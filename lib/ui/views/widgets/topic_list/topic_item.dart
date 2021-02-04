import 'package:flutter/material.dart';

import 'package:WhatIsNew/assets/constants.dart' as c;
import 'package:WhatIsNew/core/models/data/topic_item_model.dart';
import 'package:WhatIsNew/ui/views/tweet_view.dart';

class TopicItem extends StatelessWidget {
  final TopicItemModel model;

  const TopicItem({Key key, this.model}) : super(key: key);

  Container makeLeading(int index) => Container(
        padding: const EdgeInsets.only(right: 12.0),
        decoration: const BoxDecoration(
          border: Border(right: BorderSide(color: Colors.white24)),
        ),
        child: Text(
          index.toString(),
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      );

  Text makeTitleText(String name) => Text(
        name,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18.0,
        ),
      );

  Icon makeTrailing() => const Icon(
        Icons.keyboard_arrow_right,
        color: Colors.white,
        size: 30.0,
      );

  ListTile makeListTile(BuildContext context, TopicItemModel model) => ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 6.0,
        ),
        leading: makeLeading(model.index),
        title: makeTitleText(model.name),
        trailing: makeTrailing(),
        // onTap: onTapEvent(context, model.name),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TweetView(title: model.name),
            ),
          );
        },
      );

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(),
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: c.twitterViewCardBorderColor,
            ),
          ),
          color: c.twitterViewBackgroundColor,
        ),
        child: makeListTile(context, model),
      ),
    );
  }
}
