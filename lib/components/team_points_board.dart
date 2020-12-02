import 'package:flutter/material.dart';
import 'package:apuntalo/utilities/styles.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:apuntalo/models/gameDataInformation.dart';

String teamAGamePoints = '0';
String teamBGamePoints = '0';
var textEditingcontroller;
var teamAController;
var teamBController;

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
    final gameData = Provider.of<GameDataInformation>(context);
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
            width: 140,
            padding: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
                color: blue900,
                borderRadius: BorderRadius.all(Radius.circular(8))),
            child: TeamPointsIndicator(
              pointCircleRadius: pointCircleRadius,
              teamLetter: widget.teamLetter,
            ),
          ),
          FastPointsActions(
            teamLetter: widget.teamLetter,
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

class TeamPointsIndicator extends StatefulWidget {
  TeamPointsIndicator(
      {@required this.pointCircleRadius,
      @required this.teamPoints,
      this.teamLetter});

  final double pointCircleRadius;
  final int teamPoints;
  final String teamLetter;

  @override
  _TeamPointsIndicatorState createState() => _TeamPointsIndicatorState();
}

class _TeamPointsIndicatorState extends State<TeamPointsIndicator> {
  var _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 61,
          child: TextField(
            controller: _controller,
            onChanged: (inputNumber) {
              if (inputNumber == "") {
                teamAGamePoints = '0';
                teamBGamePoints = '0';
              } else if (widget.teamLetter == 'A' && inputNumber != "") {
                teamAGamePoints = inputNumber;
                teamAController = _controller;
              } else if (widget.teamLetter == 'B' && inputNumber != "") {
                teamBGamePoints = inputNumber;
                teamBController = _controller;
              }

              textEditingcontroller = _controller;
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
  FastPointsActions({this.teamLetter});

  final String teamLetter;
  @override
  _FastPointsActionsState createState() => _FastPointsActionsState();
}

class _FastPointsActionsState extends State<FastPointsActions> {
  @override
  Widget build(BuildContext context) {
    final gameData = Provider.of<GameDataInformation>(context);

    void addFastPoint(String teamLetter, String points) {
      if (teamLetter == 'A') {
        teamAGamePoints = points;
//        gameData.addPointsButtonFunction();
      } else if (teamLetter == 'B') {
        teamBGamePoints = points;
//        gameData.addPointsButtonFunction();
      }
    }

    return Container(
      padding: EdgeInsets.only(top: 10),
      child: Row(
        children: <Widget>[
          GestureDetector(
            onTap: () => addFastPoint(widget.teamLetter, '25'),
            child: ClipOval(
              child: Container(
                color: blue900,
                height: 32.0,
                width: 32.0,
                child: Center(
                  child: Text(
                    '25',
                    style: textFastPoint,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 25,
          ),
          GestureDetector(
            onTap: () => addFastPoint(widget.teamLetter, '30'),
            child: ClipOval(
              child: Container(
                color: blue900,
                height: 32.0,
                width: 32.0,
                child: Center(
                  child: Text(
                    '30',
                    style: textFastPoint,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 25,
          ),
          GestureDetector(
            onTap: () => addFastPoint(widget.teamLetter, '50'),
            child: ClipOval(
              child: Container(
                color: blue900,
                height: 32.0,
                width: 32.0,
                child: Center(
                  child: Text(
                    '50',
                    style: textFastPoint,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
