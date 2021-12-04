import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:wifi_state_plugin/wifi_state_plugin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // String _platformVersion = 'Unknown';
  bool _isWifiEnable = false;

  @override
  void initState() {
    initWifiState();
    super.initState();
    // initPlatformState();

  }

  // Platform messages are asynchronous, so we initialize in an async method.
  // Future<void> initPlatformState() async {
  //   String platformVersion;
  //   // Platform messages may fail, so we use a try/catch PlatformException.
  //   // We also handle the message potentially returning null.
  //   try {
  //     platformVersion =
  //         await WifiStatePlugin.platformVersion ?? 'Unknown platform version';
  //   } on PlatformException {
  //     platformVersion = 'Failed to get platform version.';
  //   }
  //
  //   // If the widget was removed from the tree while the asynchronous platform
  //   // message was in flight, we want to discard the reply rather than calling
  //   // setState to update our non-existent appearance.
  //   if (!mounted) return;
  //
  //   setState(() {
  //     _platformVersion = platformVersion;
  //   });
  // }

  Future<void> initWifiState() async {
    bool isWifiEnable;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.

    isWifiEnable = await WifiStatePlugin.isWifiEnabled;

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    // if (!mounted) return;

    setState(() {
      _isWifiEnable = isWifiEnable;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              getWifiWidget(_isWifiEnable),
              StreamBuilder<bool?>(
                  stream: WifiStatePlugin.getWifiStateEvents,
                  builder: (BuildContext context, AsyncSnapshot<bool?> snapshot) {
                    return Text('Wifi state changed to: ${snapshot.data}\n');
                  }),
            ],
          ),
        ),
      ),
    );
  }

  Widget getWifiWidget(bool? isEnabled) {
    String message = "";
    if(isEnabled == true) {
      message = "On setup:on";
    } else if(isEnabled == false){
      message = "On setup:off";
    }
    return Text(message);
  }
}
