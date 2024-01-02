import 'package:base_flutter_provider_project/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../utils/common_textstyles.dart';

class RedeemRewardListtile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imgtag;
  final String trailingImage;
  final VoidCallback onPressed;
  final VoidCallback onYesPressed;
  final bool redeemStatus;

  RedeemRewardListtile({
    required this.title,
    required this.subtitle,
    required this.imgtag,
    required this.trailingImage,
    required this.onPressed,
    required this.onYesPressed,
    required this.redeemStatus,
  });

  @override
  Widget build(BuildContext context) {
    var deviceheight =MediaQuery.of(context).size.height;
    var devicewidth =    MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 125,
        width: devicewidth,

        decoration: BoxDecoration(
          //color: Colors.red.shade50,
          borderRadius: BorderRadius.circular(8)
        ),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                height: 125,
                width: 90,

                decoration: BoxDecoration(
                 //   color: Colors.yellow.shade50,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                        bottomRight: Radius.circular(8),
                        bottomLeft: Radius.circular(8)),
                    image: DecorationImage(
                     // image: AssetImage( items[index].imageUrl,),
                        image: NetworkImage(
                          trailingImage,),
                      fit: BoxFit.fill,
                    )),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              flex: 3,
              child: Container(
                  width: devicewidth,
               //   color: Colors.red.shade50,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(subtitle,style: CustomTextStyle.txt16Rmtxtblk,
                          maxLines: 2,overflow: TextOverflow.ellipsis,),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Consumes $title credits",style:CustomTextStyle.txt12Rmtxtlisttilegrey, maxLines: 2,overflow: TextOverflow.ellipsis,),
                                SizedBox(height: 6),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: !redeemStatus ?GestureDetector(
                                        onTap: (){
                                          RedeemRewardpopUp(context,title,devicewidth,onYesPressed);
                                          },
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            height: 30,
                                            width: 80,
                                            decoration: const BoxDecoration(
                                              color: Colors.red,
                                              borderRadius: BorderRadius.all(Radius.circular(8))
                                            ),
                                            child: Center(child: Text("Redeem Now",style: TextStyle(color: Colors.white,fontSize: 10),)),
                                          ),
                                        ),
                                      ):SizedBox.shrink(),
                                    ),


                                    Expanded(
                                      flex: 1,
                                      child: redeemStatus? Center(
                                        child: GestureDetector(
                                            onTap: onPressed,
                                            child: Text("Download",style: CustomTextStyle.txt10RrtxtblkUL,)),
                                      ) : SizedBox.shrink(),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),

                        ],
                      ),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
void RedeemRewardpopUp(BuildContext context, String points, double devicewidth,VoidCallback onPressed) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Container(
              height: 40,
              color: Colors.white,
              width: devicewidth,
              child: Column(
                children: [
                  Text("To Redeem this Reward it will consume $points credit points.",textAlign: TextAlign.center),
                ],
              )),
          titleTextStyle: CustomTextStyle.txt16Rb,
        //  actionsOverflowButtonSpacing: 20,
        //  actionsOverflowAlignment: OverflowBarAlignment.center,
          actions: [
            Container(
              color: Colors.white,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                  height: 100,
                  width: 250,
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            flex:1,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  height: 44,
                                  //width: 160,
                                  child: MaterialButton(
                                    onPressed: onPressed,
                                    child: Text(
                                      "Yes",),
                                    color: Appcolors.splashbgcolor,
                                    textColor: Colors.black,
                                    minWidth: 200.0,
                                    height: 48.0,
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(color: Appcolors.black, width: 1.0),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                  )),
                            ),
                          ),
                          Expanded(
                            flex:1,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  height: 44,
                                // width: 160,
                                  child: MaterialButton(
                                    onPressed: (){
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      "No",
                                    ),
                                    color: Appcolors.black,
                                    textColor: Colors.white,
                                    minWidth: 200.0,
                                    height: 48.0,
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(color: Appcolors.black, width: 1.0),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                  )),
                            ),
                          ),
                        ],
                      )
                    ],
                  ))
                ],
              ),
            ),


          ],
          content: Container(
            height: 80,
            color: Colors.white,
            width: devicewidth,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(height: 8,),
                Text("The points will be reduced from your credits",style: CustomTextStyle.txt10Rrlitegrey),
                Text("Are you sure to continue?",style: CustomTextStyle.txt16Rb,),

              ],
            ),
          ),
        );
      });
}