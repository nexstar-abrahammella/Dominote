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
  color: blue900,
  fontSize: 16.0,
);

const gameInformationTextLabelStyle = TextStyle(
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
  color: whiteColor,
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
    color: blue900,
    fontSize: 18);

const teamPointsHintTextInput = TextStyle(
  fontSize: 23,
  color: blue300,
  fontWeight: FontWeight.bold,
  fontFamily: 'Monserrat',
);

const teamNameHintTextInput = TextStyle(
  fontSize: 18,
  color: blue300,
  fontWeight: FontWeight.bold,
  fontFamily: 'Monserrat',
);

const teamNameHintTextInputTeamB = TextStyle(
  fontSize: 18,
  color: blue300,
  fontWeight: FontWeight.bold,
  fontFamily: 'Monserrat',
);

const teamPointsInput = TextStyle(
  fontSize: 20,
  color: Colors.blue,
  fontWeight: FontWeight.bold,
  fontFamily: 'Monserrat',
);

const teamPointsInputTeamB = TextStyle(
  fontSize: 20,
  color: Colors.red,
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
  fontSize: 12,
  color: whiteColor,
  fontWeight: FontWeight.bold,
  fontFamily: 'Monserrat',
);

const congratulationStyle = TextStyle(
  fontSize: 30,
  color: whiteColor,
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

const textHeaderSettings = TextStyle(
  fontSize: 18,
  color: blue900,
  fontWeight: FontWeight.bold,
  fontFamily: 'Monserrat',
);

const textOptionsSettings = TextStyle(
  fontSize: 16,
  color: Colors.blue,
  fontWeight: FontWeight.bold,
  fontFamily: 'Monserrat',
);

const textFastPoint = TextStyle(
  fontSize: 16,
  color: whiteColor,
  fontWeight: FontWeight.bold,
  fontFamily: 'Monserrat',
);

const textOptionsSettingsTeamB = TextStyle(
  fontSize: 16,
  color: Colors.red,
  fontWeight: FontWeight.bold,
  fontFamily: 'Monserrat',
);

const textButtonSaveSettings = TextStyle(
  fontSize: 20,
  color: whiteColor,
  fontWeight: FontWeight.bold,
  fontFamily: 'Monserrat',
);

const boxDecorationSettings = BoxDecoration(
    color: whiteColor, borderRadius: BorderRadius.all(Radius.circular(20)));

const boxDecorationTeamName = BoxDecoration(
    color: blue200, borderRadius: BorderRadius.all(Radius.circular(5)));

const inputDecorationTeamNamePlayerOneSettings = InputDecoration(
  hintText: "Jugador #1",
  hintStyle: teamNameHintTextInput,
);

const inputDecorationTeamNamePlayerTwoSettings = InputDecoration(
  hintText: "Jugador #2",
  hintStyle: teamNameHintTextInput,
);
