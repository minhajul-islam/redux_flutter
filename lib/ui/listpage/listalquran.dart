import 'package:flutter/material.dart';
import 'package:pk_skeleton/pk_skeleton.dart';
import 'package:quran_app/data/model/surahinfo.dart';
import 'package:quran_app/data/services.dart';
import 'package:quran_app/ui/detailsurah.dart';
import 'package:quran_app/ui/widget/cardsurah.dart';

class ListAlquran extends StatefulWidget {
  @override
  _ListAlquranState createState() => _ListAlquranState();
}

class _ListAlquranState extends State<ListAlquran> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<SurahInfo>>(
      future: ServiceData().loadInfo(),
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
                                    builder: (context) => DetailSurah(
                                        detail: data.latin,
                                        index: data.index)));
                          },
                        ))
                    .toList())
            : PKCardListSkeleton(
                isCircularImage: true,
                isBottomLinesActive: true,
                length: 10,
              );
      },
    );
  }
}
