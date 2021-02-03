import 'package:flutter/material.dart';

import 'package:WhatIsNew/assets/constants.dart' as c;
import 'package:WhatIsNew/core/models/data/topic_item_model.dart';
import 'package:WhatIsNew/ui/views/widgets/topic_list/topic_item.dart';

class TopicList extends StatelessWidget {
  final List<TopicItemModel> topics;

  const TopicList({this.topics});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: c.twitterViewBackgroundColor,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: topics.length,
        itemBuilder: (BuildContext context, int index) {
          return TopicItem(model: topics[index]);
        },
      ),
    );
  }
}
