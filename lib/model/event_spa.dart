import 'dart:convert';

class EventSpa {

  /// The latitude and longitude of the user's location
  /// Need permission location

  final String? latitude;

  /// The latitude and longitude of the user's location
  /// Need permission location

  final String? longitude;

  /// The version of the library

  final String? libraryVersion;

  /// The IP address of the user
  /// Use the [NetworkRequest.getIpAddress] to get the IP address
  /// Use service [https://api64.ipify.org]
  /// Need permission internet

  final String? ipAddress;

  /// The screen of the app
  /// The screen is the current screen that the user is on
  /// Example: /home, /profile/settings

  final String? appScreen;

  /// The version of the app

  final String? appVersion;

  /// Unique user id is auth service

  final String? userId;

  /// The session id created when the app is opened and destroyed when the app is closed

  final String? sessionId;

  /// Unique counter id, counter get from the SPA service

  final String? counterId;

  /// The type of the event
  /// Example: app_exception, link_opened

  final String? eventType;

  /// The device id

  final String? deviceId;

  /// The name of the app

  final String? appName;

  /// The name of the device

  final String? deviceName;

  /// The version of the OS

  final String? osVersion;

  /// The name of the OS

  final String? osName;

  /// The platform of the device

  final String? platform;

  /// The language code of the device

  final String? language;

  /// The width of the screen

  final String? resolutionWidth;

  /// The height of the screen

  final String? resolutionHeight;

  /// The custom parameter of the event

  final Map<String, dynamic>? customParam;

  const EventSpa({
    this.latitude,
    this.longitude,
    this.libraryVersion,
    this.ipAddress,
    this.userId,
    this.sessionId,
    this.counterId,
    this.appScreen,
    this.appVersion,

    required this.eventType,

    this.deviceId,
    this.appName,
    this.deviceName,
    this.osVersion,
    this.osName,
    this.platform,
    this.language,
    this.resolutionWidth,
    this.resolutionHeight,

    this.customParam,
  });

  /// Convert this EventSpa to a json string

  String get toJsonString => jsonEncode(toMap());

  /// Convert this EventSpa to a json object

  dynamic get toJson => jsonDecode(toJsonString);

  /// Convert the json string to EventSpa

  factory EventSpa.fromJson(String source) => EventSpa._fromMap(json.decode(source));

  /// Use this constructor is app fatal error and crash app
  /// [fatal] is the error message
  /// [engagementTimeMSec] is the time in milliseconds, the user was engaged with the app

   EventSpa.appException({
    required String fatal,
    required String engagementTimeMSec,
  }) : this(
      eventType: "app_exception",
      customParam: {
        'fatal': fatal,
        'engagement_time_msec': engagementTimeMSec,
      }
  );

  /// Use this constructor is end user update the app
  /// [previousAppVersion] is the previous version of the app

  EventSpa.appUpdate({
    required String previousAppVersion,
  }) : this(
      eventType: "app_update",
      customParam: {
        'previous_app_version': previousAppVersion,
      }
  );

  /// Use this constructor is user click and open the link
  /// [linkUri] is the link that was opened

  EventSpa.linkOpened({
    required String linkUri,
  }) : this(
      eventType: "link_opened",
      customParam: {
        'link_uri': linkUri,
      }
  );

  /// Use this constructor is app error
  /// [error] is the error message
  /// [errorValue] is the error value

  EventSpa.error({
    required String error,
    required String errorValue,
  }) : this(
      eventType: "error",
      customParam: {
        'error': error,
        'error_value': errorValue,
      }
  );


  /// Use this constructor is user click link and open the file
  /// Open file is current regular: pdf|xlsx?|docx?|txt|rtf|csv|exe|key|pp(s|t|tx)|7z|pkg|rar|gz|zip|avi|mov|mp4|mpe?g|wmv|midi?|mp3|wav|wma
  /// [linkUri] is the link that was opened
  /// [linkId] is the link id
  /// [linkText] is the link text
  /// [linkDomain] is the link domain
  /// [linkClassed] is the link classed
  /// [fileName] is the file name
  /// [fileExtension] is the file extension

  EventSpa.fileOpenedInLink({
    required String linkUri,
    required String linkId,
    required String linkText,
    required String linkDomain,
    required String linkClassed,
    required String fileName,
    required String fileExtension,
  }) : this(
    eventType: "file_opened",
    customParam: {
      'link_uri': linkUri,
      'link_id': linkId,
      'link_text': linkText,
      'link_domain': linkDomain,
      'link_classed': linkClassed,
      'file_name': fileName,
      'file_extension': fileExtension,
    },
  );


  /// Use this constructor is user first open the app
  /// [previousGmpAppId] is the previous gmp app id
  /// [updatedWithAnalytics] is the updated with analytics
  /// [previousFirstOpenCount] is the previous first open count
  /// [systemApp] is the system app
  /// [systemAppUpdate] is the system app update
  /// [deferredAnalyticsCollection] is the deferred analytics collection
  /// [resetAnalyticsCause] is the reset analytics cause
  /// [engagementTimeMsec] is the time in milliseconds, the user was engaged with the app

  EventSpa.firstOpen({
    required String previousGmpAppId,
    required String updatedWithAnalytics,
    required String previousFirstOpenCount,
    required String systemApp,
    required String systemAppUpdate,
    required String deferredAnalyticsCollection,
    required String resetAnalyticsCause,
    required String engagementTimeMSec,
  }) : this(
    eventType: "first_open",
    customParam: {
      'previous_gmp_app_id': previousGmpAppId,
      'updated_with_analytics': updatedWithAnalytics,
      'previous_first_open_count': previousFirstOpenCount,
      'system_app': systemApp,
      'system_app_update': systemAppUpdate,
      'deferred_analytics_collection': deferredAnalyticsCollection,
      'reset_analytics_cause': resetAnalyticsCause,
      'engagement_time_msec': engagementTimeMSec,
    }
  );

  /// Use this constructor is user open screen
  /// [pageLocation] is new screen uri
  /// [pageReferrer] is old screen uri

  EventSpa.screenView(
      String pageLocation,
      String pageReferrer,
      ) : this(
    eventType: "screen_view",
    customParam: {
      'page_location': pageLocation,
      'page_referrer': pageReferrer,
    },
  );

  /// Use this constructor is user scroll
  /// [engagementTimeMSec] is the time in milliseconds, the user was engaged with the app
  /// user first time reach the bottom of the screen

  EventSpa.scroll(
      String engagementTimeMSec,
      ) : this(
    eventType: "scroll",
    customParam: {
      'engagement_time_msec': engagementTimeMSec,
    }
  );

  /// Use this constructor is open the app

  const EventSpa.appSessionStart() : this(
    eventType: "session_start",
  );

  /// Use this constructor is destroy the app

  const EventSpa.appSessionEnd() : this(
    eventType: "session_end",
  );

  /// Use this constructor is user search
  /// [value] is the search value

  EventSpa.search({required String value}) : this(
      eventType: "search",
      customParam: {
        'search_request': value,
      }
  );

  /// Use this constructor need create custom event
  /// [eventType] is the event type
  /// [customParam] is the custom parameter

  EventSpa.custom({
    required String eventType,
    required Map<String, dynamic> customParam,
  }) : this(
    eventType: eventType,
    customParam: customParam,
  );


  Map<String, dynamic> toMap() {
    final date = DateTime.now();
    return {
      'apiVersion': "1.0",
      'counterId' : counterId ?? '',
      'timestamp': date.toUtc().millisecondsSinceEpoch.toString(),
      'channelType': "CustomScript",
      'channelName' : "RegEvents API",
      'eventCaption': eventType ?? '',
      'customparams': [
        {
          if(latitude != null) 'latitude': latitude,
          if(longitude != null) 'longitude': longitude,
          if(osName != null) 'os_name': osName,
          if(deviceName != null) 'device_name': deviceName,
          if(libraryVersion != null) 'library': libraryVersion,
          if(ipAddress != null) 'ip_address': ipAddress,
          if(deviceId != null) 'device_id': deviceId,
          if(userId != null) 'user_id': userId,
          if(sessionId != null) 'session_id': sessionId,
          if(appScreen != null) 'app_screen': appScreen,
          if(osVersion != null) 'os_version': osVersion,
          if(appVersion != null) 'release_version': appVersion,
          if(appName != null) 'app_name': appName,
          if(platform != null) 'platform': platform,
          if(language != null) 'language': language,
          if(resolutionWidth != null) 'resolution_width': resolutionWidth,
          if(resolutionHeight != null) 'resolution_height': resolutionHeight,
          'time_zone': date.timeZoneName,
          ...?customParam,
        }
      ]
    };
  }

  factory EventSpa._fromMap(Map<String, dynamic> map) {
    return EventSpa(
      latitude: map['latitude'],
      longitude: map['longitude'],
      libraryVersion: map['library'],
      ipAddress: map['ip_address'],
      userId: map['user_id'],
      sessionId: map['session_id'],
      counterId: map['counter_id'],
      appScreen: map['app_screen'],
      appVersion: map['release_version'],
      eventType: map['eventCaption'],
      customParam: map['customparams'],
    );
  }


  /// CopyWith the current EventSpa with the new values
  /// [event] is the new values
  /// Return the new EventSpa
  /// If the value is null, the old value will be used
  /// If the value is not null, the new value will be used

  EventSpa copyWith(EventSpa event) {
    return EventSpa(
      latitude: event.latitude ?? latitude,
      longitude: event.longitude ?? longitude,
      libraryVersion: event.libraryVersion ?? libraryVersion,
      ipAddress: event.ipAddress ?? ipAddress,
      userId: event.userId ?? userId,
      sessionId: event.sessionId ?? sessionId,
      counterId: event.counterId ?? counterId,
      appScreen: event.appScreen ?? appScreen,
      appVersion: event.appVersion ?? appVersion,
      eventType: event.eventType ?? eventType,
      deviceId: event.deviceId ?? deviceId,
      appName: event.appName ?? appName,
      deviceName: event.deviceName ?? deviceName,
      osVersion: event.osVersion ?? osVersion,
      osName: event.osName ?? osName,
      platform: event.platform ?? platform,
      language: event.language ?? language,
      resolutionWidth: event.resolutionWidth ?? resolutionWidth,
      resolutionHeight: event.resolutionHeight ?? resolutionHeight,
      customParam: event.customParam,
    );
  }
}