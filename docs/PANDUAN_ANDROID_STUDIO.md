# Membuka Quizora di Android Studio

## 1. Siapkan perangkat lunak

1. Pasang Android Studio, Flutter SDK dan plugin **Flutter**. Plugin Dart biasanya ikut diminta saat memasang Flutter.
2. Atur path Flutter SDK pada Settings > Languages & Frameworks > Flutter jika belum terdeteksi.
3. Dari Tools > SDK Manager, sediakan Android SDK yang diminta Flutter beserta Android SDK Command-line Tools dan Build-Tools.
4. Gunakan JDK 17 yang kompatibel untuk Gradle: Settings > Build, Execution, Deployment > Build Tools > Gradle > Gradle JDK. Template proyek memakai AGP 8.11.1, Gradle 8.14, Kotlin 2.2.20 dan Java target 17, mengacu baseline Flutter 3.38.5.
5. Periksa toolchain:

```bash
flutter --version
flutter doctor
flutter doctor --android-licenses
```

Ikuti perbaikan pada bagian Android toolchain bila ada. Versi stable baru dapat meminta SDK atau Android Studio yang lebih baru. Unduhan dependency membutuhkan internet saat setup awal; aplikasi kuis sendiri menggunakan data lokal.

## 2. Buka folder proyek yang benar

1. Ekstrak `Quizora_UTS_AndroidStudio.zip` ke lokasi sederhana, misalnya `D:/Kuliah/quizora`.
2. Jalankan Android Studio > Open, atau File > Open.
3. Pilih folder **quizora** yang langsung memiliki `pubspec.yaml` dan folder `lib`.
4. Tunggu IDE selesai mengindeks. Buka Terminal dan pastikan posisinya berada pada folder quizora.

```bash
flutter pub get
```

Folder `android` adalah runner native. Untuk mengerjakan kode Flutter, buka root quizora, bukan hanya folder android.

`local.properties`, `.dart_tool`, `build` dan `pubspec.lock` akan dibuat oleh tooling lokal. Tidak ada path SDK komputer penyusun yang harus disalin ke komputer Anda.

## 3. Jalankan di emulator

1. Buka Tools > Device Manager.
2. Buat atau jalankan emulator Android. Untuk demo, pilih ponsel berukuran wajar, misalnya sekitar 390 logical pixels pada orientasi portrait.
3. Pilih emulator pada dropdown perangkat Android Studio.
4. Buka `lib/main.dart` lalu tekan tombol Run hijau.

Alternatif terminal:

```bash
flutter devices
flutter run
```

Untuk memilih perangkat, gunakan ID yang benar dari `flutter devices`:

```bash
flutter run -d ID_PERANGKAT
```

Tidak perlu menambahkan package provider/google_fonts. State dikelola ChangeNotifier + InheritedNotifier bawaan Flutter, dan font dimuat dari aset lokal.

## 4. Coba alur aplikasi

1. Tekan Mulai kuis dengan nama kosong: pesan validasi harus muncul.
2. Masukkan nama, mulai kuis, pilih jawaban pertama.
3. Tekan Berikutnya lalu Sebelumnya: pilihan pertama harus tetap aktif.
4. Putar emulator ke landscape: progres tidak boleh kembali ke nol.
5. Pilih Simpan sesi & ke beranda, lalu Lanjutkan progres.
6. Isi seluruh soal; tekan Selesaikan kuis lalu konfirmasi.
7. Periksa nama dan skor, buka pembahasan, ganti tema, lalu coba lagi.
8. Ulangi dengan semua jawaban benar: skor harus 100. Semua salah: skor harus 0.

Kunci berdasarkan urutan soal: **B, C, A, D, B, C, A, D, B, C**. Masing-masing benar bernilai 10 poin.

## 5. Uji responsif dan mode gelap

Tombol bulan/matahari pada app bar mengubah tema. Uji portrait, landscape dan tablet. Layout beralih menjadi dua kolom mulai lebar 760 logical pixels. Semua konten berada dalam scroll dan tombol memakai Wrap atau ukuran fleksibel.

Untuk browser desktop dengan Chrome tersedia:

```bash
flutter run -d chrome
```

Ubah lebar jendela browser untuk melihat perubahan layout. Browser berguna sebagai demonstrasi tambahan; pengujian Android tetap perlu dilakukan.

## 6. Jalankan pemeriksaan lokal

```bash
flutter analyze
flutter test
```

Test mencakup state, skor, perubahan jawaban, reset, navigasi, perubahan ukuran layar dan tema. Status penyusunan: analyzer offline lulus; test runtime belum dijalankan.

Untuk membuat APK debug yang dapat dipasang untuk demonstrasi:

```bash
flutter build apk --debug
```

Hasil normal berada di `build/app/outputs/flutter-apk/app-debug.apk`. APK belum disertakan dalam ZIP. Release signing memakai debug config pada template ini untuk tugas/demonstrasi; proyek tidak dikonfigurasi untuk distribusi Play Store.

## 7. Jika ada kendala

| Gejala | Langkah |
| --- | --- |
| `flutter` tidak dikenali | Tambahkan folder `flutter/bin` pada PATH lalu buka ulang terminal/IDE |
| Tidak muncul perangkat | Nyalakan emulator dari Device Manager dan cek `flutter devices` |
| Font/gambar tidak terbaca | Pastikan folder assets ikut diekstrak; jalankan `flutter pub get` dan restart aplikasi |
| Error Java/Gradle | Pastikan JDK 17, cek versi Flutter, lalu sesuaikan toolchain dengan baseline di README |
| SDK/NDK belum terpasang | Pasang versi yang disebut pesan build melalui SDK Manager |
| Download Gradle gagal | Periksa koneksi lalu jalankan ulang; unduhan pertama dapat lama |
| State hilang setelah hot restart | Ini sesuai desain: data berada dalam memori, bukan penyimpanan permanen |
| Hanya terlihat file Android | Buka root quizora yang memiliki pubspec.yaml |

## 8. Ubah konten

- Soal dan pembahasan: `lib/data/question_bank.dart`.
- Desain tema: `lib/core/app_theme.dart`.
- Skor, progres dan tema terpilih: `lib/state/quiz_controller.dart`.
- Nama aplikasi Android: atribut `android:label` pada `android/app/src/main/AndroidManifest.xml`.
- Identitas mahasiswa dan tautan pengumpulan: `README.md`.

Saat menambah soal, gunakan ID unik, tepat empat opsi, dan correctIndex 0–3. Skor dihitung proporsional terhadap jumlah soal, sehingga tidak perlu mengubah angka pembagi secara manual.
