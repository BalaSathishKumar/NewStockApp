import 'dart:ffi';

import 'package:base_flutter_provider_project/utils/common_textstyles.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class LgRoundedBtn extends StatelessWidget {
  final String text;
  final IconData iconData;
  final Color backgroundColor;
  final Color textColor;
  final double height;
  final double width;

  const LgRoundedBtn({
    Key? key,
    required this.text,
    required this.iconData,
    required this.backgroundColor,
    required this.textColor,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,

      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Appcolors.newgrd1,
            Appcolors.newgrd2,
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),

        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: CustomTextStyle.txt14Rbtxtblk
          ),
          SizedBox(width: 8.0),

          Icon(
            iconData,
            color: textColor,
          ),

        ],
      ),
    );
  }
}
