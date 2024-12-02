import 'package:flutter/material.dart';

class getData extends StatefulWidget {
  const getData({super.key});

  @override
  State<getData> createState() => _getDataState();
}

class _getDataState extends State<getData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Get Data'),
      ),
    );
  }
}
