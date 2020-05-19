import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterappdfdfdfdfd/UserRelated/Todos.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TodoList _todo = new TodoList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("My Todo App")),

      ),

      body: SingleChildScrollView(
        child: ListView.builder(

            itemCount: _todo.toDos.length,
            itemBuilder: (BuildContext context, int index)
            {
//              return Text(_todo.toDos[index]);
                return ListTile(
                  title: Text(_todo.toDos[index]),
                );
            }
        ),
      ),


    );
  }
}
