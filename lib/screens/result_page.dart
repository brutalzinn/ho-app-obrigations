import 'dart:io';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final String scannedData;

  const ResultPage(this.scannedData, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Scanned QR Code Data:'),
            const SizedBox(height: 20),
            Text(
              scannedData,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                exit(1);
              },
              child: const Text('Obrigation completed.'),
            ),
          ],
        ),
      ),
    );
  }
}
