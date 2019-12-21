import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:json_table/json_table.dart';
import 'package:pk_skeleton/pk_skeleton.dart';
import 'package:quran_app/data/services.dart';

class JsonView extends StatelessWidget {
  String text = lorem(paragraphs: 3, words: 50);
  bool toggle = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.keyboard_backspace),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Json View'),
        elevation: 0.0,
      ),
      body: FutureBuilder<String>(
        future: ServiceData().loadInfoTable(),
        builder: (c, snapshot) {
          return snapshot.hasData
              ? Container(
                  child: toggle
                      ? Column(
                          children: [
                            JsonTable(
                              jsonDecode(snapshot.data),
                              showColumnToggle: true,
                              tableHeaderBuilder: (String header) {
                                return Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8.0, vertical: 4.0),
                                  decoration: BoxDecoration(
                                      border: Border.all(width: 0.5),
                                      color: Colors.grey[300]),
                                  child: Text(
                                    header,
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .display1
                                        .copyWith(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 14.0,
                                            color: Colors.black87),
                                  ),
                                );
                              },
                              tableCellBuilder: (value) {
                                return Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 4.0, vertical: 2.0),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 0.5,
                                          color: Colors.grey.withOpacity(0.5))),
                                  child: Text(
                                    value,
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .display1
                                        .copyWith(
                                            fontSize: 14.0,
                                            color: Colors.grey[900]),
                                  ),
                                );
                              },
                              allowRowHighlight: true,
                              rowHighlightColor:
                                  Colors.yellow[500].withOpacity(0.7),
                              paginationRowCount: 4,
                            ),
                            SizedBox(
                              height: 40.0,
                            ),
                            Text(
                                "Simple table which creates table direclty from json")
                          ],
                        )
                      : Center(
                          child: Text("dmd"),
                        ),
                )
              : PKCardListSkeleton(
                  isCircularImage: true,
                  isBottomLinesActive: true,
                  length: 10,
                );
        },
      ),
    );
    ;
  }
}
