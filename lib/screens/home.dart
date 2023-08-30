import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app_obrigations/providers/google_provider.dart';
import 'package:flutter_app_obrigations/screens/qr_code_page.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('QR Code Scanner'),
        ),
        body: Center(
          child: Column(
            children: [
              TextButton(
                onPressed: GoogleSignInProvider().googleLogin,
                child: const Text("Sign with Google to more more resources"),
              ),
              ////show my current obrigation here
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const QRCodeScannerPage(),
                    ),
                  );
                },
                child: const Text("Scan QR Code"),
              ),
            ],
          ),
        ));
  }
}
