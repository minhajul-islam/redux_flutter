import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:quran_app/components/simple_table.dart';
import 'package:quran_app/navigation/DrawerMenu.dart';
import 'package:quran_app/redux/model/app_state.dart';

class UiOne extends StatelessWidget {
  String text = lorem(paragraphs: 3, words: 50);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz'),
        backgroundColor: Colors.teal,
      ),
      drawer: DrawerMenu(),
      body: Container(
        margin: EdgeInsets.all(16.0),
        child: StoreConnector<AppState, AppState>(
          converter: (store) => store.state,
          builder: (context, state) {
            return  Container(
              child: Column(
                children: <Widget>[
                 //one
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.orangeAccent,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    height: 100,
                    child: Align(
                      //alignment: Alignment.center,
                      //alignment: Alignment.centerLeft,
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: 100,
                        height: 57,
                        decoration: BoxDecoration(
                         color: Color(0xff757575),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                    ),
                  ),




                  //two
                  Container(
                    width: 285,
                    margin: EdgeInsets.only(top: 11),
                    child: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris pellentesque erat in blandit luctus.",
                      //textAlign: TextAlign.center,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Colors.blue,
                        fontFamily: "Open Sans",
                        fontWeight: FontWeight.w400,
                        fontSize: 17,
                      ),
                    ),
                  ),



                  //three
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 258,
                      height: 57,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [Colors.blue, Colors.red]),
                        boxShadow: [BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5.0,
                        ),],
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Get Started",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black38,
                              fontFamily: "Open Sans",
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            );
          },
        ),
      ),
    );
  }
}