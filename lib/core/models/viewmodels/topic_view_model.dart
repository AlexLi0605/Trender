import 'package:flutter/material.dart';

import 'package:dart_twitter_api/twitter_api.dart';

import 'package:WhatIsNew/core/models/data/topic_item_model.dart';
import 'package:WhatIsNew/locator.dart';

class TopicViewModel extends ChangeNotifier {
  final TwitterApi twitterApi = locator<TwitterApi>();

  List<TopicItemModel> _topics;
  List<TopicItemModel> get topics => _topics;

  Future getTopics() async {
    // TODO(alex)
    // 1. Need to add error handler while the real api is called.
    // 2. Add selectable id on UI and replace hard-code id here.
    final response = await twitterApi.trendsService.place(id: 1);
    _topics = response[0].trends.asMap().entries.map((entry) {
      return TopicItemModel(index: entry.key + 1, name: entry.value.name);
    }).toList();
    notifyListeners();
  }
}
