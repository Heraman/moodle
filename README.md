# Moodle LMS - Coolify Deployment (High Performance)

Repositori ini berisi konfigurasi *Docker Compose* Moodle yang sudah disetel untuk beban tinggi (800+ User serentak) dengan bantuan Nginx, PHP-FPM, MySQL 8.4, dan Redis Cache.

## Cara Deploy di Coolify

1. Buat **Project** baru di dashboard Coolify.
2. Tambahkan **New Resource** -> Pilih **Git Repository** (Pilih repositori Github ini).
3. Di tab *Configuration* Coolify, pastikan:
   - **Build Pack:** `Docker Compose`
   - **Docker Compose File:** `docker-compose.yml`
   - **Domains:** Isi domain e-learning kamu (misal: `https://moodle.sekolahku.sch.id`).
4. Klik **Deploy**.

## Catatan Penting Saat Instalasi Web
Setelah berhasil ter-deploy, buka domain kamu untuk melanjutkan setup instalasi Moodle:
- **Database Driver:** `mysqli`
- **Database Host:** `db`
- **Database Name:** `moodle`
- **Database User:** `moodle`
- **Database Password:** `moodle_db_password_rahasia` *(sesuai dengan yang ada di docker-compose.yml, silakan ubah jika perlu sebelum di-push ke Github).*

*Konfigurasi Moodle ini dirancang oleh AntiGravity.*
