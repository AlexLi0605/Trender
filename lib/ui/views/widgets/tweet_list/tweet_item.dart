import 'package:flutter/material.dart';

import 'package:WhatIsNew/assets/constants.dart' as c;
import 'package:WhatIsNew/core/models/data/tweet_item_model.dart';

class TweetItem extends StatelessWidget {
  final TweetItemModel model;

  const TweetItem({Key key, this.model}) : super(key: key);

  Container makeProfilePhoto(String url) => Container(
        width: 48.0,
        height: 48.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(fit: BoxFit.fill, image: NetworkImage(url)),
        ),
      );

  Text makeNameText(String name) => Text(
        name,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
        ),
      );

  Text makeScreenNameText(String screenName) => Text(
        "@$screenName ",
        style: const TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.bold,
          fontSize: 14.0,
        ),
      );

  Text makeContentText(String content) => Text(
        content,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ),
      );
  Text makeRetweetCountAndDateText(int retweetCount, String date) => Text(
        "$retweetCount retweets・$date",
        style: const TextStyle(color: Colors.white, fontSize: 14.0),
      );

  Icon makeTrailing() => const Icon(
        Icons.keyboard_arrow_right,
        color: Colors.white,
        size: 30.0,
      );

  ListTile makeListTile(TweetItemModel model) => ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20.0, vertical: 6.0),
        title: Row(
          children: <Widget>[
            makeProfilePhoto(model.profilePhoto),
            const SizedBox(width: 12.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                makeNameText(model.name),
                makeScreenNameText(model.screenName),
              ],
            ),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 10.0),
            makeContentText(model.content),
            const SizedBox(height: 10.0),
            makeRetweetCountAndDateText(model.retweetCount, model.publishedAt),
          ],
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
              color: c.twitterViewCardBorderColor,
            ),
          ),
          color: c.tweetViewBackgroundColor,
        ),
        child: makeListTile(model),
      ),
    );
  }
}
