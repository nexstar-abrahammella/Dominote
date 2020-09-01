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

const teamPointsInput = TextStyle(
  fontSize: 30,
  color: blue300,
  fontWeight: FontWeight.bold,
  fontFamily: 'Monserrat',
);