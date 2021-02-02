import 'package:flutter/material.dart';

import 'package:ff_navigation_bar/ff_navigation_bar.dart';

import 'package:WhatIsNew/assets/constants.dart' as c;
import 'package:WhatIsNew/ui/views/setting_view.dart';
import 'package:WhatIsNew/ui/views/trend_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
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
