import 'package:flutter/material.dart';
import 'package:flutterappdfdfdfdfd/Pages/AddTasks.dart';
import 'package:flutterappdfdfdfdfd/UserRelated/Todos.dart';

class EmptyHome extends StatefulWidget {

  final TodoList todoList;

  EmptyHome(this.todoList);

  @override
  _EmptyHomeState createState() => _EmptyHomeState();
}

class _EmptyHomeState extends State<EmptyHome> {

  TodoList todoList;
  @override
  void initState() {
    super.initState();
    todoList = widget.todoList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("My Todo App"),
        ),
      ),

      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.content_paste,
            size: 70.0,),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 3.0),
            ),
            Text('No Notes'),
          ],
        ),
      ),

      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(30.0),
        child: RaisedButton(
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddTasks(todoList))
            );
          },
          child: Text('Add Notes'),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
        ),
      ),




    );
  }
}
