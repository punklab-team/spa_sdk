# SPA SDK for Flutter

[![pub package](https://img.shields.io/pub/v/spa_sdk.svg)](https://pub.dev/packages/spa_sdk)  
[![platform](https://img.shields.io/badge/platform-android%20%7C%20ios-blue.svg)](https://flutter.dev/)  
[![License: MIT](https://img.shields.io/badge/license-MIT-lightgrey.svg)](LICENSE)

**SPA SDK** — плагин для Flutter, предназначенный для сбора пользовательских событий и отправки их на сервер SPA (Система Пользовательской Аналитики). Поддерживается Android и iOS.

---

## 📦 Установка

Добавьте в `pubspec.yaml`:

```yaml
dependencies:
  spa_sdk: ^<последняя_версия>
```

Затем выполните:

```bash
flutter pub get
```

---

## 🚀 Быстрый старт

### 1. Инициализация SDK

```dart
await SpaSdk.init(
  counterId: 'ваш-counter-id',
  uriServiceSpa: Uri.parse('https://your-spa-server.com'),
);
```

### 2. Отправка событий

```dart
SpaSdk.sendEvent(
  EventSpa.screenView(screenName: 'HomePage'),
);
```

---

## 📲 Платформенные настройки

### Android

В `android/app/src/main/AndroidManifest.xml` добавьте:

```xml
<uses-permission android:name="android.permission.FOREGROUND_SERVICE" />
<uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
```

### iOS

В `ios/Runner/Info.plist` добавьте:

```xml
<key>NSLocationWhenInUseUsageDescription</key>
<string>Приложению требуется доступ к вашей геолокации.</string>

<key>NSLocationAlwaysUsageDescription</key>
<string>Приложению требуется постоянный доступ к геолокации.</string>

<key>NSLocationAlwaysAndWhenInUseUsageDescription</key>
<string>Приложению требуется доступ к геолокации даже в фоновом режиме.</string>
```

---

## 🧾 Типы событий

Используйте один из следующих конструкторов:

| Метод                              | Назначение                          |
|-----------------------------------|-------------------------------------|
| `EventSpa.appException(...)`      | Исключения приложения               |
| `EventSpa.appUpdate(...)`         | Обновление приложения               |
| `EventSpa.linkOpened(...)`        | Открытие ссылки                     |
| `EventSpa.error(...)`             | Ошибка                              |
| `EventSpa.fileOpenedInLink(...)`  | Открытие файла по ссылке           |
| `EventSpa.firstOpen()`            | Первое открытие приложения          |
| `EventSpa.screenView(...)`        | Просмотр экрана                     |
| `EventSpa.scroll(...)`            | Скролл                              |
| `EventSpa.appSessionStart()`      | Начало сессии                       |
| `EventSpa.appSessionEnd()`        | Завершение сессии                   |
| `EventSpa.search(...)`            | Событие поиска                      |
| `EventSpa.custom(...)`            | Кастомное событие                   |

---

## 📡 Автоматически добавляемые поля

Каждое событие содержит следующие данные:

- `ipAddress`
- `sessionId`
- `libraryVersion`
- `counterId`
- `appVersion`
- `appName`
- `deviceId`
- `deviceName`
- `osVersion`
- `osName`
- `platform`
- `language`
- `resolutionWidth`
- `resolutionHeight`
- `id` (уникальный ID события)

---

## 📍 Геолокация

Чтобы добавить координаты `latitude` и `longitude` ко всем событиям:

1. Вызовите метод:

```dart
await SpaSdk.activateLocation();
```

2. Убедитесь, что разрешения добавлены (см. выше раздел iOS/Android).

---

## 👤 Идентификатор пользователя

Чтобы привязать `userId` ко всем событиям:

```dart
await SpaSdk.auth('user-id-123');
```

---

## 💾 Обработка ошибок

Если при отправке события возникает ошибка (например, отсутствие сети), оно сохраняется в локальную базу данных и будет автоматически отправлено при следующей успешной попытке.

---

## 📚 Полезные ссылки

- [Создание Flutter-плагинов](https://flutter.dev/developing-packages/)
- [Документация Flutter](https://flutter.dev/docs)
