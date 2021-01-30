import 'package:WhatIsNew/assets/fake_data.dart';
import 'package:WhatIsNew/core/models/google_entry.dart';
import 'package:WhatIsNew/assets/constants.dart' as c;
import 'package:flutter/material.dart';

class GoogleView extends StatefulWidget {
  @override
  _GoogleViewState createState() => _GoogleViewState();
}

class _GoogleViewState extends State<GoogleView> {
  List<GoogleEntry> entries;

  @override
  void initState() {
    entries = getGoogleEntries();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ListTile makeListTile(GoogleEntry entry) => ListTile(
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

    Card makeCard(GoogleEntry entry) => Card(
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
            child: makeListTile(entry),
          ),
        );

    final makeBody = ColoredBox(
      color: c.googleViewBackgroundColor,
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
