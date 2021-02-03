import 'package:flutter/material.dart';

import 'package:WhatIsNew/assets/constants.dart' as c;
import 'package:WhatIsNew/core/models/data/video_info_item_model.dart';

class VideoInfoItem extends StatelessWidget {
  final VideoInfoItemModel model;

  const VideoInfoItem({Key key, this.model}) : super(key: key);

  Container makeLeading(String thumbnail) => Container(
        padding: const EdgeInsets.only(right: 12.0),
        decoration: const BoxDecoration(
          border: Border(right: BorderSide(color: Colors.white24)),
        ),
        child: Image.network(thumbnail),
      );

  Text makeTitle(String title) => Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16.0,
        ),
      );

  Text makeViewCountAndDateText(int viewCount, String date) => Text(
        "$viewCount views・$date",
        style: const TextStyle(color: Colors.white, fontSize: 14.0),
      );

  Text makeChannelTitle(String channelTitle) => Text(
        channelTitle,
        style: const TextStyle(color: Colors.white, fontSize: 14.0),
      );

  Column makeSubtitle(String channelTitle, int viewCount, String date) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 6.0),
          makeChannelTitle(channelTitle),
          makeViewCountAndDateText(viewCount, date),
        ],
      );

  Icon makeTrailing() => const Icon(
        Icons.keyboard_arrow_right,
        color: Colors.white,
        size: 30.0,
      );

  ListTile makeListTile(VideoInfoItemModel model) => ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 6.0,
        ),
        leading: makeLeading(model.thumbnail),
        title: makeTitle(model.title),
        subtitle: makeSubtitle(
          model.channelTitle,
          model.viewCounts,
          model.publishedAt,
        ),
        trailing: makeTrailing(),
      );

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(),
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: c.youtubeViewCardBorderColor,
            ),
          ),
          color: c.youtubeViewBackgroundColor,
        ),
        child: makeListTile(model),
      ),
    );
  }
}
