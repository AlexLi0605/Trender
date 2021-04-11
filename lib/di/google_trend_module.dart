import 'package:trender/data/repository/google_trend_repo.dart';
import 'package:trender/di/api_module.dart';
import 'package:trender/domain/google_trend/get_daily_trends_use_case.dart';

class GoogleTrendModule {
  final ApiModule _apiModule;

  const GoogleTrendModule(this._apiModule);

  GoogleTrendRepo provideGoogleTrendRepo() =>
      GoogleTrendRepo(_apiModule.provideGoogleTrendApiService());

  GetDailyTrendsUseCase provideGetDailyTrendsUseCase() =>
      GetDailyTrendsUseCase(provideGoogleTrendRepo());
}
