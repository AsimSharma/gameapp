import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gameapp/src/constants/asset_constant.dart';
import 'package:gameapp/src/constants/color_constant.dart';
import 'package:gameapp/src/pages/auth/signup_success_page.dart';
import 'package:gameapp/src/pages/home/home_page.dart';
import 'package:gameapp/src/utils/extension.dart';
import 'package:gameapp/src/widgets/custom_text_form_field.dart';
import 'package:gameapp/src/widgets/top_curve_image_container.dart';

import 'forget_password/forget_password_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Visibility(
                          visible: isLogin == false,
                          child: const CustomTextFormField(
                            prefixIcon: Icon(Icons.person_outline),
                            hintText: "Username",
                          ),
                        ),
                        const CustomTextFormField(
                          prefixIcon:  Icon(Icons.email_outlined),
                          hintText: "Email",
                        ),
                        CustomTextFormField(
                          prefixIcon: const Icon(Icons.lock_outline),
                          hintText: "Password",
                          suffixIcon: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.visibility_off),
                          ),
                        ),
                        Visibility(
                          visible: isLogin == false,
                          child: CustomTextFormField(
                            prefixIcon: const Icon(Icons.lock_outline),
                            hintText: "Confirm Password",
                            suffixIcon: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.visibility_off),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 0.02.h(context)),
                  Visibility(
                    visible: isLogin,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const ForgetPasswordPage(),
                            ),
                          );
                        },
                        child: Text(
                          "Forget Password?",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 0.013.toResponsive(context),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: isLogin == false,
                    child: Row(
                      children: [
                        Checkbox(
                          value: true,
                          onChanged: (value) {
                            log("CHeckbox Value: $value");
                          },
                        ),
                        Expanded(
                          child: Text(
                            "I agree with the terms and conditions",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 0.013.toResponsive(context),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 0.02.h(context)),
                  InkWell(
                    onTap: () {
                      isLogin
                          ? Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const HomePage()))
                          : Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const SignupSuccessPage()));
                    },
                    child: Container(
                      height: 0.045.h(context),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: MeroColor.appThemeColor,
                        borderRadius: BorderRadius.circular(0.025.h(context)),
                      ),
                      child: Text(
                        isLogin ? "Login" : "Sign Up",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 0.0125.toResponsive(context),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: isLogin,
                    child: Column(
                      children: [
                        SizedBox(height: 0.035.h(context)),
                        InkWell(
                          onTap: () {},
                          child: Text(
                            "Or by social accounts",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 0.013.toResponsive(context),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        SizedBox(height: 0.01.h(context)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            socialAccounts.length,
                            (index) => Container(
                              margin: EdgeInsets.only(left: 0.02.w(context)),
                              height: 0.05.h(context),
                              width: 0.05.h(context),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: MeroColor.appThemeColor,
                                  width: 1,
                                ),
                              ),
                              child: Image.asset(
                                socialAccounts[index],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 0.035.h(context)),
                  RichText(
                    text: TextSpan(
                      text: isLogin
                          ? "Don't have an account? "
                          : "Already have an account? ",
                      children: [
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              isLogin = !isLogin;
                              setState(() {});
                            },
                          text: isLogin ? "Sign Up" : "Login",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: MeroColor.appThemeColor,
                            fontSize: 0.013.toResponsive(context),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}