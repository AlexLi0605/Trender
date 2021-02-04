import 'package:flutter/material.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart' as dot_env;
import 'package:google_fonts/google_fonts.dart';

import 'package:WhatIsNew/assets/constants.dart' as c;
import 'package:WhatIsNew/ui/views/home_view.dart';
import 'locator.dart';

Future main() async {
  await dot_env.load();
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wake Me Up',
      theme: ThemeData(
        primaryColor: c.primaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.openSansTextTheme(),
      ),
      home: const HomeView(title: c.homeViewTitle),
      debugShowCheckedModeBanner: false,
    );
  }
}
