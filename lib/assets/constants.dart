import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

// Page title
const String homeViewTitle = "What Is New";
const String trendViewTitle = "Trending";

// AppBar style
const TextStyle appBarTitleTextStyle = TextStyle(
  fontWeight: FontWeight.w900,
  fontStyle: FontStyle.italic,
  fontSize: 26,
);

const TextStyle appBarTitleTextStyleWithoutItalic = TextStyle(
  fontWeight: FontWeight.w900,
  fontSize: 26,
);

// Tab title
const String googleTabTitle = "GOOGLE";
const String youtubeTabTitle = "YOUTUBE";
const String twitterTabTitle = "TWITTER";

// Base Color
const Color primaryColor = Color.fromRGBO(28, 38, 47, 1);

// Tab Color
const Color tabUnselectedColor = Color.fromRGBO(155, 146, 146, 1);
const Color tabIndicatorColor = Color.fromRGBO(23, 188, 239, 1);

// Google View Color
const Color googleViewBackgroundColor = Color.fromRGBO(36, 49, 58, 1);
const Color googleViewCardBorderColor = Color.fromRGBO(191, 194, 196, 0.3);
const TextStyle googleViewDateTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 16.0,
);
const TextStyle googleViewRegionTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 16.0,
);

// Youtube View Color
const Color youtubeViewBackgroundColor = Color.fromRGBO(36, 49, 58, 1);
const Color youtubeViewCardBorderColor = Color.fromRGBO(191, 194, 196, 0.3);
const TextStyle youtubeViewDateTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 16.0,
);
const TextStyle youtubeViewRegionTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 16.0,
);

// Twitter View Color
const Color twitterViewBackgroundColor = Color.fromRGBO(36, 49, 58, 1);
const Color twitterViewCardBorderColor = Color.fromRGBO(191, 194, 196, 0.3);
const TextStyle twitterViewDateTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 16.0,
);
const TextStyle twitterViewRegionTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 16.0,
);

// Tweet View Color
const Color tweetViewBackgroundColor = Color.fromRGBO(36, 49, 58, 1);
const Color tweetViewCardBorderColor = Color.fromRGBO(191, 194, 196, 0.3);

// Bottom Navigation style
TextStyle bottomNavigationTextStyle = GoogleFonts.openSans(
  color: Colors.white,
  fontSize: 14.0,
  fontWeight: FontWeight.bold,
);
const Color bottomNavigationSelectedItemLabelColor = Colors.white;
const double bottomNavigationBarHeight = 36.0;
const String bottomNavigationHomeTitle = "Home";
const String bottomNavigationSettingTitle = "Setting";
