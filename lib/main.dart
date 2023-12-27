import 'package:flutter/material.dart';
import 'package:gameapp/src/constants/color_constant.dart';

import 'package:gameapp/src/pages/onboarding/onboarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mero Game',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: MeroColor.appThemeColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const OnboardingPage(),
    );
  }
}
