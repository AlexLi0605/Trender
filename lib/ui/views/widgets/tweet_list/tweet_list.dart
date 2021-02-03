import 'package:flutter/material.dart';

import 'package:WhatIsNew/assets/constants.dart' as c;
import 'package:WhatIsNew/core/models/data/tweet_item_model.dart';
import 'package:WhatIsNew/ui/views/widgets/tweet_list/tweet_item.dart';

class TweetList extends StatelessWidget {
  final List<TweetItemModel> tweets;

  const TweetList({this.tweets});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: c.tweetViewBackgroundColor,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: tweets.length,
        itemBuilder: (BuildContext context, int index) {
          return TweetItem(model: tweets[index]);
        },
      ),
    );
  }
}
