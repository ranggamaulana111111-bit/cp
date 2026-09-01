# Design System Guidelines (design.md): Indibiz Landing Page Style Analysis

Dokumen ini berisi analisis komprehensif mengenai **UI/UX & Design System** dari tangkapan layar antarmuka platform **Indibiz** (`indibiz.co.id`). Evaluasi ini membedah elemen visual, hierarki tipografi, struktur tata letak, komponen interaktif, serta implementasi *design tokens* yang dapat dijadikan panduan sistem desain (Design System Specifications).

---

## 1. Ringkasan Evaluasi UI/UX

 Antarmuka **Indibiz** mengusung pendekatan antarmuka bisnis B2B modern dengan estetika **clean, professional, and accessible**. Fokus utama antarmuka ini adalah memberikan kesan tepercaya (*trustworthy*), mudah dinavigasi, serta secara jelas menyampaikan *value proposition* produk digital untuk ekosistem bisnis.

* **Skor Struktur Layout:** `9/10` (Pemanfaatan *grid system* dan *whitespace* yang sangat rapi).
* **Skor Hierarki Visual:** `9/10` (Penggunaan kontras warna & *typography sizing* yang tegas).
* **Aksesibilitas Sensus:** Sangat tinggi, tombol CTA dan tautan navigasi memiliki kontras warna yang aman untuk pengguna (WCAG AA compliant).

---

## 2. Palet Warna (Color Palette & Tokens)

Indibiz menggunakan kombinasi warna berbasis **Telkom Blue/Royal Blue** sebagai identitas utama, didukung aksen **Emerald Green** untuk penekanan kata kunci, serta latar belakang netral yang terang.

### Primary & Accent Colors
* **Primary Brand Blue (`#007AFF` / `#0062E6`):** Digunakan pada logo utama, tombol *Primary CTA* ("Selengkapnya", "Masuk"), indikator *check mark*, dan tombol navigasi slider.
* **Secondary Accent Green (`#00A859` / `#0B9B48`):** Digunakan pada kata kunci dalam headline ("Produk Digital") untuk menciptakan titik fokus (*visual focal point*).
* **Neutral Dark / Text Primary (`#111827` / `#0F172A`):** Digunakan pada teks judul utama (*Headline*), teks navigasi, dan tombol sekunder. Memberikan tingkat keterbacaan (*readability*) yang sangat tinggi.
* **Neutral Light / Background (`#FAFAFA` / `#F8FAFC`):** Menjadi latar belakang halaman utama untuk menjaga kontras dan ruang bernapas visual (*white space*).
* **White (`#FFFFFF`):** Warna dasar kartu, *input search bar*, serta *Secondary Button* ("Saya Tertarik", "Daftar").

---

## 3. Tipografi & Hierarki Teks (Typography Scale)

Menggunakan font Sans-Serif geometris/humanis modern (seperti *Inter*, *Plus Jakarta Sans*, atau *Roboto*) yang memberikan kesan profesional namun tidak kaku.

### Typography Hierarchy Breakdown
1. **Hero Headline (H1):**
   * *Font-Weight:* Extra Bold / Bold (700/800)
   * *Size:* ~36px - 44px (Desktop)
   * *Color:* `#111827` dengan aksen `#00A859`
   * *Usage:* "Temukan **Produk Digital** untuk Semua Kebutuhan Bisnis Anda"
2. **Sub-heading / Feature List:**
   * *Font-Weight:* Medium / Semi-Bold (500/600)
   * *Size:* 15px - 16px
   * *Color:* `#374151`
   * *Icon:* Circle Blue Checkmark (`#007AFF`)
3. **Navigation & Interactive Text:**
   * *Font-Weight:* Medium (500)
   * *Size:* 14px
   * *Color:* `#4B5563` (Normal) / `#007AFF` (Hover/Active)
4. **Body Text / Microcopy:**
   * *Font-Weight:* Regular (400)
   * *Size:* 12px - 13px (Top Utility Bar & Footer Meta)

---

## 4. Analisis Komponen Antarmuka (Component Library)

### A. Top Utility & Main Navigation Bar
* **Top Utility Bar (Bar Navigasi Atas):**
  * Sisi Kiri: Tautan sekunder seperti *Download App* dan *Tentang Indibiz*.
  * Sisi Kanan: Tautan ke *Marketplace*.
  * Font berukuran kecil (12px) dengan warna abu-abu netral untuk membedakan hirarki dari navigasi utama.
* **Main Navigation Bar:**
  * **Logo:** Logo "indibiz" di sebelah kiri dengan simbol 'i' berwarna merah/biru khas brand Telkom Group.
  * **Global Search Bar:** *Input box* berukuran besar di bagian tengah ("Cari produk, artikel, event, dan video pembelajaran") lengkap dengan ikon kaca pembesar di sisi kanan.
  * **Dropdown Navigasi:** *Solusi Bisnis*, *Dukungan Bisnis*, dan *Pusat Bantuan* dilengkapi dengan *chevron arrow*.
  * **Authentication Action:** Tombol "Daftar" (Outline / Ghost Button) dan tombol "Masuk" (Solid Blue Fill Button).

### B. Hero Section Structure
* **Left Column (Text & Action):**
  * **Headline Utama:** Teks besar dengan aksen hijau pada klausa penting.
  * **Feature Bullet Points (2x2 Grid Layout):**
    * Transformasi Digital
    * Pertumbuhan Bisnis
    * Dukungan Berkelanjutan
    * Kemudahan Mengelola Layanan
  * **Dual CTA Buttons:**
    * *Primary Button:* "Selengkapnya" (Latar biru solid + ikon panah melingkar ke bawah).
    * *Secondary Button:* "Saya Tertarik" (Latar putih dengan *border*, teks biru + ikon panah ke kanan).
* **Right Column (Visual Collage & Interactive Banner):**
  * **Bento Grid Collage:** Susunan gambar berbentuk grid modis (*rounded corners* ~16px) yang memperlihatkan lanskap pengguna produk: pelaku UMKM, profesional bisnis, tenaga medis, dan ilustrasi 3D (*puzzle/checkmark*).
  * **Carousel Controls:**
    * Indikator Halaman (misal: "02")
    * *Progress line bar* di tengah.
    * Tombol navigasi melingkar Kiri & Kanan di pojok kanan bawah.
  * **Floating Assistant Widget:** Widget maskot / bot interaktif terapung di pojok kanan bawah gambar banner.

---

## 5. Spesifikasi Lay Out, Spacing, & Styling (Design Tokens)

```json
{
  "tokens": {
    "colors": {
      "primary": "#007AFF",
      "primary-hover": "#0056B3",
      "accent-green": "#00A859",
      "text-dark": "#111827",
      "text-muted": "#6B7280",
      "bg-main": "#FAFAFA",
      "bg-card": "#FFFFFF",
      "border-light": "#E5E7EB"
    },
    "borderRadius": {
      "button": "8px",
      "pill-button": "24px",
      "search-bar": "8px",
      "bento-card": "16px",
      "circle-icon": "50%"
    },
    "shadows": {
      "soft": "0px 4px 12px rgba(0, 0, 0, 0.05)",
      "card-hover": "0px 8px 24px rgba(0, 0, 0, 0.08)",
      "floating-widget": "0px 10px 25px rgba(0, 0, 0, 0.12)"
    },
    "spacing": {
      "container-padding-x": "48px",
      "hero-gap": "32px",
      "grid-gap": "12px"
    }
  }
}
```

---

## 6. Rekomendasi Evaluasi & Penilaian Kritis

1. **Keunggulan (Strengths):**
   * **Clear Value Proposition:** Pengunjung langsung memahami fokus platform dalam hitungan detik.
   * **Bento Grid Visuals:** Penggunaan *mosaic grid* untuk gambar memberikan nuansa modern dan dinamis tanpa terlihat berantakan.
   * **Search-Centric Design:** Search bar yang menonjol memudahkan pengguna enterprise / B2B untuk langsung mencari kebutuhan produk digital spesifik.

2. **Saran Peningkatan (Potential Improvements):**
   * **CTA Hierarchy:** Jarak antara tombol "Selengkapnya" dan "Saya Tertarik" sudah baik, namun ikon di dalam tombol "Selengkapnya" (panah bawah) dapat sedikit membingungkan apakah itu *dropdown* atau *scroll indicator*. Panah ke kanan (*chevron right*) umumnya lebih intuitif untuk navigasi halaman.
   * **Contrast on Top Utility Bar:** Teks biru muda pada latar abu-abu/putih di bagian *Top Bar* bisa ditingkatkan kontras warnanya agar sesuai standar WCAG AAA.

---