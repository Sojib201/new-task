import 'package:flutter/material.dart';

import 'hive.dart';
import 'hiveCrud1.dart';

class localStorage extends StatefulWidget {
  const localStorage({super.key});

  @override
  State<localStorage> createState() => _localStorageState();
}

class _localStorageState extends State<localStorage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>HiveCrud()));
              },
              child: Text('Hive1'),
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ToDoScreen(),));
              },
              child: Text('Hive CRUD'),
            ),
          ],
        ),
      ),
    );
  }
}
