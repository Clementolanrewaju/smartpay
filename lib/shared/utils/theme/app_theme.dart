import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  late AppColor appColor;

  AppTheme(this.appColor);

  static AppTheme light() {
    var _appColor = const AppColor(
      backgroundColor: Color(0xffFFFFFF),
      textColor: Color(0xff000000),
      eurCardColor: Color.fromRGBO(85,20 , 59, 1),
      gdpCardColor: Color.fromRGBO(0, 0, 0, 1),
      primaryColor: Color(0xFF111827),
      secondaryColor: Color(0xffC4C4C4),
      tertiaryColor: Color(0xff555555),
      baseColor: Color(0xffFED8B8),
      outlineColor: Color(0xffE0E0E0),
      fadeColor: Color(0xff050826),
      textFieldLabelColor: Color(0xff828282),
      transactionItemIconBaseColor: Color(0xff9787BE),
      successColor: Color(0xff06B856),
      failedColor: Color(0xffE04848)
    );
    return AppTheme(_appColor);
  }

  static AppTheme dark() {
    // var _appColor = const AppColor(
    //   backgroundColor: Color(0xffFFFFFF),
    //   textColor: Color(0xff000000),
    //   primaryColor: Color(0xFF161455),
    // );
    return light();
  }
}
