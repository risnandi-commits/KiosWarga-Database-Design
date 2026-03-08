# KiosWarga - Database Architecture (Auth Module)

Proyek ini adalah hasil perancangan skema database untuk sistem login KiosWarga sebagai bagian dari pengembangan portofolio IT saya.

## Fitur Utama
- **Tabel Users**: Menyimpan data identitas, email unik, dan status akun (Active/Banned).
- **Tabel Login History**: Mencatat jejak login setiap user (Timestamp & IP Address) untuk keamanan.
- **Relasi**: Menerapkan hubungan One-to-Many antara User dan Riwayat Login.

## Deliverables
- [x] Entity Relationship Diagram (ERD)
- [x] Script SQL (MySQL/PostgreSQL)

## Tools
- PortoLabs & Blackbox AI (Context & Brainstorming)
- Diagrams.net (Visualization)
