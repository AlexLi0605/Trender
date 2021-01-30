import 'package:WhatIsNew/assets/fake_data.dart';
import 'package:WhatIsNew/core/models/topic_entry.dart';
import 'package:WhatIsNew/assets/constants.dart' as c;
import 'package:WhatIsNew/ui/views/tweet_view.dart';
import 'package:flutter/material.dart';

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

    final makeBody = ColoredBox(
      color: c.twitterViewBackgroundColor,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: entries.length,
        itemBuilder: (BuildContext context, int index) {
          return makeCard(entries[index]);
        },
      ),
    );

    return makeBody;
  }
}
