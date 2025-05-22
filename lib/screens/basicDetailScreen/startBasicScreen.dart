import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gym_apps/config/assets_image.dart';
import 'package:gym_apps/config/const.dart';
import 'package:gym_apps/config/string_constant.dart';
import 'package:gym_apps/elements/ContentText.dart';
import 'package:gym_apps/elements/app_icon.dart';

import '../../config/color_constant.dart';
import '../../elements/CustomButton.dart';
import '../../routes/routes.dart';
import '../loginScreen/widget/login_helper.dart';

class StartBasicScreen extends StatefulWidget {
  const StartBasicScreen({super.key});

  @override
  State<StartBasicScreen> createState() => _StartBasicScreenState();
}

class _StartBasicScreenState extends State<StartBasicScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 100.h,
        width: 100.w,
        color: ColorConstant.black45,
        child: Column(
          children: [
            AppIconWidget(
              size: 100.w,
              img: AssetsImage.letContinueScreen,
            ),
            SizedBox(
              height: 2.h,
            ),
            ContentText(
              color: ColorConstant.yellow,
              text: StringConstant.donGiveUP,
              textSize: 9.w,
              alignment: TextAlign.center,
            ),
            SizedBox(
              height: 2.h,
            ),
            loginUIComponent(
              ContentText(
                color: ColorConstant.black18,
                text: StringConstant.donGiveUPDescription,
                textSize: 3.w,
                alignment: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            CustomButtonWidget(
              sizes: 6.w,
              height: 4.6.h,
              width: 40.w,
              color: ColorConstant.white2,
              bkg_color: ColorConstant.black18.withOpacity(0.1),
              border_color: ColorConstant.gray4,
              text: StringConstant.nextText,
              onPressed: () {
                Get.offNamed(RoutesName.genderScreen);
              },
            ),
          ],
        ),
      ),
    );
  }
}
