import 'package:flutter/material.dart';
import 'package:dominote/utilities/styles.dart';
import 'package:flutter/services.dart';

String teamAGamePoints = '0';
String teamBGamePoints = '0';

class TeamPointsBoard extends StatefulWidget {
  TeamPointsBoard({this.teamNumber, this.teamName, @required this.teamLetter});
  final String teamNumber;
  final String teamName;
  final String teamLetter;

  @override
  _TeamPointsBoardState createState() => _TeamPointsBoardState();
}

class _TeamPointsBoardState extends State<TeamPointsBoard> {
  final double pointCircleRadius = 9;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Column(
        children: <Widget>[
          TeamInfo(teamNumber: widget.teamNumber, teamName: widget.teamName),
          SizedBox(
            height: 8,
          ),
          Container(
            height: 50,
            width: 160,
            padding: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.all(Radius.circular(8))),
            child: TeamPointsIndicator(
              pointCircleRadius: pointCircleRadius,
              teamLetter: widget.teamLetter,
            ),
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
  const TeamPointsIndicator(
      {@required this.pointCircleRadius,
      @required this.teamPoints,
      this.teamLetter});

  final double pointCircleRadius;
  final int teamPoints;
  final String teamLetter;

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
        Container(
          width: 61,
          child: TextField(
            onChanged: (inputNumber) {
              if (inputNumber == "") {
                teamAGamePoints = '0';
                teamBGamePoints = '0';
              } else if (teamLetter == 'A' && inputNumber != "") {
                teamAGamePoints = inputNumber;
              } else if (teamLetter == 'B' && inputNumber != "") {
                teamBGamePoints = inputNumber;
              }
            },
            keyboardType: TextInputType.number,
            cursorColor: blue900,
            inputFormatters: [
              LengthLimitingTextInputFormatter(4),
              WhitelistingTextInputFormatter.digitsOnly
            ],
            style: teamPointsInput,
            textAlign: TextAlign.left,
            decoration: inputDecorationTeamPoint,
          ),
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
