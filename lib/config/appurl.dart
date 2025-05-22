import 'package:flutter/foundation.dart';

class AppUrls {
  static String baseUrl = kReleaseMode
      ? "https://YourUrl.com"
      : "https://YourUrl.com";

  static String apiBaseUrl = "$baseUrl/api/";

  static String dailyActivity = "${apiBaseUrl}daily-activity";
  static String insertProfile = "${apiBaseUrl}user-profile";
  static String getUserProfile = "${apiBaseUrl}user-profile";
  static String isSendOTP = "${apiBaseUrl}auth/otp/send";
  static String isSendVerify = "${apiBaseUrl}auth/otp/verify";
  static String isTracking = "${apiBaseUrl}tracking";
  static String appConfig = "${apiBaseUrl}app-config";
  static String upload_media_url = "${apiBaseUrl}image-upload";
}
