import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:quran_app/container/About.dart';
import 'package:quran_app/container/AudioPlayerDemo.dart';
import 'package:quran_app/container/Home.dart';
import 'package:quran_app/container/Settings.dart';
import 'package:quran_app/container/intro/IntroPage.dart';
import 'package:quran_app/container/ui_learn/ui_one.dart';
import 'package:quran_app/redux/model/app_state.dart';
import 'package:quran_app/redux/reducers/reducers.dart';
import 'package:redux/redux.dart';

import 'container/listalquran.dart';


void main() {
  final _initialState = AppState(sliderFontSize: 0.5);
  final Store<AppState> _store =
  Store<AppState>(reducer, initialState: _initialState);

  runApp(MyApp(store: _store));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;

  MyApp({this.store});

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => About(),
          '/listAlquran': (context) => ListAlquran(),
          '/AudioApp': (context) => AudioApp(),
          '/about': (context) => About(),
          '/IntroPage': (context) => IntroPage(),
          '/UiOne': (context) => UiOne(1),
          '/settings': (context) => Settings(),
        },
      ),
    );
  }
}