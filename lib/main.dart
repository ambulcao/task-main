import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_task/features/todo_tasks/view/todo_task_view.dart';
import 'package:todo_task/features/todo_tasks/view_model/todo_task_view_model.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TodoTaskViewModel()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: "/createTask",
        routes: {
          "/createTask": (context) => const TodoTaskView(),
        },
        //home: const MyHomePage(title: "Flutter Demo Home Page"),
      ),
    );
  }
}
