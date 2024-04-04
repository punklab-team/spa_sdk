
import 'spa_sdk_platform_interface.dart';

class SpaSdk {
  Future<String?> getPlatformVersion() {
    return SpaSdkPlatform.instance.getPlatformVersion();
  }
}
