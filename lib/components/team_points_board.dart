import 'package:flutter/material.dart';
import 'package:domiote/utilities/styles.dart';

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
            padding: EdgeInsets.only(left: 5, right: 5),
            decoration: BoxDecoration(
                color: Colors.black,
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
          width: 10,
        ),
        Text(
          teamPoints.toString(),
          style: TextStyle(
            fontSize: 30,
            color: blue300,
            fontWeight: FontWeight.bold,
            fontFamily: 'Monserrat',
          ),
        ),
      ],
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
            style: TextStyle(
                fontSize: 11,
                color: whiteColor,
                fontFamily: 'Monserrat',
                fontWeight: FontWeight.bold),
          ),
          radius: 10,
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          teamName,
          style: TextStyle(
              fontFamily: 'Monserrat',
              fontWeight: FontWeight.bold,
              color: Colors.black54,
              fontSize: 18),
        )
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
      padding: EdgeInsets.only(top: 5),
      width: 155,
      height: 37,
      child: ListView.builder(
        itemCount: 3,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: ClipOval(
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
          );
        },
      ),
    );
  }
}
