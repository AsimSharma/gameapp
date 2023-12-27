import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gameapp/src/utils/extension.dart';

import '../constants/color_constant.dart';

class MeroAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MeroAppBar(
      {Key? key,
      this.title,
      this.leadingIcon,
      this.widList,
      this.centerTile,
      this.onTap,
      this.colorss,
      this.txtColor})
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);
  final String? title;
  final IconButton? leadingIcon;
  final List<Widget>? widList;
  final bool? centerTile;
  final VoidCallback? onTap;
  final Color? colorss;
  final Color? txtColor;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: MeroColor.darkColor1,
        statusBarIconBrightness: Brightness.light,
      ),
      elevation: 0,
      backgroundColor: colorss ?? MeroColor.darkColor1,
      centerTitle: centerTile ?? false,
      title: GestureDetector(
        onTap: onTap,
        child: Text(
          title ?? "",
          style: TextStyle(
              fontSize: 0.016.toResponsive(context),
              color: txtColor ?? Colors.white),
        ),
      ),
      leading: leadingIcon,
      actions: widList,
      automaticallyImplyLeading: false,
    );
  }

  @override
  final Size preferredSize;
}
