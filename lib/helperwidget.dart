library helperwidget;
import 'package:apphelper/helperapp.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';


OKToast appRootTree(
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
  builder ??= BotToastInit();
  navigatorKey ??= AppHelpers.navigation.navigatorKey;
  scaffoldMessengerKey??= AppHelpers.navigation.messengerKey;
  navigatorObserver??=[BotToastNavigatorObserver()];
  theme??=ThemeData.light(useMaterial3: true);
  darkTheme??=ThemeData.dark(useMaterial3: true);


return OKToast(
  child: MaterialApp(
    title: 'APIM Pos',
    debugShowCheckedModeBanner: bannerShow,
    builder: builder,
    navigatorKey: navigatorKey,
    scaffoldMessengerKey: scaffoldMessengerKey,
    navigatorObservers: navigatorObserver,
    theme: theme,
    darkTheme: darkTheme,
    themeMode: themeMode,
    initialRoute: initPage,
    routes: routes,
  ),
);
}