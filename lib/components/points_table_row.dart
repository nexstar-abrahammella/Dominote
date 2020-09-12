import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dominote/utilities/styles.dart';
import 'package:dominote/screens/home_screen.dart';

class PointsTableRow extends StatefulWidget {
  final Map<String, int> points;
  final Map<String, int> fastPlay;
  final int indexRow;
  final VoidCallback onDelete;

  PointsTableRow({this.points, this.fastPlay, this.indexRow, this.onDelete});
  @override
  _PointsTableRowState createState() => _PointsTableRowState();
}

class _PointsTableRowState extends State<PointsTableRow> {
  Widget fastPointsIndicators(int option) {
    final double pointCircleRadius = 5.0;
    List<Color> circleIndicatorColor = [blue300, blue300, blue300];
    circleIndicatorColor[option] = blue700;
    return Row(
      children: <Widget>[
        CircleAvatar(
          backgroundColor: circleIndicatorColor[0],
          radius: pointCircleRadius,
        ),
        SizedBox(
          width: 5,
        ),
        CircleAvatar(
          backgroundColor: circleIndicatorColor[1],
          radius: pointCircleRadius,
        ),
        SizedBox(
          width: 5,
        ),
        CircleAvatar(
          backgroundColor: circleIndicatorColor[2],
          radius: pointCircleRadius,
        ),
      ],
    );
  }

  Widget teamPointsAndIndicator({int points = 0, bool roundWinner}) {
    return Container(
      child: Row(
        children: <Widget>[
          fastPointsIndicators(2),
          SizedBox(
            width: 10,
          ),
          Text(
            points.toString(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'Montserrat',
              fontSize: 17,
              color: (roundWinner) ? blue700 : blue300,
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool roundWinnerTeamA = widget.points['teamA'] > widget.points['teamB'];
    return Container(
      padding: EdgeInsets.only(top: 12, left: 30, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 15.0),
            width: 120,
            child: teamPointsAndIndicator(
                points: widget.points['teamA'], roundWinner: roundWinnerTeamA),
          ),
          Container(
            height: 30,
            width: 20,
            child: CircleAvatar(
              backgroundColor: blue700,
              radius: 10,
              child: Text(
                "${widget.indexRow}",
                style: teamIndexStyle,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 15.0),
            width: 100,
            child: teamPointsAndIndicator(
                points: widget.points['teamB'], roundWinner: !roundWinnerTeamA),
          ),
          Container(
              height: 25,
              width: 22,
              child: RawMaterialButton(
                onPressed: () {
                  setState(() {
                    print('ok');
                    points.removeAt(widget.indexRow);
                    print(points);
                  });
                },
                elevation: 2.0,
                fillColor: blue300,
                child: Icon(
                  Icons.clear,
                  size: 10.0,
                  color: blue200,
                ),
                padding: EdgeInsets.all(5.0),
                shape: CircleBorder(),
              )),
        ],
      ),
    );
  }
}
