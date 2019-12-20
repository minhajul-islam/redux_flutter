import 'package:flutter/material.dart';
import 'package:pk_skeleton/pk_skeleton.dart';
import 'package:quran_app/components/cardsurah.dart';
import 'package:quran_app/container/ui_learn/ui_one.dart';
import 'package:quran_app/data/api/ApiFunction.dart';
import 'package:quran_app/data/model/surahinfo.dart';
import 'package:quran_app/navigation/DrawerMenu.dart';

class ListAlquran extends StatefulWidget {
  @override
  _ListAlquranState createState() => _ListAlquranState();
}

class _ListAlquranState extends State<ListAlquran> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
        backgroundColor: Colors.teal,
      ),
      drawer: DrawerMenu(),
      body: FutureBuilder<List<SurahInfo>>(
        future: ApiFunction(context).loadInfo(),
        builder: (c, snapshot) {
          return snapshot.hasData
              ? ListView(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  children: snapshot.data
                      .map((data) => CardSurah(
                            title: data.latin,
                            subtitle: data.translation,
                            surah: data.index.toString(),
                            ayah: data.ayahCount.toString(),
                            arabic: data.arabic.toString(),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => UiOne(2)));
                            },
                          ))
                      .toList())
              : PKCardListSkeleton(
                  isCircularImage: true,
                  isBottomLinesActive: true,
                  length: 10,
                );
        },
      ),
    );
  }
}
