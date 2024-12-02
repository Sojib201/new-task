import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';


class imgaePicker extends StatefulWidget {
  const imgaePicker({super.key});

  @override
  State<imgaePicker> createState() => _cameraState();
}

class _cameraState extends State<imgaePicker> {

  File? _image;

  Future<void> _pickImage(ImageSource source) async {
    try{
      final _image =await ImagePicker().pickImage(source: source);
      if(_image==null)return;

      final imageTemporary= File(_image.path);
      setState(()=>this._image=imageTemporary);

    }on PlatformException catch(e){
      print('No image selected : $e');
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Image Picker Example")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _image != null
                  ? Image.file(_image!, height: 300, width: 300, fit: BoxFit.cover)
                  : Text("No image selected"),

            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _pickImage(ImageSource.camera),
              child:
                Container(
                  height: 50,
                  width: 150,
                  child: Row(
                    children: [
                      Icon(Icons.camera),
                      SizedBox(width: 10,),
                      Text('Pick from camera')
                    ],
                  ),
                ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _pickImage(ImageSource.gallery),
              child: Container(
                height: 50,
                width: 150,
                child: Row(
                  children: [
                    Icon(Icons.image_outlined),
                    SizedBox(width: 10,),
                    Text('Pick from Gallery')
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}






