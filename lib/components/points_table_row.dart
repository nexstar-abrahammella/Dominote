import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:apuntalo/utilities/styles.dart';
import 'package:apuntalo/screens/home_screen.dart';

class PointsTableRow extends StatefulWidget {
  final Map<String, int> points;
  final Map<String, int> fastPlay;
  final int indexRow;
  final Function onDelete;

  PointsTableRow({this.points, this.fastPlay, this.indexRow, this.onDelete});
  @override
  _PointsTableRowState createState() => _PointsTableRowState();
}

class _PointsTableRowState extends State<PointsTableRow> {
  Widget teamPointsAndIndicator({int points = 0, bool roundWinner}) {
    return Container(
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 10,
          ),
          Text(
            points.toString(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'Montserrat',
              fontSize: 22,
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
            padding: EdgeInsets.only(left: 30.0),
            width: 120,
            child: teamPointsAndIndicator(
                points: widget.points['teamA'], roundWinner: roundWinnerTeamA),
          ),
          SizedBox(),
          Container(
            height: 30,
            width: 25,
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
            padding: EdgeInsets.only(left: 40.0),
            width: 100,
            child: teamPointsAndIndicator(
                points: widget.points['teamB'], roundWinner: !roundWinnerTeamA),
          ),
          Container(
              height: 25,
              width: 22,
              child: RawMaterialButton(
                onPressed: widget.onDelete,
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
