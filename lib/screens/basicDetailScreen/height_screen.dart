import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_apps/config/const.dart';

import '../../config/color_constant.dart';
import '../../config/string_constant.dart';
import '../../controllers/basic_details_controller.dart';
import '../../elements/ContentText.dart';
import '../../elements/CustomButton.dart';
import '../../elements/custom_helper_widget.dart';
import '../../routes/routes.dart';

class HeightScreen extends StatefulWidget {
  const HeightScreen({super.key});

  @override
  State<HeightScreen> createState() => _HeightScreenState();
}

class _HeightScreenState extends State<HeightScreen> {
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
                titleName: StringConstant.whatIsYourHeight,
                colorConstants: ColorConstant.white2,
                fontSize: 6.w,
              ),
              SizedBox(
                height: 2.h,
              ),
              centerDescriptionContent(
                fontSize: 2.w,
                descriptionColor: ColorConstant.white,
                description: StringConstant.whatIsYourHeightDescription,
              ),
              SizedBox(
                height: 12.h,
              ),

              loginUIComponent(
                Container(
                  height: 10.h,
                  child: RotatedBox(
                    quarterTurns: 3,
                    child: CupertinoPicker(
                      diameterRatio: 2.0,
                      itemExtent: 164,
                      useMagnifier: true,
                      scrollController: FixedExtentScrollController(
                          initialItem:
                              basicDetailsController.selectedHeight.value),
                      onSelectedItemChanged: (index) {
                        basicDetailsController.selectedHeight.value = index * 5;
                        Debug.setLog(index.toString());
                      },
                      children: List.generate(200, (generator) {
                        return RotatedBox(
                          quarterTurns: 1,
                          child: Center(
                            child: ContentText(
                              color: ColorConstant.black45,
                              text: (generator * 5).toString(),
                              textSize: 20.w,
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Icon(
                Icons.arrow_drop_up,
                size: 20.w,
                color: ColorConstant.white2,
              ),

              Obx(() {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 8.w),
                      child: ContentText(
                        color: ColorConstant.white2,
                        text: basicDetailsController.selectedHeight.value
                            .toString(),
                        textSize: 20.w,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8.w, left: 2.w),
                      child: ContentText(
                        color: ColorConstant.white2,
                        text: "cm",
                        textSize: 6.w,
                      ),
                    ),
                  ],
                );
              }),
              // SizedBox(
              //   height: 4.4.h,
              // ),

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
                    Get.toNamed(RoutesName.goalsScreen);
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
