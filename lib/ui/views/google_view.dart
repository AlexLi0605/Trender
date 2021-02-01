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

    final makeBody = Container(
      padding: const EdgeInsets.only(top: 14.0),
      color: c.googleViewBackgroundColor,
      child: Column(
        children: <Widget>[
          const SizedBox(height: 4.0),
          Container(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const <Widget>[
                Text("Region: US", style: c.googleViewRegionTextStyle),
                Text("Date: 2021/2/1", style: c.googleViewRegionTextStyle),
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
