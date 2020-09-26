import 'package:dominote/models/gameDataInformation.dart';
import 'package:flutter/material.dart';
import 'package:dominote/utilities/styles.dart';
import 'package:dominote/utilities/internationalization_constants.dart';
import 'package:provider/provider.dart';

String dropDownSeriesValue = '2/3';
String dropDownPuntuationValue = '200';
String dropDownLanguageValue = '🇪🇸';

class SettingsGame extends StatefulWidget {
  @override
  _SettingsGameState createState() => _SettingsGameState();
}

class _SettingsGameState extends State<SettingsGame> {
  @override
  Widget build(BuildContext context) {
    final gameData = Provider.of<GameDataInformation>(context);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            i18n(
                locale: gameData.applicationLanguage,
                value: "i18n.configurations"),
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
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              width: 385,
              decoration: boxDecorationSettings,
              child: Column(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          i18n(
                              locale: gameData.applicationLanguage,
                              value: "i18n.editTeams"),
                          style: textHeaderSettings,
                        ),
                      ),
                      Divider(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: <Widget>[
                            Text(
                              gameData.teamAName,
                              style: textOptionsSettings,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Container(
                              height: 60,
                              width: 150,
                              decoration: boxDecorationTeamName,
                              child: TextField(
                                controller: gameData.teamAPlayerOneController,
                                onChanged: (value) {
                                  gameData.playerOneTeamA = value;
                                },
                                cursorColor: Colors.blue,
                                style: teamPointsInput,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.blue, width: 1.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.blue),
                                    ),
                                    labelText: i18n(
                                        locale: gameData.applicationLanguage,
                                        value: "i18n.playerOne"),
                                    labelStyle: teamNameHintTextInputTeamB),
                                autofocus: false,
                              ),
                            ),
                            Container(
                              height: 60,
                              width: 150,
                              decoration: boxDecorationTeamName,
                              child: TextField(
                                controller: gameData.teamAPlayerTwoController,
                                onChanged: (value) {
                                  gameData.playerTwoTeamA = value;
                                },
                                cursorColor: Colors.blue,
                                style: teamPointsInput,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.blue, width: 1.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.blue),
                                    ),
                                    labelText: i18n(
                                        locale: gameData.applicationLanguage,
                                        value: "i18n.playerTwo"),
                                    labelStyle: teamNameHintTextInputTeamB),
                                autofocus: false,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: <Widget>[
                            Text(
                              gameData.teamBName,
                              style: textOptionsSettingsTeamB,
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            height: 60,
                            width: 150,
                            decoration: boxDecorationTeamName,
                            child: TextField(
                              controller: gameData.teamBPlayerOneController,
                              cursorColor: Colors.red,
                              style: teamPointsInputTeamB,
                              onChanged: (value) {
                                gameData.playerOneTeamB = value;
                              },
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.red, width: 1.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red),
                                  ),
                                  labelText: i18n(
                                      locale: gameData.applicationLanguage,
                                      value: "i18n.playerOne"),
                                  labelStyle: teamNameHintTextInputTeamB),
                              autofocus: false,
                            ),
                          ),
                          Container(
                            height: 60,
                            width: 150,
                            decoration: boxDecorationTeamName,
                            child: TextField(
                              controller: gameData.teamBPlayerTwoController,
                              cursorColor: Colors.red,
                              style: teamPointsInputTeamB,
                              onChanged: (value) {
                                gameData.playerTwoTeamB = value;
                              },
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.red, width: 1.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red),
                                  ),
                                  labelText: i18n(
                                      locale: gameData.applicationLanguage,
                                      value: "i18n.playerTwo"),
                                  labelStyle: teamNameHintTextInputTeamB),
                              autofocus: false,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Divider(),
                  Row(
                    children: <Widget>[
                      Container(
                        height: 100,
                        width: 180,
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                i18n(
                                    locale: gameData.applicationLanguage,
                                    value: "i18n.seriesTitle"),
                                style: textHeaderSettings,
                              ),
                            ),
                            DropdownButton<String>(
                              value: dropDownSeriesValue,
                              elevation: 16,
                              style: TextStyle(color: blue900),
                              underline: Container(
                                height: 2,
                                color: blue900,
                              ),
                              onChanged: (String newValue) {
                                setState(() {
                                  dropDownSeriesValue = newValue;
                                });
                              },
                              items: <String>[
                                '2/3',
                                '3/5',
                                '4/7',
                                '6/10'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            )
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.grey[300],
                        height: 100,
                        width: 0.5,
                      ),
                      Container(
                        height: 100,
                        width: 200,
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                i18n(
                                    locale: gameData.applicationLanguage,
                                    value: "i18n.puntation"),
                                style: textHeaderSettings,
                              ),
                            ),
                            DropdownButton<String>(
                              value: dropDownPuntuationValue,
                              elevation: 16,
                              style: TextStyle(color: blue900),
                              underline: Container(
                                height: 2,
                                color: blue900,
                              ),
                              onChanged: (String newValue) {
                                setState(() {
                                  dropDownPuntuationValue = newValue;
                                });
                              },
                              items: <String>[
                                '50',
                                '100',
                                '200',
                                '300',
                                '400',
                                '500',
                                '600',
                                '700',
                                '800',
                                '900'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Divider(),
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          i18n(
                              locale: gameData.applicationLanguage,
                              value: "i18n.changeLanguage"),
                          style: textHeaderSettings,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            DropdownButton<String>(
                              value: dropDownLanguageValue,
                              elevation: 16,
                              underline: Container(
                                height: 1,
                                color: blue900,
                              ),
                              onChanged: (String newValue) {
                                setState(() {
                                  dropDownLanguageValue = newValue;
                                });
                              },
                              items: <String>[
                                '🇪🇸',
                                '🇺🇸'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: TextStyle(fontSize: 30),
                                  ),
                                );
                              }).toList(),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 50,
                    width: 150,
                    child: RaisedButton(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          side: BorderSide(color: Colors.red)),
                      onPressed: () {
                        setState(() {
                          gameData.seriesNumber = dropDownSeriesValue;
                          gameData.totalScore =
                              int.parse(dropDownPuntuationValue);
                          gameData.updateGame();
                          dropDownLanguageValue == '🇪🇸'
                              ? gameData.changeApplicationLanguage = 'es'
                              : gameData.changeApplicationLanguage = 'en';
                          gameData.changeTeamBName();
                          gameData.changeTeamAName();
                          gameData.playersInputName();
                          gameData.teamAi18n = gameData.applicationLanguage;
                          gameData.teamBi18n = gameData.applicationLanguage;
                          Navigator.popAndPushNamed(context, '/');
                        });
                      },
                      color: Colors.red,
                      textColor: Colors.white,
                      child: Text(
                          i18n(
                                  locale: gameData.applicationLanguage,
                                  value: "i18n.buttonSaveSettings")
                              .toUpperCase(),
                          style: textButtonSaveSettings),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
