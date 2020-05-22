import 'package:flutter/material.dart';
import 'Pages/EmptyHome.dart';
import 'Pages/Home.dart';
import 'UserRelated/Todos.dart';

void main() => runApp(MyTodoApp());


class MyTodoApp extends StatelessWidget {
  final TodoList _checkTodo = new TodoList();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: HomePage(_checkTodo),//_checkTodo.toDos.isEmpty ? EmptyHome(_checkTodo) : HomePage(_checkTodo),
    );
  }
}