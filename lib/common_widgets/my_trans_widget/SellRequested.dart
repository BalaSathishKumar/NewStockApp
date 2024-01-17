import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';
import '../../constants/constant.dart';
import '../../constants/local_images.dart';
import '../../ui/ChatPage/ChatRoomPage.dart';
import '../../utils/common_functions.dart';
import '../../utils/common_textstyles.dart';
import '../../viewModel/MyTransView_Model.dart';
import '../../viewModel/base_view_model/base_view_model.dart';
import '../loading_widgets/loader.dart';
import 'PurchaseRequested.dart';

class SellRequested extends StatefulWidget {
  const SellRequested({super.key});
  @override
  State<SellRequested> createState() => _SellRequestedState();
}

class _SellRequestedState extends State<SellRequested> {
  @override
  Widget build(BuildContext context) {
    var deviceheight = MediaQuery.of(context).size.height;
    var devicewidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Appcolors.white,
      body: Consumer<MyTransViewModel>(
          builder:(context,purchasereq,child) {
            return purchasereq.state == ViewState.busy ? Loader() :
            Container(
              child: purchasereq.MyTransResponseModel?.data?.sellrequest != null && purchasereq.MyTransResponseModel!.data!.sellrequest!.isEmpty
                  ? Center(child: Text("No Sell Request."))
                  :Column(
                children: [

            /*      CommonSearch(
                    hinttxt: "Search by asset name,seller name",
                    onSearchTextChanged: (text) {
                      searchItem(text,purchasereq.MyTransResponseModel?.data?.request);
                    },
                  ),*/
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      //  itemCount: items.length,
                      itemCount: purchasereq.MyTransResponseModel?.data?.sellrequest?.length ?? 0,
                      //  itemCount: apifilteredItems?.length ?? 0,
                        itemBuilder: (context, index) {
                          var purchasereqdata = purchasereq.MyTransResponseModel?.data?.sellrequest;
                         // print('apifilteredItems lengthsss ${apifilteredItems?.length}');
                        //  var purchasereqdata = apifilteredItems;
                          return Padding(
                            padding: const EdgeInsets.only(left: 18.0, right: 18, bottom: 7,top: 8),
                            child: InkWell(
                              onTap: () {
                                print('selected data sell req::: ${purchasereqdata?[index].status.toString()}');

                                EnterChat(purchasereqdata?[index].status,purchasereqdata?[index].companyName ?? "");

                              },
                              child: Container(
                                //  height: 220,
                                  decoration: BoxDecoration(
                                    color: Appcolors.soldRedNew,
                                    // color: Color(items[index].colors).withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 18.0, right: 18,),
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
                                                      "Sell Request Date",
                                                      "${formatDate(purchasereqdata?[index].createdAt ?? "")}",
                                                      CustomTextStyle.txt12Rrtxtsoldtxtred,
                                                      CustomTextStyle.txt16Rmtxtred,
                                                      Colors.transparent,null)),
                                              Expanded(
                                                flex: 1,
                                                child:    Container(
                                                /*  child: buildNamewithHeading(
                                                      devicewidth,
                                                      "Purchased From",
                                                      "${purchasereqdata?[index].dealerName ?? ""}",
                                                      CustomTextStyle.txt12Rrtxtgry2,
                                                      CustomTextStyle.txt16Rmtxtblk,
                                                      Colors.transparent,null),*/
                                                ),),
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
                                                    "${purchasereqdata?[index].buyshareprice ?? ""}",
                                                    CustomTextStyle.txt12Rrtxtgry2,
                                                    CustomTextStyle .txt16Rmtxtblk,
                                                    Colors.transparent,
                                                    purchasereqdata?[index].status.toString()),
                                              ),
                                            ),
                                            Expanded(
                                                flex: 1,
                                                child: purchasereqdata?[index].status.toString() == "2"
                                                    ? Container(
                                               //   height: 80,
                                                  // color: Colors.red.shade100,
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      //Icon(Icons.chat, size: 20,),
                                                     // Text("(Chat Enabled)")
                                                      SvgPicture.asset(LocalSVGImages.newchaticon,
                                                        width: 20,
                                                        height: 20,
                                                        fit: BoxFit.fill,)
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
                                                  child:  buildNamewithHeading(
                                                      devicewidth,
                                                      "Sale Value",
                                                      "${Constant.rupeeSymbol} ${purchasereqdata?[index].total ?? ""}",
                                                      CustomTextStyle.txt12Rrtxtgry2,
                                                      CustomTextStyle.txt16Rmtxtblk,
                                                      Colors.transparent,
                                                      null)
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Container(),
                                            /*  child: Container(
                                                  child:  buildNamewithHeading(
                                                      devicewidth,
                                                      "Final amount",
                                                      "${Constant.rupeeSymbol} ${purchasereqdata?[index].gtotal.toString() ?? ""}",
                                                      CustomTextStyle.txt12Rrtxtgry2,
                                                      CustomTextStyle.txt16Rmtxtblk,
                                                      Colors.transparent,
                                                      null)
                                              ),*/
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
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ChatRoomPage(chatuserID: status ?? 0,IsAdminChat: true,username: assetname,)));
    }
    else{
      //showToast("Wait For Admin Approval..");
    }
  }
}
