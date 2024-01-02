import 'package:base_flutter_provider_project/constants/colors.dart';
import 'package:base_flutter_provider_project/data/models/TransactionModel/PurchaseRequestModel.dart';
import 'package:base_flutter_provider_project/utils/common_functions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/constant.dart';
import '../../constants/local_images.dart';
import '../../ui/ChatPage/ChatRoomPage.dart';
import '../../ui/home/homepage.dart';
import '../../utils/common_textstyles.dart';
import '../../viewModel/MyTransView_Model.dart';
import 'PurchaseRequested.dart';

class Purchased extends StatefulWidget {

   Purchased({Key? key, }) : super(key: key);

  @override
  State<Purchased> createState() => _PurchasedState();
}

class _PurchasedState extends State<Purchased> {



  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    var deviceheight = MediaQuery.of(context).size.height;
    var devicewidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Appcolors.white,
      body: Consumer<MyTransViewModel>(
        builder:(context,purchased,child) {
          print('Purchasedddddd ${purchased.MyTransResponseModel?.data?.purchased}');
        return Container(
            // color: Colors.red.shade50,
            child:  purchased.MyTransResponseModel?.data?.purchased != null && purchased.MyTransResponseModel!.data!.purchased!.isEmpty
                ? Center(child: Text("No Purchased Stock."))
                :  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Expanded(
                  child: ListView.builder(
                      itemCount:  purchased.MyTransResponseModel?.data?.purchased?.length ?? 0,
                      itemBuilder: (context, index) {
                        var purchasereqdata = purchased.MyTransResponseModel?.data?.purchased;
                        return  Padding(
                          padding: const EdgeInsets.only(left: 18.0, right: 18, bottom: 7,top: 8),
                          child: Container(
                            //  height: 300,
                              decoration: BoxDecoration(color: Appcolors.purchaseGreenNew,
                                  borderRadius: BorderRadius.circular(15.0)),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 18.0, right: 18, ),
                                child: Column(
                                  children: [
                                    Container(
                                      //height: 100,
                                      // color: Colors.red,
                                      child: Row(
                                        children: [
                                          Expanded(
                                              flex: 1,
                                              child: buildNamewithHeading(
                                                  devicewidth,
                                                  "Asset Name",
                                                  "${purchasereqdata?[index].companyName ?? ""}",
                                                  CustomTextStyle.txt12Rrtxtgry2,
                                                  CustomTextStyle.txt16Rmtxtblk,
                                                  Colors.transparent,null)),
                                          Expanded(
                                              flex: 1,
                                              child: buildNamewithHeading(
                                                  devicewidth,
                                                  "Status",
                                                  "${purchasereqdata?[index].statusText ?? ""}",
                                                  CustomTextStyle.txt12Rrtxtsoldtxtred,
                                                  CustomTextStyle.txt16Rmtxtsoldtxtred,
                                                  Colors.transparent,null)),

                                        ],
                                      ),
                                    ),
                                    Container(
                                      child: Row(
                                        children: [
                                          Expanded(
                                              flex: 1,
                                              child: buildNamewithHeading(
                                                  devicewidth,
                                                  "Purchased Date",
                                                  "${formatDate(purchasereqdata?[index].createdAt ?? "")}",
                                                  CustomTextStyle.txt12Rrtxtltegreen,
                                                  CustomTextStyle.txt16Rmtxtltegreen,
                                                  Colors.transparent,null)),
                                          Expanded(
                                            flex: 1,
                                            child:    buildNamewithHeading(
                                                devicewidth,
                                                "Purchased from",
                                                "${purchasereqdata?[index].dealerName ?? ""}",
                                                CustomTextStyle.txt12Rrtxtgry2,
                                                CustomTextStyle.txt16Rmtxtblk,
                                                Colors.transparent,null),),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            child: buildNamewithHeading(
                                                devicewidth,
                                                "No of Shares",
                                                "${purchasereqdata?[index].quantity ?? ""}",
                                                CustomTextStyle.txt12Rrtxtgry2,
                                                CustomTextStyle .txt16Rmtxtblk,
                                                Colors.transparent,
                                                purchasereqdata?[index].status.toString()),
                                          ),
                                        ),
                                        Expanded(
                                            flex: 1,
                                            child: ShowChat(purchasereqdata?[index].status)
                                                ? GestureDetector(
                                              onTap: (){
                                                EnterChat(purchasereqdata?[index].status,purchasereqdata?[index].stock?.name ?? "");
                                              },
                                                  child: Container(
                                             // height: 60,
                                              // color: Colors.red.shade100,
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Icon(Icons.chat, size: 20,),
                                                ],
                                              ),
                                            ),
                                                )
                                                : SizedBox.shrink())
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                              child:  buildNamewithHeading(
                                                  devicewidth,
                                                  "Asset Value",
                                                  "${Constant.rupeeSymbol} ${purchasereqdata?[index].total ?? ""}",
                                                  CustomTextStyle.txt12Rrtxtgry2,
                                                  CustomTextStyle.txt16Rmtxtblk,
                                                  Colors.transparent,
                                                  null)
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                         /*     child:  buildNamewithHeading(
                                                  devicewidth,
                                                  "Final bid amount",
                                                  "${Constant.rupeeSymbol} ${purchasereqdata?[index].gtotal.toString() ?? ""}",
                                                  CustomTextStyle.txt12Rrtxtgry2,
                                                  CustomTextStyle.txt16Rmtxtblk,
                                                  Colors.transparent,
                                                  null)*/
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                        /*    child: buildNamewithHeading(
                                                devicewidth,
                                                "Purchased share",
                                                "${Constant.rupeeSymbol} ${purchasereqdata?[index].buyshareprice ?? ""}",
                                                CustomTextStyle.txt12Rrtxtgry2,
                                                CustomTextStyle.txt16Rmtxtblk,
                                                Colors.transparent,
                                                null),*/
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child:
                                         /* purchasereqdata?[index].promocode != null ? buildNamewithHeading(
                                              devicewidth,
                                              "coupon applied",
                                              "${Constant.rupeeSymbol} ${purchasereqdata?[index].discountAmount ?? ""}",
                                              CustomTextStyle.txt12Rrtxtgry2,
                                              CustomTextStyle.txt16Rmtxtblk,
                                              Colors.transparent,
                                              null):*/
                                          SizedBox.shrink(),
                                        ),
                                      ],
                                    )

                                  ],
                                ),
                              )),
                        );
                      }),
                )
              ],
            ),
          );
        }
      ),
    );
  }

  void EnterChat(int? status, String stockname) {
    print('status.... in purchased ${status}');
    if (status == 2 || status == 3 || status == 4) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => ChatRoomPage(chatuserID: status ?? 0,username: stockname,IsAdminChat: true,)));
    }
    else{
      showToast("Wait For Admin Approval..");
    }
  }



 /* Container buildNamewithHeading(double devicewidth,String title,String description,TextStyle st1,TextStyle st2,Color bgclr) {
                              return Container(
                                  height: 50,
                                  width: devicewidth,
                                  color: bgclr,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Flexible(child: Text(title,style: st1,maxLines: 1,overflow: TextOverflow.ellipsis,)),
                                      SizedBox(height: 10),
                                      Flexible(child: Text(description,style: st2,maxLines: 1,overflow: TextOverflow.ellipsis))
                                    ],
                                  ),
                                );
  }*/
}
ShowChat(int? status) {
  if(status == 2 || status == 3 || status == 4){
    return true;
  }else{
    return false;
  }
}