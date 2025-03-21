import 'package:flutter/material.dart';

class TodoTaskView extends StatefulWidget {
  const TodoTaskView({ Key? key }) : super(key: key);

  @override
  _TodoTaskViewState createState() => _TodoTaskViewState();
}

class _TodoTaskViewState extends State<TodoTaskView> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dueDateController = TextEditingController();
  TextEditingController createdByNameController = TextEditingController();
  TextEditingController createdByEmailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Todo Task"),
         backgroundColor: Colors.blueGrey,
         centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [

          ],
        )
      )
    );
  }
}