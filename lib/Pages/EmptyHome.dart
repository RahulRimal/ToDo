import 'package:flutter/material.dart';
import 'package:flutterappdfdfdfdfd/Pages/AddTasks.dart';

class EmptyHome extends StatefulWidget {
  @override
  _EmptyHomeState createState() => _EmptyHomeState();
}

class _EmptyHomeState extends State<EmptyHome> {
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
              MaterialPageRoute(builder: (context) => AddTasks())
            );
          },
          child: Text('Add Notes'),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
        ),
      ),




    );
  }
}
