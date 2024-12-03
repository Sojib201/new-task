import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrGenerator extends StatefulWidget {
  const QrGenerator({super.key});

  @override
  State<QrGenerator> createState() => _QrGeneratorState();
}

class _QrGeneratorState extends State<QrGenerator> {
  TextEditingController _urlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Code Generator'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (_urlController.text.isNotEmpty)
                QrImageView(
                  data: _urlController.text,
                  version: QrVersions.auto,
                  size: 200,
                ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: TextField(
                  controller: _urlController,
                  decoration: InputDecoration(
                    hintText: 'Enter Data',
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {});
                  },
                  child: Text('Generate QR Code'))
            ],
          ),
        ),
      ),
    );
  }
}
