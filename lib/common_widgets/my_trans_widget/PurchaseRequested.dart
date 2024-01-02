import 'package:base_flutter_provider_project/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../constants/constant.dart';
import '../../constants/local_images.dart';
import '../../data/models/TransactionModel/PurchaseRequestModel.dart';
import '../../ui/ChatPage/ChatRoomPage.dart';
import '../../ui/home/homepage.dart';
import '../../utils/common_functions.dart';
import '../../utils/common_textstyles.dart';
import '../../viewModel/MyTransView_Model.dart';
import '../../viewModel/base_view_model/base_view_model.dart';
import '../loading_widgets/loader.dart';
import '../search_widgets/common_search.dart';
import 'Purchased.dart';

class PurchaseRequested extends StatefulWidget {

  PurchaseRequested({Key? key,}) : super(key: key);

  @override
  State<PurchaseRequested> createState() => _PurchaseRequestedState();
}

class _PurchaseRequestedState extends State<PurchaseRequested> {
  List<Request>? apifilteredItems = [];
  late MyTransViewModel _myTransViewModel;
  @override
  void initState() {
    super.initState();
    _myTransViewModel = Provider.of<MyTransViewModel>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _myTransViewModel.MyTransapi(onFailureRes: onFailureRes, onSuccessRes: onSuccessRes);
    });

  }

  @override
  Widget build(BuildContext context) {
    print('apifilteredItems lengthsss ${apifilteredItems?.length}');
    var deviceheight = MediaQuery.of(context).size.height;
    var devicewidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Appcolors.white,
      body: Consumer<MyTransViewModel>(
        builder:(context,purchasereq,child) {
        return purchasereq.state == ViewState.busy ? Loader() :
           Container(
             child: purchasereq.MyTransResponseModel?.data?.request != null && purchasereq.MyTransResponseModel!.data!.request!.isEmpty
                ? Center(child: Text("No Purchase Requested."))
                :Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                CommonSearch(
                  hinttxt: "Search by asset name,seller name",
                  onSearchTextChanged: (text) {
                    searchItem(text,purchasereq.MyTransResponseModel?.data?.request);
                  },
                ),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    //  itemCount: items.length,
                      //itemCount: purchasereq.MyTransResponseModel?.data?.request?.length ?? 0,
                      itemCount: apifilteredItems?.length ?? 0,
                      itemBuilder: (context, index) {
                        var purchasereqdata1 = purchasereq.MyTransResponseModel?.data?.request;
                        print('apifilteredItems lengthsss ${apifilteredItems?.length}');
                                  var purchasereqdata = apifilteredItems;
                        return Padding(
                          padding: const EdgeInsets.only(
                              left: 18.0, right: 18, bottom: 7,top: 8),
                          child: InkWell(
                            onTap: () {
                              print('selected data::: ${purchasereqdata?[index].status.toString()}');
                              EnterChat(purchasereqdata?[index].status);
                              },
                            child: Container(
                              //  height: 300,
                                decoration: BoxDecoration(
                                  color: Appcolors.purchaseGreenNew,
                                  // color: Color(items[index].colors).withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(15.0)),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 18.0, right: 18),
                                  child: Column(
                                    children: [
                                      Container(
                                        //height: 100,
                                      //  color: Colors.red,
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
                                                    "Request Date",
                                                    "${formatDate(purchasereqdata?[index].createdAt ?? "")}",
                                                    CustomTextStyle.txt12Rrtxtltegreen,
                                                    CustomTextStyle.txt16Rmtxtltegreen,
                                                    Colors.transparent,null)),
                                            Expanded(
                                                flex: 1,
                                                child: buildNamewithHeading(
                                                    devicewidth,
                                                    "Listed by",
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
                                                        child:ShowChat(purchasereqdata?[index].status)
                                                            ? Container(
                                                        //  height: 80,
                                                        // color: Colors.red.shade100,
                                                                child: Column(
                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                  children: [
                                                                    Icon(Icons.chat, size: 20,),
                                                                   // Text("(Chat Enabled)")
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
                                          child: Container(),
                                          /*  child: Container(
                                              child:  buildNamewithHeading(
                                                  devicewidth,
                                                  "Final bid amount",
                                                  "${Constant.rupeeSymbol} ${purchasereqdata?[index].gtotal.toString() ?? ""}",
                                                  CustomTextStyle.txt12Rrtxtgry2,
                                                  CustomTextStyle.txt16Rmtxtblk,
                                                  Colors.transparent,
                                                  null)
                                            ),*/
                                          ),
                                        ],
                                      ),
                                    /*  Row(
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: buildNamewithHeading(
                                                devicewidth,
                                                "Purchased share",
                                                "${Constant.rupeeSymbol} ${purchasereqdata?[index].buyshareprice ?? ""}",
                                                CustomTextStyle.txt12Rrtxtgry2,
                                                CustomTextStyle.txt16Rmtxtblk,
                                                Colors.transparent,
                                                null),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child:purchasereqdata?[index].promocode != null ? buildNamewithHeading(
                                                devicewidth,
                                                "coupon applied",
                                                "${Constant.rupeeSymbol} ${purchasereqdata?[index].discountAmount ?? ""}",
                                                CustomTextStyle.txt12Rrtxtgry2,
                                                CustomTextStyle.txt16Rmtxtblk,
                                                Colors.transparent,
                                                null):SizedBox.shrink(),
                                          ),
                                        ],
                                      )*/

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



  void EnterChat(int? status) {
    if (status == 2 || status == 3 || status == 4) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ChatRoomPage(chatuserID: status ?? 0,IsAdminChat: true,)));
    }
    else{
      showToast("Wait For Admin Approval..");
    }
  }

  void searchItem(String query, List<Request>? request) {
    print('request length::: ${request?.length}');
    apifilteredItems?.clear();
    setState(() {
      //  filteredItems2 = searchitems.where((element) => element.text.toLowerCase().contains(query.toLowerCase())).toList();
      if(request != null){
        apifilteredItems = request.where((element) => element.companyName!.toLowerCase().contains(query.toLowerCase())).toList();
      }

    });
  }

  bool addFilterData(List<Request>? request) {
    //print('status in req ${request[0].status}');
    apifilteredItems?.clear();
    if(request != null && request.isNotEmpty){
    /*  for(Request item in request){
        apifilteredItems?.add(item);
      }*/
      apifilteredItems?.addAll(request);
      return true;
    }else{
      return false;
    }

  }

  onFailureRes(String p1) {
  }

  onSuccessRes(PurchaseRequestModel? purchasereq) {
        addFilterData(purchasereq?.data?.request);
  }
}
Container buildNamewithHeading(double devicewidth,String title,String description,TextStyle st1,TextStyle st2,Color bgclr, String? status) {
  return Container(
    width: devicewidth,
    height: 60,
    color: bgclr,
   // color: Colors.green,
    child: Container(
      //color: Colors.green.shade100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                    //color: Appcolors.red,
                    child: Text(title,style: st1,maxLines: 1,overflow: TextOverflow.ellipsis,)),
              )),

          Expanded(
              flex:1,
              child: Container(
                 // color: Appcolors.goldgradient1,
                  child: Text(description,style: st2,maxLines: 1,overflow: TextOverflow.ellipsis)))
        ],
      ),
    ),
  );
}