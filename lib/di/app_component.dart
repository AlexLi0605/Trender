import 'package:trender/di/core_module.dart';
import 'package:trender/di/home_module.dart';
import 'package:trender/di/view_model_module.dart';
import 'package:trender/navigation_manager.dart';
import 'package:trender/ui/home/home_view_model.dart';

class AppComponent {
  CoreModule _coreModule;
  ViewModelModule _viewModelModule;
  HomeModule _homeModule;
  NavigationManager _navigationManager;

  NavigationManager get navigationManager =>
      _navigationManager ??= _coreModule.provideNavigationManager();

  AppComponent({
    CoreModule coreModule,
    ViewModelModule viewModelModule,
    HomeModule homeModule,
  }) {
    _coreModule = coreModule ?? const CoreModule();
    _homeModule = homeModule ?? const HomeModule();
    _viewModelModule = viewModelModule ??
        ViewModelModule(
          navigationManager,
          _homeModule,
        );
  }

  HomeViewModel createHomeViewModel() =>
      _viewModelModule.provideHomeViewModel();
}
