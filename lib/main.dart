import 'package:flutter/material.dart';

import 'package:trender/app.dart';
import 'package:trender/di/app_component.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp(AppComponent()));
}
