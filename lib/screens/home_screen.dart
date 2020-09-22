import 'package:flutter/material.dart';
import '../utilities/styles.dart';
import '../utilities/constants.dart';
import 'package:dominote/components/team_points_board.dart';
import 'package:dominote/components/game_information.dart';
import '../utilities/internationalization_constants.dart';
import 'package:dominote/components/points_table_row.dart';
import 'package:dominote/utilities/internationalization_constants.dart';
import 'package:dominote/screens/game_winner_screen.dart';
import 'package:dominote/screens/settings_screen.dart';

import '../utilities/styles.dart';

int totalTeamAPoint = 0;
int totalTeamBPoint = 0;
int totalScore = 200;
int restantTeamAPoint = totalScore;
int restantTeamBPoint = totalScore;
bool isTeamAWinner = false;
bool isTeamBWinner = false;
int rowNumber = 0;
List pointsList = [];
String locale = "es";

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  showAlertDialog(BuildContext context, String textMessage) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {},
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("My title"),
      content: Text("$textMessage"),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void addPointsButtonFunction() {
    setState(() {
      FocusScope.of(context).unfocus();
      addPointsGame();
      totalTeamAPoint += int.parse(teamAGamePoints);
      totalTeamBPoint += int.parse(teamBGamePoints);
      updateTotalScoreWinner();
      teamAGamePoints = '0';
      teamBGamePoints = '0';
      if (teamAController != null) teamAController.clear();
      if (teamBController != null) teamBController.clear();

      print('Team A Has: $totalTeamAPoint | Team B Has: $totalTeamBPoint');
    });
  }

  void updateTotalScoreWinner() {
    setState(() {
      if (totalTeamAPoint < totalScore || restantTeamBPoint < totalScore) {
        restantTeamAPoint = totalScore - totalTeamAPoint;
        restantTeamBPoint = totalScore - totalTeamBPoint;
      }
      if (totalTeamAPoint >= totalScore) {
        resetGame();
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ConfettiSample()));
      }
      if (totalTeamBPoint >= totalScore) {
        resetGame();
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ConfettiSample()));
      }
    });
  }

  void addPointsGame() {
    if (teamAGamePoints == '0' && teamBGamePoints == '0') {
    } else {
      pointsList.add(
          {"teamAPoints": teamAGamePoints, "teamBPoints": teamBGamePoints});
      _addItem();
    }
  }

  void resetGame() {
    totalTeamAPoint = 0;
    totalTeamBPoint = 0;
    totalScore = 200;
    restantTeamAPoint = totalScore;
    restantTeamBPoint = totalScore;
    pointsList.length = 0;
  }

  _addItem() {
    setState(() {
      rowNumber = rowNumber + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
        backgroundColor: blue700,
        appBar: AppBar(
          elevation: 0.0,
          centerTitle: false,
          title: Text(headerTitle, style: headerTextStyle),
          backgroundColor: blue700,
        ),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(5.0),
                      decoration: gameInformationBorderDecoration,
                      child: Wrap(
                        direction: Axis.horizontal,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              GameHeaderInformation(
                                textLabel: i18n(
                                    locale: locale, value: "i18n.seriesTitle"),
                                numberLabel: seriesNumber,
                              ),
                              GameHeaderInformation(
                                textLabel:
                                    i18n(locale: locale, value: "i18n.points"),
                                numberLabel: numberGamePoints,
                              ),
                              RawMaterialButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              SettingsGame()));
                                },
                                fillColor: blue300,
                                padding: EdgeInsets.all(5.0),
                                shape: CircleBorder(),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  TeamPointsBoard(
                    teamNumber: "1",
                    teamName: "Equipo 1",
                    teamLetter: 'A',
                  ),
                  TeamPointsBoard(
                    teamNumber: "2",
                    teamName: "Equipo 2",
                    teamLetter: 'B',
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 40,
                    width: 110,
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    child: RawMaterialButton(
                      child: Text(
                        i18n(locale: locale, value: "i18n.save"),
                        style: saveButtonTextStyle,
                      ),
                      onPressed: () {
                        addPointsButtonFunction();
                      },
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              PointsTable()
            ],
          ),
        ),
      ),
    );
  }
}

class PointsTable extends StatefulWidget {
  @override
  _PointsTableState createState() => _PointsTableState();
}

class _PointsTableState extends State<PointsTable> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(left: 12, right: 12),
        child: Column(
          children: <Widget>[
            Container(
              height: 36,
              decoration: BoxDecoration(
                color: blue200,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(8.0),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    'Equipo A',
                    style: teamsLabelStyle,
                  ),
                  Text(
                    'Equipo B',
                    style: teamsLabelStyle,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                color: whiteColor,
                child: ListView.builder(
                    itemCount: pointsList.length,
                    itemBuilder: (context, index) {
                      return PointsTableRow(
                        points: {
                          'teamA': int.parse(pointsList[index]["teamAPoints"]),
                          'teamB': int.parse(pointsList[index]["teamBPoints"])
                        },
                        fastPlay: {'teamA': 1, 'teamB': 1},
                        indexRow: index + 1,
                        onDelete: () {
                          setState(() {
                            totalTeamAPoint -=
                                int.parse(pointsList[index]["teamAPoints"]);
                            totalTeamBPoint -=
                                int.parse(pointsList[index]["teamBPoints"]);
                            restantTeamAPoint = totalScore - totalTeamAPoint;
                            restantTeamBPoint = totalScore - totalTeamBPoint;
                            pointsList.removeAt(index);

                            print(index);
                          });
                        },
                      );
                    }),
              ),
            ),
            Container(
              height: 36,
              color: blue200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    '$totalTeamAPoint',
                    style: teamsLabelStyle,
                  ),
                  Text(
                    i18n(locale: locale, value: "i18n.points"),
                    style: teamsLabelStyle,
                  ),
                  Text(
                    '$totalTeamBPoint',
                    style: teamsLabelStyle,
                  ),
                ],
              ),
            ),
            Container(
              height: 36,
              decoration: BoxDecoration(
                color: blue900,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8.0),
                  bottomRight: Radius.circular(8.0),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    '$restantTeamAPoint',
                    style: teamsLabelStyleWhite,
                  ),
                  Text(
                    i18n(locale: locale, value: "i18n.restants"),
                    style: teamsLabelStyleWhite,
                  ),
                  Text(
                    '$restantTeamBPoint',
                    style: teamsLabelStyleWhite,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
