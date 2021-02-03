import 'package:flutter/material.dart';

import 'package:WhatIsNew/assets/fake_data.dart';
import 'package:WhatIsNew/core/models/data/keyword_item_model.dart';

class KeywordViewModel extends ChangeNotifier {
  List<KeywordItemModel> _keywords;
  List<KeywordItemModel> get keywords => _keywords;

  Future getKeywords() async {
    // TODO(alex): Need to add error handler while the real api is called.
    _keywords = await getKeywordItemModels();
    notifyListeners();
  }
}
