import 'package:flutter/material.dart';
import 'package:todo_task/features/widget/input_text_field_widget.dart';

class TodoTaskView extends StatefulWidget {
  const TodoTaskView({ Key? key }) : super(key: key);

  @override
  _TodoTaskViewState createState() => _TodoTaskViewState();
}

class _TodoTaskViewState extends State<TodoTaskView> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _dueDateController = TextEditingController();
  TextEditingController _createdByNameController = TextEditingController();
  TextEditingController _createdByEmailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Todo Task"),
         backgroundColor: Colors.blueGrey,
         centerTitle: true,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InputTextField(hintText: "Entre com o título da tarefa:", controller: _titleController),
            InputTextField(hintText: "Entre com a descrição da tarefa:", controller: _descriptionController),
            InputTextField(hintText: "Entre com a Data:", controller: _dueDateController, 
              isreadonly:true, prefixIcon: InkWell(
                onTap: () {
                  selectDueData();
                },
                child: Icon(Icons.calendar_today),
              ),),
            InputTextField(hintText: "Entre com o nome:", controller: _createdByNameController),
            InputTextField(hintText: "Entre com o e-mail:", controller: _createdByEmailController),
            ElevatedButton(onPressed: () {}, child: Text("Criando tarefa"))
          ],
        )
      )
    );
  }
  selectDueData() async {
    final DateTime? value = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (value != null) {
      _dueDateController.text = value.toString();
    }
  }
}