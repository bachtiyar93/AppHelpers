library helperwidget;
import 'package:apphelper/helperapp.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

class AppTree extends StatelessWidget {
   AppTree(
      {
        super.key,
        required this.title,
        this.bannerShow,
        required this.themeMode,
        required this.initPage,
        required this.routes,
        this.builder,
        this.navigatorKey,
        this.scaffoldMessengerKey,
        this.navigatorObserver,
        this.theme,
        this.darkTheme
      });
  final String title;
  bool? bannerShow;
  final ThemeMode themeMode;
  final String initPage;
  final Map<String, Widget Function(BuildContext)> routes;
  Widget Function(BuildContext, Widget?)? builder;
  GlobalKey<NavigatorState>? navigatorKey;
  GlobalKey<ScaffoldMessengerState>? scaffoldMessengerKey;
  List<NavigatorObserver>? navigatorObserver;
  ThemeData? theme;
  ThemeData? darkTheme;

  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: MaterialApp(
        title: title,
        debugShowCheckedModeBanner: bannerShow??false,
        builder: builder ??= BotToastInit(),
        navigatorKey: navigatorKey ??= AppHelpers.navigation.navigatorKey,
        scaffoldMessengerKey: scaffoldMessengerKey??= AppHelpers.navigation.messengerKey,
        navigatorObservers: navigatorObserver??=[BotToastNavigatorObserver()],
        theme: theme??=ThemeData.light(useMaterial3: true),
        darkTheme: darkTheme??=ThemeData.dark(useMaterial3: true),
        themeMode: themeMode,
        initialRoute: initPage,
        routes: routes,
      ),
    );
  }
}