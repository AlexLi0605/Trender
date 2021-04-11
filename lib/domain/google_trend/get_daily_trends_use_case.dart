import 'package:trender/data/model/daily_trends_response.dart';
import 'package:trender/data/repository/google_trend_repo.dart';

class GetDailyTrendsUseCase {
  final GoogleTrendRepo _googleTrendRepo;

  GetDailyTrendsUseCase(
    this._googleTrendRepo,
  );

  Future<DailyTrendsResponse> call(
    String hostLanguage,
    int timezone,
    String geometry,
    String endDate,
    int ns,
  ) {
    return _googleTrendRepo.getDailyTrends(
      hostLanguage,
      timezone,
      geometry,
      endDate,
      ns,
    );
  }
}
