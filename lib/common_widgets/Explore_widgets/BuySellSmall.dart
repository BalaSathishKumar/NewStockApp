import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';
import '../../ui/explore/exploreDetail.dart';
import '../../utils/common_textstyles.dart';

class SmallParallelBtn extends StatelessWidget {
  const SmallParallelBtn({
    super.key,
    required this.devicewidth,
    required this.b1hg,
    required this.b1wd,
    required this.b1txt,
    required this.b2txt,
    required this.b2hg,
    required this.b2wd,
    required this.titletxt,
    required this.buysell,
    required this.buy,
    required this.sell,
    required this.b1pressed,
    required this.b2pressed,
  });

  final double devicewidth;
  final double b1hg;
  final double b1wd;
  final double b2hg;
  final double b2wd;
  final String titletxt;
  final String b1txt;
  final String b2txt;
  final bool buysell;
  final bool buy;
  final bool sell;
  final VoidCallback b1pressed;
  final VoidCallback b2pressed;

  @override
  Widget build(BuildContext context) {
    return Consumer<buystockbutn>(
      builder:(context,buysellbtn,child) {
        print('buy::: ${buysellbtn.buy}');
        print('sell::: ${buysellbtn.sell}');

      return Container(
          height: 80,
          width: devicewidth,
          // color: Colors.redAccent.shade100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 18, right: 18),
                child: Text(
                  titletxt, style: CustomTextStyle.txt16Rb400gry,),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                    const EdgeInsets.only(top: 8.0, left: 18, right: 18),
                    child: Container(
                        height: b1hg,
                        width: b2wd,
                        child: MaterialButton(
                          onPressed: b1pressed,
                          child: Text(
                            b1txt,
                            //   style: TextStyle(fontSize: fontSize, fontFamily: fontFamily),
                          ),
                          color: buysellbtn.buy ? Appcolors.splashbgcolor : Appcolors.white,
                          textColor: Appcolors.black,
                          minWidth: 200.0,
                          height: 48.0,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                color: Appcolors.black, width: 1.0),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        )),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.only(top: 8.0, right: 18),
                    child: Container(
                        height: b2hg,
                        width: b2wd,
                        child: MaterialButton(
                          onPressed: b2pressed,
                          child: Text(
                            b2txt,
                            //   style: TextStyle(fontSize: fontSize, fontFamily: fontFamily),
                          ),
                          color: buysellbtn.sell ? Appcolors.splashbgcolor : Appcolors.white,
                          textColor: Appcolors.black,
                          minWidth: 200.0,
                          height: 48.0,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                color: Appcolors.black, width: 1.0),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        )),
                  ),
                ],
              )
            ],
          ),
        );
      }
    );
  }
}