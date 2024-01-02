import 'package:flutter/material.dart';

import '../../constants/colors.dart';


class ParallelButtons extends StatelessWidget {
  const ParallelButtons({
    super.key,
    required this.devicewidth,
    required this.btn1name,
    required this.btn2name,
    required this.btn1onpressed,
    required this.btn2onpressed,
    required this.btn1clr,
    required this.btn1txtclr,
    required this.btn2clr,
    required this.btn2txtclr,
    required this.fontFamily,
    required this.fontSize,
  });

  final double devicewidth;
  final String btn1name;
  final String btn2name;
  final String fontFamily;
  final double fontSize;
  final Color btn1clr;
  final Color btn1txtclr;
  final Color btn2clr;
  final Color btn2txtclr;
  final VoidCallback btn1onpressed;
  final VoidCallback btn2onpressed;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        width: devicewidth,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    height: 44,
                    width: 160,
                    child: MaterialButton(
                      onPressed: btn1onpressed,
                      child: Text(
                        btn1name,
                        style: TextStyle(fontSize: fontSize, fontFamily: fontFamily),
                      ),
                      color: btn1clr,
                      textColor: btn1txtclr,
                      minWidth: 200.0,
                      height: 48.0,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Appcolors.black, width: 1.0),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    )),
                Container(
                    height: 44,
                    width: 160,
                    child: MaterialButton(
                      onPressed: btn2onpressed,
                      child: Text(
                        btn2name,
                        style: TextStyle(fontSize: fontSize, fontFamily: fontFamily),
                      ),
                      color: btn2clr,
                      textColor: btn2txtclr,
                      minWidth: 200.0,
                      height: 48.0,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Appcolors.black, width: 1.0),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    )),
              ],
            )
          ],
        ));
  }
}