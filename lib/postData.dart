import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class postData extends StatefulWidget {
  const postData({super.key});

  @override
  State<postData> createState() => _postDataState();
}

class _postDataState extends State<postData> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _bodyController = TextEditingController();
  TextEditingController _userIdController = TextEditingController();

  GlobalKey<FormState> _from=GlobalKey();

  Future<void> PostData(String title, String body, String id) async {
    String url = 'https://jsonplaceholder.typicode.com/posts';
    Uri uri = Uri.parse(url);
    http.Response response = await http.post(uri,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
        body: jsonEncode({"title": title, "body": body, "userId": id}));
    if (response.statusCode == 201) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Added Successfully')));
      _titleController.text = '';
      _bodyController.text = '';
      _userIdController.text = '';
    } else {
      print('Failed');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Data'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Form(
          key: _from,
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                validator: (String? value){
                  if(value?.isEmpty?? true){
                    return 'Please Enter title';
                  }
                  return null;
                },
                decoration: InputDecoration(
                   // hintText: 'title'
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _bodyController,
                validator: (String? value){
                  if(value?.isEmpty?? true){
                    return 'Please Enter body';
                  }
                  return null;
                },
                decoration: InputDecoration(
                 // hintText: 'body'
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _userIdController,

                validator: (String? value){
                  if(value?.isEmpty?? true){
                    return 'Please Enter userId';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    //hintText: 'user id'
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_from.currentState!.validate()){
                    PostData(_titleController.text, _bodyController.text,
                        _userIdController.text);}
                  },
                  child: Text('PostData'))
            ],
          ),
        ),
      ),
    );
  }
}
