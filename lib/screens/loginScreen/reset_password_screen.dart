import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gym_apps/config/color_constant.dart';
import 'package:gym_apps/config/const.dart';
import 'package:gym_apps/config/string_constant.dart';
import 'package:gym_apps/controllers/auth_controller.dart';
import 'package:gym_apps/elements/CustomButton.dart';
import 'package:gym_apps/elements/CustomTextField.dart';
import 'package:gym_apps/routes/routes.dart';
import 'package:gym_apps/screens/loginScreen/widget/login_helper.dart';

import '../../config/text_style_constant.dart';
import '../../elements/ContentText.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  AuthController authController = Get.put(AuthController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Container(
            height: 100.h,
            width: 100.w,
            color: ColorConstant.black45,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 8.h),
                  child: headerContent(
                    titleName: StringConstant.setPassword,
                    fontSize: 6.w,
                    colorConstants: ColorConstant.honeyYellow,
                    isBackButton: true,
                    callBack: (val) {
                      Get.back();
                    },
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                centerContent(
                    titleName: StringConstant.setPassword,
                    description:
                        StringConstant.setPasswordDescription,
                    colorConstants: ColorConstant.white2,
                    descriptionColor: ColorConstant.gray4,
                    fontSize: 6.w),
                SizedBox(
                  height: 8.h,
                ),
                loginUIComponent(
                  resetPasswordContent(authController.emailController,
                      authController.passwordController, context),
                ),
                SizedBox(
                  height: 6.h,
                ),
                CustomButtonWidget(
                  sizes: 6.w,
                  height: 4.6.h,
                  width: 60.w,
                  color: ColorConstant.white2,
                  bkg_color: ColorConstant.black18.withOpacity(0.1),
                  border_color: ColorConstant.gray4,
                  text: StringConstant.resetPassword,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
