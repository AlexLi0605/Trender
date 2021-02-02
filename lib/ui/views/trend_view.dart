import 'package:flutter/material.dart';

import 'package:WhatIsNew/assets/constants.dart' as c;
import 'package:WhatIsNew/ui/views/google_view.dart';
import 'package:WhatIsNew/ui/views/twitter_view.dart';
import 'package:WhatIsNew/ui/views/youtube_view.dart';

class TrendView extends StatefulWidget {
  const TrendView({Key key}) : super(key: key);

  @override
  _TrendViewState createState() => _TrendViewState();
}

class _TrendViewState extends State<TrendView>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  Text get _appBarTitle => const Text(
        c.trendViewTitle,
        style: c.appBarTitleTextStyle,
      );

  TabBar get _tabBar => TabBar(
        unselectedLabelColor: c.tabUnselectedColor,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorColor: c.tabIndicatorColor,
        controller: _tabController,
        tabs: [
          _getTab(c.googleTabTitle),
          _getTab(c.youtubeTabTitle),
          _getTab(c.twitterTabTitle),
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
          GoogleView(),
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
