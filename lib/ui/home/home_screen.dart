import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:provider/provider.dart';

import 'package:trender/assets/page_constants.dart';
import 'package:trender/di/app_component.dart';
import 'package:trender/ext.dart';

MaterialPage createHomePage() => MaterialPage(
      child: ChangeNotifierProvider(
        create: (context) => context.read<AppComponent>().createHomeViewModel(),
        child: Builder(
          builder: (context) => const HomeScreen(),
        ),
      ),
      key: const ValueKey(homePageKey),
      name: homePageName,
    );

class HomeScreen extends StatefulWidget {
  const HomeScreen([Key key]) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(context.l10n.homePageTitle),
      ),
      body: const Center(
        child: Text('This is the home page'),
      ),
    );
  }
}
