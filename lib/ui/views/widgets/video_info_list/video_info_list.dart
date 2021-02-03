import 'package:flutter/material.dart';

import 'package:WhatIsNew/assets/constants.dart' as c;
import 'package:WhatIsNew/core/models/data/video_info_item_model.dart';
import 'package:WhatIsNew/ui/views/widgets/video_info_list/video_info_item.dart';

class VideoInfoList extends StatelessWidget {
  final List<VideoInfoItemModel> info;

  const VideoInfoList({this.info});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: c.youtubeViewBackgroundColor,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: info.length,
        itemBuilder: (BuildContext context, int index) {
          return VideoInfoItem(model: info[index]);
        },
      ),
    );
  }
}
