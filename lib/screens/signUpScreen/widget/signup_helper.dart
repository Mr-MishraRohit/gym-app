import 'package:flutter/material.dart';
import 'package:gym_apps/config/color_constant.dart';
import 'package:gym_apps/config/const.dart';
import 'package:gym_apps/config/string_constant.dart';
import 'package:gym_apps/elements/ContentText.dart';

import '../../../config/text_style_constant.dart';
import '../../../elements/CustomTextField.dart';

Widget headerContent({isBackButton = false, titleName, fontSize, colorConstants}) {
  return Container(
    child: isBackButton
        ? Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 4.w, right: 30.w),
                child: Icon(
                  Icons.arrow_back_ios_new,
                  color: colorConstants,
                  size: 6.w,
                ),
              ),
              Center(
                  child: ContentText(
                color: colorConstants,
                text: titleName,
                alignment: TextAlign.center,
                fontWeight: FontWeight.w600,
                textSize: fontSize,
              )),
            ],
          )
        : Center(
            child: ContentText(
            color: colorConstants,
            text: titleName,
            alignment: TextAlign.center,
            fontWeight: FontWeight.w600,
            textSize: fontSize,
          )),
  );
}

Widget centerContent({titleName, required String description, fontSize, colorConstants, descriptionColor}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Center(
          child: ContentText(
        color: colorConstants,
        text: titleName,
        alignment: TextAlign.center,
        fontWeight: FontWeight.w600,
        textSize: fontSize
      )),
      description.isNotEmpty?SizedBox():SizedBox(height: 4.h,),
      description.isNotEmpty?SizedBox():Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Center(
            child: ContentText(
          color: descriptionColor,
          text: description,
          alignment: TextAlign.center,
          fontWeight: FontWeight.w500,
          textSize: 3.6.w,
        )),
      ),
    ],
  );
}


Widget loginUIComponent(Widget columnWidget) {
  return Container(
    color: ColorConstant.greenGradient7,
    width: 100.w,
    padding: EdgeInsets.symmetric(horizontal: 8.w,vertical: 3.4.h),
    child: columnWidget,
  );
}

Widget richTextWidget() {
  return Text.rich(
    textAlign: TextAlign.center,
    TextSpan(
      // style: style,style
      children: [
        TextSpan(
          text: StringConstant.byContinuing,
          style: TextStyle(
            color: ColorConstant.white2,
          ),
        ),
        TextSpan(
          text: StringConstant.termsOfUse,
          style: TextStyle(
            color: ColorConstant.yellow,
          ),
        ),TextSpan(
          text: StringConstant.and,
          style: TextStyle(
            color: ColorConstant.white2,
          ),
        ),TextSpan(
          text: StringConstant.privacyPolicy,
          style: TextStyle(
            color: ColorConstant.yellow,
          ),
        ),
      ],
    ),
  );
}

Widget columnContent(fullNameController,emailController, passwordController,confirmPasswordController,contexts) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: EdgeInsets.only(left: 1.2.w),
        child: ContentText(
            color: ColorConstant.white2,
            text: StringConstant.fullName,
            alignment: TextAlign.center,
            fontWeight: FontWeight.w600,
            textSize: 3.6.w),
      ),
      SizedBox(height: 0.6.h,),
      CustomTextField(
        controller: fullNameController,
        radius: 4.w,
        height: 5.6.h,
        fillColor: ColorConstant.white,
        borderColor: ColorConstant.white,
        // textAlign: TextAlign.start,
        hint: StringConstant.johnDoe,
        contentPadding: EdgeInsets.symmetric(vertical: 1.6.h, horizontal: 2.4.w),
        fontSize: 1.4.w,
        filled: true,
        // textAlignment: Alignment.center,
        style: TextStyleConstant.heading5Regular(contexts).copyWith(fontSize: 5.2.w,fontWeight: FontWeight.w500),
      ),

      Padding(
        padding: EdgeInsets.only(left: 1.2.w,top: 2.h),
        child: ContentText(
            color: ColorConstant.white2,
            text: StringConstant.emailAddress,
            alignment: TextAlign.center,
            fontWeight: FontWeight.w600,
            textSize: 3.6.w),
      ),
      SizedBox(height: 0.6.h,),
      CustomTextField(
        controller: emailController,
        radius: 4.w,
        height: 5.6.h,
        fillColor: ColorConstant.white,
        borderColor: ColorConstant.white,
        // textAlign: TextAlign.start,
        hint: StringConstant.emailExample,
        contentPadding: EdgeInsets.symmetric(vertical: 1.6.h, horizontal: 2.4.w),
        fontSize: 1.4.w,
        filled: true,
        // textAlignment: Alignment.center,
        style: TextStyleConstant.heading5Regular(contexts).copyWith(fontSize: 5.2.w,fontWeight: FontWeight.w500),
      ),

      Padding(
        padding: EdgeInsets.only(left: 1.2.w,top: 2.h),
        child: ContentText(
            color: ColorConstant.white2,
            text: StringConstant.password,
            alignment: TextAlign.center,
            fontWeight: FontWeight.w600,
            textSize: 3.6.w),
      ),
      SizedBox(height: 0.6.h,),
      CustomTextField(
        controller: passwordController,
        radius: 4.w,
        height: 5.6.h,
        fillColor: ColorConstant.white,
        borderColor: ColorConstant.white,
        obscureText: true,
        hint: "........",
        hintStyle: TextStyle(fontSize: 8.w,),
        contentPadding: EdgeInsets.symmetric(vertical: 1.4.h, horizontal: 2.4.w),
        fontSize: 1.4.w,
        filled: true,
        style: TextStyleConstant.heading5Regular(contexts).copyWith(fontSize: 5.2.w,fontWeight: FontWeight.w500),
      ),

      Padding(
        padding: EdgeInsets.only(left: 1.2.w,top: 2.h),
        child: ContentText(
            color: ColorConstant.white2,
            text: StringConstant.confirmPassword,
            alignment: TextAlign.center,
            fontWeight: FontWeight.w600,
            textSize: 3.6.w),
      ),
      SizedBox(height: 0.6.h,),
      CustomTextField(
        controller: confirmPasswordController,
        radius: 4.w,
        height: 5.6.h,
        fillColor: ColorConstant.white,
        borderColor: ColorConstant.white,
        obscureText: true,
        hint: "........",
        hintStyle: TextStyle(fontSize: 8.w,),
        contentPadding: EdgeInsets.symmetric(vertical: 1.4.h, horizontal: 2.4.w),
        fontSize: 1.4.w,
        filled: true,
        style: TextStyleConstant.heading5Regular(contexts).copyWith(fontSize: 5.2.w,fontWeight: FontWeight.w500),
      ),
    ],
  );
}