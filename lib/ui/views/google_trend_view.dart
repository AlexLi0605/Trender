import 'package:WhatIsNew/core/models/trend_entry.dart';
import 'package:WhatIsNew/assets/constants.dart' as c;
import 'package:flutter/material.dart';

class GoogleTrendView extends StatefulWidget {
  @override
  _GoogleTrendViewState createState() => _GoogleTrendViewState();
}

class _GoogleTrendViewState extends State<GoogleTrendView> {
  List<TrendEntry> trendEntries;

  @override
  void initState() {
    trendEntries = getTrendEntries();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ListTile makeListTile(TrendEntry entry) => ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20.0, vertical: 6.0),
          leading: Container(
            padding: const EdgeInsets.only(right: 12.0),
            decoration: const BoxDecoration(
              border: Border(right: BorderSide(color: Colors.white24)),
            ),
            child: Text(
              entry.rank.toString(),
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          title: Text(
            entry.title,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
          subtitle: Row(
            children: <Widget>[
              Expanded(
                child: LinearProgressIndicator(
                  backgroundColor: const Color.fromRGBO(209, 224, 224, 0.2),
                  value: entry.popularFactor,
                  valueColor: const AlwaysStoppedAnimation(Colors.green),
                ),
              ),
            ],
          ),
          trailing: const Icon(Icons.keyboard_arrow_right,
              color: Colors.white, size: 30.0),
        );

    Card makeCard(TrendEntry entry) => Card(
          margin: const EdgeInsets.symmetric(),
          child: Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: c.googleTrendViewCardBorderColor,
                ),
              ),
              color: c.googleTrendViewBackgroundColor,
            ),
            child: makeListTile(entry),
          ),
        );

    final makeBody = ColoredBox(
      color: c.googleTrendViewBackgroundColor,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: trendEntries.length,
        itemBuilder: (BuildContext context, int index) {
          return makeCard(trendEntries[index]);
        },
      ),
    );

    return makeBody;
  }
}

List<TrendEntry> getTrendEntries() {
  return [
    TrendEntry(
      title: "Eriko",
      rank: 1,
      popularFactor: 0.9,
    ),
    TrendEntry(
      title: "Shiro",
      rank: 2,
      popularFactor: 0.8,
    ),
    TrendEntry(
      title: "Ryan",
      rank: 3,
      popularFactor: 0.7,
    ),
    TrendEntry(
      title: "Jamie",
      rank: 4,
      popularFactor: 0.6,
    ),
    TrendEntry(
      title: "Jordan",
      rank: 5,
      popularFactor: 0.5,
    ),
    TrendEntry(
      title: "COVID 19",
      rank: 6,
      popularFactor: 0.4,
    ),
    TrendEntry(
      title: "Trump",
      rank: 7,
      popularFactor: 0.3,
    ),
  ];
}
