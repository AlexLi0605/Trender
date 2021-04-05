import 'package:trender/data/api_service/api/google_trend_api.dart';
import 'package:trender/data/model/daily_trends_response.dart';

class GoogleTrendApiService {
  final GoogleTrendApi _googleTrendApi;

  GoogleTrendApiService(this._googleTrendApi);

  Future<DailyTrendsResponse> fetchDailyTrends(
    String hostLanguage,
    int timezone,
    String geometry,
    String endDate,
    int ns,
  ) {
    return _googleTrendApi.fetchDailyTrends(
      hostLanguage,
      timezone,
      geometry,
      endDate,
      ns,
    );
  }
}
