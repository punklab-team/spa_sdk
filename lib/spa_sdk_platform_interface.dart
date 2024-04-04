import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'spa_sdk_method_channel.dart';

abstract class SpaSdkPlatform extends PlatformInterface {
  /// Constructs a SpaSdkPlatform.
  SpaSdkPlatform() : super(token: _token);

  static final Object _token = Object();

  static SpaSdkPlatform _instance = MethodChannelSpaSdk();

  /// The default instance of [SpaSdkPlatform] to use.
  ///
  /// Defaults to [MethodChannelSpaSdk].
  static SpaSdkPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [SpaSdkPlatform] when
  /// they register themselves.
  static set instance(SpaSdkPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
