import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'spa_sdk_platform_interface.dart';

/// An implementation of [SpaSdkPlatform] that uses method channels.
class MethodChannelSpaSdk extends SpaSdkPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('spa_sdk');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
