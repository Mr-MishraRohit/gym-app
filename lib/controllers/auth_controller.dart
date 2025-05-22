import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:gym_apps/config/error_message.dart';
import 'package:gym_apps/elements/progress_bar.dart';
import '../api_service/firebase_auth_service.dart';
import '../config/Utils.dart';
import '../config/const.dart';
import '../model/User_model.dart';
import '../routes/routes.dart';

class AuthController extends GetxController {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  ProgressBar progressBar = ProgressBar();
  static ValueNotifier<String> otpVerified = ValueNotifier('');

  /// Register with email & password & save username instantly
  registerWithEmailAndPassword(
      String name, String password, String email, BuildContext context) async {
    String message = '';
    try {
      UserCredential result =
          await Utils.firebaseAuth.createUserWithEmailAndPassword(
        // instantiated earlier on: final _firebaseAuth = FirebaseAuth.instance;
        email: email,
        password: password,
      );
      User user = result.user!;
      user.updateProfile(displayName: name); //added this line
      progressBar.show(context);
      Future.delayed(const Duration(seconds: 3), () {
        progressBar.hide();
        Get.offNamed(RoutesName.loginScreen);
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        message = 'An account already exists with that email.';
      }
      progressBar.hide();
      Utils.showSnackBar(message);
    } catch (e) {
      progressBar.hide();
      Utils.showSnackBar("Failed: $e");
    }
  }

  /// Login with email & password
  loginWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    String message = '';
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      progressBar.show(context);
      Future.delayed(const Duration(seconds: 3), () {
        progressBar.hide();
        Utils.showSnackBar('success');
        Get.offNamed(RoutesName.startBasicScreen);
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
        message = 'Invalid login credentials.';
      } else {
        message = e.code;
      }
      progressBar.hide();
      Utils.showSnackBar(message);
    }
  }

  /// Phone number Auth flow sending OTP
  Future<void> verifyPhoneAndSendOTP(BuildContext context, UserModel userModel,
      bool isSignup, Function(bool) otpSent) async {
    progressBar.show(context);
    bool isConnected = await Utils.isInternetConnected();
    if (isConnected) {
      await verifyPhoneNumber(Utils.firebaseAuth, userModel,
          (int status, dynamic data) async {
        Debug.setLog('check_response__ $status $data');
        progressBar.hide();
        if (status == 3) {
          //OTP sent
          userModel.verificationId = data;

          otpSent(true);
        } else if (status == 2) {
          //verification failed

          FirebaseAuthException authException = data;
          if (authException.code == 'invalid-phone-number') {
            Utils.showSnackBar("Please enter valid mobile number");
          } else if (authException.code == 'too-many-requests') {
            Utils.showSnackBar("Too many Requests");
          }
        } else if (status == 4) {
          //auto retrieval timeout
        }
      });
    } else {
      progressBar.hide();
      Utils.showSnackBar(ErrorMessage.noInternetConnectionMessage);
    }
  }

  /// Verify OTP flow
  void verifyOTP(UserModel userModel, BuildContext context,
      {String? uid,
      String? emailCode,
      required String smsCode,
      required Function(bool) isInvalidOtp,
      String? url}) async {
    progressBar.show(context);
    bool isConnected = await Utils.isInternetConnected();

    if (isConnected) {
      await signInWithPhoneNumber(userModel, smsCode, Utils.firebaseAuth,
          (int status, dynamic data) async {
        if (status == 1) {
          //successfully verified
          UserCredential userCredential = data;
          Debug.setLog('user_info=> $userCredential');
          var firebaseIdToken = await userCredential.user!.getIdToken();
          Debug.setLog('firebaseIdToken=> $firebaseIdToken');
        } else if (status == 2) {
          //verification failed
          progressBar.hide();
          isInvalidOtp(true);
        }
      });
    } else {
      progressBar.hide();
      Utils.showSnackBar(ErrorMessage.noInternetConnectionMessage);
    }
  }
}
