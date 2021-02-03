import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';

import 'package:WhatIsNew/assets/constants.dart' as c;
import 'package:WhatIsNew/core/models/data/video_info_item_model.dart';
import 'package:WhatIsNew/core/models/viewmodels/video_info_model.dart';
import 'package:WhatIsNew/ui/views/widgets/video_info_list/video_info_list.dart';

class YoutubeView extends StatefulWidget {
  @override
  _YoutubeViewState createState() => _YoutubeViewState();
}

class _YoutubeViewState extends State<YoutubeView> {
  @override
  Widget build(BuildContext context) {
    Container makeTopInfo() => Container(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const <Widget>[
              Text("Region: US", style: c.twitterViewRegionTextStyle),
              Text("Category: Life", style: c.twitterViewRegionTextStyle),
              Text("Date: 2021/2/1", style: c.twitterViewRegionTextStyle),
            ],
          ),
        );
    Container makeDivider() => Container(
          padding: const EdgeInsets.only(top: 6.0, bottom: 6.0),
          decoration: const BoxDecoration(
            border: Border(
                bottom: BorderSide(
              color: Colors.white24,
              width: 2.0,
            )),
          ),
        );

    Container makeBody(List<VideoInfoItemModel> info) => Container(
          color: c.youtubeViewBackgroundColor,
          padding: const EdgeInsets.only(top: 14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              const SizedBox(height: 4.0),
              makeTopInfo(),
              makeDivider(),
              Expanded(child: VideoInfoList(info: info)),
            ],
          ),
        );

    return ViewModelBuilder<VideoInfoViewModel>.reactive(
      viewModelBuilder: () => VideoInfoViewModel(),
      onModelReady: (model) => model.getInfo(),
      builder: (content, model, child) => Scaffold(
        backgroundColor: c.youtubeViewBackgroundColor,
        body: makeBody(model.videoInfo ?? []),
      ),
    );
  }
}
