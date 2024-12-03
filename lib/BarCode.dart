import 'package:flutter/material.dart';

import 'qrGenerator.dart';
import 'qrsScanner.dart';

class barCode extends StatefulWidget {
  const barCode({super.key});

  @override
  State<barCode> createState() => _barCodeState();
}

class _barCodeState extends State<barCode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Code Scanner and Generator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>QRScanner()));
            }, child: Text('Scan QR Code'),),
            SizedBox(height: 15,),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>QrGenerator()));
            }, child: Text('Generate QR Code'),),
          ],
        ),
      ),
    );
  }
}
