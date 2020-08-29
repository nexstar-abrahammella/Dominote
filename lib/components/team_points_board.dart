import 'package:flutter/material.dart';

class TeamPointsBoard extends StatefulWidget {
  @override
  _TeamPointsBoardState createState() => _TeamPointsBoardState();
}

class _TeamPointsBoardState extends State<TeamPointsBoard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                child: Text("1"),
                radius: 8,
              ),
              Text(" Equipo A")
            ],
          ),
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
