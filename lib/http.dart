import 'package:flutter/material.dart';
import 'package:task1/getData.dart';
import 'package:task1/postData.dart';

class http extends StatefulWidget {
  const http({super.key});

  @override
  State<http> createState() => _httpState();
}

class _httpState extends State<http> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>getData()));}, child: Text('Get Data'),),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>postData()));}, child: Text('Post Data'),),
          ],
        ),
      ),
    );
  }
}
