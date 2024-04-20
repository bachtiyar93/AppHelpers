library helperapp;

import 'dart:convert';
import 'dart:io';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'CurrencyFormatter/BaseCurrencyFormatter.dart';
import 'CurrencyFormatter/CurrencyFormatter.dart';
import 'NavigationHelper/BaseNavigationHelper.dart';
import 'NavigationHelper/NavigationHelper.dart';

/// A Calculator.
class AppHelpers {
  static final BaseCurrencyFormatter currency = CurrencyFormatter();
  static final BaseNavigationHelper navigation = NavigationHelper();
  static Future<bool> hasInternet() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result.first.rawAddress.isNotEmpty) {
        return true;
      }
    } on SocketException {
      return false;
    }
    return false;
  }
  static String encryptSha1(String textData) {
    var bytes = latin1.encode(textData); // data being hashed
    var digest = sha1.convert(bytes);
    return digest.toString();
  }
  static String encryptBase64(String password) {
    return base64Encode(utf8.encode(password));
  }

  // CustomProgressDialog
  static Future<void> showWarning({title, text, dissmisable = false}) async {
    return await showDialog<void>(
      context: navigation.navigatorKey.currentContext!,
      barrierColor: Colors.transparent,
      barrierDismissible: dissmisable,
      // false = user must tap button, true = tap outside dialog
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Row(
            children: [
              const Icon(
                Icons.warning_amber,
                color: Colors.amber,
              ),
              Text(
                title ?? "Error",
                style: const TextStyle(color: Colors.amber),
              ),
            ],
          ),
          content: Text(text ?? ""),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                AppHelpers.navigation.closePage(); // Dismiss alert dialog
              },
            ),
          ],
        );
      },
    );
  }

// CustomProgressDialog
  static Future<void> showProgress({text, dissmisable = false, child}) async {
    return await showDialog<void>(
      context: navigation.navigatorKey.currentContext!,
      barrierColor: Colors.transparent,
      barrierDismissible: dissmisable,
      // false = user must tap button, true = tap outside dialog
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          backgroundColor: Colors.white,
          content: Container(
              alignment: FractionalOffset.center,
              height: 80.0,
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  child??const CircularProgressIndicator(),
                  const SizedBox(
                    width: 5,
                  ),
                   Text(text)
                ],
              )),
        );
      },
    );
  }
  static showSnackBar({required Text text}){
    return ScaffoldMessenger.of(navigation.navigatorKey.currentContext!).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: Theme.of(navigation.navigatorKey.currentContext!).colorScheme.secondary,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
              side: BorderSide(width: 4,color: Theme.of(navigation.navigatorKey.currentContext!).colorScheme.onPrimary)
          ),
          margin: const EdgeInsets.only(bottom: 35,left:35,right:35 ),
          content: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              height: 15,
              child: FittedBox(child: text)),
        ));
  }
  ///GetPage data by payload with key
  static getPageData() {
    if (ModalRoute.of(navigation.navigatorKey.currentContext!)!.settings.arguments == null) {
      return <String, dynamic>{};
    } else {
      return ModalRoute.of(navigation.navigatorKey.currentContext!)!.settings.arguments;
    }
  }
  //Delay with duration
  Future<void> futureDelay(Duration dur,function){
    return Future.delayed(dur,()=>function);
  }
  ///run after state completly build
  void runAfterBuild(function){
    return WidgetsBinding.instance
        .addPostFrameCallback((_) => function);
  }
  static T getState<T extends ChangeNotifier>({bool listen = true}){
    return Provider.of<T>(navigation.navigatorKey.currentContext!, listen:listen);
  }
}
