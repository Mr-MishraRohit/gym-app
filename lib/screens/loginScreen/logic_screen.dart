import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_apps/config/Utils.dart';
import 'package:gym_apps/config/color_constant.dart';
import 'package:gym_apps/config/const.dart';
import 'package:gym_apps/config/string_constant.dart';
import 'package:gym_apps/controllers/auth_controller.dart';
import 'package:gym_apps/elements/CustomButton.dart';
import 'package:gym_apps/routes/routes.dart';
import 'package:gym_apps/screens/loginScreen/widget/login_helper.dart';
import '../../elements/ContentText.dart';

class LogicScreen extends StatefulWidget {
  const LogicScreen({super.key});

  @override
  State<LogicScreen> createState() => _LogicScreenState();
}

class _LogicScreenState extends State<LogicScreen> {
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
                      titleName: StringConstant.login,
                      fontSize: 6.w,
                      colorConstants: ColorConstant.honeyYellow,
                      callBack: (val) {}),
                ),
                SizedBox(
                  height: 8.h,
                ),
                centerContent(
                    titleName: StringConstant.welcome,
                    description: StringConstant.welcomeDescription,
                    colorConstants: ColorConstant.white2,
                    descriptionColor: ColorConstant.gray4,
                    fontSize: 6.w),
                SizedBox(
                  height: 8.h,
                ),
                loginUIComponent(
                  columnContent(
                    authController.emailController,
                    authController.passwordController,
                    context,
                    (p0) {
                      Get.toNamed(RoutesName.forgotPasswordScreen);
                    },
                  ),
                ),
                SizedBox(
                  height: 6.h,
                ),
                CustomButtonWidget(
                  sizes: 6.w,
                  height: 4.6.h,
                  width: 40.w,
                  color: ColorConstant.white2,
                  bkg_color: ColorConstant.black18.withOpacity(0.1),
                  border_color: ColorConstant.gray4,
                  text: StringConstant.login,
                  onPressed: () async {
                    // String message = '';
                    //   try {
                    //     await FirebaseAuth.instance.signInWithEmailAndPassword(
                    //       email: authController.emailController.text.trim(),
                    //       password: authController.passwordController.text.trim(),
                    //     );
                    //     Future.delayed(const Duration(seconds: 3), () {
                    //       print('success');
                    //       Get.offNamed(RoutesName.startBasicScreen);
                    //     });
                    //   } on FirebaseAuthException catch (e) {
                    //     if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
                    //       message = 'Invalid login credentials.';
                    //     } else {
                    //       message = e.code;
                    //     }
                    //     Utils.showSnackBar(message);
                    //   }

                    if (authController.emailController.text.trim().isEmpty) {
                      Utils.showSnackBar("Email field is empty.");
                    } else if (!Utils.validateEmail(
                        authController.emailController.text.trim())) {
                      Utils.showSnackBar("Invalid email format");
                    } else if (authController.passwordController.text
                        .trim()
                        .isEmpty) {
                      Utils.showSnackBar("Password field is empty.");
                    } else {
                      authController.loginWithEmailAndPassword(
                        authController.emailController.text,
                        authController.passwordController.text,
                        context,
                      );
                    }
                  },
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(bottom: 4.6.h),
                  child: GestureDetector(
                    onTap: () => Get.offNamed(RoutesName.signUpScreen),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ContentText(
                            color: ColorConstant.white2,
                            text: StringConstant.donHaveAnAccount,
                            alignment: TextAlign.center,
                            fontWeight: FontWeight.w500,
                            textSize: 3.6.w),
                        ContentText(
                            color: ColorConstant.yellow,
                            text: StringConstant.signUp,
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
