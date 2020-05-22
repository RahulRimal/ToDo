import 'package:flutter/material.dart';
import 'package:flutterappdfdfdfdfd/UserRelated/Todos.dart';

class OwnSearchBar extends StatefulWidget {

  final TodoList todo;

  OwnSearchBar(this.todo);

  @override
  _OwnSearchBarState createState() => _OwnSearchBarState();
}

class _OwnSearchBarState extends State<OwnSearchBar> {

  TextEditingController _controller = new TextEditingController();
  TodoList _todo;

  String _searchString = '';
  List<String> filteredList = new List();


  @override
  void initState() {
    super.initState();
    _todo = widget.todo;
  }
  
  _OwnSearchBarState()
  {
    _controller.addListener((){
      if(_controller.text.isEmpty)
        {
          setState(() {
            _searchString = '';
            filteredList = _todo.toDos;
          });
        }
      else
        {
          _searchString = _controller.text;
        }
    });
  }


  Widget buildList()
  {
    if(_searchString.isNotEmpty)
      {
        List<String> tempList = new List();

        for(int i = 0; i < filteredList.length; i++)
          {
            if(filteredList[i].toLowerCase().contains(_searchString.toLowerCase()))
              {
                tempList.add(filteredList[i]);
              }
          }
        filteredList = tempList;
      }

    return ListView.builder(
        itemCount: filteredList.length,
        itemBuilder: (BuildContext context, int index)
            {
              return ListTile(
                trailing: Text(filteredList[index]),
              );
            }
    );


  }


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
      decoration: BoxDecoration(
        color: Colors.redAccent,
        borderRadius: BorderRadius.circular(22.0),
      ),
      child: TextFormField(
        controller: _controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Search',
          icon: Icon(Icons.search),
        ),
      ),
    );
  }
}
