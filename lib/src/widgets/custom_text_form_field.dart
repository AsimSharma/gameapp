import 'package:flutter/material.dart';
import 'package:gameapp/src/utils/extension.dart';

class CustomTextFormField extends StatelessWidget {
  final Widget? prefixIcon, suffixIcon;
  final String? hintText;
  const CustomTextFormField(
      {super.key, this.prefixIcon, this.suffixIcon, this.hintText});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 0.02.h(context)),
        Container(
          height: 0.05.h(context),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0.05.h(context)),
            color: Colors.white12,
          ),
          child: TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 0.01.w(context),
                vertical: 0.0035.h(context),
              ),
              prefixIcon: prefixIcon,
              hintText: hintText,
              suffixIcon: suffixIcon,
              border: InputBorder.none,
              hintStyle: const TextStyle(
                color: Colors.white70,
              ),
              suffixIconColor: Colors.white70,
              prefixIconColor: Colors.white70,
            ),
          ),
        ),
      ],
    );
  }
}
