import 'package:flutter/material.dart';

import '../config/image_constants.dart';

// import '../constants/image_constants.dart';

class AppIconWidget extends StatelessWidget {
  final double size;
  final String img;
  final Color? imgColor;
  const AppIconWidget({super.key, required this.size, required this.img, this.imgColor});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: imgColor != null?Image.asset(img,
        width: size,
        color: imgColor,
      ):Image.asset(img,
        width: size,
      ));
  }
}
