import 'dart:async';

import 'package:flutter/services.dart';

class WifiStatePlugin {
  static const MethodChannel _channel = MethodChannel('wifi_state_plugin');

  static const EventChannel _channelEvent =
      EventChannel("wifi_state_plugin_eventChannel");

  WifiStatePlugin() {
    _channel.setMethodCallHandler(methodCallHandler);
  }

  late StreamController<bool> streamController;

  @override
  Future<dynamic> methodCallHandler(MethodCall call) {
    return Future<dynamic>(() {
      if (call.method == 'wifiStateResponse') {
        print('setMethodCallHandler ${call.arguments}');
        streamController.sink.add(call.arguments);
      }
    });
  }

  Stream<bool> get provideWifiState {
    streamController = StreamController.broadcast();
    _channel.invokeMethod('provideWifiState');
    return streamController.stream;
  }

  static Stream<bool?> get getWifiStateEvents =>
      _channelEvent.receiveBroadcastStream().map((event) => event);

  Future<bool?> get stopWifiListen async {
    await streamController.close();
    final bool? result = await _channel.invokeMethod('stopWifiListen');
    return result;
  }

  static void get sendPushNotification {
    _channel.invokeMethod('sendNotification');
  }

  static Future<bool> get isWifiEnabled async {
    final bool enabled = await _channel.invokeMethod('isWifiEnabled');
    return enabled;
  }
}
