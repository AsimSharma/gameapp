import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:gameapp/src/constants/asset_constant.dart';
import 'package:gameapp/src/constants/color_constant.dart';
import 'package:gameapp/src/utils/extension.dart';

import '../../../widgets/custom_text_form_field.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  int currentIndex = 0;
  List<Map<String, dynamic>> pagesData = [
    {
      "image": AssetConstant.pcGame,
      "title": "Forget Your Password?",
      "description":
          "Enter your email address and we will send you a link to reset your password.",
    },
    {
      "image": AssetConstant.pcGame,
      "title": "Verification Code",
      "description":
          "We have sent a verification code to your email address. Please enter the code below.",
    },
    {
      "image": AssetConstant.pcGame,
      "title": "Set your new password",
      "description":
          "Enter your new password below. We're just being extra safe.",
    },
    {
      "image": AssetConstant.pcGame,
      "title": "Password Reset Successful",
      "description":
          "Recent password reset was successful. You can now login with your new password.",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MeroColor.darkColor1,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: MeroColor.darkColor1,
        leading: IconButton(
          onPressed: () {
            if (currentIndex == 0) {
              Navigator.pop(context);
            } else {
              setState(() {
                currentIndex = currentIndex - 1;
              });
            }
          },
          icon: const Icon(
            Icons.arrow_back_ios_outlined,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.06.w(context)),
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Visibility(
                  visible: currentIndex == 0,
                  child: _pageOne(),
                ),
                Visibility(
                  visible: currentIndex == 1,
                  child: _pageTwo(),
                ),
                Visibility(
                  visible: currentIndex == 2,
                  child: _pageThree(),
                ),
                Visibility(
                  visible: currentIndex == 3,
                  child: _pageFour(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _pageOne() {
    return Column(
      children: [
        _imageAndInformation(
          context,
          image: pagesData[currentIndex]["image"],
          title: pagesData[currentIndex]["title"],
          description: pagesData[currentIndex]["description"],
        ),
        SizedBox(height: 0.02.h(context)),
        const CustomTextFormField(
          prefixIcon: Icon(Icons.email_outlined),
          hintText: "Email",
        ),
        SizedBox(height: 0.045.h(context)),
        _button(context, name: "Send Code", onTap: () {
          setState(() {
            currentIndex = 1;
          });
        }),
      ],
    );
  }

  _pageTwo() {
    return Column(
      children: [
        SizedBox(height: 0.04.h(context)),
        _imageAndInformation(
          context,
          image: pagesData[currentIndex]["image"],
          title: pagesData[currentIndex]["title"],
          description: pagesData[currentIndex]["description"],
        ),
        SizedBox(height: 0.04.h(context)),
        VerificationCode(
          textStyle: TextStyle(
            fontSize: 0.02.toResponsive(context),
            color: Colors.white,
          ),
          keyboardType: TextInputType.number,
          autofocus: true,
          fullBorder: true,
          underlineColor: MeroColor.appThemeColor,
          length: 4,
          cursorColor: Colors.white,
          onCompleted: (String value) {
            log("Verification code completed: $value");
          },
          onEditing: (bool value) {
            log("Verification code editing: $value");
          },
        ),
        SizedBox(height: 0.04.h(context)),
        _button(context, name: "Done", onTap: () {
          setState(() {
            currentIndex = 2;
          });
        }),
      ],
    );
  }

  _pageThree() {
    return Column(
      children: [
        _imageAndInformation(
          context,
          image: pagesData[currentIndex]["image"],
          title: pagesData[currentIndex]["title"],
          description: pagesData[currentIndex]["description"],
        ),
        SizedBox(height: 0.04.h(context)),
        CustomTextFormField(
          hintText: "Password",
          prefixIcon: const Icon(Icons.lock_outline),
          suffixIcon: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.visibility_off),
          ),
        ),
        SizedBox(height: 0.01.h(context)),
        CustomTextFormField(
          hintText: "Confirm Password",
          prefixIcon: const Icon(Icons.lock_outline),
          suffixIcon: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.visibility_off),
          ),
        ),
        SizedBox(height: 0.04.h(context)),
        _button(context, name: "Change Password", onTap: () {
          setState(() {
            currentIndex = 3;
          });
        }),
      ],
    );
  }

  _pageFour() {
    return Column(
      children: [
        _imageAndInformation(
          context,
          image: pagesData[currentIndex]["image"],
          title: pagesData[currentIndex]["title"],
          description: pagesData[currentIndex]["description"],
        ),
        SizedBox(height: 0.04.h(context)),
        _button(context, name: "Continue To Login", onTap: () {
          Navigator.pop(context);
          setState(() {
            currentIndex = 0;
          });
        }),
      ],
    );
  }

  _imageAndInformation(BuildContext context,
      {String? image, String? title, String? description}) {
    return Column(
      children: [
        SizedBox(height: 0.01.h(context)),
        Image.asset(image ?? ""),
        SizedBox(height: 0.01.h(context)),
        Text(
          title ?? "",
          style: TextStyle(
            color: Colors.white,
            fontSize: 0.016.toResponsive(context),
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 0.01.h(context)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.06.w(context)),
          child: Text(
            description ?? "",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 0.011.toResponsive(context),
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }

  _button(BuildContext context,
      {required String name, required Function() onTap}) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        height: 0.045.h(context),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: MeroColor.appThemeColor,
          borderRadius: BorderRadius.circular(0.025.h(context)),
        ),
        child: Text(
          name,
          style: TextStyle(
            color: Colors.white,
            fontSize: 0.0125.toResponsive(context),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}