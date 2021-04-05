import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:html_unescape/html_unescape.dart';

import 'package:trender/data/model/daily_trends_response.dart';
import 'package:trender/domain/google_trend/get_daily_trends_use_case.dart';
import 'package:trender/navigation_manager.dart';

class GoogleTrendViewModel with ChangeNotifier {
  // ignore: unused_field
  final NavigationManager _navigationManager;
  final GetDailyTrendsUseCase _getDailyTrendsUseCase;

  GoogleTrendState state = GoogleTrendState.loading;
  List<DailyTrend> dailyTrends = <DailyTrend>[];

  GoogleTrendViewModel(
    this._navigationManager,
    this._getDailyTrendsUseCase,
  ) {
    fetchDailyTrends();
  }

  void fetchDailyTrends() {
    state = GoogleTrendState.loading;
    notifyListeners();

    _getDailyTrendsUseCase('en', -480, 'US', '20210406', 15).then((response) {
      final processedResponse = formatContent(response.dailyTrends);
      dailyTrends.addAll(processedResponse);
      state = GoogleTrendState.loaded;
      notifyListeners();
    }).catchError((error) {
      state = GoogleTrendState.error;
    });
  }

  List<DailyTrend> formatContent(List<DailyTrend> dailyTrends) {
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

  bool isLoading() {
    return state == GoogleTrendState.loading;
  }
}

enum GoogleTrendState {
  loading,
  loaded,
  error,
}
