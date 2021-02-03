import 'package:flutter/material.dart';

import 'package:WhatIsNew/assets/fake_data.dart';
import 'package:WhatIsNew/core/models/data/tweet_item_model.dart';

class TweetViewModel extends ChangeNotifier {
  List<TweetItemModel> _tweets;
  List<TweetItemModel> get tweets => _tweets;

  Future getTweets() async {
    // TODO(alex): Need to add error handler while the real api is called.
    _tweets = await getTweetItemModels();
    notifyListeners();
  }
}
