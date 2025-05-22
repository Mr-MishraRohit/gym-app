import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_apps/config/Utils.dart';
import 'package:gym_apps/config/image_constants.dart';
import 'package:gym_apps/routes/routes.dart';

import '../config/assets_image.dart';
import '../config/const.dart';
import '../config/string_constant.dart';
import '../model/onboarding_slider.dart';

class OnboardingController extends GetxController {
  final PageController pageController = PageController();

  /// Current slide index of onboarding screen
  RxInt currentIndex = 0.obs;

  /// Get list of slide to show for onboarding screen
  List<SliderModel> getSlides() {
    List<SliderModel> slides = [];

    // Item 1
    slides.add(
      SliderModel(
        image: AssetsImage.onBoardingScreen1,
        icons: Constants.onBoardIcon1,
        title: StringConstant.onBoardingText1,
        description: StringConstant.onBoardingText1,
      ),
    );

    // Item 2
    slides.add(
      SliderModel(
        image: AssetsImage.onBoardingScreen2,
        icons: Constants.onBoardIcon2,
        title: StringConstant.onBoardingText2,
        description: StringConstant.onBoardingText2,
      ),
    );

    // Item 3
    slides.add(
      SliderModel(
        image: AssetsImage.onBoardingScreen3,
        icons: Constants.onBoardIcon3,
        title: StringConstant.onBoardingText3,
        description: StringConstant.onBoardingText3,
      ),
    );

    return slides;
  }

  /// Navigates to Sign Up Screen when user clicks on skip or get started button
  void navigateToSignupScreen() async {
    Utils.setPrefBool(isOnBoardingScreen, true);
    Get.offNamed(RoutesName.loginScreen);
  }
}
