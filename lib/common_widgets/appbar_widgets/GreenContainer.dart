import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/colors.dart';
import '../../utils/common_textstyles.dart';


class GreenTopContainer extends StatelessWidget {
  const GreenTopContainer({
    super.key,
    required this.title,
    required this.imgtag,
    required this.imgurl,
    required this.onArrowpress,
    required this.onPressIcon,
  });
  final String title;
  final String imgtag;
  final String imgurl;
  final VoidCallback onPressIcon;
  final VoidCallback onArrowpress;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
              color: Appcolors.splashbgcolor2,
              border: Border(
                bottom: BorderSide(
                  color: Appcolors.black, // Border color
                  width: 1.0, // Border width
                  style: BorderStyle.solid, // Border style
                ),
              ),
            ),
            child: Column(
              mainAxisAlignment:  MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: onArrowpress,
                        child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 16.0, left: 10),
                              child: Icon(Icons.arrow_back),
                            )),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 20.0, left: 10),
                          child: Text(title, style: CustomTextStyle.txt18Rbblk),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: InkWell(
                          onTap: onPressIcon,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 20.0, left: 10),
                            child: Hero(
                              tag: imgtag,
                              child: SvgPicture.asset(imgurl,
                                  height: 25, width: 16),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}