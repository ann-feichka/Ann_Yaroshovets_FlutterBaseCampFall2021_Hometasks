import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wifi_state_plugin/wifi_state_plugin.dart';

void main() {
  const MethodChannel channel = MethodChannel('wifi_state_plugin');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  // test('getPlatformVersion', () async {
  //   expect(await WifiStatePlugin.platformVersion, '42');
  // });
}
