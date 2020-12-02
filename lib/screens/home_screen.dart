import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utilities/styles.dart';
import '../utilities/constants.dart';
import 'package:apuntalo/components/team_points_board.dart';
import 'package:apuntalo/components/game_information.dart';
import '../utilities/internationalization_constants.dart';
import 'package:apuntalo/components/points_table_row.dart';
import 'package:apuntalo/utilities/internationalization_constants.dart';
import 'package:apuntalo/screens/game_winner_screen.dart';
import 'package:apuntalo/screens/settings_screen.dart';
import 'package:apuntalo/models/gameDataInformation.dart';

import '../utilities/styles.dart';

int totalTeamAPoint = 0;
int totalTeamBPoint = 0;
bool isTeamAWinner = false;
bool isTeamBWinner = false;
int rowNumber = 0;
List pointsList = [];
var contextBuilder;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    contextBuilder = context;
    final gameData = Provider.of<GameDataInformation>(context);

    void addItem() {
      rowNumber = rowNumber + 1;
    }

    void addPointsGame() {
      if (teamAGamePoints == '0' && teamBGamePoints == '0') {
      } else {
        pointsList.add(
            {"teamAPoints": teamAGamePoints, "teamBPoints": teamBGamePoints});
        addItem();
      }
    }

    void updateTotalScoreWinner() {
      if (totalTeamAPoint < gameData.totalScore ||
          totalTeamBPoint < gameData.totalScore) {
        gameData.updateGame();
      }
      if (totalTeamAPoint >= gameData.totalScore) {
        gameData.teamAWin = true;
        gameData.teamBWin = false;
        gameData.totalTeamAScoreNumber = totalTeamAPoint.toString();
        gameData.totalTeamBScoreNumber = totalTeamBPoint.toString();
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => GameWinner()));
        gameData.resetGame();
      }
      if (totalTeamBPoint >= gameData.totalScore) {
        gameData.teamAWin = false;
        gameData.teamBWin = true;
        gameData.totalTeamAScoreNumber = totalTeamAPoint.toString();
        gameData.totalTeamBScoreNumber = totalTeamBPoint.toString();
        gameData.resetGame();
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => GameWinner()));
      }
    }

    void addPointsButtonFunction() {
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
    }

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
        backgroundColor: blue300,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0.0,
          backgroundColor: blue900,
          actions: <Widget>[
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(5.0),
                child: Wrap(
                  direction: Axis.horizontal,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        GameHeaderInformation(
                          textLabel: i18n(
                              locale: gameData.applicationLanguage,
                              value: "i18n.seriesTitle"),
                          numberLabel: gameData.seriesNumber,
                        ),
                        GameHeaderInformation(
                          textLabel: i18n(
                              locale: gameData.applicationLanguage,
                              value: "i18n.points"),
                          numberLabel: gameData.totalScore.toString(),
                        ),
                        RawMaterialButton(
                          child: Icon(
                            Icons.settings,
                            size: 25.0,
                            color: blue900,
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SettingsGame()));
                          },
                          fillColor: whiteColor,
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
        body: SafeArea(
          child: Column(
            children: <Widget>[
//              Row(
//                mainAxisAlignment: MainAxisAlignment.start,
//                children: <Widget>[
//                  Expanded(
//                    child: Container(
//                      padding: const EdgeInsets.all(5.0),
//                      child: Wrap(
//                        direction: Axis.horizontal,
//                        crossAxisAlignment: WrapCrossAlignment.start,
//                        children: [
//                          Row(
//                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                            children: <Widget>[
//                              GameHeaderInformation(
//                                textLabel: i18n(
//                                    locale: gameData.applicationLanguage,
//                                    value: "i18n.seriesTitle"),
//                                numberLabel: gameData.seriesNumber,
//                              ),
//                              GameHeaderInformation(
//                                textLabel: i18n(
//                                    locale: gameData.applicationLanguage,
//                                    value: "i18n.points"),
//                                numberLabel: gameData.totalScore.toString(),
//                              ),
//                              RawMaterialButton(
//                                child: Icon(
//                                  Icons.settings,
//                                  size: 25.0,
//                                ),
//                                onPressed: () {
//                                  Navigator.push(
//                                      context,
//                                      MaterialPageRoute(
//                                          builder: (context) =>
//                                              SettingsGame()));
//                                },
//                                fillColor: blue300,
//                                padding: EdgeInsets.all(5.0),
//                                shape: CircleBorder(),
//                              ),
//                            ],
//                          ),
//                        ],
//                      ),
//                    ),
//                  )
//                ],
//              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 385,
                height: 210,
                decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        TeamPointsBoard(
                          teamNumber: "1",
                          teamName: gameData.teamAName,
                          teamLetter: 'A',
                        ),
                        TeamPointsBoard(
                          teamNumber: "2",
                          teamName: gameData.teamBName,
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
                            color: blue300,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                          ),
                          child: RawMaterialButton(
                            child: Text(
                              i18n(
                                  locale: gameData.applicationLanguage,
                                  value: "i18n.save"),
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
                  ],
                ),
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
    final gameData = Provider.of<GameDataInformation>(context);

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
                    gameData.teamAName,
                    style: teamsLabelStyle,
                  ),
                  Text(
                    gameData.teamBName,
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
                        fastPlay: {'teamA': 2, 'teamB': 2},
                        indexRow: index + 1,
                        onDelete: () {
                          setState(() {
                            totalTeamAPoint -=
                                int.parse(pointsList[index]["teamAPoints"]);
                            totalTeamBPoint -=
                                int.parse(pointsList[index]["teamBPoints"]);
                            gameData.updateGame();
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
                    i18n(
                        locale: gameData.applicationLanguage,
                        value: "i18n.points"),
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
                    '${gameData.restantTeamAPoint}',
                    style: teamsLabelStyleWhite,
                  ),
                  Text(
                    i18n(
                        locale: gameData.applicationLanguage,
                        value: "i18n.restants"),
                    style: teamsLabelStyleWhite,
                  ),
                  Text(
                    '${gameData.restantTeamBPoint}',
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
