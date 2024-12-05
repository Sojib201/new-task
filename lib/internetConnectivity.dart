import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class InternetConnectivity extends StatefulWidget {
  const InternetConnectivity({super.key});

  @override
  State<InternetConnectivity> createState() => _InternetConnectivityState();
}

class _InternetConnectivityState extends State<InternetConnectivity> {

  StreamSubscription? subscription;

  @override
  void initState() {
    super.initState();
    subscription=Connectivity().onConnectivityChanged.listen((event){checkConnection();});
  }

  @override
  void dispose() {
    super.dispose();
    subscription!.cancel();
  }

  Future checkConnection() async{
    final connectivityResult=await Connectivity().checkConnectivity();
    if(connectivityResult==ConnectivityResult.mobile){
      Fluttertoast.showToast(msg: 'Connected With Mobile');
    }
    else if(connectivityResult==ConnectivityResult.wifi){
      Fluttertoast.showToast(msg: 'Connected With Wifi');

    }
    else{
      Fluttertoast.showToast(msg: 'Not Connected');

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Network Connectivity Check'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: (){
                checkConnection();

              },
              child: Text('Connectivity Check'),
            ),
          ],
        ),
      ),
    );
  }
}
