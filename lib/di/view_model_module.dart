import 'package:trender/di/google_trend_module.dart';
import 'package:trender/di/home_module.dart';
import 'package:trender/navigation_manager.dart';
import 'package:trender/ui/google_trend/google_trend_view_model.dart';
import 'package:trender/ui/home/home_view_model.dart';

class ViewModelModule {
  final NavigationManager _navigationManager;
  final HomeModule _homeModule;
  final GoogleTrendModule _googleTrendModule;

  const ViewModelModule(
    this._navigationManager,
    this._homeModule,
    this._googleTrendModule,
  );

  HomeViewModel provideHomeViewModel() => HomeViewModel(
        _navigationManager,
        _homeModule.provideGetMenuItemsUseCase(),
      );

  GoogleTrendViewModel provideGoogleTrendViewModel() => GoogleTrendViewModel(
        _navigationManager,
        _googleTrendModule.provideGetDailyTrendsUseCase(),
      );
}
