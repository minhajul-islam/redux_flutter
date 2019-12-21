import 'package:flutter/material.dart';

void showAlert(BuildContext context,String responsde) {
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("data"),
        content: Text(responsde),
      )
  );
}