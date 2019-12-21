import 'package:flutter/material.dart';
import 'package:pk_skeleton/pk_skeleton.dart';
import 'package:quran_app/data/model/allasmaul.dart';
import 'package:quran_app/data/services.dart';
import 'package:quran_app/ui/widget/cardasmaul.dart';

class ListAsmaul extends StatefulWidget {
  @override
  _ListAsmaulState createState() => _ListAsmaulState();
}

class _ListAsmaulState extends State<ListAsmaul> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: FutureBuilder<List<AllAsmaul>>(
          future: ServiceData().loadAsmaul(),
          builder: (c, snapshot) {
            return snapshot.hasData
                ? Directionality(
                    textDirection: TextDirection.rtl,
                    child: GridView(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      children: snapshot.data
                          .map((asm) => new CardAsmaul(
                                arabic: asm.arabic,
                                title: asm.latin,
                                translate: asm.translationId,
                              ))
                          .toList(),
                    ))
                : PKCardPageSkeleton(
                    totalLines: 5,
                  );
          },
        ),
      ),
    );
  }
}
