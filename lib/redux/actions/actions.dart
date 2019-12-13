import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:quran_app/data/api/ApiFunction.dart';
import 'package:quran_app/redux/model/app_state.dart';

/// FontSize
class FontSize {
  final double payload;

  FontSize(this.payload);
}

final Function changeFontSize = (BuildContext context, double payload) {
  return StoreProvider.of<AppState>(context).dispatch(FontSize(payload));
};

/// Customer inf
class Customers {
  final String payload;

  Customers(this.payload);
}

final Function getCustomers = (BuildContext context) {
  return StoreProvider.of<AppState>(context).dispatch(Customers(getCustomer()));
};

final Function getUser = (BuildContext context) {
  return StoreProvider.of<AppState>(context).dispatch(Customers(getUserInfo()));
};

/// Bold Type
class Bold {
  final bool payload;

  Bold(this.payload);
}

class Italic {
  final bool payload;

  Italic(this.payload);
}
