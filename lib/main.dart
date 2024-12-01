import 'package:flutter/material.dart';
import 'package:task1/device_info.dart';

import 'package:task1/geolocator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text('Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => geoLocator()));
              },
              child: Text('Geolocator'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => devieInfo()));
              },
              child: Text('Device Info'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Local Storage'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('HTTP'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Barcode'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Image Picker'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Internet Connectivity'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Cache Network Image'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Localization'),
            ),
          ],
        ),
      ),
    );
  }
}
