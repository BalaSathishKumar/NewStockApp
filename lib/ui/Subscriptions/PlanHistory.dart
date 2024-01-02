import 'package:base_flutter_provider_project/data/models/DealerModels/SubscriptionDetailModel.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/constant.dart';
import '../../utils/common_functions.dart';
import '../../utils/common_textstyles.dart';


class PlanHistory extends StatelessWidget {
  final List<History> history;
   PlanHistory({
   required this.history
   });

   @override
  Widget build(BuildContext context) {
    var deviceheight = MediaQuery.of(context).size.height;
    var devicewidth = MediaQuery.of(context).size.width;
    return Container(
      width: devicewidth,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Text("Transaction History",style: CustomTextStyle.txt18Rbblk,),
            SizedBox(height: 10),
            history.isEmpty ? Center(child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("No Transaction History"),
            )): ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: history?.length,
                itemBuilder: (context,index){
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      // height: 100,
                      width: 100,
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
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("Active Plan",style: CustomTextStyle.txt14Rrtxtblktxtpurple,),
                                            SizedBox(height: 10,),
                                            Text(formatDatewithTime( history[index].startAt ?? "2023-12-22T07:16:56.000000Z"),style: CustomTextStyle.txt10Rrlitegrey,maxLines: 1,),

                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          children: [
                                            Text("${Constant.rupeeSymbol}${history[index].transactions?.total.toString()}",style: CustomTextStyle.txt14Rrtxtblktxtpurple,),
                                            SizedBox(height: 10,),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 10,),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                    flex:2,
                                    child: Text("Duration: ${formatDate( history?[index].startAt ?? "2023-12-22T07:16:56.000000Z")} to ${formatDate( history?[index].expireAt ?? "2023-12-22T07:16:56.000000Z")} ",style: CustomTextStyle.txt10Rbblk,)),
                                Expanded(
                                    flex:1,
                                    child: GestureDetector(
                                        onTap: (){
                                          saveImageOrFile(context,history?[index].invoiceUrl ?? "","pdf");
                                        },
                                        child: Text("Download invoice",style: CustomTextStyle.txt10Rrtxtblktxtpurple)))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}