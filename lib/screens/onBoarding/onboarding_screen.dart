import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_apps/config/const.dart';
import 'package:gym_apps/screens/onBoarding/slider.dart';
import 'package:gym_apps/screens/onBoarding/widget/curve_edge_button.dart';
import 'package:gym_apps/screens/onBoarding/widget/dot_slider.dart';

import '../../app_background_wrapper.dart';
import '../../config/assets_image.dart';
import '../../config/color_constant.dart';
import '../../config/image_constants.dart';
import '../../config/string_constant.dart';
import '../../config/text_style_constant.dart';
import '../../controllers/onboarding_controller.dart';
import '../../elements/app_icon.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final OnboardingController onboardingController =
      Get.put<OnboardingController>(OnboardingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Container(
          child: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                      controller: onboardingController.pageController,
                      scrollDirection: Axis.horizontal,
                      itemCount: onboardingController.getSlides().length,
                      onPageChanged: (value) {
                        onboardingController.currentIndex.value = value;
                        onboardingController.update();
                      },
                      itemBuilder: (context, index) {
                        final slide = onboardingController.getSlides()[index];
                        return SliderForOnBoarding(
                          description: slide.description,
                          title: slide.title,
                          image: slide.image,
                          icons: slide.icons,
                        );
                      },
                    ),
                  ),
                ],
              ),
              if (onboardingController.currentIndex.value !=
                  onboardingController.getSlides().length - 1)
                SafeArea(
                  child: Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: onboardingController.navigateToSignupScreen,
                      child: Padding(
                        padding: EdgeInsets.all(5.0.w),
                        child: Text(
                          "Skip",
                          style: TextStyleConstant.heading6RegularW500(context)
                              .copyWith(color: ColorConstant.white2,fontSize: 7.0.w),
                        ),
                      ),
                    ),
                  ),
                ),
              SafeArea(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.0.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: List.generate(
                                onboardingController.getSlides().length,
                                (index) => BuildDotSlider(index: index),
                              ),
                            ),
                            const Spacer(),
                            onboardingController.currentIndex.value !=
                                    onboardingController.getSlides().length - 1
                                ? GestureDetector(
                              onTap: ()=>onboardingController.pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              ),
                                  child: AppIconWidget(
                                      size: 50.w,
                                      img: Constants.onBoardNextButton,
                                    ),
                                )
                                : GestureDetector(
                              onTap: ()=>onboardingController.navigateToSignupScreen(),
                                  child: AppIconWidget(
                                      size: 50.w,
                                      img: Constants.onBoardGetSubmitButton,
                                    ),
                                ),
                            // CurveEdgeButton(
                            //   text: onboardingController.currentIndex.value !=
                            //           onboardingController.getSlides().length -
                            //               1
                            //       ? StringConstant.nextText
                            //       : StringConstant.getStartedText,
                            //   onTap: () {
                            //     if (onboardingController.currentIndex.value !=
                            //         onboardingController.getSlides().length -
                            //             1) {
                            //       onboardingController.pageController.nextPage(
                            //         duration: const Duration(milliseconds: 300),
                            //         curve: Curves.easeInOut,
                            //       );
                            //     } else {
                            //       onboardingController.navigateToSignupScreen();
                            //     }
                            //   },
                            // ),
                          ],
                        ),
                        SizedBox(
                          height: 4.0.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
