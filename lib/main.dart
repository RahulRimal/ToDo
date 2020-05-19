import 'package:flutter/material.dart';
import 'package:flutterappdfdfdfdfd/Pages/EmptyHome.dart';
import 'Pages/Home.dart';
import 'UserRelated/Todos.dart';

void main() => runApp(MyTodoApp());


class MyTodoApp extends StatelessWidget {
  final TodoList _checkTodo = new TodoList();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: _checkTodo.toDos.isEmpty ? EmptyHome() : HomePage(),
    );
  }
}

