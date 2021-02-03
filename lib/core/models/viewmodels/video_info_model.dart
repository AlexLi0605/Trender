import 'package:flutter/material.dart';

import 'package:WhatIsNew/assets/fake_data.dart';
import 'package:WhatIsNew/core/models/data/video_info_item_model.dart';

class VideoInfoViewModel extends ChangeNotifier {
  List<VideoInfoItemModel> _videoInfo;
  List<VideoInfoItemModel> get videoInfo => _videoInfo;

  Future getInfo() async {
    // TODO(alex): Need to add error handler while the real api is called.
    _videoInfo = await getVideoInfoItemModels();
    notifyListeners();
  }
}
