import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:trender/assets/page_constants.dart';
import 'package:trender/data/model/menu.dart';
import 'package:trender/domain/home/get_menu_items_use_case.dart';
import 'package:trender/navigation_manager.dart';

class HomeViewModel with ChangeNotifier {
  // ignore: unused_field
  final NavigationManager _navigationManager;
  final GetMenuItemsUseCase _getMenuItemsUseCase;

  HomeViewModel(
    this._navigationManager,
    this._getMenuItemsUseCase,
  );

  List<Menu> getMenuItems() => _getMenuItemsUseCase();

  void onCardClicked(Menu menu) {
    switch (menu.title) {
      case google:
        _navigationManager.gotoGooglePage();
        debugPrint('Go to google page');
        break;
      case youtube:
        debugPrint('Go to youtube page');
        break;
      case twitter:
        debugPrint('Go to twitter page');
        break;
      case instagram:
        debugPrint('Go to instagram page');
        break;
    }
  }
}
