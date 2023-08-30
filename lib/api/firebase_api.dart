// ignore: depend_on_referenced_packages
import "package:firebase_messaging/firebase_messaging.dart";
import "package:flutter/foundation.dart";
import "package:flutter_app_obrigations/core/config.dart";

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> handleBackgroundMessage(RemoteMessage message) async {}

  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();
    final fCMToken = await _firebaseMessaging.getToken();
    Config.firebaseToken = fCMToken!;
    if (kDebugMode) {
      print("token: $fCMToken");
    }
    // FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  }
}
