import '../models/question.dart';

const questionBank = <Question>[
  Question(
      id: 'q1',
      category: 'Dasar Flutter',
      text: 'Bahasa pemrograman utama yang digunakan Flutter adalah …',
      options: ['Kotlin', 'Dart', 'Swift', 'Python'],
      correctIndex: 1,
      explanation:
          'Flutter menggunakan Dart untuk membangun antarmuka dan logika aplikasi.'),
  Question(
      id: 'q2',
      category: 'Widget',
      text:
          'Widget yang tepat untuk tampilan tanpa state yang berubah di dalamnya adalah …',
      options: [
        'StatefulWidget',
        'Navigator',
        'StatelessWidget',
        'ChangeNotifier'
      ],
      correctIndex: 2,
      explanation:
          'StatelessWidget tidak mempunyai objek State yang dapat diubah. Tampilannya tetap dapat dibangun ulang jika konfigurasi dari induk berubah.'),
  Question(
      id: 'q3',
      category: 'Widget',
      text:
          'Metode untuk memberi tahu Flutter bahwa state lokal berubah adalah …',
      options: ['setState()', 'runApp()', 'dispose()', 'buildApp()'],
      correctIndex: 0,
      explanation:
          'setState() menandai widget agar dibangun ulang setelah perubahan state lokal.'),
  Question(
      id: 'q4',
      category: 'Navigasi',
      text:
          'Perintah untuk menambahkan halaman baru pada tumpukan navigasi adalah …',
      options: [
        'Navigator.pop()',
        'Navigator.remove()',
        'Navigator.close()',
        'Navigator.push()'
      ],
      correctIndex: 3,
      explanation:
          'Navigator.push() menambahkan route. Navigator.pop() kembali ke route sebelumnya.'),
  Question(
      id: 'q5',
      category: 'Layout',
      text: 'Widget yang menyusun anak-anaknya secara vertikal adalah …',
      options: ['Row', 'Column', 'Stack', 'Padding'],
      correctIndex: 1,
      explanation:
          'Column menyusun widget pada sumbu vertikal, sedangkan Row pada sumbu horizontal.'),
  Question(
      id: 'q6',
      category: 'Aset',
      text: 'File tempat mendaftarkan aset gambar dan font Flutter adalah …',
      options: [
        'main.dart',
        'AndroidManifest.xml',
        'pubspec.yaml',
        'settings.gradle'
      ],
      correctIndex: 2,
      explanation:
          'Aset dan font dideklarasikan di bagian flutter pada pubspec.yaml.'),
  Question(
      id: 'q7',
      category: 'State',
      text: 'Fungsi notifyListeners() pada ChangeNotifier adalah …',
      options: [
        'Memberi tahu listener agar memperbarui tampilan',
        'Menghapus seluruh data',
        'Menutup halaman',
        'Mengunduh database'
      ],
      correctIndex: 0,
      explanation:
          'notifyListeners() memberi sinyal kepada pendengar bahwa data telah berubah.'),
  Question(
      id: 'q8',
      category: 'Responsif',
      text:
          'Widget yang memberikan batas ukuran dari parent kepada builder adalah …',
      options: ['Text', 'Icon', 'Divider', 'LayoutBuilder'],
      correctIndex: 3,
      explanation:
          'LayoutBuilder menyediakan BoxConstraints sehingga layout dapat menyesuaikan ruang yang tersedia.'),
  Question(
      id: 'q9',
      category: 'Siklus hidup',
      text: 'TextEditingController milik State sebaiknya dibersihkan melalui …',
      options: ['build()', 'dispose()', 'runApp()', 'initState()'],
      correctIndex: 1,
      explanation:
          'dispose() digunakan untuk melepas resource ketika State tidak lagi dipakai.'),
  Question(
      id: 'q10',
      category: 'Tema',
      text:
          'Properti MaterialApp untuk menentukan tema terang atau gelap adalah …',
      options: ['home', 'routes', 'themeMode', 'title'],
      correctIndex: 2,
      explanation:
          'themeMode memilih mode tema. theme dan darkTheme menyimpan konfigurasi masing-masing tema.'),
];
