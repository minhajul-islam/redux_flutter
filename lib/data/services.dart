import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:quran_app/data/model/allasmaul.dart';
import 'package:quran_app/data/model/alldoa.dart';
import 'package:quran_app/data/model/allsurah.dart';
import 'package:quran_app/data/model/ayatkursi.dart';
import 'package:quran_app/data/model/jadwalsholat.dart';
import 'package:quran_app/data/model/surahinfo.dart';

class ServiceData {
  var infosurah = 'surah/surah-info.json';
  var listdoa = 'surah/doa-harian.json';
  var listasmaulhusna = 'surah/asmaul-husna.json';
  var ayatkursi = 'surah/ayat-kursi.json';
  var jadwalsholat = 'http://muslimsalat.com/';

  Future<List<SurahInfo>> loadInfo() async {
    var response = await rootBundle.loadString(infosurah);
    Iterable data = json.decode(response);
    return data.map((model) => SurahInfo.fromJson(model)).toList();
  }
  Future<String> loadInfoTable() async {
    var response = await rootBundle.loadString(infosurah);
    return response;
  }

  Future<AllSurah> loadSurah(int number) async {
    final response = await rootBundle.loadString('surah/$number.json');
    var res = json.decode(response);
    var data = res['$number'];
    return AllSurah.fromJson(data);
  }

  Future<List<AllDoa>> loadDoa() async {
    var response = await rootBundle.loadString(listdoa);
    var res = json.decode(response);
    Iterable data = res['data'];
    return data.map((model) => AllDoa.fromJson(model)).toList();
  }

  Future<List<AllAsmaul>> loadAsmaul() async {
    var response = await rootBundle.loadString(listasmaulhusna);
    var res = json.decode(response);
    Iterable data = res['data'];
    return data.map((model) => AllAsmaul.fromJson(model)).toList();
  }

  Future<AyathKursi> loadAyatKursi() async {
    var response = await rootBundle.loadString(ayatkursi);
    var res = json.decode(response);
    var data = res['data'];
    return AyathKursi.fromJson(data);
  }

  Future<JadwalDaily> loadJadwalSholat(String lokasi) async {
    var response = await http.get('$jadwalsholat$lokasi/daily.json');
    var res = json.decode(response.body);
    return JadwalDaily.fromJson(res);
  }
}
