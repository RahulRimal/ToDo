import 'package:flutter/material.dart';
import 'package:flutterappdfdfdfdfd/Pages/Home.dart';
import 'package:flutterappdfdfdfdfd/UserRelated/Todos.dart';

class AddTasks extends StatefulWidget {
  @override
  _AddTasksState createState() => _AddTasksState();
}

class _AddTasksState extends State<AddTasks> {
  final _validateTextField = TextEditingController();

  var time = DateTime.now();
//  var format = new DateFormat.yMMMMd('en_US');

  TodoList todoList = new TodoList();

  void alertCancel() async {
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Discard your changes?'),
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Cancel'),
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  child: Text('Discard'),
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            if (_validateTextField.text.isEmpty) {
              Navigator.pop(context);
              return null;
            } else {
              alertCancel();
            }
          },
          icon: Icon(Icons.close),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              if (_validateTextField.text.isEmpty) {
                Navigator.pop(context);
              } else {
                todoList.AddToDo(_validateTextField.text);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              }
            },
            icon: Icon(Icons.check),
          ),
        ],
        title: Center(
          child: Text('My Todo App'),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(time.toString()),
              TextField(
                controller: _validateTextField,
                decoration: InputDecoration(
                  labelText: 'Type here !!',
                ),
                maxLines: 20,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.check_circle,
              size: 35.0,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.image,
              size: 35.0,
            ),
          ),
        ],
      ),
    );
  }
}
