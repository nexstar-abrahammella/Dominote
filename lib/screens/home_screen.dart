import 'package:flutter/material.dart';
import '../utilities/styles.dart';
import '../utilities/constants.dart';
import 'package:domiote/components/team_points_board.dart';
import 'package:domiote/components/game_information.dart';
import '../utilities/internationalization_constants.dart';

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
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(5.0),
                  decoration: gameInformationBorderDecoration,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          GameHeaderInformation(
                            textLabel: seriesTitle,
                            numberLabel: seriesNumber,
                          ),
                          GameHeaderInformation(
                            textLabel: pointTitle,
                            numberLabel: seriesNumber,
                          ),
                        ],
                      ),
                      RawMaterialButton(
                        onPressed: () {},
                        elevation: 2.0,
                        fillColor: blue300,
                        padding: EdgeInsets.all(15.0),
                        shape: CircleBorder(),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
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
