import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'package:apuntalo/utilities/styles.dart';
import 'dart:math';
import 'package:lottie/lottie.dart';
import 'package:apuntalo/utilities/internationalization_constants.dart';
import 'package:provider/provider.dart';
import 'package:apuntalo/models/gameDataInformation.dart';
import 'home_screen.dart';

class GameWinner extends StatefulWidget {
  GameWinner({this.teamWinner});

  final String teamWinner;

  @override
  _GameWinnerState createState() => _GameWinnerState();
}

class _GameWinnerState extends State<GameWinner> {
  ConfettiController myController;
  int _counter = 0;

  @override
  void initState() {
    myController = ConfettiController(
      duration: Duration(seconds: 3),
    );
    myController.play();
    super.initState();
  }

  Widget build(BuildContext context) {
    final gameData = Provider.of<GameDataInformation>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          i18n(locale: gameData.applicationLanguage, value: "i18n.results"),
          style: congratulationStyle,
        ),
        backgroundColor: blue200,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: blue900),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      backgroundColor: blue200,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Lottie.asset('lib/assets/winner.json',
                    height: 200.0, width: 300.0),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 120,
              width: 350,
              decoration: BoxDecoration(
                  color: blue900,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(23.0),
                        child: Container(
                          height: 70,
                          width: 120,
                          decoration: BoxDecoration(
                              color: whiteColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Center(
                            child: Text(
                              gameData.totalTeamAScoreNumber,
                              style:
                                  gameData.teamAWin ? scoreWinner : scoreLoser,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        ':',
                        style: dividerScoresStyle,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(23.0),
                        child: Container(
                          height: 70,
                          width: 120,
                          decoration: BoxDecoration(
                              color: whiteColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Center(
                            child: Text(
                              gameData.totalTeamBScoreNumber,
                              style:
                                  gameData.teamBWin ? scoreWinner : scoreLoser,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              i18n(
                  locale: gameData.applicationLanguage,
                  value: "i18n.theWinnerIs"),
              style: teamWinnerTextStyle,
            ),
            SizedBox(height: 10),
            Text(
              gameData.teamPlayersName(),
              style: teamWinnerStyle,
            ),
            ConfettiWidget(
              confettiController: myController,
              blastDirection: -pi / 2,
              particleDrag: 0.05,
              emissionFrequency: 0.02,
              numberOfParticles: 20, // number of particles to emit
              gravity: 0.05, // gravity - or fall speed
              shouldLoop: false,
              colors: const [
                Colors.green,
                Colors.blue,
                Colors.pink,
                Colors.yellow,
                Colors.red
              ],
            ),
          ],
        ),
      ),
    );
  }
}
