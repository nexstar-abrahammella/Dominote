import 'package:flutter/material.dart';
import 'package:domiote/components/TeamPointsBoard.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("DOMINOTE"),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[TeamPointsBoard(), TeamPointsBoard()],
      ),
    );
  }
}
