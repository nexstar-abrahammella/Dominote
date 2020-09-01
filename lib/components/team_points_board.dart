import 'package:flutter/material.dart';
import 'package:dominote/utilities/styles.dart';

class TeamPointsBoard extends StatefulWidget {
  @override
  _TeamPointsBoardState createState() => _TeamPointsBoardState();
}

class _TeamPointsBoardState extends State<TeamPointsBoard> {
  final String teamNumber = "1";
  final String teamName = "Los tigers";
  final int teamPoints = 100;
  final double pointCircleRadius = 9;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Column(
        children: <Widget>[
          TeamInfo(teamNumber: teamNumber, teamName: teamName),
          SizedBox(
            height: 8,
          ),
          Container(
            height: 50,
            padding: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.all(Radius.circular(8))),
            child: TeamPointsIndicator(
                pointCircleRadius: pointCircleRadius, teamPoints: teamPoints),
          ),
          FastPointsActions()
        ],
      ),
    );
  }
}

class TeamInfo extends StatelessWidget {
  const TeamInfo({
    Key key,
    @required this.teamNumber,
    @required this.teamName,
  }) : super(key: key);

  final String teamNumber;
  final String teamName;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircleAvatar(
          backgroundColor: blue300,
          child: Text(
            teamNumber,
            style: teamNumberTextStyle,
          ),
          radius: 10,
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          teamName,
          style: teamNameTextStyle,
        )
      ],
    );
  }
}

class TeamPointsIndicator extends StatelessWidget {
  const TeamPointsIndicator({
    Key key,
    @required this.pointCircleRadius,
    @required this.teamPoints,
  }) : super(key: key);

  final double pointCircleRadius;
  final int teamPoints;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircleAvatar(
          backgroundColor: blue300,
          radius: pointCircleRadius,
        ),
        SizedBox(
          width: 5,
        ),
        CircleAvatar(
          backgroundColor: blue300,
          radius: pointCircleRadius,
        ),
        SizedBox(
          width: 5,
        ),
        CircleAvatar(
          backgroundColor: blue300,
          radius: pointCircleRadius,
        ),
        SizedBox(
          width: 15,
        ),
        Text(
          teamPoints.toString(),
          style: teamPointsInput,
        ),
      ],
    );
  }
}

class FastPointsActions extends StatefulWidget {
  @override
  _FastPointsActionsState createState() => _FastPointsActionsState();
}

class _FastPointsActionsState extends State<FastPointsActions> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: Row(
        children: <Widget>[
          ClipOval(
            child: Material(
              color: blue300, // button color
              child: InkWell(
                child: SizedBox(
                  width: 32,
                  height: 32,
                ),
                onTap: () {},
              ),
            ),
          ),
          SizedBox(
            width: 25,
          ),
          ClipOval(
            child: Material(
              color: blue300, // button color
              child: InkWell(
                child: SizedBox(
                  width: 32,
                  height: 32,
                ),
                onTap: () {},
              ),
            ),
          ),
          SizedBox(
            width: 25,
          ),
          ClipOval(
            child: Material(
              color: blue300, // button color
              child: InkWell(
                child: SizedBox(
                  width: 32,
                  height: 32,
                ),
                onTap: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
