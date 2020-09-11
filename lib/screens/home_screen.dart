import 'package:flutter/material.dart';
import '../utilities/styles.dart';
import '../utilities/constants.dart';
import 'package:dominote/components/team_points_board.dart';
import 'package:dominote/components/game_information.dart';
import '../utilities/internationalization_constants.dart';
import 'package:dominote/components/points_table_row.dart';
import 'package:dominote/utilities/internationalization_constants.dart';

import '../utilities/styles.dart';

int totalTeamAPoint = 0;
int totalTeamBPoint = 0;

String locale = "es";

class HomeScreen extends StatelessWidget {
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
                                onPressed: () {},
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
                        totalTeamAPoint += int.parse(teamAGamePoints);
                        totalTeamBPoint += int.parse(teamBGamePoints);

                        print(
                            'Team A Has: $totalTeamAPoint | Team B Has: $totalTeamBPoint');
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

class PointsTable extends StatelessWidget {
  const PointsTable({
    Key key,
  }) : super(key: key);

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
                    itemCount: 7,
                    itemBuilder: (context, index) {
                      return PointsTableRow(
                        points: {'teamA': 50, 'teamB': 60},
                        fastPlay: {'teamA': 1, 'teamB': 1},
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
                    '101',
                    style: teamsLabelStyleWhite,
                  ),
                  Text(
                    i18n(locale: locale, value: "i18n.restants"),
                    style: teamsLabelStyleWhite,
                  ),
                  Text(
                    '125',
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
