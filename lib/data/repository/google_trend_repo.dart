import 'dart:async';

import 'package:trender/data/api_service/google_trend_api_service.dart';
import 'package:trender/data/model/daily_trends_response.dart';

class GoogleTrendRepo {
  final GoogleTrendApiService _googleTrendApiService;

  GoogleTrendRepo(this._googleTrendApiService);

  Future<DailyTrendsResponse> getDailyTrends(
    String hostLanguage,
    int timezone,
    String geometry,
    String endDate,
    int ns,
  ) {
    return _googleTrendApiService.fetchDailyTrends(
      hostLanguage,
      timezone,
      geometry,
      endDate,
      ns,
    );
  }
}
