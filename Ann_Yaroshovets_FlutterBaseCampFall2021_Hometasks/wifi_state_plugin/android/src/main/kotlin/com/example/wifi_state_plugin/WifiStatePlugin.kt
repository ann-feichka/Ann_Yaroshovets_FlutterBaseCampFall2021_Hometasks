package com.example.wifi_state_plugin

import androidx.annotation.NonNull
import android.content.Context
import android.net.wifi.WifiManager
import android.content.IntentFilter
import android.net.ConnectivityManager
import android.content.BroadcastReceiver
import android.content.Intent
import android.net.NetworkInfo
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import android.os.BatteryManager
import android.graphics.Color
import android.app.NotificationChannel
import android.app.NotificationManager
import androidx.core.app.NotificationCompat


/** WifiStatePlugin */
class WifiStatePlugin : FlutterPlugin, MethodCallHandler, EventChannel.StreamHandler {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private lateinit var channel: MethodChannel
    private lateinit var channelEvent: EventChannel
    lateinit var context: Context


    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "wifi_state_plugin")
        channel.setMethodCallHandler(this)
        channelEvent = EventChannel(flutterPluginBinding.getBinaryMessenger(), "wifi_state_plugin_eventChannel")
        channelEvent.setStreamHandler(this)
        context = flutterPluginBinding.getApplicationContext()
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        if (call.method == "isWifiEnabled") {
            result.success(isWifiEnabled())
        } else if (call.method == "provideWifiState") {
            result.success(null)
            val intentFilter = IntentFilter()
            intentFilter.addAction(ConnectivityManager.CONNECTIVITY_ACTION)
            intentFilter.addAction("android.net.wifi.STATE_CHANGE")
            context.registerReceiver(object : BroadcastReceiver() {
                override fun onReceive(context: Context, intent: Intent) {
                    val connectivityManager = context.getSystemService(Context.CONNECTIVITY_SERVICE) as ConnectivityManager
                    val networkInfo = connectivityManager.getActiveNetworkInfo()
                    if (networkInfo != null && networkInfo.type == ConnectivityManager.TYPE_WIFI) {
                        channel.invokeMethod("wifiStateResponse", true)
                    } else {
                        channel.invokeMethod("wifiStateResponse", false)
                    }

                }
            }, intentFilter)
        } else {
            result.notImplemented()
        }
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    override fun onListen(arguments: Any?, events: EventChannel.EventSink) {
        val intentFilter = IntentFilter()
        intentFilter.addAction(ConnectivityManager.CONNECTIVITY_ACTION)
        intentFilter.addAction("android.net.wifi.STATE_CHANGE")
        context.registerReceiver(object : BroadcastReceiver() {
            override fun onReceive(context: Context, intent: Intent) {
                val connectivityManager = context.getSystemService(Context.CONNECTIVITY_SERVICE) as ConnectivityManager
                val networkInfo = connectivityManager.getActiveNetworkInfo()
                if (networkInfo != null && networkInfo.type == ConnectivityManager.TYPE_WIFI) {
                    sendNotification(title = "Wifi state", message = "Changed to: on")
                    events.success(true)
                } else {
                    sendNotification(title = "Wifi state", message = "Changed to: off")
                    events.success(false)
                }
            }
        }, intentFilter)
    }


    override fun onCancel(arguments: Any?) {}


    private fun isWifiEnabled(): Boolean {
        val wifiManager: WifiManager = context.getSystemService(Context.WIFI_SERVICE) as WifiManager
        return wifiManager.isWifiEnabled()
    }

    private fun sendNotification(title: String, message: String) {
        val notificationManager: NotificationManager = context.getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager
        val CHANNEL_ID = "my_channel_01"
        if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.O) {
            val name: CharSequence = "my_channel"
            val Description = "This is my channel"
            val importance: Int = NotificationManager.IMPORTANCE_HIGH
            val mChannel = NotificationChannel(CHANNEL_ID, name, importance)
            mChannel.setDescription(Description)
            mChannel.enableLights(true)
            mChannel.setLightColor(Color.RED)
            mChannel.enableVibration(true)
            mChannel.setVibrationPattern(longArrayOf(100, 200, 300, 400, 500, 400, 300, 200, 400))
            mChannel.setShowBadge(false)
            notificationManager.createNotificationChannel(mChannel)
        }
        val builder: NotificationCompat.Builder = NotificationCompat.Builder(context, CHANNEL_ID)
                .setSmallIcon(android.R.drawable.ic_dialog_info)
                .setContentTitle(title)
                .setContentText(message)
                .setPriority(NotificationCompat.PRIORITY_DEFAULT)
        notificationManager.notify(1, builder.build())
    }

}
