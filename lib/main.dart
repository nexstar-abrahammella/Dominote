import 'package:apuntalo/screens/home_screen2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen.dart';
import 'screens/settings_screen.dart';
import 'package:apuntalo/screens/game_winner_screen.dart';
import 'models/gameDataInformation.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => GameDataInformation(),
        ),
      ],
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => HomeScreen2(),
          '/settings': (context) => SettingsGame(),
          '/gameWinner': (context) => GameWinner()
        },
      ),
    );
  }
}
