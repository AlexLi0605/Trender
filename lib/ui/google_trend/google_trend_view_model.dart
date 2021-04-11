import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:html_unescape/html_unescape.dart';
import 'package:intl/intl.dart';

import 'package:trender/assets/app_constants.dart';
import 'package:trender/data/model/daily_trends_response.dart';
import 'package:trender/domain/google_trend/get_daily_trends_use_case.dart';
import 'package:trender/navigation_manager.dart';

class GoogleTrendViewModel with ChangeNotifier {
  // ignore: unused_field
  final NavigationManager _navigationManager;
  final GetDailyTrendsUseCase _getDailyTrendsUseCase;

  GoogleTrendState state = GoogleTrendState.loading;
  List<DailyTrend> dailyTrends = <DailyTrend>[];
  String endDateForNextRequest;

  GoogleTrendViewModel(
    this._navigationManager,
    this._getDailyTrendsUseCase,
  ) {
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat(yearMonthDay);
    endDateForNextRequest = formatter.format(now);
    fetchDailyTrends();
  }

  List<DailyTrend> _formatContent(List<DailyTrend> dailyTrends) {
    final unescape = HtmlUnescape();
    return dailyTrends.map((dailyTrend) {
      dailyTrend.trends = dailyTrend.trends.map((trend) {
        trend.articles = trend.articles.map((article) {
          article.title = unescape.convert(article.title);
          return article;
        }).toList();
        return trend;
      }).toList();
      return dailyTrend;
    }).toList();
  }

  void fetchDailyTrends() {
    state = GoogleTrendState.loading;
    notifyListeners();

    if (endDateForNextRequest == null) {
      final DateTime now = DateTime.now();
      final DateFormat formatter = DateFormat(yearMonthDay);
      endDateForNextRequest = formatter.format(now);
    }

    _getDailyTrendsUseCase('en', -480, 'US', endDateForNextRequest, 15)
        .then((response) {
      final processedResponse = _formatContent(response.dailyTrends);
      dailyTrends.addAll(processedResponse);
      endDateForNextRequest = response.endDateForNextRequest;
      state = GoogleTrendState.loaded;
      notifyListeners();
    }).catchError((error) {
      state = GoogleTrendState.error;
      notifyListeners();
    });
  }

  bool isLoading() {
    return state == GoogleTrendState.loading;
  }
}

enum GoogleTrendState {
  loading,
  loaded,
  error,
}
