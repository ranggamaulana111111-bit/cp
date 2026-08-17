# CV. Chilva Computer - Company Profile

Website company profile CV. Chilva Computer — Mitra terpercaya pengadaan hardware, instalasi CCTV, dan optimasi jaringan.

## Tech Stack

- **Framework:** Astro v7
- **Styling:** Tailwind CSS v4
- **Docker:** Nginx Alpine
- **Tunnel:** Cloudflare Tunnel

## Struktur Project

```
/
├── public/
├── src/
│   ├── components/
│   │   ├── About.astro
│   │   ├── Contact.astro
│   │   ├── Portfolio.astro
│   │   ├── Procurement.astro
│   │   └── Testimonials.astro
│   ├── data/
│   │   └── company.ts
│   ├── layouts/
│   │   └── Layout.astro
│   ├── pages/
│   │   └── index.astro
│   └── styles/
│       └── global.css
├── Dockerfile
├── docker-compose.yml
└── package.json
```

## Perintah

| Perintah | Fungsi |
|---|---|
| `npm install` | Install dependencies |
| `npm run dev` | Jalankan dev server di `localhost:4321` |
| `npm run build` | Build untuk production ke `./dist/` |
| `npm run preview` | Preview hasil build lokal |

## Deploy dengan Docker

```bash
# Build & jalankan
docker compose up -d --build

# Cek status
docker ps

# Log
docker logs chilva-website
```

Website akan berjalan di **http://localhost:5551**

## Cloudflare Tunnel

```bash
# Install cloudflared
curl -L https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64 -o /usr/local/bin/cloudflared
chmod +x /usr/local/bin/cloudflared

# Jalankan tunnel
cloudflared tunnel --url http://localhost:5551
```

## Update Website

```bash
git pull
docker compose up -d --build
```
