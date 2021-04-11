import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:badges/badges.dart';
import 'package:expandable/expandable.dart';
import 'package:provider/provider.dart';

import 'package:trender/assets/custom_colors.dart';
import 'package:trender/assets/page_constants.dart';
import 'package:trender/data/model/daily_trends_response.dart';
import 'package:trender/di/app_component.dart';
import 'package:trender/ext.dart';
import 'package:trender/ui/google_trend/google_trend_view_model.dart';

MaterialPage createGoogleTrendPage() => MaterialPage(
      child: ChangeNotifierProvider(
        create: (context) =>
            context.read<AppComponent>().createGoogleTrendViewModel(),
        child: Builder(
          builder: (context) => GoogleTrendScreen(
            context,
            context.l10n.googleTitle,
          ),
        ),
      ),
      key: const ValueKey(googlePageKey),
      name: googlePageName,
    );

class GoogleTrendScreen extends StatelessWidget {
  final ScrollController _controller = ScrollController();
  final String _title;

  GoogleTrendScreen(BuildContext context, this._title, [Key key])
      : super(key: key) {
    // TODO(alex): Should not pass context like this way, fix it in the future
    _controller.addListener(() {
      if (_controller.position.pixels == _controller.position.maxScrollExtent) {
        context.read<GoogleTrendViewModel>().fetchDailyTrends();
      }
    });
  }

  Widget _createSearchBar(BuildContext context) => Container(
        padding: const EdgeInsets.fromLTRB(12, 8, 0, 8),
        decoration: BoxDecoration(
          border: Border.all(color: CustomColors.veryLightPink),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            const Icon(Icons.search, color: Colors.black26),
            const SizedBox(width: 12),
            Text(
              context.l10n.searchForKeyword,
              style: const TextStyle(color: Colors.black26),
            ),
          ],
        ),
      );

  Widget _createRegionChip(BuildContext context) => Row(
        children: [
          Badge(
            padding: const EdgeInsets.fromLTRB(10, 6, 10, 6),
            toAnimate: false,
            shape: BadgeShape.square,
            badgeColor: CustomColors.veryLightPink,
            borderRadius: BorderRadius.circular(20),
            elevation: 0,
            badgeContent: Row(
              children: [
                const Icon(CupertinoIcons.location, size: 16),
                const SizedBox(width: 6),
                Text(context.l10n.region),
              ],
            ),
          ),
        ],
      );

  Widget _createTitle(BuildContext context) => Text(
        context.l10n.dailyTrends,
        style: const TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600),
      );

  Widget _createDailyTrends(BuildContext context, DailyTrend dailyTrend) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 10),
        Text(
          dailyTrend.formattedDate,
          style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return TrendCard(dailyTrend.trends[index]);
          },
          itemCount: dailyTrend.trends.length,
        )
      ],
    );
  }

  Widget _createDailyTrendsList(
    BuildContext context,
    ScrollController controller,
  ) {
    final dailyTrends = context.watch<GoogleTrendViewModel>().dailyTrends;
    return Expanded(
      child: SingleChildScrollView(
        controller: controller,
        child: SafeArea(
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              if (index == dailyTrends.length) {
                return _createLoadingIndicator(context);
              }
              return _createDailyTrends(context, dailyTrends[index]);
            },
            itemCount: dailyTrends.length + 1,
          ),
        ),
      ),
    );
  }

  Widget _createLoadingIndicator(BuildContext context) {
    final isLoading = context.read<GoogleTrendViewModel>().isLoading();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Opacity(
          opacity: isLoading ? 1.0 : 00,
          child: const CircularProgressIndicator(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_title)),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 20),
            _createSearchBar(context),
            const SizedBox(height: 20),
            _createTitle(context),
            const SizedBox(height: 8),
            _createRegionChip(context),
            const Divider(color: Colors.black26),
            _createDailyTrendsList(context, _controller),
          ],
        ),
      ),
    );
  }
}

class TrendCard extends StatelessWidget {
  final Trend trend;
  const TrendCard(this.trend);

  Widget _createRoundingImage(double width, double height, String url) =>
      Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: CustomColors.roundingImageBorder,
          borderRadius: BorderRadius.circular(8.0),
          image: DecorationImage(
            image: NetworkImage(url),
          ),
        ),
      );

  Widget _createHeaderView(BuildContext context) {
    final article = trend.articles.first;
    return Row(
      children: [
        _createRoundingImage(90, 90, trend.imageResource.imageUrl),
        const SizedBox(width: 15.0),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                trend.title.query,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16.0,
                ),
              ),
              const SizedBox(height: 5.0),
              Text(
                article.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: CustomColors.greyText),
              ),
              const SizedBox(height: 5.0),
              Text('${article.source}・${article.timeAgo}'),
              Text(
                '${trend.formattedTraffic} ${context.l10n.searches}',
                style: const TextStyle(color: CustomColors.redText),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _createArticleCard(BuildContext context, Article article) {
    final List<Widget> leadingImage = [];
    if (article.imageResource != null) {
      final url = article.imageResource.imageUrl;
      leadingImage.add(_createRoundingImage(70, 70, url));
      leadingImage.add(const SizedBox(width: 15));
    }
    return Container(
      margin: const EdgeInsets.only(right: 10, top: 10),
      padding: const EdgeInsets.all(10.0),
      width: 300,
      decoration: BoxDecoration(
        border: Border.all(color: CustomColors.cardDecorationBorder),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        children: [
          ...leadingImage,
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  article.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 5.0),
                Text(
                  '${article.source}・${article.timeAgo}',
                  style: const TextStyle(
                    fontSize: 12.0,
                    color: CustomColors.greyText,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _createExpandedView(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return _createArticleCard(context, trend.articles[index]);
        },
        itemCount: trend.articles.length,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          border: Border.all(color: CustomColors.cardDecorationBorder),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: ScrollOnExpand(
          scrollOnCollapse: false,
          child: ExpandablePanel(
            header: _createHeaderView(context),
            expanded: _createExpandedView(context),
            builder: (_, collapsed, expanded) {
              return Expandable(collapsed: collapsed, expanded: expanded);
            },
          ),
        ),
      ),
    );
  }
}
