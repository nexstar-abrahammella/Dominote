import 'package:flutter/material.dart';
import 'package:domiote/components/team_points_board.dart';
import 'package:domiote/components/headers_components.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarHeader(),
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              TeamPointsBoard(),
              TeamPointsBoard(),
            ],
          ),
        ],
      ),
    );
  }
}
