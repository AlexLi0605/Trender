import 'package:flutter/material.dart';

import 'package:WhatIsNew/assets/fake_data.dart';
import 'package:WhatIsNew/core/models/data/topic_item_model.dart';

class TopicViewModel extends ChangeNotifier {
  List<TopicItemModel> _topics;
  List<TopicItemModel> get topics => _topics;

  Future getTopics() async {
    // TODO(alex): Need to add error handler while the real api is called.
    _topics = await getTopicItemModels();
    notifyListeners();
  }
}
