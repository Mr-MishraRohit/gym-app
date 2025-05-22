import 'package:firebase_auth/firebase_auth.dart';

import '../config/const.dart';
import '../controllers/auth_controller.dart';
import '../model/User_model.dart';

Future<void> verifyPhoneNumber(FirebaseAuth _auth, UserModel userModel, Function callBackStatus) async {
  verificationCompleted(PhoneAuthCredential phoneAuthCredential) async {
    AuthController.otpVerified.value = phoneAuthCredential.smsCode!;
    AuthController.otpVerified.notifyListeners();
    callBackStatus(1, phoneAuthCredential); //verified and get user
  }

  PhoneVerificationFailed verificationFailed = (FirebaseAuthException authException) {
    print(authException);
    callBackStatus(2, authException); //failure and get exception
  };

  PhoneCodeSent codeSent = (String? verificationId, [int? forceResendingToken]) async {
    callBackStatus(3, verificationId); //code sent and get id
  };

  PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout = (String verificationId) {
    callBackStatus(4, verificationId); //retrieval timeout & get id
  };

  try {
    await _auth.verifyPhoneNumber(
        phoneNumber: userModel.mobile_number,
        timeout: const Duration(seconds: 119),
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
  } catch (e) {
    Debug.setLog('verifyPhoneAndSendOTP__$e');

    callBackStatus(2, e,); //failure and get exception
  }
}


//sign in or signup with phone.
Future<void> signInWithPhoneNumber(UserModel userModel, String smsCode, FirebaseAuth _auth, Function callBackStatus) async {
  try {
    final PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: userModel.verificationId,
      smsCode: smsCode,
    );
    UserCredential userCredential = await _auth.signInWithCredential(credential);
    callBackStatus(1, userCredential); //verified and get user //login
    } catch (e) {
    Debug.setLog("$e");
    callBackStatus(2, e); //failure and get exception

  }
}
