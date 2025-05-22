import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_apps/config/const.dart';
import 'package:gym_apps/config/string_constant.dart';

import '../../config/color_constant.dart';
import '../../config/image_constants.dart';
import '../../config/text_style_constant.dart';
import '../../controllers/onboarding_controller.dart';
import '../../elements/app_icon.dart';

class SliderForOnBoarding extends StatefulWidget {
  final String image, title, description,icons;

  const SliderForOnBoarding(
      {super.key,
      required this.image,
      required this.icons,
      required this.title,
      required this.description});

  @override
  State<SliderForOnBoarding> createState() => _SliderForOnBoardingState();
}

class _SliderForOnBoardingState extends State<SliderForOnBoarding> {
  final OnboardingController onboardingController =
      Get.find<OnboardingController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              widget.image,
            ),
            fit: BoxFit.cover),
      ),
      child: Center(
        child: Container(
          height: 26.h,
          width: 100.w,
          color: ColorConstant.greenGradient7,
          child: Center(

              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 2.6.h,horizontal: 2.w),
                child: Column(
                  children: [
                    AppIconWidget(img: widget.icons, size: 16.w,),
                    Spacer(),
                    Text(
                                widget.title,
                                style: TextStyle(
                    fontSize: 8.w,
                    color: ColorConstant.white,
                                  fontWeight: FontWeight.w700,
                                ),
                      textAlign: TextAlign.center,
                              ),
                  ],
                ),
              )),
        ),
      ),
    );

    //   Column(
    //   children: [
    //     Image.asset(
    //       widget.image,
    //       width: double.infinity,
    //       height: 50.0.h,
    //       fit: context.isPhone ? BoxFit.fill : BoxFit.contain,
    //     ),
    //     SizedBox(height: 3.6.h),
    //     Padding(
    //       padding: EdgeInsets.symmetric(horizontal: 5.0.w),
    //       child: Text(
    //         widget.title,
    //         style: TextStyleConstant.paragraphBodyBold(context)
    //             .copyWith(color: ColorConstant.blue8),
    //         textAlign: TextAlign.center,
    //       ),
    //     ),
    //     SizedBox(height: 3.0.h),
    //     Padding(
    //       padding: EdgeInsets.symmetric(horizontal: 4.0.w),
    //       child: Text(
    //         widget.description,
    //         style: TextStyleConstant.subtitleMedium(context)
    //             .copyWith(color: ColorConstant.gray8),
    //         textAlign: TextAlign.center,
    //       ),
    //     ),
    //   ],
    // );
  }
}
