#!/bin/bash
set -e

echo "=== Deploy CV. Chilva Computer Website ==="

# 1. Copy project ke server
echo "[1/4] Copy project ke server..."
# scp -r . user@server:/opt/chilva-website/
# atau git clone dari repo

# 2. Build & run Docker
echo "[2/4] Build Docker image..."
cd /opt/chilva-website
docker compose up -d --build

# 3. Cek status
echo "[3/4] Cek container status..."
docker ps | grep chilva-website

# 4. Selesai
echo "[4/4] Deploy selesai!"
echo "Website berjalan di: http://localhost:5551"
echo ""
echo "=== Cloudflare Tunnel Setup ==="
echo "Jika belum punya cloudflared:"
echo "  curl -L https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64 -o /usr/local/bin/cloudflared"
echo "  chmod +x /usr/local/bin/cloudflared"
echo ""
echo "Jalankan tunnel:"
echo "  cloudflared tunnel --url http://localhost:5551"
