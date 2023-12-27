import 'package:flutter/material.dart';
import 'package:gameapp/src/utils/extension.dart';

import '../../../constants/asset_constant.dart';
import '../../../constants/color_constant.dart';

class PointsInformationContainer extends StatelessWidget {
  final String totalPoints;
  final Function onRefresh;
  const PointsInformationContainer({
    super.key,
    required this.totalPoints,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.09.h(context),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: null,
                icon: Image.asset(AssetConstant.starIcon),
              ),
              SizedBox(width: 0.03.w(context)),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "$totalPoints P",
                    style: TextStyle(
                      fontSize: 0.016.toResponsive(context),
                      fontWeight: FontWeight.bold,
                      color: MeroColor.appThemeColor,
                    ),
                  ),
                  Text(
                    "Available Points",
                    style: TextStyle(
                      fontSize: 0.0135.toResponsive(context),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
          IconButton(
            onPressed: () {
              onRefresh();
            },
            icon: Image.asset(AssetConstant.refreshIcon),
          ),
        ],
      ),
    );
  }
}
