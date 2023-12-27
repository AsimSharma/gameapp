import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MeroColor {
  const MeroColor._();

  static const Color appThemeColor = Color(0xff0336FF);
  static const Color darkColor1 = Color(0xff292F3D);
  static const Color darkColor2 = Color(0xff2C2F3E);

  static const Color absentColor = Color(0xffF4B703);
  static const Color presentColor = Color(0xff2B8376);
  static const Color holidayColor = Color(0xffFF001F);
  static const Color halfLeave = Colors.purple;
  static const Color indicatorColor = Color(0xffFF7533);
  static const Color bodyBackgroundColor = Color(0xffF6F6F6);
  static const Color fineButtonColor = Color(0xffFF0000);
  static const Color containerColor = Color(0x330336FF);
  static const Color textColor = Color(0xff000000);
  static const Color bottomNavBarChooseColor = Color(0xffFF7533);
  static const Color confirmBookingContainerColor = Color(0xffF6F6F6);
  static const Color appreciationTextColor = Color(0xFF0336FF);
  static const Color leaveRequestAcceptColor = Color(0xFF0336FF);
  static const Color urlLinkColor = Color(0xff0336FF);
  static const Color errorColor = Color(0xffFF001F);
  static const Color successColor = Color(0xff2B8376);
  static const Color warningColor = Colors.orange;
  static const Color communityContainerColor = Color(0xff653AB6);
  static const Color khaltiColor = Color(0xff683AB7);

  /// Change Swatch Color to primary
  static statusbarTextWhite() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
  }

  static statusbarTextBlack() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
  }

  static statusBarTransparent() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.light,
    ));
  }
}
