library helperwidget;
import 'package:apphelper/helperapp.dart';
import 'package:flutter/material.dart';



MaterialApp appRootTree (
    {
      required String title,
      bool bannerShow=false,
      required ThemeMode themeMode,
      required String initPage,
      required Map<String, Widget Function(BuildContext)> routes,
      Widget Function(BuildContext, Widget?)? builder,
      GlobalKey<NavigatorState>? navigatorKey,
      GlobalKey<ScaffoldMessengerState>? scaffoldMessengerKey,
      List<NavigatorObserver>? navigatorObserver,
      ThemeData? theme,
      ThemeData? darkTheme

    })
{
  navigatorKey ??= AppHelpers.navigation.navigatorKey;
  scaffoldMessengerKey??= AppHelpers.navigation.messengerKey;
  theme??=ThemeData.light(useMaterial3: true);
  darkTheme??=ThemeData.dark(useMaterial3: true);


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