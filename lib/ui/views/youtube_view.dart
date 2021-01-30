import 'package:WhatIsNew/assets/constants.dart' as c;
import 'package:WhatIsNew/core/models/youtube_entry.dart';
import 'package:flutter/material.dart';

class YoutubeView extends StatefulWidget {
  @override
  _YoutubeViewState createState() => _YoutubeViewState();
}

class _YoutubeViewState extends State<YoutubeView> {
  List<YoutubeEntry> youtubeEntries;

  @override
  void initState() {
    youtubeEntries = getYoutubeEntries();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ListTile makeListTile(YoutubeEntry entry) => ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          leading: Container(
            padding: const EdgeInsets.only(right: 12.0),
            decoration: const BoxDecoration(
              border: Border(right: BorderSide(color: Colors.white24)),
            ),
            child: Image.network(entry.thumbnail),
          ),
          title: Text(
            entry.title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 6.0),
              Text(
                entry.channelTitle,
                style: const TextStyle(color: Colors.white, fontSize: 14.0),
              ),
              Text(
                "${entry.viewCounts} views・${entry.publishedAt}",
                style: const TextStyle(color: Colors.white, fontSize: 14.0),
              ),
            ],
          ),
          trailing: const Icon(Icons.keyboard_arrow_right,
              color: Colors.white, size: 30.0),
        );

    Card makeCard(YoutubeEntry entry) => Card(
          margin: const EdgeInsets.symmetric(),
          child: Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: c.youtubeViewCardBorderColor,
                ),
              ),
              color: c.youtubeViewBackgroundColor,
            ),
            child: makeListTile(entry),
          ),
        );

    final makeBody = ColoredBox(
      color: c.youtubeViewBackgroundColor,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: youtubeEntries.length,
        itemBuilder: (BuildContext context, int index) {
          return makeCard(youtubeEntries[index]);
        },
      ),
    );

    return makeBody;
  }
}

List<YoutubeEntry> getYoutubeEntries() {
  return [
    YoutubeEntry(
      title: "Lil Durk - Should've Ducked feat. Pooh Shiesty (Official Audio)",
      channelTitle: "Lil Durk",
      thumbnail: "https://i.ytimg.com/vi/8a2ezAX65UM/default.jpg",
      publishedAt: '20 hours ago',
      viewCounts: 1469449,
    ),
    YoutubeEntry(
      title: "I'M BUILDING A BETTER BOY",
      channelTitle: "Danny Gonzalez",
      thumbnail: "https://i.ytimg.com/vi/3n-gWR0mk6k/default.jpg",
      publishedAt: '14 minutes ago',
      viewCounts: 837904,
    ),
    YoutubeEntry(
      title: "If Everything Was Like Among Us 6",
      channelTitle: "Shiloh & Bros",
      thumbnail: "https://i.ytimg.com/vi/ZynBkp-4GQ8/default.jpg",
      publishedAt: '1 day ago',
      viewCounts: 5639896,
    ),
    YoutubeEntry(
      title: "Selena Gomez, Rauw Alejandro - Baila Conmigo (Official Video)",
      channelTitle: "SelenaGomezVEVO",
      thumbnail: "https://i.ytimg.com/vi/h5WN3pkxPF0/default.jpg",
      publishedAt: '2 days ago',
      viewCounts: 8656933,
    ),
    YoutubeEntry(
      title: "Can We Turn Resin Pigments Into PAINT?",
      channelTitle: "EvanAndKatelyn",
      thumbnail: "https://i.ytimg.com/vi/LfC7tIOfftE/default.jpg",
      publishedAt: '1 week ago',
      viewCounts: 4482423,
    ),
  ];
}
