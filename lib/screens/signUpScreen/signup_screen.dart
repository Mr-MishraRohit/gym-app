import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gym_apps/config/color_constant.dart';
import 'package:gym_apps/config/const.dart';
import 'package:gym_apps/config/error_message.dart';
import 'package:gym_apps/config/string_constant.dart';
import 'package:gym_apps/controllers/auth_controller.dart';
import 'package:gym_apps/elements/CustomButton.dart';
import 'package:gym_apps/elements/CustomTextField.dart';
import 'package:gym_apps/screens/signUpScreen/widget/signup_helper.dart';
// import 'package:gym_apps/screens/loginScreen/widget/login_helper.dart';

import '../../config/Utils.dart';
import '../../config/text_style_constant.dart';
import '../../elements/ContentText.dart';
import '../../routes/routes.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
                      titleName: StringConstant.createAccount,
                      fontSize: 6.w,
                      colorConstants: ColorConstant.honeyYellow),
                ),
                SizedBox(
                  height: 4.h,
                ),
                centerContent(
                    titleName: StringConstant.letStart,
                    description: "",
                    colorConstants: ColorConstant.white2,
                    descriptionColor: ColorConstant.gray4,
                    fontSize: 6.w),
                SizedBox(
                  height: 1.h,
                ),
                loginUIComponent(
                  columnContent(
                      authController.fullNameController,
                      authController.emailController,
                      authController.passwordController,
                      authController.confirmPasswordController,
                      context),
                ),
                SizedBox(
                  height: 3.h,
                ),
                richTextWidget(),
                SizedBox(
                  height: 3.h,
                ),
                CustomButtonWidget(
                  sizes: 6.w,
                  height: 4.6.h,
                  width: 46.w,
                  color: ColorConstant.white2,
                  bkg_color: ColorConstant.black18.withOpacity(0.1),
                  border_color: ColorConstant.gray4,
                  text: StringConstant.signUp,
                  onPressed: () async {

                    if (authController.fullNameController.text.trim().isEmpty) {
                      Utils.showSnackBar(ErrorMessage.nameRequired);
                    } else if (authController.emailController.text
                        .trim()
                        .isEmpty) {
                      Utils.showSnackBar(ErrorMessage.emailRequired);
                    } else if (!Utils.validateEmail(
                        authController.emailController.text.trim())) {
                      Utils.showSnackBar(ErrorMessage.emailFormat);
                    } else if (authController.passwordController.text
                        .trim()
                        .isEmpty) {
                      Utils.showSnackBar(ErrorMessage.passwordRequired);
                    } else if (authController.confirmPasswordController.text
                        .trim()
                        .isEmpty) {
                      Utils.showSnackBar(ErrorMessage.confirmPasswordRequired);
                    } else if (authController.passwordController.text.trim() !=
                        authController.confirmPasswordController.text.trim()) {
                      Utils.showSnackBar(
                          ErrorMessage.bothPasswordUnmatched);
                    } else {
                      authController.registerWithEmailAndPassword(
                        authController.fullNameController.text,
                        authController.passwordController.text,
                        authController.emailController.text,
                        context,
                      );
                    }
                  },
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(bottom: 4.6.h),
                  child: GestureDetector(
                    onTap: () => Get.offNamed(RoutesName.loginScreen),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ContentText(
                            color: ColorConstant.white2,
                            text: StringConstant.alreadyHaveAnAccount,
                            alignment: TextAlign.center,
                            fontWeight: FontWeight.w500,
                            textSize: 3.6.w),
                        ContentText(
                            color: ColorConstant.yellow,
                            text: StringConstant.login,
                            alignment: TextAlign.center,
                            fontWeight: FontWeight.w500,
                            textSize: 3.6.w),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
