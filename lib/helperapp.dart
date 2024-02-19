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

  ///GetPage data by payload with key
  static getPageData(context) {
    if (ModalRoute.of(context)!.settings.arguments == null) {
      return <String, dynamic>{};
    } else {
      return ModalRoute.of(context)!.settings.arguments;
    }
  }
  //Delay with duration
  static futureDelay(Duration dur,function){
    return Future.delayed(dur,()=>function);
  }
  ///run after state completly build
  static void runAfterBuild(function){
    return WidgetsBinding.instance
        .addPostFrameCallback((_) => function);
  }
  static T getState<T extends ChangeNotifier>(BuildContext context,{bool listen = true}){
    return Provider.of<T>(context, listen:listen);
  }
}
