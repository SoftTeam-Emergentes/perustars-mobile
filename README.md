# perustars-mobile

PeruStars Mobile App Frontend

Probado usando Pixel 5 API 28 (Android 9) en emulación

# Instalación y ejecución

SDKs requeridos:
- Dart 2.17.0
- Flutter 3.0.0

Para obtener dependencias:
```sh
flutter pub get
flutter pub upgrade
```

Para ejecutar el proyecto:
```sh
flutter run lib/main.dart --no-sound-null-safety
```

Para crear archivo APK:
```sh
flutter build apk --no-sound-null-safety
```

# Solución de problemas de ejecución
Configuraciones de Android para compilación (Cambiar en "android/app/build.gradle"):
- compileSdkVersion 33
- minSdkVersion 28
- targetSdkVersion 28

Reemplazar Gradle en "android/build.gradle" con lo siguiente:
```sh
classpath 'com.android.tools.build:gradle:4.2.2'
```
