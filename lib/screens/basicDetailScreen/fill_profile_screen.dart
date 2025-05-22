import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:gym_apps/config/Utils.dart';
import 'package:gym_apps/config/const.dart';
import '../../config/color_constant.dart';
import '../../config/error_message.dart';
import '../../config/string_constant.dart';
import '../../config/text_style_constant.dart';
import '../../controllers/basic_details_controller.dart';
import '../../elements/ContentText.dart';
import '../../elements/CustomButton.dart';
import '../../elements/CustomTextField.dart';
import '../../elements/custom_helper_widget.dart';
import '../../routes/routes.dart';

class FillProfileScreen extends StatefulWidget {
  const FillProfileScreen({super.key});

  @override
  State<FillProfileScreen> createState() => _FillProfileScreenState();
}

class _FillProfileScreenState extends State<FillProfileScreen> {
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
                titleName: StringConstant.fillYourProfile,
                colorConstants: ColorConstant.white2,
                fontSize: 6.w,
              ),
              SizedBox(
                height: 2.h,
              ),
              centerDescriptionContent(
                fontSize: 2.w,
                descriptionColor: ColorConstant.white,
                description: StringConstant.fillYourProfileDescription,
              ),
              SizedBox(
                height: 14.h,
              ),

              columnContent(context),

              Spacer(),

              Padding(
                padding: EdgeInsets.only(bottom: 5.h),
                child: CustomButtonWidget(
                  sizes: 6.w,
                  height: 5.6.h,
                  width: 40.w,
                  color: ColorConstant.white2,
                  bkg_color: ColorConstant.greenGradient7,
                  border_color: ColorConstant.gray4,
                  text: StringConstant.letStart,
                  onPressed: ()async{

                    if(basicDetailsController.nickNameController.text.trim().isEmpty){
                      Utils.showSnackBar(ErrorMessage.nickNameRequired);
                    }else if(basicDetailsController.phoneController.text.trim().isEmpty){
                      Utils.showSnackBar(ErrorMessage.phoneNumberRequired);
                    }else{
                      var isSuccess = await basicDetailsController.firebaseDatabaseService(context);

                      if(isSuccess == "success"){
                        Utils.showSnackBar(StringConstant.success);
                        Utils.setPrefBool(isBasicDetails, true);
                        Get.offNamed(RoutesName.homeScreen);
                      }else{
                        Utils.showSnackBar(StringConstant.fail);
                      }
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget columnContent(contexts) {
    var firebaseObject = Utils.firebaseAuth.currentUser;
    basicDetailsController.fullNameController.text =
        firebaseObject!.displayName!;
    basicDetailsController.emailController.text = firebaseObject.email!;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 1.2.w),
            child: ContentText(
                color: ColorConstant.greenGradient7,
                text: "Full Name",
                alignment: TextAlign.center,
                fontWeight: FontWeight.w600,
                textSize: 4.w),
          ),
          SizedBox(
            height: 1.2.h,
          ),
          CustomTextField(
            controller: basicDetailsController.fullNameController,
            radius: 4.w,
            height: 5.6.h,
            readOnly: true,
            fillColor: ColorConstant.white,
            borderColor: ColorConstant.white,
            // textAlign: TextAlign.start,
            hint: "John Doe",
            contentPadding:
                EdgeInsets.symmetric(vertical: 1.6.h, horizontal: 2.4.w),
            fontSize: 1.4.w,
            filled: true,
            // textAlignment: Alignment.center,
            style: TextStyleConstant.heading5Regular(contexts)
                .copyWith(fontSize: 5.2.w, fontWeight: FontWeight.w500),
          ),


          Padding(
            padding: EdgeInsets.only(left: 1.2.w,top: 2.h),
            child: ContentText(
                color: ColorConstant.greenGradient7,
                text: "Nick Name",
                alignment: TextAlign.center,
                fontWeight: FontWeight.w600,
                textSize: 4.w),
          ),
          SizedBox(
            height: 1.2.h,
          ),
          CustomTextField(
            controller: basicDetailsController.nickNameController,
            radius: 4.w,
            height: 5.6.h,
            fillColor: ColorConstant.white,
            borderColor: ColorConstant.white,
            // textAlign: TextAlign.start,
            hint: "John Doe",
            contentPadding:
                EdgeInsets.symmetric(vertical: 1.6.h, horizontal: 2.4.w),
            fontSize: 1.4.w,
            filled: true,
            // textAlignment: Alignment.center,
            style: TextStyleConstant.heading5Regular(contexts)
                .copyWith(fontSize: 5.2.w, fontWeight: FontWeight.w500),
          ),
          Padding(
            padding: EdgeInsets.only(left: 1.2.w, top: 2.h),
            child: ContentText(
                color: ColorConstant.greenGradient7,
                text: StringConstant.emailAddress,
                alignment: TextAlign.center,
                fontWeight: FontWeight.w600,
                textSize: 4.w),
          ),
          SizedBox(
            height: 1.2.h,
          ),
          CustomTextField(
            controller: basicDetailsController.emailController,
            radius: 4.w,
            height: 5.6.h,
            readOnly: true,
            fillColor: ColorConstant.white,
            borderColor: ColorConstant.white,
            // textAlign: TextAlign.start,
            hint: "Example@test.com",
            contentPadding:
                EdgeInsets.symmetric(vertical: 1.6.h, horizontal: 2.4.w),
            fontSize: 1.4.w,
            filled: true,
            // textAlignment: Alignment.center,
            style: TextStyleConstant.heading5Regular(contexts)
                .copyWith(fontSize: 5.2.w, fontWeight: FontWeight.w500),
          ),
          Padding(
            padding: EdgeInsets.only(left: 1.2.w, top: 2.h),
            child: ContentText(
                color: ColorConstant.greenGradient7,
                text: "Mobile Number",
                alignment: TextAlign.center,
                fontWeight: FontWeight.w600,
                textSize: 3.6.w),
          ),
          SizedBox(
            height: 1.2.h,
          ),
          CustomTextField(
            controller: basicDetailsController.phoneController,
            radius: 4.w,
            height: 5.6.h,
            fillColor: ColorConstant.white,
            borderColor: ColorConstant.white,
            maxLength: 10,
            hint: "9999999999",
            keyboardType: TextInputType.number,
            inputFormatter: [FilteringTextInputFormatter.digitsOnly],
            hintStyle: TextStyle(
              fontSize: 5.2.w,
              height: 0.1.h
            ),
            contentPadding:
                EdgeInsets.symmetric(vertical: 1.4.h, horizontal: 2.4.w),
            fontSize: 1.4.w,
            prefixIcon: Padding(
              padding: EdgeInsets.only(left: 2.w),
              child: Text("+91 ",style: TextStyle(
                  fontSize: 5.2.w,
                  height: 0.2.h,
                 fontWeight: FontWeight.w500
              ),),
            ),
            filled: true,
            style: TextStyleConstant.heading5Regular(contexts)
                .copyWith(fontSize: 5.2.w, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
