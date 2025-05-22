import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_apps/config/const.dart';
import 'package:gym_apps/config/image_constants.dart';
import 'package:gym_apps/elements/app_icon.dart';

import '../../config/color_constant.dart';
import '../../config/string_constant.dart';
import '../../controllers/basic_details_controller.dart';
import '../../elements/ContentText.dart';
import '../../elements/CustomButton.dart';
import '../../elements/custom_helper_widget.dart';
import '../../routes/routes.dart';

class GoalsScreen extends StatefulWidget {
  const GoalsScreen({super.key});

  @override
  State<GoalsScreen> createState() => _GoalsScreenState();
}

class _GoalsScreenState extends State<GoalsScreen> {
  BasicDetailsController basicDetailsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
                  Get.back();
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
                titleName: StringConstant.whatIsYourGoal,
                colorConstants: ColorConstant.white2,
                fontSize: 6.w,
              ),
              SizedBox(
                height: 2.h,
              ),
              centerDescriptionContent(
                fontSize: 2.w,
                descriptionColor: ColorConstant.white,
                description: StringConstant.whatIsYourGoalDescription,
              ),
              SizedBox(
                height: 6.h,
              ),
              loginUIComponent(
                SizedBox(
                  height: 44.h,
                  child: ListView.separated(
                    itemBuilder: (BuildContext context, int index) {
                      return Obx(() {
                        return GestureDetector(
                          onTap: () {
                            basicDetailsController.selectedGoalName.value =
                                basicDetailsController.goalList[index];
                          },
                          child: Container(
                            height: 6.h,
                            width: 100.w,
                            decoration: BoxDecoration(
                              color: ColorConstant.white2,
                              borderRadius: BorderRadius.circular(8.w),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 4.w,
                                vertical: 2.h,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ContentText(
                                    color: ColorConstant.black45,
                                    text:
                                        basicDetailsController.goalList[index],
                                    textSize: 4.w,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  basicDetailsController.goalList[index] ==
                                          basicDetailsController
                                              .selectedGoalName.value
                                      ? AppIconWidget(
                                          size: 10.w,
                                          img: Constants.radioButton,
                                          imgColor:
                                              ColorConstant.greenGradient7,
                                        )
                                      : AppIconWidget(
                                          size: 10.w,
                                          img: Constants.radioButton),
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 2.h,
                      );
                    },
                    itemCount: basicDetailsController.goalList.length,
                  ),
                ),
              ),
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
                    Get.toNamed(RoutesName.physicalScreen);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
