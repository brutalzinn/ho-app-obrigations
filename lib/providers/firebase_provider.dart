// ignore: depend_on_referenced_packages
import "package:firebase_messaging/firebase_messaging.dart";
import "package:flutter/foundation.dart";
import "package:flutter_app_obrigations/core/config.dart";

class FirebaseProvider {
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();
    final fCMToken = await _firebaseMessaging.getToken();
    Config.firebaseToken = fCMToken!;
    if (kDebugMode) {
      print("token: $fCMToken");
    }
  }
}
