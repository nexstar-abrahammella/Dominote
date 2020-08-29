import 'package:flutter/material.dart';
import 'package:domiote/components/TeamPointsBoard.dart';
import '../utilities/styles.dart';
import '../utilities/constants.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blue700,
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: false,
        title: Text(headerTitle, style: headerTextStyle),
        backgroundColor: blue700,
      ),
      body: Column(
        children: <Widget>[
          Row(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              TeamPointsBoard(),
              TeamPointsBoard(),
            ],
          )
        ],
      ),
    );
  }
}
