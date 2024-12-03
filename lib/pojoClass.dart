class Post {
  List<Data>? data;

  Post({this.data});

  Post.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? userId;
  int? id;
  String? title;
  String? body;

  Data({this.userId, this.id, this.title, this.body});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    return data;
  }
}





/*
import 'package:task1/pojoClass.dart';

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class getData extends StatefulWidget {
  const getData({super.key});

  @override
  State<getData> createState() => _getDataState();
}

class _getDataState extends State<getData> {
  Future<List<Data>>? posts;

  @override
  void initState() {
    super.initState();
    posts = _getData();
  }

  Future<List<Data>> _getData() async {
    String url = 'https://jsonplaceholder.typicode.com/posts';
    try {
      Uri uri = Uri.parse(url);
      http.Response response = await http.get(uri);

      if (response.statusCode == 200) {
        List data = jsonDecode(response.body);
        return data.map((e) => Data.fromJson(e)).toList();
      } else {
        throw Exception("Failed to load data");
      }
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Get Data'),
      ),
      body: FutureBuilder(
        future: _getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("No Data Found"));
          } else {
            List<Data>? listData = snapshot.data;
            return ListView.builder(
              itemCount: listData!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Text(listData[index].userId.toString(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  title: Row(
                    children: [
                      Text('Title : ',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),textAlign: TextAlign.justify,),
                      Expanded(child: Text(listData[index].title.toString(),style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)),
                    ],
                  ),
                  subtitle: Text(listData[index].body.toString()),
                );
              },
            );
          }
        },
      ),
    );
  }
}
*/








