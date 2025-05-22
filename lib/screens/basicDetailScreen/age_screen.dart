import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_apps/config/const.dart';
import 'package:gym_apps/elements/ContentText.dart';
import '../../config/color_constant.dart';
import '../../config/string_constant.dart';
import '../../controllers/basic_details_controller.dart';
import '../../elements/CustomButton.dart';
import '../../elements/custom_helper_widget.dart';
import '../../routes/routes.dart';

class AgeScreen extends StatefulWidget {
  const AgeScreen({super.key});

  @override
  State<AgeScreen> createState() => _AgeScreenState();
}

class _AgeScreenState extends State<AgeScreen> {
  BasicDetailsController basicDetailsController =
      Get.put(BasicDetailsController());

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
                titleName: StringConstant.howOldAreYou,
                colorConstants: ColorConstant.white2,
                fontSize: 6.w,
              ),
              SizedBox(
                height: 2.h,
              ),
              centerDescriptionContent(
                fontSize: 2.w,
                descriptionColor: ColorConstant.white,
                description: StringConstant.howOldAreYouDescription,
              ),
              SizedBox(
                height: 6.h,
              ),
              Obx(() {
                return ContentText(
                  color: ColorConstant.white2,
                  text: basicDetailsController.selectedCurrentIndex.value,
                  textSize: 20.w,
                );
              }),
              Icon(
                Icons.arrow_drop_up,
                size: 20.w,
                color: ColorConstant.white2,
              ),
              loginUIComponent(
                Container(
                  height: 20.h,
                  child: CupertinoPicker(
                    itemExtent: 90,
                    useMagnifier: true,
                    scrollController: FixedExtentScrollController(initialItem: 18),
                    onSelectedItemChanged: (index) {
                      basicDetailsController.selectedCurrentIndex.value =
                          index.toString();
                      Debug.setLog(index.toString());
                    },
                    children: List.generate(200, (generator) {
                      return ContentText(
                        color: ColorConstant.black45,
                        text: generator.toString(),
                        textSize: 20.w,
                      );
                    }),
                  ),
                ),
              ),
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
                    Get.toNamed(RoutesName.weightScreen);
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
