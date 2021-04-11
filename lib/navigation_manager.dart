import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:trender/ui/google_trend/google_trend_screen.dart';
import 'package:trender/ui/home/home_screen.dart';

class NavigationManager extends ChangeNotifier {
  /// It's important to provide new list for Navigator each time
  /// because it compares previous list with the next one on
  /// each [NavigatorState didUpdateWidget]
  List<Page> get pages => List.unmodifiable(_pages);
  final List<Page> _pages = [createHomePage()];

  final _navigatorKey = GlobalKey<NavigatorState>();

  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;
  Completer<dynamic> _result;

  void didPop(RouteSettings routeSettings) {
    _pages.remove(routeSettings);
    notifyListeners();
  }

  void popPage({dynamic result}) {
    _pages.removeLast();
    _result?.complete(result);
    notifyListeners();
  }

  void replaceAllWith(Page page) {
    _pages.clear();
    _pages.add(page);
    notifyListeners();
  }

  void goToHomePage() {
    _pages.add(createHomePage());
    notifyListeners();
  }

  void gotoGooglePage() {
    _pages.add(createGoogleTrendPage());
    notifyListeners();
  }
}
