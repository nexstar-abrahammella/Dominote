import 'package:flutter/material.dart';
import '../utilities/styles.dart';

class GameHeaderInformation extends StatefulWidget {
  GameHeaderInformation({this.textLabel, this.numberLabel});
  final String textLabel;
  final String numberLabel;

  @override
  _GameHeaderInformationState createState() => _GameHeaderInformationState();
}

class _GameHeaderInformationState extends State<GameHeaderInformation> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Row(
              children: <Widget>[
                Text(
                  widget.textLabel,
                  style: gameInformationTextLabelStyle,
                ),
                Container(
                  margin: const EdgeInsets.all(4.0),
                  padding: EdgeInsets.all(6.0),
                  width: 70,
                  decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Text(
                    widget.numberLabel,
                    textAlign: TextAlign.center,
                    style: gameInformationLabelStyle,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
