import 'package:WhatIsNew/assets/fake_data.dart';
import 'package:WhatIsNew/core/models/tweet_entry.dart';
import 'package:flutter/material.dart';

class TweetViewModel extends ChangeNotifier {
  List<TweetEntry> _tweets;
  List<TweetEntry> get tweets => _tweets;

  Future getTweets() async {
    // TODO(alex): Need to add error handler while the real api is called.
    _tweets = await getTweetEntries();
    notifyListeners();
  }
}
