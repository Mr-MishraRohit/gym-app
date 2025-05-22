import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:gym_apps/config/Utils.dart';
import 'package:gym_apps/elements/progress_bar.dart';
import 'package:gym_apps/model/User_model.dart';
import '../api_service/http_service.dart';
import '../config/appurl.dart';
import '../config/const.dart';
import '../config/error_message.dart';

class BasicDetailsController extends GetxController {
  RxBool isMaleGenderSelected = true.obs;
  RxBool isFemaleGenderSelected = false.obs;
  RxString selectedCurrentGender = "Male".obs;

  RxString selectedCurrentIndex = "18".obs;

  RxInt selectedWeight = 75.obs;
  RxInt selectedHeight = (10 * 5).obs;
  RxString selectedUnit = "KG".obs;

  List<String> goalList = [
    "Lose Weight",
    "Gain Weight",
    "Muscle Mass Gain",
    "Shape Body",
    "Others"
  ];
  List<String> physicalList = ["Beginner", "Intermediate", "Advance"];

  RxString selectedGoalName = "Lose Weight".obs;
  RxString selectedPhysicalName = "Beginner".obs;

  TextEditingController fullNameController = TextEditingController();
  TextEditingController nickNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  UserModel userModel = UserModel();
  ProgressBar progressBar = ProgressBar();

  /// Https Service
  HttpService httpService = HttpService();

  /// Firebase Database Config Added Data
  firebaseDatabaseService(BuildContext context) async {
    try {
      progressBar.show(context);
      CollectionReference users =
          FirebaseFirestore.instance.collection('users');
      // Call the user's CollectionReference to add a new user
      await users.doc(Utils.firebaseAuth.currentUser!.uid).set({
        'full_name': fullNameController.text,
        'email': emailController.text,
        'nick_name': nickNameController.text,
        'mobile_number': phoneController.text,
        'gender': selectedCurrentGender.value,
        'age': selectedCurrentIndex.value,
        'selected_unit': selectedUnit.value,
        'weight': selectedWeight.value,
        'height': selectedHeight.value,
        'goal': selectedGoalName.value,
        'physical_level': selectedPhysicalName.value,
      });
      getUser(context);
      return 'success';
    } catch (e) {
      progressBar.hide();
      return 'Error adding user';
    }
  }

  /// Fetch User Data from Firebase
  getUser(BuildContext context) async {
    try {
      CollectionReference users =
          FirebaseFirestore.instance.collection('users');
      final snapshot =
          await users.doc(Utils.firebaseAuth.currentUser!.uid).get();
      final data = snapshot.data() as Map<String, dynamic>;
      Debug.setLog("user object $data");

      userModel = UserModel.fromJson(data);

      Debug.setLog("User data ${userModel.toMap()}");
      insertProfileRecords(context);
      return data['full_name'];
    } catch (e) {
      return 'Error fetching user';
    }
  }

  /// Https Post Call
  insertProfileRecords(BuildContext context) async {
    progressBar.show(context);
    bool isConnected = await Utils.isInternetConnected();
    if (isConnected) {
      var response = await httpService
          .postRequest(AppUrls.insertProfile,
              rowData: userModel.toMap(), isAuthorizationRequired: true)
          .catchError((e) => progressBar.hide());
      progressBar.hide();
      if (checkAPIResponse(response?.statusCode)) {}
    } else {
      progressBar.hide();
      Utils.showSnackBar(ErrorMessage.noInternetConnectionMessage);
    }
  }

  /// Https Get Call
  getUserData() async {
    bool isConnected = await Utils.isInternetConnected();
    if (isConnected) {
      var response = await httpService
          .getRequest(
            AppUrls.getUserProfile,
            isAuthorizationRequired: true,
          )
          .catchError((e) => Debug.setLog(e.toString()));
      if (checkAPIResponse(response?.statusCode)) {
        Debug.setLog('Response data ${response.data}');
        userModel = UserModel.fromJson(response.data);
      }
    } else {
      Utils.showSnackBar(ErrorMessage.noInternetConnectionMessage);
    }
  }
}
