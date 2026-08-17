# Deploy CV. Chilva Computer Website

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
curl http://localhost:5551
```

## Cloudflare Tunnel

### Install cloudflared
```bash
curl -L https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64 -o /usr/local/bin/cloudflared
chmod +x /usr/local/bin/cloudflared
```

### Quick tunnel (tanpa akun Cloudflare)
```bash
cloudflared tunnel --url http://localhost:5551
```
Ini akan kasih URL random seperti `https://xxx.trycloudflare.com`

### Named tunnel (dengan akun Cloudflare)
```bash
# Login
cloudflared tunnel login

# Buat tunnel
cloudflared tunnel create chilva-website

# Route DNS
cloudflared tunnel route dns chilva-website chilvacomputer.id

# Jalankan
cloudflared tunnel run --url http://localhost:5551 chilva-website
```

### Setup sebagai service systemd
```bash
sudo tee /etc/systemd/system/cloudflared.service << EOF
[Unit]
Description=Cloudflare Tunnel for Chilva Website
After=network.target docker.service

[Service]
Type=simple
ExecStart=/usr/local/bin/cloudflared tunnel --url http://localhost:5551 run chilva-website
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
