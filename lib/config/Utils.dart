import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'const.dart';

class Utils {
  static SharedPreferences? prefs;
  static FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  // static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  // static FirebaseAnalyticsObserver observer =
  // FirebaseAnalyticsObserver(analytics: analytics);

  static Future<void> setTestSetCurrentScreen(String splashScreen) async {
    Debug.setLog("Names Constant ${splashScreen}");
  }
  static showSnackBar(String value) {
    Get.showSnackbar(
      GetBar(
        title: "",
        message: value.tr,
        isDismissible: true,
        padding: const EdgeInsets.all(10.0),
        titleText: Container(),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  static Future<bool> isInternetConnected() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        Debug.setLog('connected');
        return true;
      } else {
        return false;
      }
    } on SocketException catch (_) {
      Debug.setLog('not connected');
      return false;
    }
  }

  static bool validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    if (regex.hasMatch(value)) {
      return true;
    } else {
      return false;
    }
  }

  static Future setPref() async {
    prefs = await SharedPreferences.getInstance();
  }

  // ---------------------- String ----------------------
  static Future setPrefString(String key, String value) async {
    if (prefs == null) await setPref();
    prefs!.setString(key, value);
  }

  static Future<String> getPrefString(String key) async {
    if (prefs == null) await setPref();
    return prefs!.getString(key) ?? '';
  }

  // ---------------------- Bool ----------------------
  static Future setPrefBool(String key, bool value) async {
    if (prefs == null) await setPref();
    prefs!.setBool(key, value);
  }

  static Future<bool> getPrefBool(String key) async {
    if (prefs == null) await setPref();
    return prefs!.getBool(key) ?? false;
  }

  // ---------------------- Double ----------------------
  static Future setPrefDouble(String key, double value) async {
    if (prefs == null) await setPref();
    prefs!.setDouble(key, value);
  }

  static Future<double> getPrefDouble(String key) async {
    if (prefs == null) await setPref();
    return prefs!.getDouble(key) ?? 0.0;
  }

  // ---------------------- Integer ----------------------
  static Future setPrefInteger(String key, int value) async {
    if (prefs == null) await setPref();
    prefs!.setInt(key, value);
  }

  static Future<int> getPrefInteger(String key) async {
    if (prefs == null) await setPref();
    return prefs!.getInt(key) ?? 0;
  }

  // ---------------------- List<String> ----------------------
  static Future setPrefListString(String key, List<String> value) async {
    Debug.setLog("1234 setPRef contact list ${value.toString()}");
    if (prefs == null) await setPref();
    prefs!.setStringList(key, value);
  }

  static Future<List<String>> getPrefListString(String key) async {
    if (prefs == null) await setPref();
    return prefs!.getStringList(key) ?? [];
  }

  static Future clearPrefsData() async {
    if (prefs == null) await setPref();
    return prefs!.clear();
  }

}

DateTime? currentBackPressTime;

Future<bool> onWillPop() {
  DateTime now = DateTime.now();
  if (currentBackPressTime == null ||
      now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
    currentBackPressTime = now;

    Utils.showSnackBar(
      "EXIT",
    );
    return Future.value(false);
  }
  return Future.value(true);
}

Future<bool> backPressed() async {
  bool back = await onWillPop();
  if (back) {
    if (Platform.isAndroid) {
      SystemNavigator.pop();
    } else {
      exit(0);
    }
  }
  return back;
}
