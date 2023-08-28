import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_obrigations/api/firebase_api.dart';
import "package:firebase_core/firebase_core.dart";
import 'screens/qr_code_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseApi().initNotifications();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ErrorWidget.builder = (FlutterErrorDetails details) {
      // If we're in debug mode, use the normal error widget which shows the error
      // message:
      if (kDebugMode) {
        return ErrorWidget(details.exception);
      }
      // In release builds, show a yellow-on-blue message instead:
      return Container(
        alignment: Alignment.center,
        child: Text(
          'Error!\n${details.exception}',
          style: const TextStyle(color: Colors.yellow),
          textAlign: TextAlign.center,
          textDirection: TextDirection.ltr,
        ),
      );
    };
    return MaterialApp(
      title: 'QR Code Scanner App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const QRCodeScannerPage(),
    );
  }
}
