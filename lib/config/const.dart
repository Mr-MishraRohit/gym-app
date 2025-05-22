import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

const DEBUG = kDebugMode;

class Debug {
  static void setLog(String msg) {
    if (DEBUG) log(msg);
    
  }
}

String APP_NAME = 'GymZy';
String JWT = 'JWT';
String USERNAME = 'USERNAME';
String PHONE = 'PHONE';
String isOnBoardingScreen = "isOnBoardingScreen";
String isBasicDetails = "isBasicDetails";
String AppCredentials = "AppCredentials";
//FONT FAMILY
const fontFamilyString = 'Poppins';

bool checkAPIResponse(int? code){
  if(code == 200 || code == 201) return true;
  else return false;
}


extension SizeExt on num {
  double get h => this * Get.height / 100;

  double get w => this * Get.width / 100;
}