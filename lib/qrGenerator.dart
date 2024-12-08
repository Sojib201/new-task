// import 'dart:typed_data';
// import 'dart:ui' as ui;
//
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:image_gallery_saver/image_gallery_saver.dart';
// import 'package:qr_flutter/qr_flutter.dart';
//
// class QrGenerator extends StatefulWidget {
//   const QrGenerator({super.key});
//
//   @override
//   State<QrGenerator> createState() => _QrGeneratorState();
// }
//
// class _QrGeneratorState extends State<QrGenerator> {
//   final TextEditingController _urlController = TextEditingController();
//   final GlobalKey _repaintKey = GlobalKey();
//
//   Future<Uint8List?> _captureQRCode() async {
//     try {
//       RenderRepaintBoundary? boundary =
//       _repaintKey.currentContext?.findRenderObject() as RenderRepaintBoundary?;
//       if (boundary == null) {
//         print("RepaintBoundary is null.");
//         return null;
//       }
//
//       // Ensure QR code is fully rendered
//       //await Future.delayed(Duration(milliseconds: 10));
//
//       ui.Image image = await boundary.toImage(pixelRatio:1); // Lower pixel ratio
//       ByteData? byteData =
//       await image.toByteData(format: ui.ImageByteFormat.png);
//
//       // Logging to verify image capture
//       print("Captured image size: ${byteData?.lengthInBytes}");
//
//       return byteData?.buffer.asUint8List();
//     } catch (e) {
//       print("Error capturing QR code: $e");
//       return null;
//     }
//   }
//
//
//   Future<void> _saveToGallery(Uint8List imageBytes) async {
//     final result = await ImageGallerySaver.saveImage(
//       imageBytes,
//       quality: 100,
//       name: "qr_code_image",
//     );
//     print("Saved to gallery: $result");
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text("QR Code saved to gallery!")),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('QR Code Generator'),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             SizedBox(height: 15),
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 10),
//               child: TextField(
//                 controller: _urlController,
//                 decoration: InputDecoration(
//                   hintText: 'Enter Data',
//                   border: OutlineInputBorder(),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(15),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 15),
//             ElevatedButton(
//               onPressed: () {
//                 setState(() {}); // Trigger rebuild to display updated QR code
//               },
//               child: Text('Generate QR Code'),
//             ),
//             SizedBox(height: 15),
//             if (_urlController.text.isNotEmpty)
//               RepaintBoundary(
//                 key: _repaintKey,
//                 child: QrImageView(
//                   data: _urlController.text,
//                   version: QrVersions.auto,
//                   size: 200,
//                   gapless: false,
//                 ),
//               ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () async {
//                 Uint8List? imageBytes = await _captureQRCode();
//                 if (imageBytes != null) {
//                   await _saveToGallery(imageBytes);
//                 } else {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(content: Text("Failed to capture QR Code.")),
//                   );
//                 }
//               },
//               child: Text("Save QR Code to Gallery"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:screenshot/screenshot.dart';

class QrGenerator extends StatefulWidget {
  const QrGenerator({super.key});

  @override
  State<QrGenerator> createState() => _QrGeneratorState();
}

class _QrGeneratorState extends State<QrGenerator> {
  final TextEditingController _urlController = TextEditingController();
  ScreenshotController screenshotController = ScreenshotController();

  Future<Uint8List?> CaptureAndSave() async {
    final unit8list = await screenshotController.capture();
    if (unit8list != null) {
      final result = await ImageGallerySaver.saveImage(unit8list);
      if (result['isSuccess']) {
        print('Image saved to gallery');
      } else {
        print(' Failed to save gallery');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Code Generator'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 15),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
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
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                setState(() {}); // Trigger rebuild to display updated QR code
              },
              child: Text('Generate QR Code'),
            ),
            SizedBox(height: 15),
            if (_urlController.text.isNotEmpty)
              Screenshot(
                controller: screenshotController,
                child: QrImageView(
                  data: _urlController.text,
                  version: QrVersions.auto,
                  size: 200,
                  gapless: false,
                ),
              ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await CaptureAndSave();
              },
              child: Text("Save QR Code to Gallery"),
            ),
          ],
        ),
      ),
    );
  }
}
