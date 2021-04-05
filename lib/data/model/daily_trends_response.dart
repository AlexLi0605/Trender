import 'package:json_annotation/json_annotation.dart';

part 'daily_trends_response.g.dart';

@JsonSerializable()
class DailyTrendsResponse {
  String rssFeedPageUrl;
  String endDateForNextRequest;
  @JsonKey(name: 'trendingSearchesDays')
  List<DailyTrend> dailyTrends;

  DailyTrendsResponse({
    this.rssFeedPageUrl,
    this.endDateForNextRequest,
    this.dailyTrends,
  });

  factory DailyTrendsResponse.fromJson(Map<String, dynamic> json) =>
      _$DailyTrendsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DailyTrendsResponseToJson(this);
}

@JsonSerializable()
class DailyTrend {
  String date;
  String formattedDate;
  @JsonKey(name: 'trendingSearches')
  List<Trend> trends;

  DailyTrend({
    this.date,
    this.formattedDate,
    this.trends,
  });

  factory DailyTrend.fromJson(Map<String, dynamic> json) =>
      _$DailyTrendFromJson(json);

  Map<String, dynamic> toJson() => _$DailyTrendToJson(this);
}

@JsonSerializable()
class Trend {
  String shareUrl;
  String formattedTraffic;
  Title title;
  List<Title> relatedQueries;
  @JsonKey(name: 'image')
  ImageResource imageResource;
  List<Article> articles;

  Trend({
    this.shareUrl,
    this.formattedTraffic,
    this.title,
    this.relatedQueries,
    this.imageResource,
    this.articles,
  });

  factory Trend.fromJson(Map<String, dynamic> json) => _$TrendFromJson(json);

  Map<String, dynamic> toJson() => _$TrendToJson(this);
}

@JsonSerializable()
class Title {
  String query;
  String exploreLink;

  Title({
    this.query,
    this.exploreLink,
  });

  factory Title.fromJson(Map<String, dynamic> json) => _$TitleFromJson(json);

  Map<String, dynamic> toJson() => _$TitleToJson(this);
}

@JsonSerializable()
class ImageResource {
  String newsUrl;
  String source;
  String imageUrl;

  ImageResource({
    this.newsUrl,
    this.source,
    this.imageUrl,
  });

  factory ImageResource.fromJson(Map<String, dynamic> json) =>
      _$ImageResourceFromJson(json);

  Map<String, dynamic> toJson() => _$ImageResourceToJson(this);
}

@JsonSerializable()
class Article {
  String title;
  String timeAgo;
  String source;
  @JsonKey(name: 'image')
  ImageResource imageResource;
  String url;
  String snippet;

  Article({
    this.title,
    this.timeAgo,
    this.source,
    this.imageResource,
    this.url,
    this.snippet,
  });

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleToJson(this);
}
