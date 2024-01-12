import 'package:base_flutter_provider_project/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../constants/constant.dart';
import '../../constants/local_images.dart';
import '../../ui/ChatPage/ChatRoomPage.dart';
import '../../ui/home/homepage.dart';
import '../../utils/common_functions.dart';
import '../../utils/common_textstyles.dart';
import '../../viewModel/MyTransView_Model.dart';
import 'PurchaseRequested.dart';
import 'Purchased.dart';
import 'SellRequested.dart';

class SoldPage extends StatefulWidget {
  const SoldPage({Key? key}) : super(key: key);

  @override
  State<SoldPage> createState() => _SoldPageState();
}

class _SoldPageState extends State<SoldPage> {
  @override
  Widget build(BuildContext context) {

    var deviceheight = MediaQuery.of(context).size.height;
    var devicewidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Appcolors.white,
      body: Consumer<MyTransViewModel>(
        builder:(context,purchased,child) {
          print('Purchasedddddd ${purchased.MyTransResponseModel?.data?.sold}');
          return Container(

            child: purchased.MyTransResponseModel?.data?.sold != null && purchased.MyTransResponseModel!.data!.sold!.isEmpty
                ? Center(child: Text("No Sold Stock."))
                :Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: purchased.MyTransResponseModel?.data?.sold?.length ?? 0,
                      itemBuilder: (context, index) {
                        var solddata =purchased.MyTransResponseModel?.data?.sold;
                        return  Padding(
                          padding: const EdgeInsets.only(
                              left: 18.0, right: 18, bottom: 7,top: 8),
                          child: InkWell(
                            onTap: () {
                              print('selected data sell req::: ${solddata?[index].status.toString()}');

                              EnterChat(solddata?[index].status,solddata?[index].companyName ?? "");

                            },
                            child: Container(
                              //  height: 220,
                                decoration: BoxDecoration(
                                  color: Appcolors.soldRedNew,
                                  // color: Color(items[index].colors).withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 18.0, right: 18, ),
                                  child: Column(
                                    children: [
                                      Container(
                                        child: Row(
                                          children: [
                                            Expanded(
                                                flex: 1,
                                                child: buildNamewithHeading(
                                                    devicewidth,
                                                    "Asset Name",
                                                    "${solddata?[index].companyName ?? ""}",
                                                    CustomTextStyle.txt12Rrtxtgry2,
                                                    CustomTextStyle.txt16Rmtxtblk,
                                                    Colors.transparent,null)),
                                            Expanded(
                                                flex: 1,
                                                child: buildNamewithHeading(
                                                    devicewidth,
                                                    "Status",
                                                    "${solddata?[index].statusText ?? ""}",
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
                                                    "Sell Request Date",
                                                    "${formatDate(solddata?[index].createdAt ?? "")}",
                                                    CustomTextStyle.txt12Rrtxtsoldtxtred,
                                                    CustomTextStyle.txt16Rmtxtred,
                                                    Colors.transparent,null)),
                                            Expanded(
                                              flex: 1,
                                              child:  buildNamewithHeading(
                                                devicewidth,
                                                "Sold Date",
                                                formatDate(solddata?[index].updatedAt ?? ""),
                                                  CustomTextStyle.txt12Rrtxtsoldtxtred,
                                                  CustomTextStyle.txt16Rmtxtred,
                                                Colors.transparent,
                                                null))
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
                                                  "${solddata?[index].buyshareprice ?? ""}",
                                                  CustomTextStyle.txt12Rrtxtgry2,
                                                  CustomTextStyle .txt16Rmtxtblk,
                                                  Colors.transparent,
                                                  solddata?[index].status.toString()),
                                            ),
                                          ),
                                          Expanded(
                                              flex: 1,
                                              child: ShowChat(solddata?[index].status)
                                                  ? Container(
                                             //   height: 80,
                                                // color: Colors.red.shade100,
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    SvgPicture.asset(LocalSVGImages.newchaticon,
                                                      width: 20,
                                                      height: 20,
                                                      fit: BoxFit.fill,)
                                                    //Icon(Icons.chat, size: 20,),
                                                  //  Text("(Chat Enabled)")
                                                  ],
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
                                              child:  Container(
                                                  child:  buildNamewithHeading(
                                                      devicewidth,
                                                      "Sale Value",
                                                      "${Constant.rupeeSymbol} ${solddata?[index].gtotal.toString() ?? ""}",
                                                      CustomTextStyle.txt12Rrtxtgry2,
                                                      CustomTextStyle.txt16Rmtxtblk,
                                                      Colors.transparent,
                                                      null)
                                              ),
                                          /*      child:  buildNamewithHeading(
                                                    devicewidth,
                                                    "Amount",
                                                    "${Constant.rupeeSymbol} ${solddata?[index].total ?? ""}",
                                                    CustomTextStyle.txt12Rrtxtgry2,
                                                    CustomTextStyle.txt16Rmtxtblk,
                                                    Colors.transparent,
                                                    null)*/
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(

                                            )
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )),
                          ),
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

  void EnterChat(int? status, String assetname) {
    if (status == 2 || status == 3 || status == 4) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => ChatRoomPage(chatuserID: status ?? 0,IsAdminChat: true,username: assetname,)));
    }
    else{
      //showToast("Wait For Admin Approval..");
    }
  }
}
