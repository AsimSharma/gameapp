import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gameapp/src/constants/asset_constant.dart';
import 'package:gameapp/src/constants/color_constant.dart';
import 'package:gameapp/src/utils/extension.dart';
import 'package:gameapp/src/widgets/top_curve_image_container.dart';

class SignupSuccessPage extends StatefulWidget {
  const SignupSuccessPage({super.key});

  @override
  State<SignupSuccessPage> createState() => _SignupSuccessPageState();
}

class _SignupSuccessPageState extends State<SignupSuccessPage> {
  bool isLogin = true;
  List<String> socialAccounts = [
    AssetConstant.facebookIcon,
    AssetConstant.googleIcon,
    AssetConstant.twitterIcon,
  ];
  @override
  Widget build(BuildContext context) {
    MeroColor.statusBarTransparent();
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: MeroColor.darkColor1,
          ),
          const Positioned(
            child: TopCurveImageContainer(
              image: AssetConstant.pcGame,
            ),
          ),
          Positioned(
            top: 0.25.h(context),
            left: 0.1.w(context),
            right: 0.1.w(context),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 0.04.w(context),
                vertical: 0.03.h(context),
              ),
              decoration: BoxDecoration(
                color: MeroColor.darkColor2,
                borderRadius: BorderRadius.circular(0.01.h(context)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Image.asset(
                    AssetConstant.meroGameLogoPng,
                    filterQuality: FilterQuality.high,
                  ),
                  SizedBox(height: 0.02.h(context)),
                  Image.asset(
                    AssetConstant.success,
                    filterQuality: FilterQuality.high,
                  ),
                  SizedBox(height: 0.03.h(context)),
                  Text(
                    "Now you are registered with us.",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 0.0155.toResponsive(context),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 0.01.h(context)),
                  Container(
                    height: 0.001.h(context),
                    width: double.infinity,
                    color: Colors.white,
                  ),
                  SizedBox(height: 0.03.h(context)),
                  Text(
                    "Get ready to play.",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 0.0125.toResponsive(context),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 0.03.h(context)),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 0.05.h(context),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: MeroColor.appThemeColor,
                        borderRadius: BorderRadius.circular(0.025.h(context)),
                      ),
                      child: Text(
                        "Start Now",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 0.0145.toResponsive(context),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 0.015.h(context)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
