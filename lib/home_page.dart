import 'package:WhatIsNew/ui/views/google_trend_view.dart';
import 'package:WhatIsNew/ui/views/twitter_view.dart';
import 'package:WhatIsNew/ui/views/youtube_view.dart';
import 'package:WhatIsNew/assets/constants.dart' as C;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
          fontWeight: FontWeight.w900,
          fontStyle: FontStyle.italic,
          fontSize: 26,
        ),
      );

  TabBar get _tabBar => TabBar(
        unselectedLabelColor: C.TAB_UNSELECTED_COLOR,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorColor: C.TAB_INDICATOR_COLOR,
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
        bottom: PreferredSize(
          preferredSize: _tabBar.preferredSize,
          child: _tabBar,
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
      child: Align(
        child: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
    );
  }
}
