# Panduan Kontribusi
# From Banua - Platform Eksplorasi Kalimantan Selatan

## Pendahuluan

Terima kasih atas minat Anda untuk berkontribusi pada proyek From Banua! Sebagai proyek open source dan open contribution dari Raizora, kami sangat menghargai bantuan dari siapa pun yang ingin berpartisipasi dalam pengembangan platform ini.

Dokumen ini berisi panduan untuk berkontribusi ke proyek From Banua. Dengan mengikuti panduan ini, Anda membantu kami menjaga konsistensi dan kualitas kode serta konten dalam proyek.

## Visi Proyek

From Banua bertujuan untuk mendokumentasikan dan mempromosikan berbagai entitas (usaha, organisasi, perusahaan, dan tempat) di Kalimantan Selatan dalam format digital yang terstruktur dan mudah diakses. Kami percaya bahwa dengan meningkatkan visibilitas entitas-entitas ini, kita dapat mendukung ekonomi lokal, mempromosikan pariwisata, dan melestarikan warisan budaya Kalimantan Selatan.

## Cara Berkontribusi

Ada banyak cara untuk berkontribusi pada proyek From Banua:

### 1. Kontribusi Data

Anda dapat menambahkan atau memperbarui data entitas di Kalimantan Selatan:

1. Fork repositori
2. Tambahkan atau perbarui data di file `lib/frombanua/data/borneo_data.json`
3. Pastikan data yang Anda tambahkan mengikuti format yang sudah ada
4. Kirim pull request dengan deskripsi yang jelas tentang entitas yang Anda tambahkan/perbarui

Format data untuk entitas baru:

```json
{
  "id": [ID unik],
  "name": "Nama Entitas",
  "category": "usaha|organisasi|perusahaan|tempat",
  "description": "Deskripsi entitas...",
  "image_url": "URL gambar",
  "location": "Lokasi",
  "founded_at": "Tahun berdiri",
  "website": "URL website",
  "tags": ["tag1", "tag2"],
  "votes": 0
}
```

### 2. Pengembangan Fitur

Jika Anda ingin mengembangkan fitur baru:

1. Periksa dulu Issues di GitHub untuk memastikan fitur tersebut belum direncanakan atau sedang dikerjakan
2. Buat issue baru untuk mendiskusikan fitur yang Anda usulkan
3. Setelah disetujui, fork repositori dan buat branch baru dari `dev`
4. Kembangkan fitur Anda
5. Tulis test sesuai kebutuhan
6. Kirim pull request dengan referensi ke issue terkait

### 3. Perbaikan Bug

Untuk memperbaiki bug:

1. Periksa daftar Issues di GitHub
2. Klaim issue yang ingin Anda kerjakan dengan mengomentari issue tersebut
3. Fork repositori dan buat branch baru dari `dev`
4. Perbaiki bug
5. Kirim pull request dengan referensi ke issue terkait

### 4. Dokumentasi

Anda juga bisa membantu dengan memperbaiki atau menambahkan dokumentasi:

1. Perbarui README
2. Tambahkan komentar pada kode
3. Tulis tutorial atau panduan penggunaan
4. Perbarui atau tambahkan dokumen dalam folder `docs/`

### 5. Pengujian dan Review

Anda dapat membantu dengan:

1. Menguji aplikasi dan melaporkan bug
2. Me-review pull request dari kontributor lain
3. Memberikan feedback tentang UX/UI

## Proses Kontribusi

### Fork-and-Pull Model

From Banua menggunakan model fork-and-pull untuk kontribusi:

1. **Fork** repositori ke akun GitHub Anda
2. **Clone** fork ke komputer lokal Anda
3. **Buat branch baru** dari `dev` untuk perubahan Anda
4. **Commit perubahan** ke branch Anda
5. **Push branch** ke fork GitHub Anda
6. **Buat Pull Request** ke repositori utama

### Proses Review

Setiap pull request akan di-review oleh maintainer proyek. Dalam review, kami akan memeriksa:

- Apakah kode memenuhi standar dan konvensi proyek
- Apakah perubahan sesuai dengan tujuan dan desain proyek
- Apakah ada bug atau masalah keamanan
- Apakah ada test yang cukup (jika relevan)

Maintainer mungkin akan meminta perubahan sebelum menerima pull request Anda.

## Standar Kode

### Elixir/Phoenix

- Ikuti [Elixir Style Guide](https://github.com/christopheradams/elixir_style_guide)
- Gunakan mix formatter (`mix format`) sebelum commit
- Pastikan semua warning dan error dari `mix credo` terselesaikan
- Tulis test untuk kode baru

### CSS/HTML

- Gunakan pendekatan utility-first Tailwind
- Ikuti praktik terbaik HTML semantik
- Pastikan UI responsif dan dapat diakses

### Commit Messages

- Gunakan format: `[Tipe]: Deskripsi singkat`
- Tipe bisa berupa: `Feature`, `Fix`, `Docs`, `Style`, `Refactor`, `Test`, `Data`
- Tulis deskripsi yang jelas dalam bahasa Indonesia atau Inggris
- Referensikan nomor issue jika relevan: `Fix: Memperbaiki rendering kategori (#42)`

## Setup Pengembangan

Lihat [README.md](/README.md) untuk petunjuk lengkap tentang setup lingkungan pengembangan.

## Kode Etik

Sebagai kontributor dan pemelihara proyek From Banua, kami berkomitmen untuk menghormati semua orang yang berkontribusi melalui issue, pull request, komentar, dan bentuk partisipasi lainnya.

Kami berkomitmen untuk membuat partisipasi dalam proyek ini menjadi pengalaman yang bebas pelecehan untuk semua orang, terlepas dari tingkat pengalaman, identitas dan ekspresi gender, orientasi seksual, disabilitas, penampilan fisik, ukuran tubuh, ras, etnis, usia, agama, atau kebangsaan.

Contoh perilaku yang tidak kami terima termasuk:
- Penggunaan bahasa atau citra seksual
- Pelecehan melalui komentar pribadi atau publik
- Serangan pribadi
- Doxing atau publikasi informasi pribadi tanpa izin
- Perilaku lain yang secara wajar dapat dianggap tidak pantas dalam lingkungan profesional

Maintainer proyek memiliki hak dan tanggung jawab untuk menghapus, mengedit, atau menolak komentar, commit, kode, dan kontribusi lain yang tidak sesuai dengan Kode Etik ini.

## Lisensi

Dengan berkontribusi pada proyek From Banua, Anda menyetujui bahwa kontribusi Anda akan dilisensikan di bawah lisensi yang sama dengan proyek (MIT License).

## Kontak

Jika Anda memiliki pertanyaan atau membutuhkan bantuan:

- Buat issue di GitHub
- Hubungi maintainer proyek melalui email yang tertera di README
- Bergabunglah dengan komunitas Raizora di platform media sosial

---

Terima kasih telah berkontribusi pada proyek From Banua. Kontribusi Anda sangat berharga bagi pengembangan platform dan komunitas Kalimantan Selatan!