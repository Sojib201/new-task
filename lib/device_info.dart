import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';

class devieInfo extends StatefulWidget {
  const devieInfo({super.key});

  @override
  State<devieInfo> createState() => _devieInfoState();
}

class _devieInfoState extends State<devieInfo> {
  String model="";
  String id="";
  String brand="";
  String name="";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getInfo();
  }



  Future getInfo() async{
    if(Platform.isAndroid){
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      model= androidInfo.model.toString();
      print("***");
      print(model);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Device info : $model'),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: (){setState(() {

            });}, child: Text('Get Device Info'))
          ],
        ),
      ),
    );
  }
}
