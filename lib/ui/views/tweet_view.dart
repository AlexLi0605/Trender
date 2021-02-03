import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';

import 'package:WhatIsNew/assets/constants.dart' as c;
import 'package:WhatIsNew/core/models/viewmodels/tweet_view_model.dart';
import 'package:WhatIsNew/ui/views/widgets/tweet_list/tweet_list.dart';

class TweetView extends StatefulWidget {
  const TweetView({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _TweetViewState createState() => _TweetViewState();
}

class _TweetViewState extends State<TweetView> {
  Text get _appBarTitle => Text(
        widget.title,
        style: c.appBarTitleTextStyleWithoutItalic,
      );

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TweetViewModel>.reactive(
      viewModelBuilder: () => TweetViewModel(),
      onModelReady: (model) => model.getTweets(),
      builder: (content, model, child) => Scaffold(
        backgroundColor: c.tweetViewBackgroundColor,
        appBar: AppBar(title: _appBarTitle),
        body: TweetList(tweets: model.tweets ?? []),
      ),
    );
  }
}
