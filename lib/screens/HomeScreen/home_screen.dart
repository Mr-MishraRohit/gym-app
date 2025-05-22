import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_apps/config/Utils.dart';
import 'package:gym_apps/config/color_constant.dart';
import 'package:gym_apps/config/const.dart';
import 'package:gym_apps/elements/ContentText.dart';

import '../../config/string_constant.dart';
import '../../elements/CustomButton.dart';
import '../../routes/routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            ContentText(
              color: ColorConstant.black45,
              text: "Home Screen",
              textSize: 10.w,
            ),
            SizedBox(height: 4.h,),
            CustomButtonWidget(
              sizes: 6.w,
              height: 5.6.h,
              width: 40.w,
              color: ColorConstant.white2,
              bkg_color: ColorConstant.greenGradient7,
              border_color: ColorConstant.gray4,
              text: "Logout",
              onPressed: ()async{
                await Utils.firebaseAuth.signOut();
                Get.toNamed(RoutesName.loginScreen);
              },
            ),
          ],
        ),
      ),
    );
  }
}
