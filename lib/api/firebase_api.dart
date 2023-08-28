// ignore: depend_on_referenced_packages
import "package:firebase_messaging/firebase_messaging.dart";

class FirebaseApi {
  final _testefirebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotifications() async {
    await _testefirebaseMessaging.requestPermission();
    final fCMToken = await _testefirebaseMessaging.getToken();
    print("token: $fCMToken");
  }
}
