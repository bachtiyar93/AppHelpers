library helperapp;

import 'dart:convert';
import 'dart:io';
import 'package:crypto/crypto.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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

  static void backPage(context) {
    try {
      Navigator.pop(context);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  ///convertRupiah
  static String convertToRpNoRp(double money) {
    final formatCurrency =
    NumberFormat.simpleCurrency(locale: 'id', decimalDigits: 0);
    return formatCurrency.format(money).replaceAll("Rp", "");
  }

  ///GetPage data by payload
  static getPageData(context) {
    if (ModalRoute.of(context)!.settings.arguments == null) {
      return <String, dynamic>{};
    } else {
      return ModalRoute.of(context)!.settings.arguments;
    }
  }

  // ///get data hive
  // static getDataBox<T>(String key, T data) async {
  //   if (!kIsWeb && !Hive.isBoxOpen(key)) {
  //     Hive.init((await getApplicationDocumentsDirectory()).path);
  //   }
  //   Box box = await Hive.openBox<T>(key);
  //   var query = await box.get(key);
  //   if(box.isEmpty){
  //     await box.put(key, data);
  //     query=data;
  //     await box.close();
  //     return data;
  //   }
  //   await box.close();
  //   return query as T;
  // }
  //
  // ///save data hive
  // static saveDataBox<T>(String key, T data) async {
  //   Box box = await Hive.openBox<T>(key);
  //   await box.put(key, data);
  //   await box.close();
  // }
  //
  // ///Deleted hive
  // static deletedDataBox(key) async {
  //   Box box = await Hive.openBox(key);
  //   box.delete(key);
  //   await box.close();
  // }
  // static deletedAllBox() async {
  //   await Hive.deleteFromDisk();
  // }
  ///Delay with duration
  static futureDelay(Duration dur,function){
    return Future.delayed(dur,()=>function);
  }
  ///run after state completly build
  static void runAfterBuild(function){
    return WidgetsBinding.instance
        .addPostFrameCallback((_) => function);
  }

  static ChangeNotifier getState(BuildContext context,{bool listen = true}){
    return Provider.of(context, listen:listen);
  }
}
