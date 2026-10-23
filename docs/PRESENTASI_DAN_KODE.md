# Panduan presentasi maksimal 10 menit

Ini bahan penjelasan, bukan video yang telah direkam. Durasi yang disarankan 8–9 menit agar ada ruang jika demonstrasi memerlukan waktu tambahan.

## 00:00–00:40 — Pembukaan

“Selamat pagi/siang. Saya [nama], NIM [NIM], dari lab [PM 1/PM 3]. Pada UTS Pemrograman Mobile ini saya mempresentasikan Quizora, aplikasi kuis pilihan ganda tentang dasar Flutter. Aplikasi dibuat menggunakan Flutter dan Dart dengan Android Studio. Pengguna memasukkan nama, menjawab sepuluh soal, kemudian melihat skor dan pembahasan.”

## 00:40–01:40 — Beranda

Tampilkan kolom nama, tekan mulai tanpa nama untuk memperlihatkan validasi, lalu masukkan nama Anda.

“Beranda memakai StatefulWidget karena memiliki form dan TextEditingController. Nama wajib diisi sebelum sesi dimulai. Font Outfit dimuat dari aset lokal, begitu juga gambar logo. Dengan begitu, font dan logo tidak bergantung pada koneksi internet saat aplikasi digunakan.”

## 01:40–03:30 — Kuis

Pilih jawaban, pindah soal, kembali dan ubah jawaban. Tunjukkan peta soal, progress bar, tombol selesai yang belum aktif dan tombol kembali ke beranda. Lanjutkan sesi.

“Seluruh pertanyaan ditampilkan menggunakan satu QuizScreen. Perubahan soal cukup mengganti index pada controller, bukan membuat satu file layar untuk setiap pertanyaan. Jawaban disimpan dalam List<int?>. Nilai null berarti belum dijawab, sedangkan angka 0 sampai 3 mewakili opsi A sampai D. Jawaban bisa diubah sampai pengguna mengumpulkannya. Tombol selesai hanya aktif setelah seluruh soal dijawab.”

## 03:30–04:30 — Rotasi dan responsivitas

Putar emulator, tunjukkan jawaban masih dipilih. Jika tersedia, buka tablet atau browser dan perlihatkan dua kolom.

“LayoutBuilder membaca lebar ruang yang tersedia. Pada layar sempit, konten ditampilkan satu kolom; pada layar lebar, pertanyaan dan panel progres berdampingan. Scroll mencegah konten terpotong pada landscape. QuizController dibuat sekali pada State aplikasi di atas Navigator, sehingga perubahan ukuran layar dan perpindahan route tidak membuat jawaban baru. Proyek ini menyimpan sesi dalam memori, jadi hot restart atau menutup paksa aplikasi memang memulai sesi baru.”

## 04:30–05:40 — Hasil dan pembahasan

Selesaikan seluruh soal, konfirmasi, tampilkan nama, skor, benar/salah. Buka pembahasan.

“Skor dihitung dari jumlah jawaban benar dibagi jumlah soal, kemudian dikalikan 100. Untuk sepuluh soal, setiap jawaban benar bernilai sepuluh poin. Setelah dikumpulkan, jawaban dikunci. Halaman pembahasan memperlihatkan jawaban pengguna, jawaban benar dan alasan jawabannya. Tombol Coba lagi membuat sesi baru dengan nama yang sama.”

## 05:40–06:20 — Tema

Tunjukkan pergantian tema pada dua halaman.

“Mode terang dan gelap diatur melalui ThemeData dan themeMode pada MaterialApp. Tema terpilih disimpan pada QuizController sehingga tetap konsisten ketika berpindah halaman.”

## 06:20–08:00 — Jelaskan implementasi

| File | Penjelasan saat ditunjukkan |
| --- | --- |
| `main.dart` | Titik awal yang menjalankan QuizoraApp |
| `app.dart` | Membuat dan membersihkan controller, memasang scope, tema dan route |
| `models/question.dart` | Model satu soal dengan opsi, indeks benar dan pembahasan |
| `data/question_bank.dart` | Seluruh soal lokal dalam satu list |
| `state/quiz_controller.dart` | start, selectAnswer, goTo, finish, score dan toggleTheme |
| `state/quiz_scope.dart` | Menghubungkan ChangeNotifier ke UI melalui InheritedNotifier |
| `screens/home_screen.dart` | Form nama, validasi, konfirmasi sesi baru, lanjutkan sesi |
| `screens/quiz_screen.dart` | Menampilkan soal aktif dan menerima pilihan jawaban |
| `screens/result_screen.dart` | Menampilkan skor pengguna dan tombol ulang |
| `screens/review_screen.dart` | Pembahasan seluruh jawaban setelah selesai |
| `widgets/answer_option.dart` | Reusable opsi jawaban untuk seluruh soal |
| `widgets/responsive_page.dart` | Scroll, lebar konten dan keputusan layout |
| `core/app_theme.dart` | Konfigurasi warna, tipografi dan komponen |
| `pubspec.yaml` | Registrasi gambar dan font Outfit |

Contoh alur yang perlu dipahami: pengguna mengetuk opsi → selectAnswer mengisi daftar jawaban → notifyListeners dipanggil → QuizScope memberi tahu widget yang bergantung pada controller → tampilan pilihan dan progres diperbarui.

## 08:00–09:00 — GitHub dan penutup

Tampilkan repository sendiri dan histori commit yang benar-benar ada. Jelaskan perubahan yang Anda lakukan secara jujur. Tampilkan README yang sudah diisi, screenshot asli, mockup dan tautan video.

“Proyek dipisahkan menjadi model, data, state, screens, dan widgets agar tiap bagian memiliki tanggung jawab yang jelas. Pengembangan dilacak menggunakan commit per perubahan. Demikian demonstrasi aplikasi Quizora. Terima kasih.”

## Pertanyaan yang mungkin muncul

**Mengapa memakai StatelessWidget dan StatefulWidget?** StatelessWidget untuk tampilan yang menerima data dari controller; StatefulWidget untuk pemilik controller/form yang memerlukan lifecycle initState dan dispose.

**Mengapa halaman kuis StatelessWidget meskipun jawabannya berubah?** State tidak harus berada di widget halaman. QuizScreen bergantung pada QuizScope, sehingga berubah ketika controller memberi notifikasi.

**Apa bedanya setState dan ChangeNotifier?** setState menjadwalkan rebuild state lokal, sedangkan ChangeNotifier memberi tahu listener saat state bersama berubah. Proyek ini menggunakan notifier untuk data kuis lintas halaman.

**Mengapa tidak memakai Provider?** InheritedNotifier adalah mekanisme bawaan Flutter yang cukup untuk aplikasi kecil ini. Provider dapat mempermudah pola serupa pada aplikasi yang lebih besar, tetapi bukan syarat soal.

**Mengapa jawaban tidak hilang setelah rotasi?** Controller tidak dibuat dalam build halaman dan tidak dibuang saat orientasi berubah; manifest juga memakai konfigurasi Flutter untuk perubahan ukuran/orientasi.

**Apakah jawaban tetap ada setelah aplikasi ditutup paksa?** Tidak. Ruang lingkup proyek adalah data lokal dalam memori. Penyimpanan permanen dapat ditambahkan terpisah jika diperlukan.

**Bagaimana jika jumlah soal berubah?** Jumlah soal, progres, navigasi dan perhitungan skor menggunakan questions.length; sumber data cukup diperbarui di question_bank.dart.

**Apa arti correctIndex = 1?** Indeks dimulai dari nol, sehingga 1 berarti opsi kedua atau B.

**Bagaimana mencegah skor terlalu cepat terlihat?** finish memeriksa allAnswered. UI menonaktifkan tombol selesai sampai semua jawaban terisi.

**Apa yang belum diverifikasi?** Analyzer offline sudah lulus. Jalankan test, build dan demo perangkat sendiri sebelum menyatakan aplikasi lulus uji runtime.
