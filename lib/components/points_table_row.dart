import 'package:flutter/material.dart';
import 'package:domiote/utilities/styles.dart';

class PointsTableRow extends StatefulWidget {
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
    return Container(
      padding: EdgeInsets.only(top: 12, left: 55, right: 55),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          teamPointsAndIndicator(points: 100, roundWinner: true),
          CircleAvatar(
            backgroundColor: blue700,
            radius: 10,
            child: Text(
              "1",
              style: TextStyle(color: whiteColor),
            ),
          ),
          teamPointsAndIndicator(points: 80, roundWinner: false),
        ],
      ),
    );
  }
}
