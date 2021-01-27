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

  Text get _appBarTitle => Text(
        widget.title,
        style: const TextStyle(
          color: Colors.blue,
          fontWeight: FontWeight.w900,
          fontStyle: FontStyle.italic,
          fontFamily: 'Open Sans',
          fontSize: 30,
        ),
      );

  TabBar get _tabBar => TabBar(
        unselectedLabelColor: Colors.redAccent,
        indicatorSize: TabBarIndicatorSize.label,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.redAccent,
        ),
        controller: _tabController,
        tabs: [
          _getTab(C.GOOGLE_TAB_TITLE),
          _getTab(C.YOUTUBE_TAB_TITLE),
          _getTab(C.TWITTER_TAB_TITLE),
        ],
      );

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _appBarTitle,
        elevation: 0,
        backgroundColor: Colors.transparent,
        bottom: PreferredSize(
          preferredSize: _tabBar.preferredSize,
          child: ColoredBox(
            color: Colors.white,
            child: _tabBar,
          ),
        ),
      ),
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

  Tab _getTab(String title) {
    return Tab(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: Colors.redAccent),
        ),
        child: Align(
          child: Text(title),
        ),
      ),
    );
  }
}
