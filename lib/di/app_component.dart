import 'package:trender/di/core_module.dart';
import 'package:trender/di/view_model_module.dart';
import 'package:trender/navigation_manager.dart';
import 'package:trender/ui/home/home_view_model.dart';

class AppComponent {
  CoreModule _coreModule;
  ViewModelModule _viewModelModule;

  NavigationManager _navigationManager;

  NavigationManager get navigationManager =>
      _navigationManager ??= _coreModule.provideNavigationManager();

  AppComponent({
    CoreModule coreModule,
    ViewModelModule viewModelModule,
  }) {
    _coreModule = coreModule ?? const CoreModule();

    _viewModelModule = viewModelModule ??
        ViewModelModule(
          navigationManager,
        );
  }

  HomeViewModel createHomeViewModel() =>
      _viewModelModule.provideHomeViewModel();
}
