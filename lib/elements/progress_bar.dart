import 'package:flutter/material.dart';
import 'package:gym_apps/config/color_constant.dart';
import '../config/const.dart';

class ProgressBar {

  OverlayEntry? _progressOverlayEntry;
  bool isShowing = false;

  void show(BuildContext context){

    Debug.setLog('show_progress____123');
    isShowing = true;

    _progressOverlayEntry = _createdProgressEntry(context);

    Overlay.of(context)!.insert(_progressOverlayEntry!);
  }

  void hide(){
    Debug.setLog('show_progress____12356777');
    isShowing = false;
    if(_progressOverlayEntry != null){
      _progressOverlayEntry!.remove();
      _progressOverlayEntry = null;
    }
  }

  OverlayEntry _createdProgressEntry(BuildContext context) =>
      OverlayEntry(
          builder: (BuildContext context) =>
              Stack(
                children: <Widget>[
                  Container(
                    color: Colors.black45.withOpacity(0.5),
                  ),
                  Center(
                    child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(ColorConstant.greenGradient7),backgroundColor:ColorConstant.white ,),
                  )

                ],

              )
      );

  double screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  double screenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

}
