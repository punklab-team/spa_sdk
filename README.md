# spa_sdk

SPA SDK for Flutter

## Getting Started

This project is a starting point for a Flutter
[plug-in package](https://flutter.dev/developing-packages/),
a specialized package that includes platform-specific implementation code for
Android and/or iOS. 

For help getting started with Flutter development, view the
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


## Android
    <uses-permission android:name="android.permission.FOREGROUND_SERVICE" />
    <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>


## iOS
    // This is probably the only one you need. Background location is supported
    // by this -- the caveat is that a blue badge is shown in the status bar
    // when the app is using location service while in the background.
    NSLocationWhenInUseUsageDescription
    
    // Deprecated, use NSLocationAlwaysAndWhenInUseUsageDescription instead.
    NSLocationAlwaysUsageDescription
    
    // Use this very carefully. This key is required only if your iOS app
    // uses APIs that access the user’s location information at all times,
    // even if the app isn't running.
    NSLocationAlwaysAndWhenInUseUsageDescription

# spa_sdk

    Вы должны инициализировать SDK с помощью метода [SpaSdk.init]
    Указав [SpaSdk.counterId] - идентификатор счетчика в СПА
    и [SpaSdk.uriServiceSpa] - адрес сервера СПА
    
    После инициализации SDK можно использовать методы для отправки событий на сервер СПА
    Для отправки события на сервер используйте метод [SpaSdk.sendEvent]
    
    Есть несколько дефолтных конструкторов для создания событий:
    [EventSpa.appException] - для отправки исключений
    [EventSpa.appUpdate] - для отправки событий об обновлении приложения
    [EventSpa.linkOpened] - для отправки событий об открытии ссылки
    [EventSpa.error] - для отправки ошибок
    [EventSpa.fileOpenedInLink] - для отправки событий об открытии файла по ссылке
    [EventSpa.firstOpen] - для отправки событий первого открытия приложения
    [EventSpa.screenView] - для отправки событий просмотра экрана
    [EventSpa.scroll] - для отправки событий скролла
    [EventSpa.appSessionStart] - для отправки событий начала сессии
    [EventSpa.appSessionEnd] - для отправки событий окончания сессии
    [EventSpa.search] - для отправки событий поиска
    [EventSpa.custom] - для отправки кастомных событий
    
    Дефолтные данные которые мы собираем и отправляем вместе с событием:
    
    [EventSpa.ipAddress] - ip адрес
    [EventSpa.sessionId] - id сессии
    [EventSpa.libraryVersion] - версия библиотеки
    [EventSpa.counterId] - id счетчика
    [EventSpa.appVersion] - версия приложения
    [EventSpa.deviceId] - id устройства
    [EventSpa.appName] - название приложения
    [EventSpa.deviceName] - название устройства
    [EventSpa.osVersion] - версия операционной системы
    [EventSpa.osName] - название операционной системы
    [EventSpa.platform] - платформа
    [EventSpa.language] - язык
    [EventSpa.resolutionWidth] - ширина экрана
    [EventSpa.resolutionHeight] - высота экрана
    [EventSpa.id] - id события
    
    Поля которые требуют дополнителые действия:
    
    [EventSpa.latitude] - широта
    [EventSpa.longitude] - долгота
    
      Нужно вызвать метод [SpaSdk.activateLocation] для вызова разрешения на доступ к геолокации и добавления координат ко всем событиям
    
      Требуется добавить в Info.plist следующие строки:
    
      NSLocationAlwaysUsageDescription
      NSLocationWhenInUseUsageDescription
      NSLocationAlwaysAndWhenInUseUsageDescription

      И разрешения для Android

      <uses-permission android:name="android.permission.FOREGROUND_SERVICE" />
      <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
    
    [EventSpa.userId] - id пользователя
    
     Нужно вызвать метод [SpaSdk.auth] для добавления id пользователя ко всем событиям
    
    
    В случае возникновения ошибок при отправке событий, они сохраняются в локальной базе данных
    и отправляются на сервер при следующей отправке событий
    
