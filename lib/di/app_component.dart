import 'package:trender/di/api_module.dart';
import 'package:trender/di/core_module.dart';
import 'package:trender/di/google_trend_module.dart';
import 'package:trender/di/home_module.dart';
import 'package:trender/di/mist_module.dart';
import 'package:trender/di/view_model_module.dart';
import 'package:trender/env/env.dart';
import 'package:trender/navigation_manager.dart';
import 'package:trender/ui/google_trend/google_trend_view_model.dart';
import 'package:trender/ui/home/home_view_model.dart';

class AppComponent {
  CoreModule _coreModule;
  ViewModelModule _viewModelModule;
  HomeModule _homeModule;
  MistModule _mistModule;
  GoogleTrendModule _googleTrendModule;
  NavigationManager _navigationManager;
  ApiModule _apiModule;

  NavigationManager get navigationManager =>
      _navigationManager ??= _coreModule.provideNavigationManager();

  AppComponent({
    CoreModule coreModule,
    ViewModelModule viewModelModule,
    HomeModule homeModule,
    MistModule mistModule,
    GoogleTrendModule googleTrendModule,
    ApiModule apiModule,
  }) {
    _coreModule = coreModule ?? const CoreModule();
    _homeModule = homeModule ?? const HomeModule();
    _mistModule = mistModule ?? const MistModule();
    _apiModule = apiModule ?? const ApiModule(Env.googleTrendApiEndpoint);
    _googleTrendModule = googleTrendModule ?? GoogleTrendModule(_apiModule);
    _viewModelModule = viewModelModule ??
        ViewModelModule(
          navigationManager,
          _homeModule,
          _mistModule,
          _googleTrendModule,
        );
  }

  HomeViewModel createHomeViewModel() =>
      _viewModelModule.provideHomeViewModel();

  GoogleTrendViewModel createGoogleTrendViewModel() =>
      _viewModelModule.provideGoogleTrendViewModel();
}
