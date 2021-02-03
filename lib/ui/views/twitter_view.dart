import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';

import 'package:WhatIsNew/assets/constants.dart' as c;
import 'package:WhatIsNew/core/models/data/topic_item_model.dart';
import 'package:WhatIsNew/core/models/viewmodels/topic_view_model.dart';
import 'package:WhatIsNew/ui/views/widgets/topic_list/topic_list.dart';

class TwitterView extends StatefulWidget {
  @override
  _TwitterViewState createState() => _TwitterViewState();
}

class _TwitterViewState extends State<TwitterView> {
  @override
  Widget build(BuildContext context) {
    Container makeTopInfo() => Container(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const <Widget>[
              Text("Region: US", style: c.youtubeViewRegionTextStyle),
              Text("Date: 2021/2/1", style: c.youtubeViewRegionTextStyle),
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

    Container makeBody(List<TopicItemModel> topics) => Container(
          padding: const EdgeInsets.only(top: 14.0),
          color: c.twitterViewBackgroundColor,
          child: Column(
            children: <Widget>[
              const SizedBox(height: 4.0),
              makeTopInfo(),
              makeDivider(),
              Expanded(child: TopicList(topics: topics)),
            ],
          ),
        );

    return ViewModelBuilder<TopicViewModel>.reactive(
      viewModelBuilder: () => TopicViewModel(),
      onModelReady: (model) => model.getTopics(),
      builder: (content, model, child) => Scaffold(
        backgroundColor: c.twitterViewBackgroundColor,
        body: makeBody(model.topics ?? []),
      ),
    );
  }
}
