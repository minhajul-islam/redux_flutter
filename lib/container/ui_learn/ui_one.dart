import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:quran_app/components/simple_table.dart';
import 'package:quran_app/container/Settings.dart';
import 'package:quran_app/navigation/DrawerMenu.dart';
import 'package:quran_app/navigation/navigation.dart';
import 'package:quran_app/redux/model/app_state.dart';

class UiOne extends StatefulWidget {

  final int page;

  UiOne(this.page);
  @override
  _UiOneState createState() => _UiOneState();

}

class _UiOneState extends State<UiOne> {
  String text = lorem(paragraphs: 3, words: 50);
  int page;
  _UiOneState({this.page});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.page.toString()),
        backgroundColor: Colors.teal,
      ),
      //drawer: DrawerMenu(),
      body: Container(
        child: StoreConnector<AppState, AppState>(
          converter: (store) => store.state,
          builder: (context, state) {
            return Column(
              children: <Widget>[
                GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => UiOne(widget.page+1)),
                    );
                  },
                  child: SingleChildScrollView(
                    child: Container(
                      child: Image.asset(navData[widget.page],
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height-85,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}