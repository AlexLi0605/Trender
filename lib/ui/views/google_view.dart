import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';

import 'package:WhatIsNew/assets/constants.dart' as c;
import 'package:WhatIsNew/core/models/data/keyword_item_model.dart';
import 'package:WhatIsNew/core/models/viewmodels/keyword_model.dart';
import 'package:WhatIsNew/ui/views/widgets/keyword_list/keyword_list.dart';

class GoogleView extends StatefulWidget {
  @override
  _GoogleViewState createState() => _GoogleViewState();
}

class _GoogleViewState extends State<GoogleView> {
  @override
  Widget build(BuildContext context) {
    Container makeTopInfo() => Container(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const <Widget>[
              Text("Region: US", style: c.googleViewRegionTextStyle),
              Text("Date: 2021/2/1", style: c.googleViewRegionTextStyle),
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

    Container makeBody(List<KeywordItemModel> keywords) => Container(
          padding: const EdgeInsets.only(top: 14.0),
          color: c.googleViewBackgroundColor,
          child: Column(
            children: <Widget>[
              const SizedBox(height: 4.0),
              makeTopInfo(),
              makeDivider(),
              Expanded(child: KeywordList(keywords: keywords)),
            ],
          ),
        );

    return ViewModelBuilder<KeywordViewModel>.reactive(
      viewModelBuilder: () => KeywordViewModel(),
      onModelReady: (model) => model.getKeywords(),
      builder: (content, model, child) => Scaffold(
        backgroundColor: c.googleViewBackgroundColor,
        body: makeBody(model.keywords ?? []),
      ),
    );
  }
}
