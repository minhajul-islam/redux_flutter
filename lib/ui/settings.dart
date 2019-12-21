import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/data/location.dart';
import 'package:quran_app/data/themes.dart';
import 'package:quran_app/data/uistate.dart';
import 'package:quran_app/ui/widget/cardsetting.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    var ui = Provider.of<UiState>(context);
    var dark = Provider.of<ThemeNotifier>(context);
    var loc = Provider.of<LocationNotifier>(context);
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.keyboard_backspace),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text('Settings'),
          elevation: 0.0,
        ),
        body: Column(
          children: <Widget>[
            CardSetting(
              title: 'Theme',
              leading: Switch(
                value: dark.darkmode,
                onChanged: (newValue) => dark.switchTheme(newValue),
              ),
            ),
            CardSlider(
              title: 'Font Size',
              slider: Slider(
                min: 0.5,
                value: ui.sliderFontSize,
                onChanged: (newValue) => ui.fontSize = newValue,
              ),
              trailing: ui.fontSize.toInt().toString(),
            ),
          ],
        ));
  }
}

class CardSlider extends StatelessWidget {
  const CardSlider({
    Key key,
    @required this.title,
    @required this.slider,
    @required this.trailing,
  }) : super(key: key);

  final String title;
  final Widget slider;
  final String trailing;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      child: Card(
        elevation: 0,
        child: ListTile(
          contentPadding: EdgeInsets.only(top: 10, right: 30, left: 15),
          title: Text(title),
          subtitle: slider,
          trailing: Text(trailing),
        ),
      ),
    );
  }
}
