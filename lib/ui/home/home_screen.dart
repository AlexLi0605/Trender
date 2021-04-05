import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'package:trender/assets/page_constants.dart';
import 'package:trender/data/model/menu.dart';
import 'package:trender/di/app_component.dart';
import 'package:trender/ext.dart';
import 'package:trender/ui/home/home_view_model.dart';

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

  Widget homeScaffold(BuildContext context) => Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.transparent,
        ),
        child: Scaffold(
          key: _scaffoldKey,
          body: bodySliverList(context),
        ),
      );

  Widget menuStack(BuildContext context, Menu menu) => InkWell(
        onTap: () => context.read<HomeViewModel>().onCardClicked(menu),
        splashColor: Colors.orange,
        child: Card(
          clipBehavior: Clip.antiAlias,
          elevation: 2.0,
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              menuImage(menu),
              menuColor(),
              menuData(menu),
            ],
          ),
        ),
      );

  Widget menuImage(Menu menu) => Image.asset(
        menu.image,
        fit: BoxFit.cover,
      );

  Widget menuColor() => Container(
        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black.withOpacity(0.8),
              blurRadius: 10.0,
            ),
          ],
        ),
      );

  Widget menuData(Menu menu) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset(menu.iconPath, width: 24, height: 24),
          const SizedBox(height: 10.0),
          Text(
            menu.title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      );

  Widget bodySliverList(BuildContext context) {
    final menus = context.read<HomeViewModel>().getMenuItems();
    final menuController = StreamController<List<Menu>>();
    menuController.add(menus);
    return StreamBuilder<List<Menu>>(
      stream: menuController.stream,
      builder: (context, snapshot) {
        return snapshot.hasData
            ? CustomScrollView(
                slivers: <Widget>[
                  appBar(),
                  bodyGrid(context, snapshot.data),
                ],
              )
            : const Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget bodyGrid(BuildContext context, List<Menu> menu) => SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return menuStack(context, menu[index]);
          },
          childCount: menu.length,
        ),
      );

  Widget appBar() => SliverAppBar(
        backgroundColor: Colors.black,
        pinned: true,
        elevation: 10.0,
        forceElevated: true,
        expandedHeight: 150.0,
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: false,
          background: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blueGrey.shade800, Colors.black87],
              ),
            ),
          ),
          title: Row(
            children: <Widget>[
              const FlutterLogo(textColor: Colors.yellow),
              const SizedBox(width: 10.0),
              Text(context.l10n.homePageTitle)
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return homeScaffold(context);
  }
}
