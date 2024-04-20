library helperwidget;
import 'package:apphelper/apphelpers.dart';
import 'package:flutter/material.dart';

//
//
// MaterialApp appRootTree (
//     {
//       required String title,
//       bool bannerShow=false,
//       required ThemeMode themeMode,
//       required String initPage,
//       required Map<String, Widget Function(BuildContext)> routes,
//       Widget Function(BuildContext, Widget?)? builder,
//       GlobalKey<NavigatorState>? navigatorKey,
//       GlobalKey<ScaffoldMessengerState>? scaffoldMessengerKey,
//       List<NavigatorObserver>? navigatorObserver,
//       ThemeData? theme,
//       ThemeData? darkTheme
//
//     })
// {
//   navigatorKey ??= AppHelpers.navigation.navigatorKey;
//   scaffoldMessengerKey??= AppHelpers.navigation.messengerKey;
//   theme??=ThemeData.light(useMaterial3: true);
//   darkTheme??=ThemeData.dark(useMaterial3: true);
//
//
// return MaterialApp(
//     title: title,
//     debugShowCheckedModeBanner: bannerShow,
//     builder: builder,
//     navigatorKey: navigatorKey,
//     scaffoldMessengerKey: scaffoldMessengerKey,
//     theme: theme,
//     darkTheme: darkTheme,
//     themeMode: themeMode,
//     initialRoute: initPage,
//     routes: routes,
//   );
// }

class AppRootTree extends MaterialApp {
   const AppRootTree(this.navigatorKey,  {super.key,
    required this.title,
    this.bannerShow=false,
    required this.themeMode,
    required this.initPage,
    required this.routes,
     this.builder,
    this.scaffoldMessengerKey,
    this.navigatorObserver,
    this.theme,
    this.darkTheme
  });
  @override
  final String title;
  final bool bannerShow;
  @override
  final ThemeMode themeMode;
  final String initPage;
  @override
  final Map<String, Widget Function(BuildContext)> routes;
  @override
  final Widget Function(BuildContext, Widget?)? builder;
  @override
  final GlobalKey<NavigatorState>? navigatorKey;
  @override
  final GlobalKey<ScaffoldMessengerState>? scaffoldMessengerKey;
   final List<NavigatorObserver>? navigatorObserver;
  @override
  final ThemeData? theme;
  @override
  final ThemeData? darkTheme;




  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      debugShowCheckedModeBanner: bannerShow,
      builder: builder,
      navigatorKey: navigatorKey??AppHelpers.navigation.navigatorKey,
      scaffoldMessengerKey: scaffoldMessengerKey??AppHelpers.navigation.messengerKey,
      theme: theme??ThemeData.light(useMaterial3: true),
      darkTheme: darkTheme??ThemeData.dark(useMaterial3: true),
      themeMode: themeMode,
      initialRoute: initPage,
      routes: routes,
    );
  }
}
