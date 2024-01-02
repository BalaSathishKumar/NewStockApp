import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/local_images.dart';

class HomePageAppBar extends StatelessWidget {
  const HomePageAppBar({
    required this.devicewidth,
    required this.logotag,
    required this.onPressed,
    required this.onPressedmenu,
    required this.iconpath

  });

  final double devicewidth;
  final String logotag;
  final String iconpath;
  final VoidCallback onPressed;
  final VoidCallback onPressedmenu;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18.0, top: 25, right: 18),
      child: Container(
        width: devicewidth,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Hero(
                tag: logotag,
                child: Row(
                  children: [
                    SvgPicture.asset(
                        LocalSVGImages.ic_brand_logo_green,
                        height: 25,
                        width: 16),
                  ],
                ),
              ),
              Row(
                children: [
                  iconpath.isNotEmpty && iconpath != "menu"?  InkWell(
                    onTap: onPressed,

                    child: Hero(
                      tag: "search",
                      child: Row(
                        children: [
                          SvgPicture.asset(iconpath,
                              height: 30, width: 30),
                        ],
                      ),
                    ),
                  ): Container(),
                  SizedBox(width: 14),
                  iconpath.isNotEmpty || iconpath == "menu"?  InkWell(
                    onTap: onPressedmenu,

                    child: Row(
                      children: [
                        Icon(Icons.menu)
                      ],
                    ),
                  ): Container(),
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}