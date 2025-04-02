# Development Plan
# From Banua - Platform Eksplorasi Kalimantan Selatan

## Ringkasan

Dokumen ini menjelaskan rencana pengembangan untuk platform From Banua, sebuah website yang menampilkan informasi tentang usaha, organisasi, perusahaan, dan tempat-tempat menarik di Kalimantan Selatan. Rencana ini mencakup timeline pengembangan, teknologi yang digunakan, arsitektur sistem, dan pendekatan pengembangan.

## Timeline Proyek

### Sprint 1: Setup dan Struktur Dasar (2 minggu)
- Setup lingkungan pengembangan
- Inisialisasi proyek Phoenix
- Konfigurasi Tailwind v4
- Pembuatan struktur data dasar
- Implementasi routing dasar

### Sprint 2: Core Features (2 minggu)
- Implementasi modul pemrosesan data JSON
- Pembuatan halaman utama dengan daftar entitas
- Implementasi filter kategori
- Implementasi halaman detail entitas
- Styling dasar menggunakan Tailwind

### Sprint 3: Fitur Pencarian dan UI Enhancement (2 minggu)
- Implementasi pencarian teks
- Implementasi pengurutan data
- Penyempurnaan UI/UX
- Optimasi responsive design
- Penambahan animasi dan transisi

### Sprint 4: QA dan Deployment (1 minggu)
- Testing fungsional
- Optimasi performa
- Persiapan deployment
- Deployment ke production
- Dokumentasi final

## Teknologi Stack

### Backend
- **Bahasa**: Elixir 1.14+
- **Framework**: Phoenix 1.7+
- **Data Storage**: JSON untuk MVP, kemungkinan transisi ke database di fase selanjutnya

### Frontend
- **Framework CSS**: Tailwind CSS v4
- **JavaScript**: Vanilla JS + HTMX untuk interaksi dinamis
- **Build Tools**: esbuild untuk JavaScript, mix untuk aset Elixir

### Infrastructure & Deployment
- **Hosting**: Fly.io atau Gigalixir (PaaS untuk aplikasi Elixir)
- **CI/CD**: GitHub Actions
- **Monitoring**: Uptime Robot (gratis) atau New Relic (berbayar)

## Arsitektur Sistem

### Komponen Utama

1. **Data Layer**
   - File JSON untuk penyimpanan data
   - Modul `Frombanua.Borneo` untuk operasi CRUD dan filter data

2. **Application Layer**
   - Controllers untuk menangani request HTTP
   - Context modules untuk business logic

3. **Presentation Layer**
   - Template Phoenix untuk rendering HTML
   - Tailwind CSS untuk styling
   - HTMX untuk interaksi dinamis tanpa SPA kompleks

### Alur Data

```
User Request → Router → Controller → Borneo Module → JSON Data
                                  ↓
                  User ← Template ← Processed Data
```

## Struktur Project

```
frombanua/
├── assets/               # Aset statis (CSS, JS)
├── lib/
│   ├── frombanua/        # Core business logic
│   │   ├── data/         # Data JSON
│   │   └── borneo.ex     # Data processing module
│   ├── frombanua_web/    # Web interface
│   │   ├── controllers/  # Controller dan template
│   │   ├── components/   # Reusable components
│   │   └── router.ex     # Routing definitions
├── docs/                 # Dokumentasi
│   ├── prd/              # Product Requirements
│   └── devplan/          # Development Plan
├── priv/                 # Compiled assets & static files
└── test/                 # Tests
```

## Pendekatan Pengembangan

### Metodologi
- **Agile Development**: Iterasi cepat dengan sprint mingguan
- **Feature-based Approach**: Pengembangan berdasarkan fitur, bukan layer
- **Continuous Integration**: GitHub Actions untuk testing dan linting
- **Incremental Rollout**: Deployment fitur secara bertahap

### Testing Strategy
- **Unit Testing**: Fungsi-fungsi dalam modul Borneo
- **Controller Testing**: Response controller
- **Integration Testing**: Alur pengguna end-to-end
- **Browser Testing**: Compatibility check pada browser utama

### Branching Strategy
- `main`: Branch utama, selalu dalam kondisi deployable
- `dev`: Branch pengembangan, integrasi fitur
- `feature/*`: Branch untuk fitur individu
- `fix/*`: Branch untuk perbaikan bug

## Rencana Pengembangan API

### Fase 1 (MVP)
- Belum ada API public, hanya rendering HTML

### Fase 2
- REST API sederhana untuk mengakses data entitas
- Endpoint GET untuk entitas dan kategori

### Fase 3
- API lengkap dengan autentikasi
- POST/PUT/DELETE endpoints untuk kontribusi data
- Dokumentasi API dengan Swagger

## Desain Database

Untuk MVP, kita menggunakan struktur JSON:

```json
{
  "items": [
    {
      "id": 1,
      "name": "Nama Entitas",
      "category": "usaha|organisasi|perusahaan|tempat",
      "description": "Deskripsi...",
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

Untuk fase selanjutnya, skema database akan meliputi:
- Table `entities`
- Table `categories`
- Table `tags`
- Table `users` (untuk kontribusi)
- Table `votes`

## Resources dan Dependensi

### Tim Pengembangan
- 1 Backend Developer (Elixir/Phoenix)
- 1 Frontend Developer (Tailwind/HTMX)
- 1 UI/UX Designer (part-time)
- Community contributors

### External Services
- GitHub untuk version control
- Fly.io/Gigalixir untuk hosting
- Unsplash/Pixabay untuk placeholder images

## Faktor Risiko dan Mitigasi

### Risiko Teknis
- **Kompleksitas data**: Memulai dengan struktur sederhana, iterasi berdasarkan feedback
- **Performa dengan JSON**: Implementasi caching, transisi ke database jika diperlukan
- **Kompatibilitas browser**: Testing cross-browser, progressive enhancement

### Risiko Bisnis
- **Kualitas data**: Verifikasi data, sumber yang jelas
- **Adopsi pengguna**: Fokus pada UX, promosi di komunitas lokal
- **Keberlanjutan**: Open source, dokumentasi yang baik, onboarding kontributor

## Strategi Deployment

### Environment
- **Development**: Lokal pada mesin developer
- **Staging**: Fly.io instance terpisah untuk testing
- **Production**: Fly.io instance teroptimasi

### Deployment Process
1. Build aset dan aplikasi
2. Testing otomatis
3. Deploy ke staging
4. Testing manual/smoke test
5. Deploy ke production
6. Monitoring post-deployment

### Rollback Strategy
- Kemampuan untuk rollback ke versi sebelumnya
- Snapshot database (jika relevan)
- Logging komprehensif untuk debugging

## Monitoring dan Maintenance

### Monitoring
- Error tracking dengan Sentry
- Uptime monitoring
- Performance metrics

### Maintenance
- Jadwal update bulanan
- Rotasi on-call untuk isu kritis
- Dokumentasi untuk self-service

## Pengembangan Masa Depan

### Fase 2 (Post-MVP)
- Sistem autentikasi
- Fitur kontribusi data oleh pengguna
- Integrasi peta interaktif
- Sistem rating dan review

### Fase 3
- Aplikasi mobile (PWA)
- API publik
- Fitur sosial (komentar, diskusi)
- Integrasi dengan layanan eksternal

## Kesimpulan

Rencana pengembangan ini memberikan panduan untuk membangun From Banua secara bertahap dari MVP hingga platform yang lebih komprehensif. Dengan pendekatan agile dan fokus pada kualitas dan pengalaman pengguna, proyek ini bertujuan untuk menjadi platform referensi untuk eksplorasi Kalimantan Selatan.

Sebagai proyek open source, From Banua mengundang kontribusi dari komunitas untuk memperkaya data, memperbaiki fungsionalitas, dan mengembangkan fitur baru yang bermanfaat bagi pengguna dan entitas yang terdaftar.