import 'package:flutter/material.dart';
import 'package:quran_app/data/Constants.dart';
import 'package:quran_app/ui/json_show_page.dart';
import 'package:quran_app/ui/listpage/ayatkursi.dart';
import 'package:quran_app/ui/listpage/jadwalsholat.dart';
import 'package:quran_app/ui/listpage/listalquran.dart';
import 'package:quran_app/ui/listpage/listasmaul.dart';
import 'package:quran_app/ui/listpage/listdoa.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
          elevation: 0.0,
        ),
        drawer: Drawer(child: Drawers()),
        body:ListAlquran());
//        NestedScrollView(
//          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
//            return [
//              SliverAppBar(
//                pinned: false,
//                actions: <Widget>[
//                  IconButton(
//                    icon: Icon(Icons.info_outline),
//                    onPressed: () {
//                      Navigator.push(context,
//                          MaterialPageRoute(builder: (context) => JsonView()));
//                    },
//                  )
//                ],
//                flexibleSpace: FlexibleSpaceBar(
//                  collapseMode: CollapseMode.pin,
//                  background: Column(
//                    crossAxisAlignment: CrossAxisAlignment.start,
//                    children: <Widget>[
//                      Container(
//                        height: 60.0,
//                        width: double.infinity,
//                      ),
//                      Padding(
//                        padding: const EdgeInsets.all(20.0),
//                        child: Text(
//                          Static.appName,
//                          style: TextStyle(
//                              fontSize: 24.0,
//                              fontWeight: FontWeight.w500,
//                              color: Colors.white),
//                        ),
//                      ),
//                    ],
//                  ),
//                ),
//                expandedHeight: 150.0,
//                bottom: TabBar(
//                  controller: _tabController,
//                  indicatorColor: Colors.transparent,
//                  labelColor: Colors.white,
//                  unselectedLabelColor: Colors.white.withOpacity(0.6),
//                  labelPadding: EdgeInsets.symmetric(horizontal: 20.0),
//                  isScrollable: true,
//                  tabs: [
//                    Tab(
//                      child: Text(
//                        'Jadwal Sholat',
//                        style: TextStyle(
//                          fontSize: 16.0,
//                          fontWeight: FontWeight.bold,
//                        ),
//                      ),
//                    ),
//                    Tab(
//                      child: Text(
//                        'Alquran',
//                        style: TextStyle(
//                          fontSize: 16.0,
//                          fontWeight: FontWeight.bold,
//                        ),
//                      ),
//                    ),
//                    Tab(
//                      child: Text(
//                        'Doa Harian',
//                        style: TextStyle(
//                          fontSize: 16.0,
//                          fontWeight: FontWeight.bold,
//                        ),
//                      ),
//                    ),
//                    Tab(
//                      child: Text(
//                        'Asmaul Husna',
//                        style: TextStyle(
//                          fontSize: 16.0,
//                          fontWeight: FontWeight.bold,
//                        ),
//                      ),
//                    ),
//                    Tab(
//                      child: Text(
//                        'Ayat Kursi',
//                        style: TextStyle(
//                          fontSize: 16.0,
//                          fontWeight: FontWeight.bold,
//                        ),
//                      ),
//                    ),
//
//                  ],
//                ),
//              )
//            ];
//          },
//          body: TabBarView(
//            controller: _tabController,
//            children: <Widget>[
//              JadwalSholat(),
//              ListAlquran(),
//              ListDoa(),
//              ListAsmaul(),
//              AyatKursi(),
//            ],
//          ),
//        ));
  }
}

class Drawers extends StatelessWidget {
  const Drawers({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        DrawerHeader(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Spacer(),
              Image.asset('images/logo.jpg',
                width: MediaQuery.of(context).size.width-100,
                height: 100.0,
              ),
              Spacer(),
            ],
          ),
        ),
        ListTile(
            title: Text('About'),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () => Navigator.popAndPushNamed(context, '/about')),
        ListTile(
            title: Text('Json View'),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () => Navigator.popAndPushNamed(context, '/jsonView')),
        ListTile(
            title: Text('Audio App'),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () => Navigator.popAndPushNamed(context, '/audioApp')),
        ListTile(
            title: Text('Settings'),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () => Navigator.popAndPushNamed(context, '/settings')),
        ListTile(
            title: Text('Intro'),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () => Navigator.popAndPushNamed(context, '/intro')),
        ListTile(
            title: Text('Game'),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () => Navigator.popAndPushNamed(context, '/game')),
      ],
    );
  }
}
