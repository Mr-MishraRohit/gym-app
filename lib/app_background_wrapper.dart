import 'package:flutter/cupertino.dart';

import 'config/color_constant.dart';

class AppBackgroundWrapper extends StatelessWidget {
  const AppBackgroundWrapper({
    super.key,
    required this.child,
    this.backgroundImage,
  });

  final String? backgroundImage;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorConstant.white2,
        image: backgroundImage != null
            ? DecorationImage(
                image: AssetImage(backgroundImage!),
                fit: BoxFit.cover,
              )
            : null,
      ),
      child: child,
    );
  }
}
