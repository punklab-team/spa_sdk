import 'package:flutter_test/flutter_test.dart';
import 'package:spa_sdk/spa_sdk.dart';
import 'package:spa_sdk/spa_sdk_platform_interface.dart';
import 'package:spa_sdk/spa_sdk_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockSpaSdkPlatform
    with MockPlatformInterfaceMixin
    implements SpaSdkPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final SpaSdkPlatform initialPlatform = SpaSdkPlatform.instance;

  test('$MethodChannelSpaSdk is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelSpaSdk>());
  });

  test('getPlatformVersion', () async {
    SpaSdk spaSdkPlugin = SpaSdk();
    MockSpaSdkPlatform fakePlatform = MockSpaSdkPlatform();
    SpaSdkPlatform.instance = fakePlatform;

    expect(await spaSdkPlugin.getPlatformVersion(), '42');
  });
}
