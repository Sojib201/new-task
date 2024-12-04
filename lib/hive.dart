import 'package:flutter/material.dart';
import 'package:task1/hiveService.dart';

class HiveCrud extends StatefulWidget {
  const HiveCrud({super.key});

  @override
  State<HiveCrud> createState() => _HiveCrudState();
}

class _HiveCrudState extends State<HiveCrud> {
  TextEditingController storeController = TextEditingController();
  TextEditingController updateController = TextEditingController();
  List<dynamic> values = [];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hive CRUD'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
            ),
            TextField(
              controller: storeController,
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () async {
                Hiveservice hiveservice=Hiveservice();
                await hiveservice.createData(storeController.text);
                storeController.text='';
              },
              child: Text('Store'),
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () async {
                Hiveservice hiveservice=Hiveservice();
                var hivevalues=await hiveservice.read();
                setState(() {
                  values=hivevalues;
                });
              },
              child: Text('Read'),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              values.toString(),
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () async {
                Hiveservice hiveservice=Hiveservice();
               await hiveservice.delete(0);
              },
              child: Text('Delete'),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: updateController,
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () async{
                Hiveservice hiveservice=Hiveservice();
                await hiveservice.update(0, updateController.text);
                updateController.text='';
              },
              child: Text('Update'),
            ),
          ],
        ),
      ),
    );
  }
}
