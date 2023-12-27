import 'package:flutter/material.dart';
import 'package:gameapp/src/constants/asset_constant.dart';
import 'package:gameapp/src/constants/color_constant.dart';
import 'package:gameapp/src/pages/auth/login_page.dart';
import 'package:gameapp/src/utils/extension.dart';

import '../../widgets/top_curve_image_container.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  List<Map<String, String>> pageViewData = [
    {
      "title": "Your World of Bets 1",
      "desc": "Bet on matches and win exciting prizes",
    },
    {
      "title": "Your World of Bets 2",
      "desc": "Bet on matches and win exciting prizes",
    },
    {
      "title": "Your World of Bets 3",
      "desc": "Bet on matches and win exciting prizes",
    }
  ];

  int currentIndex = 0;
  PageController pageController = PageController();

  @override
  void initState() {
    MeroColor.statusBarTransparent();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Image.asset(
                  AssetConstant.footballPlaying,
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.cover,
                  height: 0.15.h(context),
                ),
                SizedBox(height: 0.01.h(context)),
                Image.asset(
                  AssetConstant.meroGameLogoPng,
                  filterQuality: FilterQuality.high,
                ),
                SizedBox(
                  height: 0.1.h(context),
                  width: 1.0.w(context),
                ),
                Container(
                  constraints: BoxConstraints(
                    maxHeight: 0.15.h(context),
                    minHeight: 0.1.h(context),
                    maxWidth: 0.8.w(context),
                  ),
                  child: PageView.builder(
                    controller: pageController,
                    onPageChanged: (value) {
                      setState(() {
                        currentIndex = value;
                      });
                    },
                    pageSnapping: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: pageViewData.length,
                    itemBuilder: (context, index) {
                      final data = pageViewData[index];
                      return Column(
                        children: [
                          Text(
                            data["title"] ?? "",
                            style: TextStyle(
                              fontSize: 0.02.toResponsive(context),
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 0.02.h(context)),
                          Text(
                            data["desc"] ?? "",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 0.014.toResponsive(context),
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 0.01.h(context),
                ),
                Row(
                  children: List.generate(
                    pageViewData.length,
                    (index) => Container(
                      margin: EdgeInsets.symmetric(horizontal: 0.01.w(context)),
                      height: 0.013.h(context),
                      width: currentIndex == index
                          ? 0.02.h(context)
                          : 0.013.h(context),
                      decoration: BoxDecoration(
                          color: currentIndex == index
                              ? MeroColor.appThemeColor
                              : Colors.grey,
                          borderRadius: BorderRadius.circular(5)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
              bottom: 0.01.h(context),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 0.9.w(context),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const LoginPage(),
                            ),
                          );
                        },
                        child: Text(
                          "Skip This",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 0.014.toResponsive(context),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          if (currentIndex != pageViewData.length - 1) {
                            currentIndex++;
                            pageController.animateToPage(
                              currentIndex,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeIn,
                            );
                          } else {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const LoginPage(),
                              ),
                            );
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 0.007.h(context),
                            horizontal: 0.1.w(context),
                          ),
                          decoration: BoxDecoration(
                            color: MeroColor.appThemeColor,
                            borderRadius: BorderRadius.circular(0.1.h(context)),
                          ),
                          child: Text(
                            currentIndex == pageViewData.length - 1
                                ? "Finish"
                                : "Next",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 0.014.toResponsive(context),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
