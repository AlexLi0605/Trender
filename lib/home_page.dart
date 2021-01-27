import 'package:WhatIsNew/ui/views/google_trend_view.dart';
import 'package:WhatIsNew/ui/views/twitter_view.dart';
import 'package:WhatIsNew/ui/views/youtube_view.dart';
import 'package:WhatIsNew/assets/constants.dart' as C;

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  static const List<Tab> tabs = <Tab>[
    Tab(text: C.GOOGLE_TAB_TITLE),
    Tab(text: C.YOUTUBE_TAB_TITLE),
    Tab(text: C.TWITTER_TAB_TITLE),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(widget.title),
          bottom: TabBar(
            controller: _tabController,
            indicatorColor: Colors.white,
            tabs: tabs,
          )),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          GoogleTrendView(),
          YoutubeView(),
          TwitterView(),
        ],
      ),
    );
  }
}
