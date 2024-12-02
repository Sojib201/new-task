import 'package:flutter/material.dart';

class postData extends StatefulWidget {
  const postData({super.key});

  @override
  State<postData> createState() => _postDataState();
}

class _postDataState extends State<postData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Post Data'),),);
  }
}
