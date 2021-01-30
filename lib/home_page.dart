import 'package:flutter/material.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';

import 'package:WhatIsNew/ui/views/setting_view.dart';
import 'package:WhatIsNew/ui/views/trend_views.dart';
import 'package:WhatIsNew/assets/constants.dart' as c;

class HomePage extends StatefulWidget {
  const HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;

  FFNavigationBar get _navigationBar => FFNavigationBar(
        theme: FFNavigationBarTheme(
          barBackgroundColor: c.primaryColor,
          selectedItemBorderColor: c.primaryColor,
          selectedItemBackgroundColor: c.primaryColor,
          selectedItemLabelColor: c.bottomNavigationSelectedItemLabelColor,
          barHeight: c.bottomNavigationBarHeight,
          selectedItemTextStyle: c.bottomNavigationTextStyle,
          unselectedItemTextStyle: c.bottomNavigationTextStyle,
        ),
        selectedIndex: _selectedIndex,
        onSelectTab: (index) {
          setState(() {
            _selectedIndex = index as int;
          });
        },
        items: [
          FFNavigationBarItem(
            iconData: Icons.home,
            label: c.bottomNavigationHomeTitle,
          ),
          FFNavigationBarItem(
            iconData: Icons.settings,
            label: c.bottomNavigationSettingTitle,
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: IndexedStack(
          index: _selectedIndex,
          children: const <Widget>[
            TrendView(),
            SettingView(),
          ],
        ),
      ),
      bottomNavigationBar: _navigationBar,
    );
  }
}
