import 'package:flutter/material.dart';

const kTitle = 'Redux';

class DrawerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Center(
              child: Text(
                kTitle,
                style: TextStyle(
                  fontSize: Theme
                      .of(context)
                      .textTheme
                      .title
                      .fontSize,
                  color: Colors.white,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.teal,
            ),
          ),
          getListTile('Home', onTap: () {
            Navigator.pushReplacementNamed(context, '/');
          }),
          getLine(),
          getListTile('ListAlquran', onTap: () {
            Navigator.pushReplacementNamed(context, '/listAlquran');
          }),
          getLine(),
          getListTile('AudioApp', onTap: () {
            Navigator.pushReplacementNamed(context, '/AudioApp');
          }),
          getLine(),
          getListTile('About', onTap: () {
            Navigator.pushReplacementNamed(context, '/about');
          }),
          getLine(),
          getListTile('IntroPage', onTap: () {
            Navigator.pushReplacementNamed(context, '/IntroPage');
          }),
          getLine(),
          getListTile('UiOne', onTap: () {
            Navigator.pushReplacementNamed(context, '/UiOne');
          }),
          getLine(),
          getListTile('Settings', onTap: () {
            Navigator.pushReplacementNamed(context, '/settings');
          }),
        ],
      ),
    );
  }

  Widget getLine() {
    return SizedBox(
      height: 0.5,
      child: Container(
        color: Colors.grey,
      ),
    );
  }

  Widget getListTile(title, {Function onTap}) {
    return ListTile(
      title: Text(title),
      onTap: onTap,
    );
  }
}