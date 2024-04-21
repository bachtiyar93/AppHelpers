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
   const AppRootTree({super.key,
    required this.title,
    required this.bannerShow,
    required this.themeMode,
    required this.initPage,
    required this.routes,
     required this.builder,
     required this.navigatorKey,
     required this.scaffoldMessengerKey,
    required this.navigatorObserver,
    required this.theme,
    required this.darkTheme
  });
  final String title;
  final bool bannerShow;
  final ThemeMode themeMode;
  final String initPage;
  final Map<String, Widget Function(BuildContext)> routes;
  final Widget Function(BuildContext, Widget?) builder;
  final GlobalKey<NavigatorState> navigatorKey;
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey;
   final List<NavigatorObserver> navigatorObserver;
  final ThemeData theme;
  final ThemeData darkTheme;




  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      debugShowCheckedModeBanner: bannerShow,
      builder: builder,
      navigatorKey: navigatorKey,
      scaffoldMessengerKey: scaffoldMessengerKey,
      theme: theme,
      darkTheme: darkTheme,
      themeMode: themeMode,
      initialRoute: initPage,
      routes: routes,
    );
  }
}
