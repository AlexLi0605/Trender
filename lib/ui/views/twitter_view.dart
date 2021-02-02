import 'package:flutter/material.dart';

import 'package:WhatIsNew/assets/constants.dart' as c;
import 'package:WhatIsNew/assets/fake_data.dart';
import 'package:WhatIsNew/core/models/topic_entry.dart';
import 'package:WhatIsNew/ui/views/tweet_view.dart';

class TwitterView extends StatefulWidget {
  @override
  _TwitterViewState createState() => _TwitterViewState();
}

class _TwitterViewState extends State<TwitterView> {
  List<TopicEntry> entries;

  @override
  void initState() {
    entries = getTopicEntries();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ListTile makeListTile(TopicEntry entry) => ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 6.0,
          ),
          leading: Container(
            padding: const EdgeInsets.only(right: 12.0),
            decoration: const BoxDecoration(
              border: Border(
                right: BorderSide(color: Colors.white24),
              ),
            ),
            child: Text(
              entry.rank.toString(),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          title: Text(
            entry.name,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
          trailing: const Icon(
            Icons.keyboard_arrow_right,
            color: Colors.white,
            size: 30.0,
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TweetView(title: entry.name),
              ),
            );
          },
        );

    Card makeCard(TopicEntry entry) => Card(
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
            child: makeListTile(entry),
          ),
        );

    final makeBody = Container(
      padding: const EdgeInsets.only(top: 14.0),
      color: c.twitterViewBackgroundColor,
      child: Column(
        children: <Widget>[
          const SizedBox(height: 4.0),
          Container(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const <Widget>[
                Text("Region: US", style: c.youtubeViewRegionTextStyle),
                Text("Date: 2021/2/1", style: c.youtubeViewRegionTextStyle),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 6.0, bottom: 6.0),
            decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                color: Colors.white24,
                width: 2.0,
              )),
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: entries.length,
              itemBuilder: (BuildContext context, int index) {
                return makeCard(entries[index]);
              },
            ),
          ),
        ],
      ),
    );

    return makeBody;
  }
}
