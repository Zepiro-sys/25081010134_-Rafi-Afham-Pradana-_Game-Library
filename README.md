# Library Game PC

Website katalog game sederhana berbasis **PHP Native** dan **MySQL/MariaDB**. Data game, developer, dan genre diambil dari database lalu ditampilkan dalam bentuk card dengan tema visual **Steam**.

## Fitur

- Menampilkan daftar game beserta developer, genre, dan deskripsi genre.
- Data diambil dari tiga tabel yang digabung dengan `JOIN`.
- Output di-escape dengan `htmlspecialchars()` untuk mencegah XSS.
- Tampilan responsif: 3 kolom (desktop), 2 kolom (tablet), 1 kolom (mobile).

## Teknologi

| Bagian   | Teknologi                          |
|----------|------------------------------------|
| Backend  | PHP 8.0 (Native, ekstensi `mysqli`) |
| Database | MariaDB 10.4 / MySQL               |
| Frontend | HTML5 dan CSS3 (Flexbox, media query) |
| Server   | Apache (XAMPP)                     |

## Struktur Proyek

```
game_library/
├── database/
│   └── game_library.sql   # skema dan data awal
├── services/
│   └── config.php         # koneksi database
├── index.php              # halaman utama (query dan tampilan)
├── style.css              # styling tema Steam
└── README.md
```

## Struktur Database

Database: `game_library`

**developer**

| Kolom           | Tipe        | Keterangan   |
|-----------------|-------------|--------------|
| `idDeveloper`   | varchar(45) | Primary key  |
| `namaDeveloper` | varchar(45) | Nama studio  |
| `negaraAsal`    | varchar(45) | Negara asal  |

**genre**

| Kolom       | Tipe          | Keterangan      |
|-------------|---------------|-----------------|
| `idGenre`   | varchar(45)   | Primary key     |
| `genre`     | varchar(45)   | Nama genre      |
| `deskripsi` | varchar(1000) | Penjelasan genre |

**game**

| Kolom         | Tipe         | Keterangan                          |
|---------------|--------------|-------------------------------------|
| `idGame`      | varchar(45)  | Primary key                         |
| `namaGame`    | varchar(100) | Judul game                          |
| `idDeveloper` | varchar(45)  | Foreign key ke `developer.idDeveloper` |
| `idGenre`     | varchar(45)  | Foreign key ke `genre.idGenre`      |

Relasi: satu developer dan satu genre dapat dimiliki banyak game (one-to-many).

## Cara Menjalankan

1. **Install XAMPP**, lalu jalankan **Apache** dan **MySQL** dari XAMPP Control Panel.
2. **Salin folder proyek** ke `C:\xampp\htdocs\game_library` (Windows) atau `/opt/lampp/htdocs/game_library` (Linux).
3. **Impor database:**
   - Buka `http://localhost/phpmyadmin`.
   - Buat database baru bernama `game_library`.
   - Pilih tab **Import**, lalu unggah `database/game_library.sql`.
4. **Cek koneksi** di `services/config.php` dan sesuaikan jika perlu:
   ```php
   $host = 'localhost';
   $user = 'root';
   $pass = '';
   $db   = 'game_library';
   ```
5. **Buka di browser:** `http://localhost/game_library/index.php`

## Alur Kerja Kode

1. `index.php` memanggil `services/config.php` untuk membuka koneksi ke database.
2. Query `SELECT` dengan dua `JOIN` mengambil nama game, nama developer, genre, dan deskripsi genre. Kolom diberi alias (`judul_game`, `nama_developer`, `nama_genre`).
3. Perulangan `while` dengan `fetch_assoc()` membuat satu card untuk setiap baris hasil query.
4. `style.css` mengatur tampilan card dan layout.

## Desain (Tema Steam)

- **Warna brand:** `#66c0f4` (biru Steam) untuk judul, border aktif, dan badge.
- **Background:** `#1b2838` (utama) dan `#171a21` (navbar).
- **Box Model:** card memakai `padding`, `border`, `box-shadow`, dan `margin`.
- **Flexbox:** navbar dan container card memakai `display: flex` dengan `flex-wrap: wrap`.
- **Responsif:** media query di `1024px` (2 kolom) dan `768px` (1 kolom).

Baris CSS yang memenuhi rubrik penilaian diberi komentar `/* Syarat ... */`.

## Pemecahan Masalah

| Masalah | Penyebab dan solusi |
|---------|---------------------|
| Browser menampilkan daftar file, bukan website | Buka langsung `.../index.php` atau pastikan Apache aktif dan folder ada di `htdocs`. |
| `Koneksi gagal` | MySQL belum berjalan, atau kredensial di `services/config.php` salah. |
| `Unknown database 'game_library'` | Database belum dibuat atau file SQL belum diimpor. |
| `Undefined variable $koneksi` | Nama variabel koneksi di `index.php` harus sama dengan di `config.php` (`$conn`). |
| Card kosong | Tabel `game` belum berisi data, atau kolom di query tidak cocok dengan yang dipanggil di tampilan. |

## Pengembangan Selanjutnya

- Fitur pencarian dan filter berdasarkan genre atau developer.
- Halaman tambah, ubah, dan hapus game (CRUD).
- Gambar sampul untuk setiap game.
- Migrasi ke *prepared statement* jika nanti menerima input dari pengguna.
