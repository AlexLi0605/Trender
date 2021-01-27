import 'package:flutter/material.dart';
import 'package:WhatIsNew/assets/constants.dart' as C;

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
        primarySwatch: Colors.lightBlue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomePage(title: C.HOME_PAGE_TITLE),
      debugShowCheckedModeBanner: false,
    );
  }
}
