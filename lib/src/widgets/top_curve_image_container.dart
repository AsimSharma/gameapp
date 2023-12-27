import 'package:flutter/material.dart';
import 'package:gameapp/src/utils/extension.dart';

import '../constants/asset_constant.dart';

class TopCurveImageContainer extends StatelessWidget {
  final String image;
  const TopCurveImageContainer({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.3.h(context),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.16.h(context)),
          bottomRight: Radius.circular(0.16.h(context)),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.16.h(context)),
          bottomRight: Radius.circular(0.16.h(context)),
        ),
        child: Image.asset(
          image,
          filterQuality: FilterQuality.high,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
