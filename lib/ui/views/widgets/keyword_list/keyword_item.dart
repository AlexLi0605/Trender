import 'package:flutter/material.dart';

import 'package:WhatIsNew/assets/constants.dart' as c;
import 'package:WhatIsNew/core/models/data/keyword_item_model.dart';

class KeywordItem extends StatelessWidget {
  final KeywordItemModel model;

  const KeywordItem({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Container makeLeading(int rank) => Container(
          padding: const EdgeInsets.only(right: 12.0),
          decoration: const BoxDecoration(
            border: Border(right: BorderSide(color: Colors.white24)),
          ),
          child: Text(
            rank.toString(),
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        );

    Text makeTitle(String title) => Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        );
    Row makeSubtitle(double popularFactor) => Row(
          children: <Widget>[
            Expanded(
              child: LinearProgressIndicator(
                backgroundColor: const Color.fromRGBO(209, 224, 224, 0.2),
                value: popularFactor,
                valueColor: const AlwaysStoppedAnimation(Colors.green),
              ),
            ),
          ],
        );

    Icon makeTrailing() => const Icon(
          Icons.keyboard_arrow_right,
          color: Colors.white,
          size: 30.0,
        );

    ListTile makeListTile(KeywordItemModel model) => ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 6.0,
          ),
          leading: makeLeading(model.rank),
          title: makeTitle(model.title),
          subtitle: makeSubtitle(model.popularFactor),
          trailing: makeTrailing(),
        );

    return Card(
      margin: const EdgeInsets.symmetric(),
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: c.googleViewCardBorderColor,
            ),
          ),
          color: c.googleViewBackgroundColor,
        ),
        child: makeListTile(model),
      ),
    );
  }
}
