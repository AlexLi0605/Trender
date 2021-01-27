import 'package:WhatIsNew/ui/views/google_trend_view.dart';
import 'package:WhatIsNew/ui/views/twitter_view.dart';
import 'package:WhatIsNew/ui/views/youtube_view.dart';
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
    Tab(text: "GOOGLE"),
    Tab(text: "YOUTUBE"),
    Tab(text: "TWITTER"),
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
