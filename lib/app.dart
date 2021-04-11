import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

import 'package:trender/assets/app_constants.dart';
import 'package:trender/di/app_component.dart';
import 'package:trender/ext.dart';
import 'package:trender/navigation_manager.dart';
import 'package:trender/theme.dart';

class MyApp extends StatefulWidget {
  final AppComponent _appComponent;

  const MyApp(this._appComponent, [Key key]) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isTestEnv() {
    return Platform.environment.containsKey(testEnvironmentKeyword);
  }

  @override
  Widget build(BuildContext context) {
    EasyLoading.instance
      ..indicatorType = EasyLoadingIndicatorType.circle
      ..loadingStyle = EasyLoadingStyle.light
      ..indicatorSize = 45.0;
    // TODO(alex): Add database / firebase init task here
    final initTasks = <Future>[];
    return _createAppWithAsyncTasks(widget._appComponent, initTasks);
  }

  Widget _createAppWithAsyncTasks(
    AppComponent appComponent,
    List<Future> tasks,
  ) {
    return _createAppInitFutureBuilder(
      futures: tasks,
      app: _createApp(appComponent),
      loadingView: _createLoadingView(),
      createErrorView: (error) => throw Exception(error),
    );
  }

  Widget _createAppInitFutureBuilder({
    List<Future> futures,
    Widget app,
    Widget loadingView,
    Widget Function(Object error) createErrorView,
  }) {
    return FutureBuilder(
      future: Future.wait(futures),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return createErrorView(snapshot.error);
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return app;
        }
        return loadingView;
      },
    );
  }

  Widget _createApp(AppComponent appComponent) {
    return MultiProvider(
      // App level providers
      providers: [
        InheritedProvider.value(value: appComponent),
        ChangeNotifierProvider.value(value: appComponent.navigationManager),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        theme: appTheme,
        home: MainNavigatorPage(),
        builder: EasyLoading.init(),
      ),
    );
  }

  Widget _createLoadingView() {
    return const MaterialApp(home: SizedBox.shrink());
  }
}

class MainNavigatorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navigationManager = context.watch<NavigationManager>();
    // This is required to handle back button on Android
    // The same navigator key must be used to check WillPopScope's condition
    // and provided to Navigator widget
    return WillPopScope(
      onWillPop: () async =>
          !await navigationManager.navigatorKey.currentState.maybePop(),
      child: Navigator(
        key: navigationManager.navigatorKey,
        pages: navigationManager.pages,
        onPopPage: (route, result) {
          navigationManager.didPop(route.settings);
          return route.didPop(result);
        },
      ),
    );
  }
}
