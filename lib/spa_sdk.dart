
import 'spa_sdk_platform_interface.dart';

class SpaSdk {
  String getKey(){
    return SpaSdkPlatform.instance.getKey();
  }
  Future<void> setKey({required String apiKey}){
    return SpaSdkPlatform.instance.setKey(apiKey:apiKey);
  }
  Future<String?> getPlatformVersion() {
    return SpaSdkPlatform.instance.getPlatformVersion();
  }
}
