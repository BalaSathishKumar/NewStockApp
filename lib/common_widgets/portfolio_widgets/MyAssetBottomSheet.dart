
import 'package:base_flutter_provider_project/data/models/dashboard_model/DashboardResponseModel.dart';
import 'package:base_flutter_provider_project/ui/TransactionHistory/TransactionHistory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';
import '../../constants/local_images.dart';
import '../../data/models/Portfolio_model/InvestedStock.dart';
import '../../ui/explore/exploreDetail.dart';
import '../../ui/home/StockHome.dart';
import '../../utils/common_functions.dart';
import '../../utils/common_textstyles.dart';
import '../../viewModel/dashboard_view_model.dart';
import '../Stock_widgets/StockSections.dart';
import '../button_widgets/LGgRoundedBtn.dart';

class MyAssetBottomSheet extends StatelessWidget {
  final Invested? selectedstocks;
  final Assets? selectedAssets;

  const MyAssetBottomSheet({Key? key,

    required this.selectedstocks,this.selectedAssets})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var deviceheight = MediaQuery.of(context).size.height;
    var devicewidth = MediaQuery.of(context).size.width;
    return Container(

      decoration: BoxDecoration(
        // color: Colors.green.shade100,
          color: Appcolors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(23.0),
            topRight: Radius.circular(23.0),
          )),
      child:   Consumer<DashboardViewModel>(
    builder: (context, dashStocks, child) {
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 18.0, right: 18),
          child: Column(
            children: [
              Container(
                height: 50,
                width: devicewidth,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(23.0),
                      topRight: Radius.circular(23.0),
                    )),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.close, color: Appcolors.black, size: 25,))
                    ],
                  ),
                ),
              ),
              Container(
                height: 80,
                width: devicewidth,
                //   color: Colors.yellow,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      //             color: Colors.red,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Text(selectedAssets != null ?selectedAssets?.name ?? "": selectedstocks?.companyName ?? "",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: CustomTextStyle.txt24Rbblack,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 10),
                              selectedAssets != null ? SizedBox.shrink(): InkWell(
                                onTap: () {
                                  print('selected stock in asset ${selectedstocks?.stock?.category?.categoryName}');
                                   Provider.of<DropOptions>(context, listen: false).getDropOPtionsStockid(selectedstocks?.stock?.id);
                               //  Provider.of<DropOptions>(context, listen: false).getDropOPtions(SetCat(dashStocks.dashboardResponseModel?.data?.category, selectedstocks?.stock?.category?.id));
                                  Provider.of<DropOptions>(context, listen: false).getDropStocks(null);
                                 Navigator.push(context, MaterialPageRoute(builder: (context) => ExploreDetail(selectedstocks: selectedstocks?.stock, isExplore: true,)));
                                },
                                child: SvgPicture.asset(
                                    LocalSVGImages.mailredirect,
                                    height: 15, width: 15),
                              ),
                            ],
                          ),
                          Container(
                            width: devicewidth / 2,
                            child: Divider(
                              color: Appcolors.txtpurple,
                            ),
                          ),
                          selectedAssets != null ? SizedBox.shrink(): Text(selectedstocks?.dealerName ?? "",
                            style: CustomTextStyle.txt18Rltxtpur,
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildQuickStat(devicewidth, selectedAssets != null ?"No. shares owned":"Shares Held", selectedAssets != null ?selectedAssets?.noOfShares.toString() ?? "":"${selectedstocks?.buyShareSize ?? ""}",
                      selectedAssets != null ?"Asset Value": "Value", selectedAssets != null ?selectedAssets?.assetValue.toString() ?? "":"Rs ${selectedstocks?.total ?? ""}"),
                  buildQuickStat(devicewidth, "Date of Purchase", selectedAssets != null ? formatDate(selectedAssets?.purchaseDate ?? ""):formatDate(selectedstocks?.createdAt ?? ""),
                      selectedAssets != null ?"Purchased From":"Seller/Broker", selectedAssets != null ?selectedAssets?.purchaseFrom ?? "":selectedstocks?.dealerName ?? ""),
                  buildQuickStat(devicewidth, selectedAssets != null ?"Additional Notes":"Paid via", selectedAssets != null ?selectedAssets?.notes ?? "":selectedstocks?.payment ?? "", "", ""),
                ],
              ),
              selectedAssets != null ?
              Container(
                  height: 110,
                  width: devicewidth): Container(
                  height: 140,
                  width: devicewidth,
                  //  color: Colors.red,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          print('Trans history clicked');
                          // context.router.push(const Transactionhistory());
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => TransactionHistory()));
                        },
                        child: Container(
                          height: 50,
                          width: devicewidth / 2 + 20,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 0, right: 0),
                            child: LgRoundedBtn(
                              height: 0,
                              width: 0,
                              text: 'View Transaction History',
                              iconData: Icons.arrow_forward,
                              backgroundColor: Appcolors.txtlitegreen2,
                              textColor: Appcolors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      );
    }
      ),
    );
  }

  Container buildQuickStat(double devicewidth,String title1,String subtitle1,String title2,String subtitle2)  {
    return Container(
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
                  Flexible(child: Text(title1,style: CustomTextStyle.txt14gpquickstatsgrey,maxLines: 1,overflow: TextOverflow.ellipsis)),
                  SizedBox(height: 10,),
                  Flexible(child: Text(subtitle1,style: CustomTextStyle.txt14Rbtxtblk,maxLines: 1,overflow: TextOverflow.ellipsis,)),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
            width: 20,
          ),
          Expanded(
            flex: 1,

            child: Container(

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(child: Text(title2,style: CustomTextStyle.txt14gpquickstatsgrey)),
                  SizedBox(height: 10,),
                  Flexible(child: Text(subtitle2,style: CustomTextStyle.txt14Rbtxtblk)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }


}
