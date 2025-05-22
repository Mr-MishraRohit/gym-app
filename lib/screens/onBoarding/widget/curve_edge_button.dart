import 'package:flutter/material.dart';
import 'package:gym_apps/config/const.dart';

import '../../../config/color_constant.dart';
import '../../../config/text_style_constant.dart';

class CurveEdgeButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const CurveEdgeButton({super.key, required this.text,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 3.8.w, vertical: 3.2.w),
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(
            color: ColorConstant.black0
                .withOpacity(0.08),
            blurRadius: 3,
            offset: const Offset(1, 0),
          ),
            BoxShadow(
              color: ColorConstant.black0
                  .withOpacity(0.04),
              blurRadius: 2,
              offset: const Offset(1, 0),
            ),
            BoxShadow(
              color: ColorConstant.black0
                  .withOpacity(0.04),
              blurRadius: 12,
              offset: const Offset(0, 0),
            ),
          ],
          gradient: const LinearGradient(
            colors: [ColorConstant.blue75, ColorConstant.blue9],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(1.9.w),
          ),
        ),
        child: Text(
          text,
          style: TextStyleConstant.heading6Medium(context)
              .copyWith(color: ColorConstant.white),
        ),
      ),
    );
  }
}
