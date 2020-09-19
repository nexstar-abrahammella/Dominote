import 'package:flutter/material.dart';

//colors

const blue700 = Color(0xff3A3E47);
const blue900 = Color(0xff1D2233);
const blue300 = Color(0xffA8ADB8);
const blue200 = Color(0xffEFF2F7);
const whiteColor = Color(0xffFFFFFF);

const headerTextStyle = TextStyle(
  fontFamily: 'Kanit',
  fontWeight: FontWeight.w900,
  fontSize: 25.0,
);

const gameInformationLabelStyle = TextStyle(
  fontFamily: 'Monserrat',
  color: whiteColor,
  fontSize: 16.0,
);

const teamsLabelStyle = TextStyle(
  fontFamily: 'Monserrat',
  color: blue900,
  fontSize: 18.0,
);

const teamsLabelStyleWhite = TextStyle(
  fontFamily: 'Monserrat',
  color: blue200,
  fontSize: 18.0,
);

const gameInformationBorderDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(width: 0.3, color: whiteColor),
    bottom: BorderSide(width: 0.3, color: whiteColor),
  ),
);

const saveButtonTextStyle = TextStyle(
  fontFamily: 'Monserrat',
  color: blue300,
  fontSize: 20.0,
  fontWeight: FontWeight.w800,
);

const TextStyle teamNumberTextStyle = TextStyle(
    fontSize: 11,
    color: whiteColor,
    fontFamily: 'Monserrat',
    fontWeight: FontWeight.bold);

const TextStyle teamNameTextStyle = TextStyle(
    fontFamily: 'Monserrat',
    fontWeight: FontWeight.bold,
    color: whiteColor,
    fontSize: 18);

const teamPointsHintTextInput = TextStyle(
  fontSize: 23,
  color: blue300,
  fontWeight: FontWeight.bold,
  fontFamily: 'Monserrat',
);

const teamPointsInput = TextStyle(
  fontSize: 23,
  color: blue900,
  fontWeight: FontWeight.bold,
  fontFamily: 'Monserrat',
);

const inputDecorationTeamPoint = InputDecoration(
  enabledBorder: UnderlineInputBorder(
    borderSide: BorderSide.none,
  ),
  focusedBorder: UnderlineInputBorder(
    borderSide: BorderSide.none,
  ),
  hintText: "0",
  hintStyle: teamPointsHintTextInput,
);

const teamIndexStyle = TextStyle(
  fontSize: 10,
  color: whiteColor,
  fontWeight: FontWeight.bold,
  fontFamily: 'Monserrat',
);

const congratulationStyle = TextStyle(
  fontSize: 30,
  color: blue900,
  fontWeight: FontWeight.bold,
  fontFamily: 'Monserrat',
);

const teamWinnerTextStyle = TextStyle(
  fontSize: 20,
  color: blue300,
  fontWeight: FontWeight.bold,
  fontFamily: 'Monserrat',
);

const teamWinnerStyle = TextStyle(
  fontSize: 23,
  color: blue900,
  fontWeight: FontWeight.bold,
  fontFamily: 'Monserrat',
);

const scoreWinner = TextStyle(
  fontSize: 45,
  color: Colors.green,
  fontWeight: FontWeight.bold,
  fontFamily: 'Monserrat',
);

const scoreLoser = TextStyle(
  fontSize: 45,
  color: Colors.red,
  fontWeight: FontWeight.bold,
  fontFamily: 'Monserrat',
);

const dividerScoresStyle = TextStyle(
  fontSize: 45,
  color: blue200,
  fontWeight: FontWeight.bold,
  fontFamily: 'Monserrat',
);

const buttonShareStyle = TextStyle(
  fontSize: 23,
  color: whiteColor,
  fontWeight: FontWeight.bold,
  fontFamily: 'Monserrat',
);
