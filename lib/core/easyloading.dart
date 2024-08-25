import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

confing(){
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.circle
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..maskType = EasyLoadingMaskType.black
    ..backgroundColor = Colors.white
    ..textColor = Colors.white
    ..indicatorColor = Color(0xFF5D9CEC)
    ..userInteractions = true
    ..dismissOnTap = false;
    /*..customAnimation = CustomAnimation();*/
}
