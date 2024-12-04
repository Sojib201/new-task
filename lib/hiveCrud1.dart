// import 'package:flutter/material.dart';
// import 'package:todo/style.dart';
//
// class ToDoScreen extends StatefulWidget {
//   const ToDoScreen({super.key});
//
//   @override
//   State<ToDoScreen> createState() => _ToDoScreenState();
// }
//
// class _ToDoScreenState extends State<ToDoScreen> {
//   TextEditingController nameController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//
//   List<Map<String, dynamic>> todos = [];
//   bool isediting = false;
//   int currentIndex = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("To Do"),
//         centerTitle: true,
//         backgroundColor: Colors.green,
//       ),
//       body: Column(
//         children: [
//           SizedBox(
//             height: 50,
//           ),
//           TextField(
//             controller: nameController,
//             decoration: MyInput("Name"),
//           ),
//           SizedBox(
//             height: 15,
//           ),
//           TextField(
//             controller: emailController,
//             decoration: MyInput("Email"),
//           ),
//           SizedBox(
//             height: 15,
//           ),
//           ElevatedButton(
//             onPressed: () {
//               if (nameController.text.trim().isNotEmpty &&
//                   emailController.text.trim().isNotEmpty) {
//                 if (isediting) {
//                   todos[currentIndex] = {
//                     "name": nameController.text.trim(),
//                     "email": emailController.text.trim()
//                   };
//                   isediting=false;
//                 } else {
//                   todos.add({
//                     "name": nameController.text.trim(),
//                     "email": emailController.text.trim(),
//                   });
//                 }
//
//                 nameController.text = '';
//                 emailController.text = '';
//
//                 setState(() {});
//               }
//             },
//             child:  Text(isediting ?  'Update':'Save'),
//             style: button(),
//           ),
//           Expanded(
//             flex: 90,
//             child: ListView.builder(
//               itemCount: todos.length,
//               itemBuilder: (context, index) {
//                 return Card(
//                     child: Padding(
//                   padding: const EdgeInsets.all(10),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Column(
//                         children: [
//                           Text(todos[index]['name']),
//                           Text(todos[index]['email']),
//                         ],
//                       ),
//                       SizedBox(
//                         width: 230,
//                       ),
//                       IconButton(
//                         onPressed: () {
//                           setState(() {
//                             todos.removeAt(index);
//                           });
//                         },
//                         icon: Icon(Icons.delete),
//                         color: Colors.red,
//                       ),
//                       IconButton(
//                         onPressed: () {
//                           nameController.text = todos[index]['name'];
//                           emailController.text = todos[index]['email'];
//                           isediting = true;
//                           currentIndex = index;
//                           setState(() {
//
//                           });
//                         },
//                         icon: Icon(Icons.edit),
//                         color: Colors.green,
//                       ),
//                     ],
//                   ),
//                 ));
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }




import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({super.key});

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {  final TextEditingController _textController = TextEditingController();
final Box _todoBox = Hive.box('myBox');
int? _editingIndex; // Tracks the index of the item being edited (null if adding)

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: Text('To-Do App')),
    body: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _textController,
                  decoration: InputDecoration(
                    hintText: 'Enter To-Do',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(width: 8),
              ElevatedButton(
                onPressed: () {
                  if (_textController.text.trim().isEmpty) return;

                  if (_editingIndex == null) {
                    // Add new item
                    _todoBox.add(_textController.text.trim());
                  } else {
                    // Update existing item
                    _todoBox.putAt(_editingIndex!, _textController.text.trim());
                    _editingIndex = null; // Reset editing state
                  }

                  _textController.clear(); // Clear TextField
                  setState(() {}); // Update UI
                },
                child: Text(_editingIndex == null ? 'Add' : 'Update'),
              ),
            ],
          ),
        ),
        Expanded(
          child: ValueListenableBuilder(
            valueListenable: _todoBox.listenable(),
            builder: (context, Box box, _) {
              if (box.isEmpty) {
                return Center(child: Text('No To-Do Items'));
              }

              return ListView.builder(
                itemCount: box.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(box.getAt(index)),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            // Populate the TextField with the current item's value
                            _textController.text = box.getAt(index);
                            setState(() {
                              _editingIndex = index; // Set editing index
                            });
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            box.deleteAt(index); // Delete item
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    ),
  );
}
}









