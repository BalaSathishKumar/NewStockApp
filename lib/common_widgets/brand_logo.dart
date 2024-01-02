import 'package:base_flutter_provider_project/constants/local_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget brandLogo(BuildContext context) {
  return Stack(
    children: [
      Center(
        child: Hero(
          tag: 'brandLogo',
          child:SvgPicture.asset(LocalSVGImages.splashbg,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.fill,),
        ),
      ),
      Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child:
         Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Image.asset(LocalPNGImages.saudalogo,
                width: 300,
                height: 300,
                fit: BoxFit.fill,
             ),
           ],
         ),
      )
    ],
  );
}
