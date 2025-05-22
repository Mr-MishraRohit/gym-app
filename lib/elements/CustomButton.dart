import 'package:flutter/material.dart';
import 'package:gym_apps/config/const.dart';

class CustomButtonWidget extends StatelessWidget {
  CustomButtonWidget({Key? key, required this.color, required this.bkg_color, required this.border_color, required this.text, required this.onPressed, this.height,this.width, this.fontWeight,this.sizes})
      : super(key: key);

  final Color color;
  final Color bkg_color;
  final Color border_color;
  final String text;
  final FontWeight? fontWeight;
  final double? sizes;
  final double? height;
  final double? width;
  final VoidCallback onPressed;

  int lastClickTime = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if (DateTime.now().millisecondsSinceEpoch - lastClickTime < 1000){
          //don't do anything
        }else{
          onPressed();
        }

        lastClickTime = DateTime.now().millisecondsSinceEpoch;
      },
      child: Container(
        // width: double.infinity,
        decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(6.w),),color: bkg_color,border: Border.all(color: border_color)),

        height: height ?? 7.2.h,
        width: width ?? 13.2.w,
        child: Center(
          child: FittedBox(
            child: Text(text,
                style: TextStyle(
                  color: color,
                  fontWeight: fontWeight ?? FontWeight.bold,
                  fontSize: sizes ?? 1.4.w,
                ),textAlign: TextAlign.center,),
          ),
        ),
      ),
    );
  }
}
