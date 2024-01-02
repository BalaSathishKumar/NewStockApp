import 'package:base_flutter_provider_project/data/models/DealerModels/SubscriptionDetailModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/colors.dart';
import '../../constants/constant.dart';
import '../../constants/local_images.dart';
import '../../utils/common_functions.dart';
import '../../utils/common_textstyles.dart';
import '../Dealers/select_payment.dart';

class ActivePlan extends StatelessWidget {
  final Subscriptions? subscriptions;
  ActivePlan({
    required this.subscriptions
});

  @override
  Widget build(BuildContext context) {
    var deviceheight = MediaQuery.of(context).size.height;
    var devicewidth = MediaQuery.of(context).size.width;
    return Container(
      //height: 200,
      width: devicewidth,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Appcolors.txtpurple),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  subscriptions?.subscriptionData?.startAt == null?SizedBox.shrink(): Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Active Plan",style: CustomTextStyle.txt14Rrtxtblktxtpurple,),
                            SizedBox(height: 10,),
                            Text("${subscriptions?.subscriptionData?.transactions?.durationType ?? ""} (charged ${subscriptions?.subscriptionData?.transactions?.durationType ?? ""}) -${subscriptions?.subscriptionData?.transactions?.amount ?? 0} Rs",style: CustomTextStyle.txt12Rrlitegrey,maxLines: 1,),
                            SizedBox(height: 15,),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            Text("${Constant.rupeeSymbol}${subscriptions?.subscriptionData?.transactions?.amount ?? 0}",style: CustomTextStyle.txt14Rrtxtblktxtpurple,),
                            SizedBox(height: 10,),
                            Text("per ${subscriptions?.subscriptionData?.transactions?.durationType ?? ""}",style: CustomTextStyle.txt12Rrlitegrey,),
                            SizedBox(height: 15,),
                          ],
                        ),
                      ),

                    ],
                  )
                ],
              ),
            ),
          ),
          Container(
            width: devicewidth,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      subscriptions?.subscriptionData?.startAt == null?Text(""):Icon(Icons.star,color: Colors.yellow,),
                      SizedBox(width: 10,),
                      subscriptions?.subscriptionData?.startAt == null?Text("No Subscription"): Text("Duration: ${formatDate( subscriptions?.subscriptionData?.startAt ?? "2023-12-22T07:16:56.000000Z")} to ${formatDate( subscriptions?.subscriptionData?.expireAt ?? "2023-12-22T07:16:56.000000Z")} ")
                    ],
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context) => SelectPayment()));
                    },
                    child: Container(
                      width: devicewidth,
                      // color: Colors.red.shade50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("View all plans"),
                          SizedBox(width: 10,),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Hero(
                              tag: "moreplan",
                              child: SvgPicture.asset(LocalSVGImages.viewall,
                                  height: 15, width: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}