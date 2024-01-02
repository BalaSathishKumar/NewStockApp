import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../utils/CustomBorderClipper.dart';
import '../../utils/common_textstyles.dart';

class Tentative extends StatelessWidget {
  const Tentative({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var deviceheight = MediaQuery.of(context).size.height;
    var devicewidth = MediaQuery.of(context).size.width;
    return Container(
      width: devicewidth,
      height: 300,
      child:  ClipRect(
        clipper: TopBorderClipper(20.0),
    child: DottedBorder(
    dashPattern: [8, 4],
    strokeWidth: 1,
    color: Appcolors.kyctxtgrey,
    strokeCap: StrokeCap.square,
    borderType: BorderType.RRect,
    radius: Radius.circular(0),
    child:

      Column(
        children: [
          Container(
            height: 60,
            width: devicewidth,
            //color: Colors.orange,
            child: Padding(
              padding: const EdgeInsets.only(left: 18.0, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Tentative Evaluation",
                    style: CustomTextStyle.txt16Rb,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text("as per  various sources & experts",
                      style: CustomTextStyle.txt14gpquickstatsgrey),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            height: 200,
            child: Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Column(
                children: [
                  buildTentative(devicewidth,"1", "Deserves to be around 150 Rs post IPO."),
                  buildTentative(devicewidth,  "2", "It can have an issue price of 65 Rs but open higher on listing."),
                  buildTentative(devicewidth,  "3", "At the current market cap, it is being valued at 5000 Crore."),
                ],
              ),
            ),
          )
        ],
      ),
    )
    ));
  }

  Padding buildTentative(double devicewidth, String sno, String description) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 50,
        width: devicewidth,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Flexible(
                        child: Text(
                          sno,
                      style: CustomTextStyle.txt14Rrtxtblk,
                    )),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
              width: 10,
            ),
            Expanded(
              flex: 10,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                        child: Text(description,
                            style: CustomTextStyle.txt14Rrtxtblk)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
