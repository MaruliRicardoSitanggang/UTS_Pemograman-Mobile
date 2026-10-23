# Struktur folder lengkap

Folder .git juga ada di ZIP untuk menyimpan histori commit. Isinya dikelola Git dan tidak perlu diedit manual. .dart_tool dan build dibuat otomatis oleh Flutter pada komputer Anda.

```text
quizora/
├── android/
│   ├── app/
│   │   ├── src/
│   │   │   ├── debug/
│   │   │   │   └── AndroidManifest.xml
│   │   │   ├── main/
│   │   │   │   ├── kotlin/
│   │   │   │   │   └── com/
│   │   │   │   │       └── maruli/
│   │   │   │   │           └── quizora/
│   │   │   │   │               └── MainActivity.kt
│   │   │   │   ├── res/
│   │   │   │   │   ├── drawable/
│   │   │   │   │   │   └── launch_background.xml
│   │   │   │   │   ├── drawable-v21/
│   │   │   │   │   │   └── launch_background.xml
│   │   │   │   │   ├── mipmap-hdpi/
│   │   │   │   │   │   └── ic_launcher.png
│   │   │   │   │   ├── mipmap-mdpi/
│   │   │   │   │   │   └── ic_launcher.png
│   │   │   │   │   ├── mipmap-xhdpi/
│   │   │   │   │   │   └── ic_launcher.png
│   │   │   │   │   ├── mipmap-xxhdpi/
│   │   │   │   │   │   └── ic_launcher.png
│   │   │   │   │   ├── mipmap-xxxhdpi/
│   │   │   │   │   │   └── ic_launcher.png
│   │   │   │   │   ├── values/
│   │   │   │   │   │   └── styles.xml
│   │   │   │   │   └── values-night/
│   │   │   │   │       └── styles.xml
│   │   │   │   └── AndroidManifest.xml
│   │   │   └── profile/
│   │   │       └── AndroidManifest.xml
│   │   └── build.gradle
│   ├── gradle/
│   │   └── wrapper/
│   │       ├── gradle-wrapper.jar
│   │       └── gradle-wrapper.properties
│   ├── .gitignore
│   ├── build.gradle
│   ├── gradle.properties
│   ├── gradlew
│   ├── gradlew.bat
│   └── settings.gradle
├── assets/
│   ├── fonts/
│   │   ├── OFL.txt
│   │   ├── Outfit-Bold.ttf
│   │   ├── Outfit-Regular.ttf
│   │   └── Outfit-SemiBold.ttf
│   └── images/
│       └── quizora_mark.png
├── docs/
│   ├── screenshots/
│   │   └── README.md
│   ├── CHECKLIST_PENGUMPULAN.md
│   ├── FLUTTER_LICENSE.txt
│   ├── PANDUAN_ANDROID_STUDIO.md
│   ├── PRESENTASI_DAN_KODE.md
│   ├── STRUKTUR_FOLDER.md
│   └── mockup.svg
├── lib/
│   ├── core/
│   │   └── app_theme.dart
│   ├── data/
│   │   └── question_bank.dart
│   ├── models/
│   │   └── question.dart
│   ├── screens/
│   │   ├── home_screen.dart
│   │   ├── quiz_screen.dart
│   │   ├── result_screen.dart
│   │   └── review_screen.dart
│   ├── state/
│   │   ├── quiz_controller.dart
│   │   └── quiz_scope.dart
│   ├── widgets/
│   │   ├── answer_option.dart
│   │   ├── app_card.dart
│   │   ├── primary_button.dart
│   │   ├── responsive_page.dart
│   │   ├── stat_chip.dart
│   │   └── theme_toggle.dart
│   ├── app.dart
│   └── main.dart
├── test/
│   ├── app_test.dart
│   └── quiz_controller_test.dart
├── web/
│   ├── icons/
│   │   ├── Icon-192.png
│   │   └── Icon-512.png
│   ├── favicon.png
│   ├── index.html
│   └── manifest.json
├── .gitignore
├── README.md
├── analysis_options.yaml
└── pubspec.yaml
```

## Folder/file otomatis saat dijalankan

- `.dart_tool/`: konfigurasi package dan cache lokal.
- `build/`: hasil build.
- `pubspec.lock`: versi dependency yang diselesaikan oleh SDK Anda; commit file ini setelah pub get.
- `android/local.properties`: lokasi SDK Android/Flutter pada komputer Anda; jangan diunggah.

Semua kode Dart aplikasi berada di lib/. MainActivity.kt hanya entry point native Android untuk menjalankan Flutter. Tidak perlu menulis ulang UI dalam Kotlin atau Java.
