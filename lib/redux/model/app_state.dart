import 'package:flutter/material.dart';

class AppState {
  double sliderFontSize;
  bool bold;
  bool italic;
  String customers;

  AppState(
      {@required this.sliderFontSize, this.bold = false, this.italic = false,this.customers ='[]'});

  AppState.fromAppState(AppState another) {
    sliderFontSize = another.sliderFontSize;
    bold = another.bold;
    italic = another.italic;
    customers = another.customers;
  }

  double get viewFontSize => sliderFontSize * 30;
}