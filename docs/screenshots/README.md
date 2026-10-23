# Screenshot Quizora

Dokumentasi ini berisi **15 screenshot asli** dari aplikasi Quizora yang dijalankan pada 23 Oktober 2026 melalui `lib/main.dart`. Galeri ditampilkan pada [README utama](../../README.md#screenshot-aplikasi).

## Lingkungan Pengambilan

| Data | Keterangan |
| --- | --- |
| Aplikasi | Quizora 1.0.0+1, source pada repository ini |
| Platform | Flutter Web, Chrome 156, Windows |
| Flutter / Dart | Flutter 3.47.2 / Dart 3.13.2 |
| Nama demonstrasi | Maruli |
| Metode | Aplikasi dijalankan dengan `flutter run -d web-server`; interaksi UI dan screenshot menggunakan Chrome DevTools Protocol |
| Resolusi | Ukuran viewport dalam CSS pixels, device scale factor 1 |

Gambar diambil dari UI aplikasi yang dirender dan dioperasikan melalui form, tombol jawaban, navigasi, serta dialog yang sebenarnya. Semua file PNG disimpan langsung dari hasil tangkapan browser tanpa modifikasi visual. Ukuran portrait merupakan viewport browser dan tidak menyatakan screenshot dari HP atau emulator Android.

## Daftar Screenshot

| File | Viewport | Halaman / skenario |
| --- | --- | --- |
| [home-light.png](home-light.png) | 430 × 1120 | Beranda mode terang, kolom nama, logo, dan cara bermain |
| [home-dark.png](home-dark.png) | 430 × 1120 | Beranda setelah mengaktifkan mode gelap |
| [quiz-unanswered.png](quiz-unanswered.png) | 430 × 1180 | Soal pertama, belum ada jawaban, tombol selesai belum aktif |
| [quiz-selected.png](quiz-selected.png) | 430 × 1180 | Jawaban Dart dipilih, progres 1 dari 10 |
| [quiz-dark.png](quiz-dark.png) | 430 × 1180 | Soal dan jawaban terpilih dalam mode gelap |
| [quiz-complete.png](quiz-complete.png) | 430 × 1180 | Semua soal terjawab, tombol Selesaikan kuis aktif |
| [submit-confirmation.png](submit-confirmation.png) | 430 × 1180 | Dialog konfirmasi Kumpulkan jawaban |
| [result-high.png](result-high.png) | 430 × 900 | 10 benar, 0 salah, skor 100 |
| [result-low.png](result-low.png) | 430 × 900 | 3 benar, 7 salah, skor 30 |
| [result-dark.png](result-dark.png) | 430 × 900 | Hasil skor 100 dalam mode gelap |
| [review-light.png](review-light.png) | 430 × 1180 | Awal pembahasan sesi skor 100 dalam mode terang |
| [review-dark.png](review-dark.png) | 430 × 1180 | Awal pembahasan sesi skor 100 dalam mode gelap |
| [review-mixed.png](review-mixed.png) | 430 × 1180 | Pembahasan sesi skor 30, digulir ke bagian jawaban salah |
| [tablet.png](tablet.png) | 1280 × 900 | Soal dan peta soal berdampingan, jawaban pertama tetap terpilih |
| [landscape.png](landscape.png) | 1024 × 720 | Layout landscape, jawaban dan progres dipertahankan |

## Alur Pengambilan

1. Jalankan aplikasi di Chrome dan gunakan viewport beranda 430 × 1120. Ambil mode terang dan gelap melalui tombol tema.
2. Masukkan nama **Maruli**, lalu tekan **Mulai kuis**. Gunakan viewport 430 × 1180 untuk mengambil soal sebelum dan setelah memilih **B — Dart**.
3. Aktifkan mode gelap dan ambil halaman kuis. Kembalikan ke mode terang, lalu ubah viewport menjadi 1280 × 900 dan 1024 × 720 untuk dokumentasi responsif tanpa menghapus sesi.
4. Kembali ke viewport portrait dan lengkapi jawaban **B, C, A, D, B, C, A, D, B, C**. Ambil progres 10 dari 10 dan dialog konfirmasi.
5. Konfirmasi **Selesai**. Dengan viewport 430 × 900, ambil hasil **100** dalam mode terang dan gelap. Buka pembahasan dan ambil kedua tema pada viewport 430 × 1180.
6. Kembali ke hasil, tekan **Coba lagi**, lalu jawab **B, C, A, A, A, A, B, A, A, A**. Selesaikan kuis dan ambil hasil **30**.
7. Buka pembahasan sesi skor 30, gulir ke soal yang salah, lalu ambil screenshot.

Halaman beranda, kuis, dan pembahasan memakai scroll. Screenshot merekam area yang terlihat pada viewport saat pengambilan; pembahasan lengkap dapat dibaca dengan menggulir di aplikasi. [Mockup SVG](../mockup.svg) tetap tersedia sebagai referensi desain terpisah.
