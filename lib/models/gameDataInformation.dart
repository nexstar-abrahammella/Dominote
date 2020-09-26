import 'package:flutter/material.dart';
import 'package:dominote/screens/home_screen.dart';
import 'package:dominote/utilities/internationalization_constants.dart';

class GameDataInformation with ChangeNotifier {
  int _totalScore = 200;
  int _restantTeamAPoint = 200;
  int _restantTeamBPoint = 200;
  String _seriesNumber = '2/3';
  String _locale = "es";
  String _teamA = 'Equipo A';
  String _teamB = 'Equipo B';
  String _playerOneTeamB;
  String _playerTwoTeamB;
  String _playerOneTeamA;
  String _playerTwoTeamA;
  String totalTeamAScoreNumber = '0';
  String totalTeamBScoreNumber = '0';

  String teamANameText = 'Equipo A';
  String teamBNameText = 'Equipo B';
  TextEditingController teamAPlayerOneController;
  TextEditingController teamAPlayerTwoController;
  TextEditingController teamBPlayerOneController;
  TextEditingController teamBPlayerTwoController;

  bool teamAWin = false;
  bool teamBWin = false;

  get totalScore => _totalScore;
  get playerOneTeamA => _playerOneTeamA;
  get playerTwoTeamA => _playerTwoTeamA;
  get playerOneTeamB => _playerOneTeamB;
  get playerTwoTeamB => _playerTwoTeamB;
  get restantTeamAPoint => _restantTeamAPoint;
  get restantTeamBPoint => _restantTeamBPoint;
  get seriesNumber => _seriesNumber;
  get applicationLanguage => _locale;
  get teamAName => _teamA;
  get teamBName => _teamB;

  set seriesNumber(String series) {
    this._seriesNumber = series;
  }

  set totalScore(int score) {
    this._totalScore = score;
    notifyListeners();
  }

  set changeApplicationLanguage(String language) {
    this._locale = language;
    notifyListeners();
  }

  void resetGame() {
    this._restantTeamAPoint = this._totalScore;
    this._restantTeamBPoint = this._totalScore;
    totalTeamAPoint = 0;
    totalTeamBPoint = 0;
    pointsList.length = 0;
    notifyListeners();
  }

  void updateGame() {
    this._restantTeamAPoint = this._totalScore - totalTeamAPoint;
    this._restantTeamBPoint = this._totalScore - totalTeamBPoint;
    notifyListeners();
  }

  void changeTeamBName() {
    var playerOneNull =
        this._playerOneTeamB == null || this._playerOneTeamB == '';
    var playerTwoNull =
        this._playerTwoTeamB == null || this._playerTwoTeamB == '';

    var isPlayerBlanksOrNull = playerOneNull && playerTwoNull;
    var isPlayersInputNotNullOrBlank = !(playerOneNull) & !playerTwoNull;
    var isPlayerOneNotNullAndPlayerTwoIsNull = !playerOneNull && playerTwoNull;
    var isPlayerOneNullAndPlayerTwoIsNotNull = playerOneNull && !playerTwoNull;

    if (isPlayerBlanksOrNull) {
      this._teamB = teamBNameText;
    } else if (isPlayersInputNotNullOrBlank)
      this._teamB = '${this._playerOneTeamB[0]} & ${this._playerTwoTeamB[0]}';
    else if (isPlayerOneNotNullAndPlayerTwoIsNull)
      this._teamB = '${this._playerOneTeamB}';
    else if (isPlayerOneNullAndPlayerTwoIsNotNull)
      this._teamB = '${this._playerTwoTeamB}';
    else
      this._teamB = teamBNameText;

    notifyListeners();
  }

  void changeTeamAName() {
    var playerOneNull =
        this._playerOneTeamA == null || this._playerOneTeamA == '';
    var playerTwoNull =
        this._playerTwoTeamA == null || this._playerTwoTeamA == '';

    var isPlayerBlanksOrNull = playerOneNull && playerTwoNull;
    var isPlayersInputNotNullOrBlank = !(playerOneNull) & !playerTwoNull;
    var isPlayerOneNotNullAndPlayerTwoIsNull = !playerOneNull && playerTwoNull;
    var isPlayerOneNullAndPlayerTwoIsNotNull = playerOneNull && !playerTwoNull;

    if (isPlayerBlanksOrNull) {
      this._teamA = teamANameText;
    } else if (isPlayersInputNotNullOrBlank)
      this._teamA = '${this._playerOneTeamA[0]} & ${this._playerTwoTeamA[0]}';
    else if (isPlayerOneNotNullAndPlayerTwoIsNull)
      this._teamA = '${this._playerOneTeamA}';
    else if (isPlayerOneNullAndPlayerTwoIsNotNull)
      this._teamA = '${this._playerTwoTeamA}';
    else
      this._teamA = teamANameText;

    notifyListeners();
  }

  teamPlayersName() {
    if (teamAWin) {
      return this._teamA;
    } else {
      return this._teamB;
    }
  }

  void playersInputName() {
    teamAPlayerOneController = TextEditingController(text: playerOneTeamA);
    teamAPlayerTwoController = TextEditingController(text: playerTwoTeamA);
    teamBPlayerOneController = TextEditingController(text: playerOneTeamB);
    teamBPlayerTwoController = TextEditingController(text: playerTwoTeamB);
  }

  set playerOneTeamB(String playerName) {
    this._playerOneTeamB = playerName;
    notifyListeners();
  }

  set playerTwoTeamB(String playerName) {
    this._playerTwoTeamB = playerName;
    notifyListeners();
  }

  set playerOneTeamA(String playerName) {
    this._playerOneTeamA = playerName;
    notifyListeners();
  }

  set playerTwoTeamA(String playerName) {
    this._playerTwoTeamA = playerName;
    notifyListeners();
  }

  set teamAi18n(String locale) {
    this._teamA = i18n(locale: locale, value: "i18n.teamA");
    teamANameText = i18n(locale: locale, value: "i18n.teamA");
    notifyListeners();
  }

  set teamBi18n(String locale) {
    this._teamB = i18n(locale: locale, value: "i18n.teamB");
    teamBNameText = i18n(locale: locale, value: "i18n.teamB");
    notifyListeners();
  }
}
