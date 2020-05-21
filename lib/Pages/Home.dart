import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterappdfdfdfdfd/UserRelated/Todos.dart';

import 'AddTasks.dart';

class HomePage extends StatefulWidget {
  final TodoList todo;

  HomePage(this.todo);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TodoList _todo;
  bool _isFavorite = false;

  void initState() {
    super.initState();
    _todo = widget.todo;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("My Todo App")),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text('Hey There !!'),
          Expanded(
            child: ListView.builder(
                itemCount: _todo.toDos.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(_todo.toDos[index]),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                _isFavorite = !_isFavorite;
                              });
                            },
                            icon: _isFavorite
                                ? Icon(
                                    Icons.favorite,
                                    color: Colors.redAccent,
                                  )
                                : Icon(Icons.favorite_border),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
          icon: IconButton(
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddTasks())
              );
            },
            icon: Icon(Icons.add),
          ),
          title: Text('Add note'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.menu),
          title: Text('Menu'),
        ),
      ]),
    );
  }
}
