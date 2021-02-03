import 'package:WhatIsNew/core/models/data/topic_item_model.dart';
import 'package:WhatIsNew/core/models/data/trend_item_model.dart';
import 'package:WhatIsNew/core/models/data/tweet_item_model.dart';
import 'package:WhatIsNew/core/models/data/video_info_item_model.dart';

List<TrendItemModel> getTrendItemModels() {
  return [
    TrendItemModel(
      title: "Eriko",
      rank: 1,
      popularFactor: 0.9,
    ),
    TrendItemModel(
      title: "Shiro",
      rank: 2,
      popularFactor: 0.8,
    ),
    TrendItemModel(
      title: "Ryan",
      rank: 3,
      popularFactor: 0.7,
    ),
    TrendItemModel(
      title: "Jamie",
      rank: 4,
      popularFactor: 0.6,
    ),
    TrendItemModel(
      title: "Jordan",
      rank: 5,
      popularFactor: 0.5,
    ),
    TrendItemModel(
      title: "COVID 19",
      rank: 6,
      popularFactor: 0.4,
    ),
    TrendItemModel(
      title: "Trump",
      rank: 7,
      popularFactor: 0.3,
    ),
    TrendItemModel(
      title: "Eriko",
      rank: 8,
      popularFactor: 0.9,
    ),
    TrendItemModel(
      title: "Shiro",
      rank: 9,
      popularFactor: 0.8,
    ),
    TrendItemModel(
      title: "Ryan",
      rank: 10,
      popularFactor: 0.7,
    ),
    TrendItemModel(
      title: "Jamie",
      rank: 11,
      popularFactor: 0.6,
    ),
    TrendItemModel(
      title: "Jordan",
      rank: 12,
      popularFactor: 0.5,
    ),
    TrendItemModel(
      title: "COVID 19",
      rank: 13,
      popularFactor: 0.4,
    ),
    TrendItemModel(
      title: "Trump",
      rank: 14,
      popularFactor: 0.3,
    ),
  ];
}

Future<List<TweetItemModel>> getTweetItemModels() async {
  return [
    TweetItemModel(
      name: "金井 宣茂",
      screenName: "Astro_Kanai",
      profilePhoto:
          'https://pbs.twimg.com/profile_images/879071738625232901/u0nlrr4Y_normal.jpg',
      content:
          "宇宙ステーションでも、日本と9時間の時差で月曜日が始まりました。n今週は6人から3人にクルーのサイズダウンがありますが、しっかりと任されているタスクをこなしたいと思います。nn写真は、NASAの実験施設「ディスティニー」のグローブ…",
      retweetCount: 226,
      publishedAt: "1 day ago",
    ),
    TweetItemModel(
      name: "NASA's Kennedy Space Center",
      screenName: "NASAKennedy",
      profilePhoto:
          "https://pbs.twimg.com/profile_images/1113501416558141440/csp6nhvI_reasonably_small.png",
      content:
          "Congratulations to #Olympics athletes who won gold! Neutron stars like the one at the heart of the Crab Nebula may…",
      retweetCount: 498,
      publishedAt: "3 days ago",
    ),
    TweetItemModel(
      name: "RobinHood",
      screenName: "robinhood",
      profilePhoto:
          "https://pbs.twimg.com/profile_images/1267616128022351873/dZJpsWTD_reasonably_small.jpg",
      content:
          "On behalf of the Worldwide Robin Hood Society, I would just like to thank you all for your support, follows and kind…",
      retweetCount: 9482,
      publishedAt: "10 hours ago",
    ),
    TweetItemModel(
      name: "medi-tally",
      screenName: "MediTally",
      profilePhoto:
          "https://pbs.twimg.com/profile_images/1349549465317875713/trMgGFyI_reasonably_small.jpg",
      content:
          "Remember to ask if Medi Tally is being used the easiest way to Improve & Manage Patient Flow & Saves Valuable Resources.",
      retweetCount: 132,
      publishedAt: "4 minutes ago",
    ),
    TweetItemModel(
      name: "金井 宣茂",
      screenName: "Astro_Kanai",
      profilePhoto:
          'https://pbs.twimg.com/profile_images/879071738625232901/u0nlrr4Y_normal.jpg',
      content:
          "宇宙ステーションでも、日本と9時間の時差で月曜日が始まりました。n今週は6人から3人にクルーのサイズダウンがありますが、しっかりと任されているタスクをこなしたいと思います。nn写真は、NASAの実験施設「ディスティニー」のグローブ…",
      retweetCount: 226,
      publishedAt: "1 day ago",
    ),
    TweetItemModel(
      name: "NASA's Kennedy Space Center",
      screenName: "NASAKennedy",
      profilePhoto:
          "https://pbs.twimg.com/profile_images/1113501416558141440/csp6nhvI_reasonably_small.png",
      content:
          "Congratulations to #Olympics athletes who won gold! Neutron stars like the one at the heart of the Crab Nebula may…",
      retweetCount: 498,
      publishedAt: "3 days ago",
    ),
    TweetItemModel(
      name: "RobinHood",
      screenName: "robinhood",
      profilePhoto:
          "https://pbs.twimg.com/profile_images/1267616128022351873/dZJpsWTD_reasonably_small.jpg",
      content:
          "On behalf of the Worldwide Robin Hood Society, I would just like to thank you all for your support, follows and kind…",
      retweetCount: 9482,
      publishedAt: "10 hours ago",
    ),
    TweetItemModel(
      name: "medi-tally",
      screenName: "MediTally",
      profilePhoto:
          "https://pbs.twimg.com/profile_images/1349549465317875713/trMgGFyI_reasonably_small.jpg",
      content:
          "Remember to ask if Medi Tally is being used the easiest way to Improve & Manage Patient Flow & Saves Valuable Resources.",
      retweetCount: 132,
      publishedAt: "4 minutes ago",
    ),
  ];
}

List<TopicItemModel> getTopicItemModels() {
  return [
    TopicItemModel(
      name: "#GiftAGamer",
      rank: 1,
    ),
    TopicItemModel(
      name: "#AskCuppyAnything",
      rank: 2,
    ),
    TopicItemModel(
      name: "#givethanks",
      rank: 3,
    ),
    TopicItemModel(
      name: "#Carrefour",
      rank: 4,
    ),
    TopicItemModel(
      name: "#StreamLifeGoesOn",
      rank: 5,
    ),
    TopicItemModel(
      name: "#STREAM BE PARTY",
      rank: 6,
    ),
    TopicItemModel(
      name: "#TransDayOfRemembrance",
      rank: 7,
    ),
    TopicItemModel(
      name: "#GiftAGamer",
      rank: 8,
    ),
    TopicItemModel(
      name: "#AskCuppyAnything",
      rank: 9,
    ),
    TopicItemModel(
      name: "#givethanks",
      rank: 10,
    ),
    TopicItemModel(
      name: "#Carrefour",
      rank: 11,
    ),
    TopicItemModel(
      name: "#StreamLifeGoesOn",
      rank: 12,
    ),
    TopicItemModel(
      name: "#STREAM BE PARTY",
      rank: 13,
    ),
    TopicItemModel(
      name: "#TransDayOfRemembrance",
      rank: 14,
    ),
  ];
}

List<VideoInfoItemModel> getVideoInfoItemModels() {
  return [
    VideoInfoItemModel(
      title: "Lil Durk - Should've Ducked feat. Pooh Shiesty (Official Audio)",
      channelTitle: "Lil Durk",
      thumbnail: "https://i.ytimg.com/vi/8a2ezAX65UM/default.jpg",
      publishedAt: '20 hours ago',
      viewCounts: 1469449,
    ),
    VideoInfoItemModel(
      title: "I'M BUILDING A BETTER BOY",
      channelTitle: "Danny Gonzalez",
      thumbnail: "https://i.ytimg.com/vi/3n-gWR0mk6k/default.jpg",
      publishedAt: '14 minutes ago',
      viewCounts: 837904,
    ),
    VideoInfoItemModel(
      title: "If Everything Was Like Among Us 6",
      channelTitle: "Shiloh & Bros",
      thumbnail: "https://i.ytimg.com/vi/ZynBkp-4GQ8/default.jpg",
      publishedAt: '1 day ago',
      viewCounts: 5639896,
    ),
    VideoInfoItemModel(
      title: "Selena Gomez, Rauw Alejandro - Baila Conmigo (Official Video)",
      channelTitle: "SelenaGomezVEVO",
      thumbnail: "https://i.ytimg.com/vi/h5WN3pkxPF0/default.jpg",
      publishedAt: '2 days ago',
      viewCounts: 8656933,
    ),
    VideoInfoItemModel(
      title: "Can We Turn Resin Pigments Into PAINT?",
      channelTitle: "EvanAndKatelyn",
      thumbnail: "https://i.ytimg.com/vi/LfC7tIOfftE/default.jpg",
      publishedAt: '1 week ago',
      viewCounts: 4482423,
    ),
    VideoInfoItemModel(
      title: "Lil Durk - Should've Ducked feat. Pooh Shiesty (Official Audio)",
      channelTitle: "Lil Durk",
      thumbnail: "https://i.ytimg.com/vi/8a2ezAX65UM/default.jpg",
      publishedAt: '20 hours ago',
      viewCounts: 1469449,
    ),
    VideoInfoItemModel(
      title: "I'M BUILDING A BETTER BOY",
      channelTitle: "Danny Gonzalez",
      thumbnail: "https://i.ytimg.com/vi/3n-gWR0mk6k/default.jpg",
      publishedAt: '14 minutes ago',
      viewCounts: 837904,
    ),
    VideoInfoItemModel(
      title: "If Everything Was Like Among Us 6",
      channelTitle: "Shiloh & Bros",
      thumbnail: "https://i.ytimg.com/vi/ZynBkp-4GQ8/default.jpg",
      publishedAt: '1 day ago',
      viewCounts: 5639896,
    ),
    VideoInfoItemModel(
      title: "Selena Gomez, Rauw Alejandro - Baila Conmigo (Official Video)",
      channelTitle: "SelenaGomezVEVO",
      thumbnail: "https://i.ytimg.com/vi/h5WN3pkxPF0/default.jpg",
      publishedAt: '2 days ago',
      viewCounts: 8656933,
    ),
    VideoInfoItemModel(
      title: "Can We Turn Resin Pigments Into PAINT?",
      channelTitle: "EvanAndKatelyn",
      thumbnail: "https://i.ytimg.com/vi/LfC7tIOfftE/default.jpg",
      publishedAt: '1 week ago',
      viewCounts: 4482423,
    ),
  ];
}
