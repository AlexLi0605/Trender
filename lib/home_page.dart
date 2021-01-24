import 'package:WakeMeUp/pages/alarm_page.dart';
import 'package:WakeMeUp/pages/clock_page.dart';
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
    Tab(text: "ALARM"),
    Tab(text: "CLOCK"),
  ];
  bool showFab = true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
    _tabController.addListener(() {
      showFab = _tabController.index == 0;
      setState(() {});
    });
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
          AlarmPage(),
          ClockPage(),
        ],
      ),
      floatingActionButton: showFab
          ? FloatingActionButton(
              onPressed: () => debugPrint("Add items"),
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
