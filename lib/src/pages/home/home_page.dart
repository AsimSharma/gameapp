import 'package:flutter/material.dart';
import 'package:gameapp/src/constants/asset_constant.dart';
import 'package:gameapp/src/constants/color_constant.dart';
import 'package:gameapp/src/pages/auth/login_page.dart';
import 'package:gameapp/src/utils/extension.dart';
import 'package:gameapp/src/widgets/mero_appbar.dart';

import 'widgets/points_information_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> games = [
    {
      "image": AssetConstant.quizImage,
      "title": "Quiz",
    },
    {
      "image": AssetConstant.wordSearchImage,
      "title": "Word Search",
    },
    {
      "image": AssetConstant.dailySpinImage,
      "title": "Daily Spin",
    },
    {
      "image": AssetConstant.drawingImage,
      "title": "Drawing",
    },
    {
      "image": AssetConstant.flashCardImage,
      "title": "Flash Card",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MeroColor.darkColor1,
      appBar: MeroAppBar(
        title: "Mero Game",
        widList: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (_) => const LoginPage()));
            },
            icon: const Icon(
              Icons.logout_outlined,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0.015.toResponsive(context)),
        child: Column(
          children: [
            PointsInformationContainer(
              totalPoints: '1024',
              onRefresh: () {},
            ),
            SizedBox(height: 0.02.h(context)),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: games.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {},
                    child: Container(
                      constraints: BoxConstraints(
                        maxHeight: 0.15.h(context),
                        maxWidth: 0.35.w(context),
                        minWidth: 0.35.w(context),
                      ),
                      margin: (index % 2 == 0)
                          ? EdgeInsets.only(right: 0.015.w(context), top: 10)
                          : EdgeInsets.only(left: 0.015.w(context), top: 10),
                      decoration: BoxDecoration(
                        color: MeroColor.appThemeColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Expanded(child: Image.asset(games[index]['image'])),
                          Text(
                            games[index]['title'],
                            style: TextStyle(
                              fontSize: 0.013.toResponsive(context),
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 0.03.h(context)),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: MeroColor.darkColor1,
        selectedItemColor: MeroColor.appThemeColor,
        selectedFontSize: 0.015.toResponsive(context),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_outlined),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
