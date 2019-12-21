import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/data/location.dart';
import 'package:quran_app/data/themes.dart';
import 'package:quran_app/data/uistate.dart';
import 'package:quran_app/ui/audio_player_demo.dart';
import 'package:quran_app/ui/home.dart';
import 'package:quran_app/ui/intro/IntroPage.dart';
import 'package:quran_app/ui/json_show_page.dart';
import 'package:quran_app/ui/settings.dart';

void main() => runApp(MultiProvider(providers: [
  ChangeNotifierProvider(builder: (_) => UiState()),
  ChangeNotifierProvider(builder: (_) => ThemeNotifier()),
  ChangeNotifierProvider(builder: (_) => LocationNotifier()),
], child: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quran App',
      theme: Provider.of<ThemeNotifier>(context).curretThemeData,
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/settings': (context) => Settings(),
        '/jsonView': (context) => JsonView(),
        '/audioApp': (context) => AudioApp(),
        '/intro': (context) => IntroPage(),
      },
    );
  }
}