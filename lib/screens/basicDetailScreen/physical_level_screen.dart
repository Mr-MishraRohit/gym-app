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

class PhysicalLevelScreen extends StatefulWidget {
  const PhysicalLevelScreen({super.key});

  @override
  State<PhysicalLevelScreen> createState() => _PhysicalLevelScreenState();
}

class _PhysicalLevelScreenState extends State<PhysicalLevelScreen> {
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
                titleName: StringConstant.physicalActivityLevel,
                colorConstants: ColorConstant.white2,
                fontSize: 6.w,
              ),
              SizedBox(
                height: 2.h,
              ),
              centerDescriptionContent(
                fontSize: 2.w,
                descriptionColor: ColorConstant.white,
                description: StringConstant.physicalActivityLevelDescription,
              ),
              SizedBox(
                height: 14.h,
              ),
              SizedBox(
                height: 44.h,
                width: 80.w,
                child: ListView.separated(
                  itemBuilder: (BuildContext context, int index) {
                    return Obx(() {
                      return GestureDetector(
                        onTap: () {
                          basicDetailsController.selectedPhysicalName.value =
                              basicDetailsController.physicalList[index];
                        },
                        child: Container(
                          height: 8.h,
                          width: 80.w,
                          decoration: BoxDecoration(
                            color: basicDetailsController.physicalList[index] ==
                                    basicDetailsController
                                        .selectedPhysicalName.value
                                ? ColorConstant.greenGradient7
                                : ColorConstant.white2,
                            borderRadius: BorderRadius.circular(8.w),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 4.w,
                              vertical: 2.h,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ContentText(
                                  color: basicDetailsController
                                              .physicalList[index] ==
                                          basicDetailsController
                                              .selectedPhysicalName.value
                                      ? ColorConstant.white2
                                      : ColorConstant.black45,
                                  text: basicDetailsController
                                      .physicalList[index],
                                  textSize: 6.w,
                                  fontWeight: FontWeight.w600,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    });
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 3.h,
                    );
                  },
                  itemCount: basicDetailsController.physicalList.length,
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
                    Get.toNamed(RoutesName.fillYourProfileScreen);
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
