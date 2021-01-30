import 'package:WhatIsNew/assets/fake_data.dart';
import 'package:WhatIsNew/core/models/tweet_entry.dart';
import 'package:WhatIsNew/assets/constants.dart' as c;
import 'package:flutter/material.dart';

class TweetView extends StatefulWidget {
  const TweetView({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _TweetViewState createState() => _TweetViewState();
}

class _TweetViewState extends State<TweetView> {
  List<TweetEntry> entries;

  Text get _appBarTitle => Text(
        widget.title,
        style: c.appBarTitleTextStyleWithoutItalic,
      );
  @override
  void initState() {
    entries = getTweetEntries();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ListTile makeListTile(TweetEntry entry) => ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 6.0,
          ),
          title: Row(
            children: <Widget>[
              Container(
                width: 48.0,
                height: 48.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(entry.profilePhoto),
                  ),
                ),
              ),
              const SizedBox(width: 12.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    entry.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  Text(
                    "@${entry.screenName} ",
                    style: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 10.0),
              Text(
                entry.content,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
              const SizedBox(height: 10.0),
              Text(
                "${entry.retweetCount} retweets・${entry.publishedAt}",
                style: const TextStyle(color: Colors.white, fontSize: 14.0),
              ),
            ],
          ),
          trailing: const Icon(
            Icons.keyboard_arrow_right,
            color: Colors.white,
            size: 30.0,
          ),
        );

    Card makeCard(TweetEntry entry) => Card(
          margin: const EdgeInsets.symmetric(),
          child: Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: c.twitterViewCardBorderColor,
                ),
              ),
              color: c.tweetViewBackgroundColor,
            ),
            child: makeListTile(entry),
          ),
        );

    final makeBody = ColoredBox(
      color: c.tweetViewBackgroundColor,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: entries.length,
        itemBuilder: (BuildContext context, int index) {
          return makeCard(entries[index]);
        },
      ),
    );

    return Scaffold(
      backgroundColor: c.tweetViewBackgroundColor,
      appBar: AppBar(title: _appBarTitle),
      body: makeBody,
    );
  }
}
