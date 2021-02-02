import 'package:WhatIsNew/ui/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:WhatIsNew/assets/constants.dart' as c;
import 'package:google_fonts/google_fonts.dart';

void main() {
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
      home: const HomeView(title: c.homePageTitle),
      debugShowCheckedModeBanner: false,
    );
  }
}
