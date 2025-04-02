# From Banua

![From Banua Logo](https://via.placeholder.com/200x100?text=From+Banua)

Blog yang menampilkan usaha, organisasi, perusahaan, dan tempat-tempat menarik di Kalimantan Selatan.

## Deskripsi

From Banua adalah platform yang dibuat untuk memperkenalkan berbagai entitas di Kalimantan Selatan. Tujuan utama dari platform ini adalah mendokumentasikan dan mempromosikan berbagai usaha lokal, organisasi, perusahaan, dan tempat-tempat menarik yang ada di Kalimantan Selatan.

Fitur utama:
- Katalog data usaha, organisasi, perusahaan, dan tempat di Kalimantan Selatan
- Filtering berdasarkan kategori
- Pencarian dan pengurutan data
- Tampilan detail untuk setiap entitas
- UI yang intuitif dan modern terinspirasi dari Product Hunt

## Teknologi

Proyek ini dibangun menggunakan:
- [Elixir](https://elixir-lang.org/) - Bahasa pemrograman yang digunakan
- [Phoenix Framework](https://www.phoenixframework.org/) - Framework web
- [Tailwind CSS v4](https://tailwindcss.com/) - Untuk styling dan UI
- [HTMX](https://htmx.org/) - Untuk interaksi dinamis pada sisi klien

## Pengembangan

### Prasyarat

Pastikan Anda memiliki beberapa hal berikut terinstal:
- Elixir (versi 1.14 atau lebih baru)
- Erlang/OTP (versi 25 atau lebih baru)
- Node.js (versi 16 atau lebih baru)
- NPM atau Yarn

### Setup Awal

Clone repositori ini:

```bash
git clone https://github.com/raizora/frombanua.git
cd frombanua
```

Instal dependensi:

```bash
mix deps.get
npm install --prefix assets
```

### Menjalankan Server Lokal

Untuk menjalankan server Phoenix dalam mode development:

```bash
mix phx.server
```

Atau di dalam IEx (Interactive Elixir):

```bash
iex -S mix phx.server
```

Kunjungi [`localhost:4000`](http://localhost:4000) dari browser Anda untuk mengakses aplikasi.

### Struktur Data

Data entitas disimpan dalam format JSON di `lib/frombanua/data/borneo_data.json` dengan struktur:

```json
{
  "items": [
    {
      "id": 1,
      "name": "Nama Entitas",
      "category": "usaha|organisasi|perusahaan|tempat",
      "description": "Deskripsi entitas...",
      "image_url": "URL gambar",
      "location": "Lokasi",
      "founded_at": "Tahun berdiri",
      "website": "URL website",
      "tags": ["tag1", "tag2"],
      "votes": 100
    }
  ]
}
```

Untuk menambahkan entitas baru, cukup tambahkan ke array `items` dalam file JSON tersebut.

## Arsitektur

Aplikasi ini menggunakan struktur standar Phoenix dengan beberapa modifikasi:

```
frombanua/
├── assets/               # Aset statis (CSS, JS)
├── lib/
│   ├── frombanua/        # Kode bisnis
│   │   ├── data/         # Data JSON
│   │   └── borneo.ex     # Modul untuk operasi data
│   ├── frombanua_web/    # Kode web
│   │   ├── controllers/  # Controller dan template
│   │   ├── components/   # Komponen web yang dapat digunakan kembali
│   │   └── router.ex     # Definisi rute
├── priv/                 # Aset yang dikompilasi dan file statis
└── test/                 # Unit dan integrasi test
```

### Alur Data

1. Data disimpan dalam format JSON di `lib/frombanua/data/borneo_data.json`
2. Modul `Frombanua.Borneo` menyediakan fungsi-fungsi untuk mengakses dan memfilter data
3. Controller `FrombanuaWeb.BorneoController` menangani request HTTP dan mengolah data
4. Template di `borneo_html/` digunakan untuk menampilkan data ke pengguna

## Deployment

### Menggunakan Fly.io

1. Instal [flyctl](https://fly.io/docs/hands-on/install-flyctl/)
2. Login ke Fly.io:
   ```bash
   fly auth login
   ```
3. Siapkan aplikasi:
   ```bash
   fly launch
   ```
4. Deploy:
   ```bash
   fly deploy
   ```

### Menggunakan Gigalixir

1. Instal [Gigalixir CLI](https://gigalixir.readthedocs.io/en/latest/getting-started-guide.html#install-the-command-line-interface)
2. Login:
   ```bash
   gigalixir login
   ```
3. Buat aplikasi:
   ```bash
   gigalixir create
   ```
4. Push kode:
   ```bash
   git push gigalixir master
   ```

### Menggunakan Heroku

1. Instal [Heroku CLI](https://devcenter.heroku.com/articles/heroku-cli)
2. Login:
   ```bash
   heroku login
   ```
3. Buat aplikasi:
   ```bash
   heroku create --buildpack hashnuke/elixir
   ```
4. Deploy:
   ```bash
   git push heroku main
   ```

## Kontribusi

From Banua adalah proyek open source yang diinisiasi oleh [Raizora](https://github.com/raizora) dan terbuka untuk kontribusi dari komunitas. Kami sangat mengapresiasi bantuan dalam bentuk:

- Penambahan data entitas dari Kalimantan Selatan
- Perbaikan bug
- Penambahan fitur
- Peningkatan UI/UX
- Dokumentasi

Silakan buat pull request atau buka issue jika Anda ingin berkontribusi.

## Lisensi

Proyek ini dilisensikan di bawah lisensi MIT - lihat file [LICENSE](LICENSE) untuk detail lebih lanjut.

---

<div align="center">
  <p>From Banua © 2025</p>
  <p>Dibuat dengan ❤️ oleh <a href="https://github.com/raizora">Raizora</a></p>
  <p>Ini adalah proyek open source dan open contribution dari  Raizora<br>untuk memajukan teknologi dan mendokumentasikan kekayaan Kalimantan Selatan</p>
  <p>
    <a href="https://github.com/raizora">GitHub</a> •
    <a href="https://twitter.com/raizora">Twitter</a> •
    <a href="https://raizora.com">Website</a>
  </p>
</div>