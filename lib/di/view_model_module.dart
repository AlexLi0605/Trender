import 'package:trender/di/home_module.dart';
import 'package:trender/navigation_manager.dart';
import 'package:trender/ui/home/home_view_model.dart';

class ViewModelModule {
  final NavigationManager _navigationManager;
  final HomeModule _homeModule;

  const ViewModelModule(
    this._navigationManager,
    this._homeModule,
  );

  HomeViewModel provideHomeViewModel() => HomeViewModel(
        _navigationManager,
        _homeModule.provideGetMenuItemsUseCase(),
      );
}
