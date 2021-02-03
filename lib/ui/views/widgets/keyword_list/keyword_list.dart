import 'package:flutter/material.dart';

import 'package:WhatIsNew/assets/constants.dart' as c;
import 'package:WhatIsNew/core/models/data/keyword_item_model.dart';
import 'package:WhatIsNew/ui/views/widgets/keyword_list/keyword_item.dart';

class KeywordList extends StatelessWidget {
  final List<KeywordItemModel> keywords;

  const KeywordList({this.keywords});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: c.googleViewBackgroundColor,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: keywords.length,
        itemBuilder: (BuildContext context, int index) {
          return KeywordItem(model: keywords[index]);
        },
      ),
    );
  }
}
