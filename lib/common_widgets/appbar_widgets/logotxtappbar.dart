import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/local_images.dart';
import '../../utils/common_textstyles.dart';


class LogoTxtAppbar extends StatelessWidget {

  final String title;
  final String logotag;
  final VoidCallback onPressed;
  final VoidCallback? onMenuPressed;
  // final VoidCallback? onBackpressed;
  final bool Isportfolio;


  const LogoTxtAppbar(
      {Key? key,
        required this.title,
        required this.logotag,
        required this.Isportfolio,
      //  this.onBackpressed,
        required this.onPressed,
        this.onMenuPressed
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          title == "My Portfolio"?Container():  GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back,size: 25)),
        /*  Hero(
            tag: logotag,
            child: Row(
              children: [
                SvgPicture.asset(
                    LocalSVGImages.ic_brand_logo_green,
                    height: 18,
                    width: 16),
              ],
            ),
          ),*/
          Expanded(
              flex: 3,
              child: Center(child: Container(
           //      color: Colors.red.shade50,
                  child: Text(title,style: CustomTextStyle.txt18Rbtitlegrey,)))),
          Isportfolio ? Expanded(
            flex: 1,
            child: Container(
           //   color: Colors.red.shade50,
              child: Hero(
                tag: "addnewentry",
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: onPressed,
                        child: SvgPicture.asset(
                            LocalSVGImages.addnewntry,
                            height: 25,
                            width: 16),
                      ),
                    ),
                   // SizedBox(width: 8),
                    Expanded(
                        flex: 1,
                        child: InkWell(
                          onTap: onMenuPressed ,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Icon(Icons.menu),
                          ),
                        ))
                  ],
                ),
              ),
            ),
          ):
          Expanded(
              flex: 1,
              child: Container(
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 25,width: 16,
                      ),
                    ),
                    //SizedBox(width: 8),
                    Expanded(
                        flex: 1,
                        child: InkWell(
                          onTap:onMenuPressed ,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Icon(Icons.menu),
                          ),
                        )),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}