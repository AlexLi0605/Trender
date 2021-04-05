import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';

import 'package:trender/assets/api_constants.dart';
import 'package:trender/data/api_service/api/google_trend_api.dart';
import 'package:trender/data/api_service/google_trend_api_service.dart';

class ApiModule {
  final String _googleTrendbaseUrl;

  const ApiModule(this._googleTrendbaseUrl);

  Dio provideDio() {
    final dio = Dio();
    dio.interceptors.add(
      InterceptorsWrapper(
        onResponse: (Response response) async {
          if (response.request.path == dailyTrendsEndpoint &&
              response.data is Uint8List) {
            final data = response.data as Uint8List;
            final jsonString = String.fromCharCodes(data.sublist(6));
            response.data = jsonDecode(jsonString)[defaultKey];
          }
          return response;
        },
      ),
    );
    return dio;
  }

  GoogleTrendApi provideGoogleTrendApi() =>
      GoogleTrendApi(provideDio(), baseUrl: _googleTrendbaseUrl);

  GoogleTrendApiService provideGoogleTrendApiService() =>
      GoogleTrendApiService(provideGoogleTrendApi());
}
