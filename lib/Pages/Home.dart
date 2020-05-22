import 'package:flutter/material.dart';
import 'package:flutterappdfdfdfdfd/Pages/AddTasks.dart';
import 'package:flutterappdfdfdfdfd/Pages/search_bar.dart';
import 'package:flutterappdfdfdfdfd/UserRelated/Todos.dart';

class HomePage extends StatefulWidget {
  final TodoList todo;


  HomePage(this.todo);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TodoList todo;
  var reversedTodo;


  void initState() {
    super.initState();
    todo = widget.todo;
    reversedTodo = todo.toDos.reversed.toList();
  }

  void _showMenu() async
  {
    await showDialog(
        context: context,
        builder: (BuildContext context)
        {
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                RaisedButton(
                  onPressed: (){
                    //TODO: Implement Favorite List !!
                  },
                  child: Text('Favorites'),
                ),

                RaisedButton(
                  onPressed: (){
                    //TODO: Goto Setting page !!
                  },
                  child: Text('Settings'),
                ),
              ],
            ),
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("My Todo App")),//OwnSearchBar(todo),
      ),

        
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text('Hey There !!'),
          Expanded(
            child: ListView.builder(
                itemCount: reversedTodo.length,
                itemBuilder: (BuildContext context, int index) {
                  return TodooListItems(reversedTodo[index]);
                }),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.redAccent,
          selectedItemColor: Colors.black87,
          items: [
        BottomNavigationBarItem(
          icon: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddTasks(todo)));
            },
            icon: Icon(Icons.add),
          ),
          title: Text('Add note'),
        ),
        BottomNavigationBarItem(
          icon: IconButton(
            onPressed: (){
              return _showMenu();
            },
            icon: Icon(Icons.menu),
          ),
          title: Text('Menu'),
        ),
      ]),
    );
  }
}





class TodooListItems extends StatefulWidget {
  final String todoText;

  TodooListItems(this.todoText);

  @override
  _TodooListItemsState createState() => _TodooListItemsState();
}

class _TodooListItemsState extends State<TodooListItems> {
  String _todoItem;

  @override
  void initState() {
    super.initState();
    _todoItem = widget.todoText;
  }

  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(_todoItem),
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
  }
}
