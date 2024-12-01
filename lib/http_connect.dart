import 'dart:convert';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class AppCon {
  ///This Function for CRUD
  Future<http.Response?> getAPI({required String uri, headers}) async {
    if(kDebugMode){
      log(uri);
      log(jsonEncode(headers));
    }

    try {
      final http.Response response =
          await http.get(Uri.parse(uri), headers: headers);
      if(kDebugMode) {
        log(response.statusCode.toString());
        log(response.body);
      }
      return response;
    } catch(e){
      log(e.toString());
      return null;
    }
  }

  Future<http.Response?> postAPI(
      {required String uri, required postParams, headers}) async {
    if(kDebugMode){
      log(uri);
      log(jsonEncode(headers));
      log(jsonEncode(postParams));
    }

    try {
      final http.Response response =
          await http.post(Uri.parse(uri), body: postParams, headers: headers);
      if (kDebugMode) {
        log(response.statusCode.toString());
        log(response.body);
      }
      return response;
    }catch(e){
      log(e.toString());
      return null;
    }
  }

  Future<http.Response?> putAPI(
      {required String uri, required postParams, headers}) async {
    if(kDebugMode) {
      log(uri);
      log(jsonEncode(headers));
      log(jsonEncode(postParams));
    }
    try{
      final response =
          await http.put(Uri.parse(uri), body: postParams, headers: headers);
      if (kDebugMode) {
        log(response.statusCode.toString());
        log(response.body);
      }
      return response;
    }catch(e){
      log(e.toString());
      return null;
    }
  }
}