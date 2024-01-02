import 'package:base_flutter_provider_project/utils/common_textstyles.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/constant.dart';
import '../../data/models/Explore_model/ExploreModel.dart';

class ExBuySell extends StatelessWidget {
   ExBuySell({
    super.key,
    required this.devicewidth,
    required this.selectedstocks,
  });

  final double devicewidth;
  Stocks? selectedstocks;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: devicewidth,
      //color: Colors.blue.shade100,
      child: DottedBorder(
        dashPattern: [8, 4],
        strokeWidth: 1,
        color: Appcolors.kyctxtgrey,
        strokeCap: StrokeCap.square,
        borderType: BorderType.RRect,
        radius: Radius.circular(0),
        child: Container(
          height: 110,
          width: devicewidth,
         // color: Colors.blue.shade100,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              /*  Expanded(
                    flex: 1,
                    child: SizedBox()),*/
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Appcolors.txtlitegreen2.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(8.0),
                    ),

                    child: Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Buy",style: CustomTextStyle.txt16Rltxtlitegrey2,),
                    //    Text("${Constant.rupeeSymbol}22222222.17",style: CustomTextStyle.txt26Rmtxtlitegrey2,maxLines: 1,overflow: TextOverflow.ellipsis,),
                      Text("${Constant.rupeeSymbol}${selectedstocks?.buyingPrice ?? ""}",style: CustomTextStyle.txt26Rmtxtlitegrey2,maxLines: 1,overflow: TextOverflow.ellipsis,),
                        ],
                      ),
                    ),
                  ),
                ),
          /*      Expanded(
                    flex: 1,
                    child: SizedBox()),*/
                SizedBox(
                  height: 8,
                  width: 12,
                ),

                Expanded(
                  flex: 1,
                  child: Container(
                    height: 145,
                    width: 80,
                    decoration: BoxDecoration(
                        color: Appcolors.white,
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(
                            color: Appcolors.txtlitegreen2
                        ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Sell",style: CustomTextStyle.txt16Rltxtlitegrey2,),
                          Text("${Constant.rupeeSymbol}${selectedstocks?.sellingPrice ?? ""}",style: CustomTextStyle.txt26Rmtxtlitegrey2,maxLines: 1,overflow: TextOverflow.ellipsis,),
                        ],
                      ),
                    ),
                  ),
                ),
               /* Expanded(
                    flex: 1,
                    child: SizedBox()),*/
              ],
            ),
          ),
        ),
      ),
    );
  }
}