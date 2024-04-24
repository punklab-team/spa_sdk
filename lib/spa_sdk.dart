
import 'dart:io';

import 'package:client_information/client_information.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'model/event_spa.dart';
import 'network_request.dart';


///need singleton
class SpaSdk {
  
  /// Singleton instance of the SpaSdk

  static SpaSdk? _instance;

  /// Singleton instance of the SpaSdk
  /// [counterId] is the counter id which is required to send the event
  /// [uriServiceSpa] is the uri of the server where the event will be sent

  static SpaSdk instance({required String counterId, required String uriServiceSpa,}) => _instance ??= SpaSdk._(counterId: counterId, uriServiceSpa: uriServiceSpa);

  /// Version of the sdk
  
  static const String _version = "0.0.1";

  /// Counter id

  final String counterId;

  /// Uri of the spa server

  final String uriServiceSpa;

  /// id auth user
  
  static String? _userId;

  /// id session

  static final String _sessionId = const Uuid().v4();

  /// ip address

  static String _ip = "0.0.0.0";

  /// Network request

  static final NetworkRequest _networkRequest = NetworkRequest();

  /// Client information

  static final ClientInformation _clientInfo = ClientInformation();

  /// Window instance for the flutter

  static final SingletonFlutterWindow _window = WidgetsBinding.instance.window;

  SpaSdk._({
    required this.uriServiceSpa,
    required this.counterId,
  }){
    _initIpAddress();
  }

  Future<void> _initIpAddress() async {
    try {
      var value = await _networkRequest.getIpAddress();
      _ip = value['ip'] ?? 'none';
    } catch (_) {
      _ip = 'none';
    }
  }

  /// Set the user id
  /// and add this id to all events

  void auth(String userId) {
    _userId = userId;
  }


  /// Send the event to the server
  /// [event] is the event which need to send
  /// add the default data to the event

  Future<Map<String, dynamic>> sendEvent(EventSpa event) {
    return _networkRequest.postSpaMessage(
      _defaultDataEvent().copyWith(event),
      uriServiceSpa
    );
  }

  /// Default data for the event
  
  EventSpa _defaultDataEvent() {
    return EventSpa(
      latitude: null,//_clientInfo.latitude,
      longitude: null,//_clientInfo.longitude,
      libraryVersion: _version,
      ipAddress: _ip,
      userId: _userId,
      sessionId: _sessionId,
      counterId: counterId,
      appVersion: _clientInfo.applicationVersion,
      deviceId: _clientInfo.deviceId,
      appName: _clientInfo.applicationName,
      deviceName: _clientInfo.deviceName,
      osVersion: _clientInfo.osVersion,
      osName: _clientInfo.osName,
      platform: _getCurrentPlatform(),
      language: _window.locale.languageCode,
      resolutionWidth: _window.physicalSize.width.toString(),
      resolutionHeight: _window.physicalSize.height.toString(),
      eventType: null,
    );
  }

  /// Get the current platform
  
  String _getCurrentPlatform() {
    if (kIsWeb) return "web";

    return Platform.operatingSystem;
  }
}
