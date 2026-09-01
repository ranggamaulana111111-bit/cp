# Deploy CV. Chilva Computer Website

Domain: `chilvacomputer.com` (port `2005`)

## Persiapan Server Ubuntu

```bash
# Install Docker (jika belum)
curl -fsSL https://get.docker.com | sh
sudo usermod -aG docker $USER
newgrp docker

# Install Docker Compose (jika belum)
sudo apt install docker-compose-plugin -y
```

## Deploy

```bash
# 1. Clone / copy project ke server
git clone <repo-url> /opt/chilva-website
cd /opt/chilva-website

# 2. Build & jalankan
docker compose up -d --build

# 3. Cek status
docker ps
docker logs chilva-website

# 4. Test lokal
curl http://localhost:2005
```

## Nginx Reverse Proxy (domain chilvacomputer.com)

Website berjalan di port `2005`, tetapi user mengakses lewat `http://chilvacomputer.com:2005`.
Buat virtual host Nginx agar domain mengarah ke port tersebut.

### Konfigurasi Nginx

Buat file `/etc/nginx/sites-available/chilvacomputer.com`:

```nginx
server {
    listen 80;
    server_name chilvacomputer.com www.chilvacomputer.com;

    location / {
        proxy_pass http://127.0.0.1:2005;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}
```

Aktifkan site:

```bash
sudo ln -s /etc/nginx/sites-available/chilvacomputer.com /etc/nginx/sites-enabled/
sudo nginx -t
sudo systemctl reload nginx
```

> Catatan: Pastikan A record `chilvacomputer.com` dan `www.chilvacomputer.com` mengarah ke IP public server.

### (Opsional) Ekpos port 2005 langsung

Jika tidak pakai Nginx reverse proxy, cukup pastikan port `2005` terbuka di firewall:

```bash
sudo ufw allow 2005/tcp
```

Lalu akses langsung via `http://chilvacomputer.com:2005`.

## Cloudflare Tunnel

### Install cloudflared
```bash
curl -L https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64 -o /usr/local/bin/cloudflared
chmod +x /usr/local/bin/cloudflared
```

### Quick tunnel (tanpa akun Cloudflare)
```bash
cloudflared tunnel --url http://localhost:2005
```
Ini akan kasih URL random seperti `https://xxx.trycloudflare.com`

### Named tunnel (dengan akun Cloudflare)
```bash
# Login
cloudflared tunnel login

# Buat tunnel
cloudflared tunnel create chilva-website

# Route DNS
cloudflared tunnel route dns chilva-website chilvacomputer.com

# Jalankan
cloudflared tunnel run --url http://localhost:2005 chilva-website
```

### Setup sebagai service systemd
```bash
sudo tee /etc/systemd/system/cloudflared.service << EOF
[Unit]
Description=Cloudflare Tunnel for Chilva Website
After=network.target docker.service

[Service]
Type=simple
ExecStart=/usr/local/bin/cloudflared tunnel --url http://localhost:2005 run chilva-website
Restart=always
RestartSec=5

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl daemon-reload
sudo systemctl enable cloudflared
sudo systemctl start cloudflared
```

## Update Website

```bash
cd /opt/chilva-website
git pull
docker compose up -d --build
```
