import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:trender/assets/api_constants.dart';
import 'package:trender/data/model/daily_trends_response.dart';

part 'google_trend_api.g.dart';

@RestApi()
abstract class GoogleTrendApi {
  factory GoogleTrendApi(Dio dio, {String baseUrl}) = _GoogleTrendApi;

  @GET(dailyTrendsEndpoint)
  @DioResponseType(ResponseType.bytes)
  Future<DailyTrendsResponse> fetchDailyTrends(
    @Query('hl') String hostLanguage,
    @Query('tz') int timezone,
    @Query('geo') String geometry,
    @Query('ed') String endeDate,
    @Query('ns') int ns,
  );
}
