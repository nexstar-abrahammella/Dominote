import 'package:flutter/material.dart';
import '../utilities/styles.dart';
import '../utilities/constants.dart';
import 'package:domiote/components/team_points_board.dart';
import 'package:domiote/components/game_information.dart';
import '../utilities/internationalization_constants.dart';
import 'package:domiote/components/PointsTableRow.dart';

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
                              numberLabel: numberGamePoints,
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
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RawMaterialButton(
                  child: Text(
                    'Guardar',
                    style: saveButtonTextStyle,
                  ),
                  onPressed: () {},
                  elevation: 2.0,
                  fillColor: whiteColor,
                  padding: EdgeInsets.all(10.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
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
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return PointsTableRow();
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
                    '99',
                    style: teamsLabelStyle,
                  ),
                  Text(
                    'Puntos',
                    style: teamsLabelStyle,
                  ),
                  Text(
                    '75',
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
                    'Restantes',
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
