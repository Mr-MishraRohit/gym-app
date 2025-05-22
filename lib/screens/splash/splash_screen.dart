import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gym_apps/config/Utils.dart';
import 'package:gym_apps/config/const.dart';
import 'package:gym_apps/config/image_constants.dart';
import '../../elements/app_icon.dart';
import '../../routes/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  static const int _maxDelayNavigationTime = 3; // in seconds

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navigateToOnboardingScreen();
  }

  void _navigateToOnboardingScreen() {

    Future.delayed(const Duration(seconds: _maxDelayNavigationTime), ()async{
      var isOnBoarding = await Utils.getPrefBool(isOnBoardingScreen);
      var isBasicProfile = await Utils.getPrefBool(isBasicDetails);
      if(isOnBoarding){
        if(FirebaseAuth.instance.currentUser != null){
          if(isBasicProfile){
            Get.offNamed(RoutesName.homeScreen);
          }else{
            Get.offNamed(RoutesName.genderScreen);
          }
        }else{
          Get.offNamed(RoutesName.signUpScreen);
        }
      }else{
        Get.offNamed(RoutesName.onboardingScreen);
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        width: 100.w,
        height: 100.h,
        decoration: BoxDecoration(color: Colors.black),
        child: AppIconWidget(size: 100.w,img: Constants.appIcon,),
      ),
    );
  }
}
