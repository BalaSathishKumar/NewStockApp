import 'package:base_flutter_provider_project/common_widgets/portfolio_widgets/portfoliiotab1.dart';
import 'package:base_flutter_provider_project/constants/colors.dart';
import 'package:base_flutter_provider_project/data/models/Portfolio_model/InvestedStock.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../constants/constant.dart';
import '../../constants/local_images.dart';
import '../../constants/theme_color.dart';
import '../../ui/home/homepage.dart';
import '../../utils/common_functions.dart';
import '../../utils/common_textstyles.dart';
import '../../viewModel/portfolio_view_model.dart';
import 'MyAssetBottomSheet.dart';

class PortFolioTab2 extends StatelessWidget {




  @override
  Widget build(BuildContext context) {

    var deviceheight = MediaQuery.of(context).size.height;
    var devicewidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Appcolors.white,
      body: Consumer<MyPortfolioViewModel>(
        builder: (context,thirdpartyvm,child) {
          return Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 18.0, right: 18, top: 0),
              child: Column(
                children: [
                  thirdpartyvm.MyPortfolioResponseModel?.data?.assets == null || thirdpartyvm.MyPortfolioResponseModel!.data!.assets!.isEmpty
                      ? Container(
                    child: Column(
                      children: [
                        Container(
                          height: 80,
                          width: devicewidth,
                          // color: Colors.yellow,
                          child: Hero(
                            tag: "addgroup",
                            child: SvgPicture.asset(
                              LocalSVGImages.addentrygroup2,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Container(
                          height: 263,
                          width: devicewidth,
                          // color: Colors.yellow,
                          child: Hero(
                            tag: "notepad",
                            child: SvgPicture.asset(
                              LocalSVGImages.notepad,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Center(
                          child: Container(
                            height: 80,
                            width: devicewidth,
                            //   color: Colors.red,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 20.0, right: 20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment:
                                CrossAxisAlignment.center,
                                children: [
                                  Text("No Record Saved",
                                      style: CustomTextStyle.txt24Rbblack),
                                  Text(
                                      'Trading transactions made elsewhere can be noted within Sauda app to keep everything organized in one place.',
                                      style: CustomTextStyle
                                          .txt14Rrtxtlisttilegrey,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                      : Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 18),
                        child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 20),
                            buildFolioValue(devicewidth, Constant.rupeeSymbol, thirdpartyvm.MyPortfolioResponseModel?.data?.totalValue ?? "","TOTAL","VALUE"),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: buildRichText(
                                TextSpan(text: "MY"),
                                TextSpan(text: "RECORDS",
                                    style: CustomTextStyle.txt24Rbblack),
                                CustomTextStyle.txt24Rlblk,
                              ),
                            ),
                            ListView.builder(
                                shrinkWrap: true,
                                // itemCount: items.length,
                                physics:NeverScrollableScrollPhysics(),
                                itemCount: thirdpartyvm.MyPortfolioResponseModel?.data?.assets?.length ?? 0,
                                itemBuilder: (context, index) {
                                  var thirdpartydata = thirdpartyvm.MyPortfolioResponseModel?.data?.assets;
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, right: 8, bottom: 7),
                                    child: InkWell(
                                      onTap: () {
                                        showCustomBottomSheet(context, thirdpartydata?[index]);
                                      },
                                      child: Container(
                                          height: 100,
                                        decoration: BoxDecoration(
                                          color: SetBgColour(index),
                                          borderRadius: BorderRadius.circular(15.0),
                                        ),
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Expanded(
                                                      flex: 1,
                                                      child: Container(
                                                        height: 100,
                                                        //  color: Colors.red,
                                                        child: Column(
                                                          mainAxisAlignment: MainAxisAlignment
                                                              .center,
                                                          children: [
                                                            //  Image.asset(items[index].imageUrl,height: 35,width: 35,),
                                                            SvgPicture.asset(
                                                                LocalSVGImages
                                                                    .purpledash,
                                                                height: 5,
                                                                width: 5),
                                                          ],
                                                        ),
                                                      )),
                                                  // SizedBox(width: 5,),
                                                  Expanded(
                                                    flex: 3,
                                                    child: Container(
                                                      height: 100,
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Expanded(
                                                              flex: 1,
                                                              child: Container(
                                                                //     color: Colors.red.shade50,
                                                                  child: Column(
                                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                                    children: [
                                                                      Text(
                                                                        thirdpartydata?[index].name ?? "",
                                                                        style: CustomTextStyle
                                                                            .txt16Rb,),
                                                                    ],
                                                                  ))),

                                                          Expanded(
                                                              flex: 1,
                                                              child: Container(
                                                                // color: Colors.blue.shade50,
                                                                  child: Column(
                                                                    children: [
                                                                      Text(
                                                                        thirdpartydata?[index].notes ?? "" ,
                                                                        maxLines: 3,
                                                                        overflow: TextOverflow
                                                                            .ellipsis,
                                                                        style: CustomTextStyle
                                                                            .txt14Rlblk,),
                                                                    ],
                                                                  ))),


                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 2,
                                                    child: Container(
                                                        height: 30,
                                                        //   color: Colors.red,
                                                        child: Text(
                                                          "${Constant
                                                              .rupeeSymbol} ${thirdpartydata?[index].assetValue ?? ""}",
                                                          style: CustomTextStyle
                                                              .txt16Rb,
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        )),)
                                                ],
                                              ),


                                            ],
                                          )),
                                    ),
                                  );
                                }),
                          ],
                        ),
                    ),
                      ),

                ],
              ),
            ),
          );
        }
      ),
    );
  }

  SetBgColour(int index) {
    var chkindx = index % 2;
    if(chkindx == 0){
      return ThemeColor.Grey6;
    }else{
      return ThemeColor.Green6;
    }

  }

  void showCustomBottomSheet(BuildContext context, Assets? thirdpartydata) {

    showModalBottomSheet<void>(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16.0),
        ),
      ),
      builder: (BuildContext context) {
        return MyAssetBottomSheet(selectedstocks: null,selectedAssets: thirdpartydata,);
      },
    );
  }
}
