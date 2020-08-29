import 'package:flutter/material.dart';
import 'package:domiote/utilities/styles.dart';

class TeamPointsBoard extends StatefulWidget {
  @override
  _TeamPointsBoardState createState() => _TeamPointsBoardState();
}

class _TeamPointsBoardState extends State<TeamPointsBoard> {
  final String teamNumber = "1";
  final String teamName = "Los tigers";
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
                color: Colors.black54,
                borderRadius: BorderRadius.all(Radius.circular(8))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 10,
                ),
                SizedBox(
                  width: 5,
                ),
                CircleAvatar(
                  radius: 10,
                ),
                SizedBox(
                  width: 5,
                ),
                CircleAvatar(
                  radius: 10,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "200",
                  style: TextStyle(fontSize: 25),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 5),
            child: Row(
              children: <Widget>[
                CircleAvatar(
                  radius: 15,
                ),
                SizedBox(
                  width: 15,
                ),
                CircleAvatar(
                  radius: 15,
                ),
                SizedBox(
                  width: 15,
                ),
                CircleAvatar(
                  radius: 15,
                ),
              ],
            ),
          )
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
