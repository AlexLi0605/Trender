import 'package:trender/domain/home/get_menu_items_use_case.dart';

class HomeModule {
  const HomeModule();

  GetMenuItemsUseCase provideGetMenuItemsUseCase() => GetMenuItemsUseCase();
}
