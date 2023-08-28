import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_obrigations/core/http_client.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import 'result_page.dart';

class QRCodeScannerPage extends StatefulWidget {
  const QRCodeScannerPage({super.key});

  @override
  _QRCodeScannerPageState createState() => _QRCodeScannerPageState();
}

class _QRCodeScannerPageState extends State<QRCodeScannerPage> {
  QRViewController? _controller;
  final GlobalKey _qrKey = GlobalKey(debugLabel: 'QR');

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      _controller = controller;
    });

    _controller!.scannedDataStream.listen((
      scanData,
    ) async {
      try {
        final sucesss = await HttpClient.makeApiCall(scanData.code!);
        if (sucesss) {
          // ignore: use_build_context_synchronously
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => ResultPage(scanData.code!),
            ),
          );
        }
      } on Exception {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: const Text("Error"),
                  content: const Text("Faild to connect with obrigation API."),
                  actions: [
                    TextButton(
                      child: const Text('OK'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ));
              
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Code Scanner'),
      ),
      body: QRView(
        key: _qrKey,
        onQRViewCreated: _onQRViewCreated,
      ),
    );
  }
}
