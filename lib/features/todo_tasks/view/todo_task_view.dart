import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_task/features/todo_tasks/model/todo_task_model.dart';
import 'package:todo_task/features/todo_tasks/view_model/todo_task_view_model.dart';
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InputTextField(hintText: "Entre com o título da tarefa:", controller: _titleController),
            InputTextField(hintText: "Entre com a descrição da tarefa:", controller: _descriptionController),
            InputTextField(hintText: "Entre com a Data:", controller: _dueDateController, 
              isreadonly:true, suffixIcon: InkWell(
                onTap: () {
                  selectDueData();
                },
                child: Icon(Icons.calendar_today),
              ),),
              selectProrityDropDown(),
            InputTextField(hintText: "Entre com o nome:", controller: _createdByNameController),
            InputTextField(hintText: "Entre com o e-mail:", controller: _createdByEmailController),
            ElevatedButton(onPressed: () {
              submitTaskDetails();
            }, child: Text("Criando tarefa"))
          ],
        )
        )
      )
    );
  }

  void submitTaskDetails(){
    final TodoTaskProvider = Provider.of<TodoTaskViewModel>(context, listen: false);
    TodoTaskProvider.createTask(TodoTaskModel(
      title: _titleController.text,
      description: _descriptionController.text,
      dueDate: _dueDateController.text,
      priority: TodoTaskProvider.selectedPriority,
      createdBy: CreatedBy(
        createdByName: _createdByNameController.text,
        createdByEmail: _createdByEmailController.text
      )
    ));
  }

  Widget selectProrityDropDown() {
    final todoTaskProvider = Provider.of<TodoTaskViewModel>(context);
    return DropdownButton<String>(
      value: todoTaskProvider.selectedPriority,
      icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? newValue) {
        todoTaskProvider.setPriority(newValue ?? todoTaskProvider.selectedPriority);
      },
      items: todoTaskProvider.priorityList
          .map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
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