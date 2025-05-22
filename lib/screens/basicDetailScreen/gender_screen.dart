import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gym_apps/config/Utils.dart';
import 'package:gym_apps/config/assets_image.dart';
import 'package:gym_apps/config/color_constant.dart';
import 'package:gym_apps/config/const.dart';
import 'package:gym_apps/config/string_constant.dart';
import 'package:gym_apps/controllers/basic_details_controller.dart';
import 'package:gym_apps/elements/app_icon.dart';
import 'package:gym_apps/elements/custom_helper_widget.dart';

import '../../elements/ContentText.dart';
import '../../elements/CustomButton.dart';
import '../../routes/routes.dart';

class GenderScreen extends StatefulWidget {
  const GenderScreen({super.key});

  @override
  State<GenderScreen> createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
  BasicDetailsController basicDetailsController =
      Get.put(BasicDetailsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return Container(
          height: 100.h,
          width: 100.w,
          color: ColorConstant.black45,
          child: Column(
            children: [
              SizedBox(
                height: 4.h,
              ),
              headerAppBarContent(
                callBack: (val) {
                  Utils.firebaseAuth.signOut();
                  Get.offNamed(RoutesName.loginScreen);
                },
                isBackButton: true,
                fontSize: 4.w,
                colorConstants: ColorConstant.greenGradient7,
                titleName: StringConstant.Back,
              ),
              SizedBox(
                height: 4.h,
              ),
              centerBoldContent(
                titleName: StringConstant.whatsYourGender,
                colorConstants: ColorConstant.white2,
                fontSize: 6.w,
              ),
              SizedBox(
                height: 2.h,
              ),
              loginUIComponent(
                centerDescriptionContent(
                  fontSize: 2.w,
                  descriptionColor: ColorConstant.black18,
                  description: StringConstant.whatsYourGenderDescription,
                ),
              ),
              SizedBox(
                height: 6.h,
              ),
              GestureDetector(
                  onTap: () {
                    if (basicDetailsController.isFemaleGenderSelected.value) {
                      basicDetailsController.isMaleGenderSelected.value = true;
                      basicDetailsController.isFemaleGenderSelected.value =
                          false;
                      basicDetailsController.selectedCurrentGender.value =
                          "Male";
                    }
                  },
                  child: genderWidget(
                      basicDetailsController.isMaleGenderSelected.value,
                      AssetsImage.icMale,
                      true)),
              SizedBox(
                height: 6.h,
              ),
              GestureDetector(
                  onTap: () {
                    if (basicDetailsController.isMaleGenderSelected.value) {
                      basicDetailsController.isFemaleGenderSelected.value =
                          true;
                      basicDetailsController.isMaleGenderSelected.value = false;
                      basicDetailsController.selectedCurrentGender.value =
                          "Female";
                    }
                  },
                  child: genderWidget(
                      basicDetailsController.isFemaleGenderSelected.value,
                      AssetsImage.icFemale,
                      false)),

              // SizedBox(height: 4.4.h,),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(bottom: 5.h),
                child: CustomButtonWidget(
                  sizes: 6.w,
                  height: 5.6.h,
                  width: 40.w,
                  color: ColorConstant.white2,
                  bkg_color: ColorConstant.black18.withOpacity(0.1),
                  border_color: ColorConstant.gray4,
                  text: StringConstant.continues,
                  onPressed: () {
                    Get.toNamed(RoutesName.ageScreen);
                    // Get.offNamed(RoutesName.ageScreen);
                  },
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget genderWidget(isSelected, String assetsImages, bool isMale) {
    return isSelected
        ? Column(
            children: [
              Container(
                width: 30.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    20.w,
                  ),
                  color: ColorConstant.greenGradient7,
                  // border: Border.all(color: ColorConstant.white2),
                ),
                padding: EdgeInsets.symmetric(
                    vertical: 4.h, horizontal: isMale ? 8.w : 11.w),
                child: AppIconWidget(
                  img: assetsImages,
                  size: 12.w,
                  imgColor: ColorConstant.black45,
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              ContentText(
                color: ColorConstant.white2,
                text: isMale ? StringConstant.male : StringConstant.female,
                alignment: TextAlign.center,
                fontWeight: FontWeight.w500,
                textSize: 7.w,
              ),
            ],
          )
        : Column(
            children: [
              Container(
                width: 31.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    20.w,
                  ),
                  color: ColorConstant.black45,
                  border: Border.all(color: ColorConstant.white2, width: 2),
                ),
                padding: EdgeInsets.symmetric(
                    vertical: 4.h, horizontal: isMale ? 8.w : 11.w),
                child: AppIconWidget(
                  img: assetsImages,
                  size: 12.w,
                  imgColor: ColorConstant.white2,
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              ContentText(
                color: ColorConstant.white2,
                text: isMale ? StringConstant.male : StringConstant.female,
                alignment: TextAlign.center,
                fontWeight: FontWeight.w500,
                textSize: 7.w,
              ),
            ],
          );
  }
}
