import 'package:flutter/material.dart';
import 'package:WhatIsNew/assets/constants.dart' as C;
import 'package:google_fonts/google_fonts.dart';

import 'home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wake Me Up',
      theme: ThemeData(
        primaryColor: C.PRIMARY_COLOR,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.openSansTextTheme(),
      ),
      home: const HomePage(title: C.HOME_PAGE_TITLE),
      debugShowCheckedModeBanner: false,
    );
  }
}
