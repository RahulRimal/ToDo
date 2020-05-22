import 'package:flutter/material.dart';
import 'package:flutterappdfdfdfdfd/Pages/Home.dart';
import 'package:flutterappdfdfdfdfd/UserRelated/Todos.dart';

class AddTasks extends StatefulWidget {
  final TodoList todoList;

  AddTasks(this.todoList);

  @override
  _AddTasksState createState() => _AddTasksState();
}

class _AddTasksState extends State<AddTasks> {
  TodoList todo;

  @override
  void initState() {
    super.initState();
    todo = widget.todoList;
  }

  final _validateTextField = TextEditingController();

  var time = DateTime.now();
//  var format = new DateFormat.yMMMMd('en_US');

  bool _bulletEnabled = false;

  Widget _showBullet(bool _bulletEnabled) {
    return Visibility(
      visible: _bulletEnabled,
      child: Icon(Icons.arrow_forward),
    );
  }

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
                todo.AddToDo(_validateTextField.text);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage(todo)));
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
                  prefixIcon: _showBullet(_bulletEnabled),
                  labelText: 'Type here !!',
                ),
                maxLines: 20,
              ),

            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          selectedIconTheme: IconThemeData(color: Colors.redAccent),
          items: [
            BottomNavigationBarItem(
              icon: IconButton(
                onPressed: () {
                  setState(() {
                    _bulletEnabled = !_bulletEnabled;
                  });
                },
                icon: Icon(Icons.arrow_forward),
              ),
              title: Text('Bullet'),
            ),
            BottomNavigationBarItem(
              icon: IconButton(
                onPressed: () {
                  setState(() {
                  });
                },
                icon: Icon(Icons.image),
              ),
              title: Text('Image'),
            ),
          ]),
    );
  }
}
