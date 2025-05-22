import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_apps/config/const.dart';

import '../../../config/color_constant.dart';
import '../../../controllers/onboarding_controller.dart';
class BuildDotSlider extends StatelessWidget {
  final int index;
  const BuildDotSlider({super.key,required this.index});

  @override
  Widget build(BuildContext context) {
    final OnboardingController onboardingController = Get.find<OnboardingController>();
    return Obx(() =>
       Container(
        height: 12,
        width: onboardingController.currentIndex.value == index ? 27 : 12,
        margin: EdgeInsets.only(right: 1.5.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: onboardingController.currentIndex.value == index ? ColorConstant.greenGradient7:ColorConstant.greenGradient7.withOpacity(0.4),
        ),
      ),
    );
  }
}
