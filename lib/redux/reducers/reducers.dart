

import 'package:quran_app/redux/actions/actions.dart';
import 'package:quran_app/redux/model/app_state.dart';

AppState reducer(AppState prevState, dynamic action) {
  AppState newState = AppState.fromAppState(prevState);

  if (action is FontSize) {
    newState.sliderFontSize = action.payload;
  } else if (action is Bold) {
    newState.bold = action.payload;
  } else if (action is Italic) {
    newState.italic = action.payload;
  }else if (action is Customers) {
    newState.customers = action.payload;
  }

  return newState;
}