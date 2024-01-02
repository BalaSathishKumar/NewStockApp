import 'package:base_flutter_provider_project/data/models/Explore_model/ExploreDetailModel.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';
import '../../utils/CustomBorderClipper.dart';
import '../../utils/common_textstyles.dart';
import '../../viewModel/explore_detail_view_model.dart';

class FinancialInfo extends StatelessWidget {


final List<String> particularList = [];
  @override
  Widget build(BuildContext context) {


    var deviceheight = MediaQuery.of(context).size.height;
    var devicewidth = MediaQuery.of(context).size.width;
    return Container(
        width: devicewidth,
       // height: 500,
      //  color: Colors.red,
        child: ClipRect(
            clipper: TopBorderClipper(20.0),
            child: DottedBorder(
              dashPattern: [8, 4],
              strokeWidth: 1,
              color: Appcolors.kyctxtgrey,
              strokeCap: StrokeCap.square,
              borderType: BorderType.RRect,
              radius: Radius.circular(0),
              child: Consumer<ExploreDetailViewModel>(
    builder: (context, expDetaildata, child) {
      return
        Column(
          children: [
            Container(
             // height: 100,
              width: devicewidth,
              child: Padding(
                padding: const EdgeInsets.only(left: 18.0, top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      expDetaildata.exploredetailModel?.stocks?.financialTitle ?? "",
                      style: CustomTextStyle.txt16Rb,
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 58.0),
                      child: Container(
                       // height: 50,
                        child: Text(
                            "The company issued 10 bonus shares for every share held on 28th October 2021 and also sub-divided equity shares from FV 10 to FV 1.",
                            style: CustomTextStyle.txt14gpquickstatsgrey),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            // buildYears(devicewidth,"2021", "2022"),
                expDetaildata.exploredetailModel?.stocks?.financialInformation != null  && expDetaildata.exploredetailModel!.stocks!.financialInformation!.isNotEmpty ?
                buildFinancialInfo(
                devicewidth,
                "",
                "",
              //  expDetaildata.exploredetailModel?.stocks?.financialInformation?[0].data?[0].year ?? "",
                    ChkFinanceData(expDetaildata.exploredetailModel?.stocks?.financialInformation,"year",0) ?? "",
                    ChkFinanceData(expDetaildata.exploredetailModel?.stocks?.financialInformation,"year",1) ?? "",
                   ChkFinanceData(expDetaildata.exploredetailModel?.stocks?.financialInformation,"year",2) ?? "",

              //  expDetaildata.exploredetailModel?.stocks?.financialInformation?[0].data?[1].year ?? "",
                    //expDetaildata.exploredetailModel?.stocks?.financialInformation?[0].data?[2].year ?? "",

                Appcolors.white): Container(),

            expDetaildata.exploredetailModel?.stocks?.financialInformation != null  &&
                expDetaildata.exploredetailModel!.stocks!.financialInformation!.isNotEmpty ?
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Container(
                width: devicewidth,
               // height: 320,
              //  color: Colors.red.shade50,
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: expDetaildata.exploredetailModel?.stocks?.financialInformation
                        ?.length ?? 0,
                    itemBuilder: (context, index) {
                      return buildFinancialInfo(
                          devicewidth,
                          expDetaildata.exploredetailModel?.stocks?.financialInformation?[index].particulars ?? "",
                          "",
                        //  expDetaildata.exploredetailModel?.stocks?.financialInformation?[index].data?[0].value ?? "",
                          ChkFinanceValues(expDetaildata.exploredetailModel?.stocks?.financialInformation?[index],0),
                       //   expDetaildata.exploredetailModel?.stocks?.financialInformation?[index].data?[1].value ?? "",
                          ChkFinanceValues(expDetaildata.exploredetailModel?.stocks?.financialInformation?[index],1),
                         // expDetaildata.exploredetailModel?.stocks?.financialInformation?[index].data?[2].value ?? "",
                       ChkFinanceValues(expDetaildata.exploredetailModel?.stocks?.financialInformation?[index],2),
                          setbgClr(index) );
                    }),
              ),
            ) : Container()
          ],
        );
    }
              ),
            )));
  }


  Container buildYears(double devicewidth, String year1, String year2) {
    return Container(
                  height: 30,
                  width: devicewidth,

                  child:  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 50,
                      width: devicewidth,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              height: 50,
                              child: Column(),
                            ),
                          ),

                          Expanded(
                            flex: 1,
                            child: Container(
                              height: 50,
                              child: Row(
                                //  crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                      flex: 1,
                                      child: Container(
                                        height: 50,
                                        child: Center(
                                          child: Text(year1,
                                              style: CustomTextStyle.txt14Rbtxtblk),
                                        ),
                                      )),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Expanded(
                                      flex: 1,
                                      child: Container(
                                        height: 50,
                                        child: Center(
                                          child: Text(year2,
                                              style: CustomTextStyle.txt14Rbtxtblk),
                                        ),
                                      )),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Expanded(
                                      flex: 1,
                                      child: Container(
                                        height: 50,
                                        child: Center(
                                          child: Text(year2,
                                              style: CustomTextStyle.txt14Rbtxtblk),
                                        ),
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
  }

  Padding buildFinancialInfo(double devicewidth, String title1, String subtitle1, String title2, String subtitle2,String subtitle3,Color listcolour) {
    return Padding(
      padding: const EdgeInsets.only(left: 18.0,right: 18.0),
      child: Container(
        height: 50,
        width: devicewidth,
        color: listcolour.withOpacity(0.4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                height: 50,
             //   color: Colors.green,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title1,
                      style: CustomTextStyle.txt14Rrtxtblk,
                     // maxLines: 1,
                     // overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),

            Expanded(
              flex: 2,
              child: Container(
                height: 50,
               // color: Colors.red,
                child: Row(
                  //  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                        child: Container(
                          height: 50,
                          child: Center(
                            child: Text(title2,
                              //  maxLines: 1,
                                style: title1.isEmpty?CustomTextStyle.txt11Rbtxtblk:CustomTextStyle.txt11Rrtxtblk),
                          ),
                        )),
                    // SizedBox(
                    //   height: 10,
                    // ),
                    Expanded(
                      flex: 1,
                        child: Container(
                          height: 50,
                          child: Center(
                            child: Text(subtitle2,
                                style: title1.isEmpty?CustomTextStyle.txt11Rbtxtblk:CustomTextStyle.txt11Rrtxtblk),
                          ),
                        )),
                    // SizedBox(
                    //   height: 10,
                    // ),
                    Expanded(
                        flex: 1,
                        child: Container(
                          height: 50,
                          child: Center(
                            child: Text(subtitle3,
                                //style: title1.isEmpty?CustomTextStyle.txt14Rbtxtblk:CustomTextStyle.txt14Rrtxtblk),
                                style: title1.isEmpty?CustomTextStyle.txt11Rbtxtblk:CustomTextStyle.txt11Rrtxtblk),
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color setbgClr(int index) {
    if(index % 2 == 0){
      return Appcolors.white;
    }else{
      return Appcolors.kyctxtgrey2;
    }
  }

   ChkFinanceData(List<FinancialInformation>? financedata , String from, int dataindex) {

    if(from == "year") {
   //   print('financedata[0].data? length ${financedata?[0].data?[2].year}');
      if (financedata != null && financedata.isNotEmpty) {

        if(financedata[0].data != null && financedata[0].data!.isNotEmpty){
          var yeardata = financedata[0];
           if(financedata[0].data?.length == 1){
            if(dataindex == 0){
              return financedata[0].data?[0].year;
            }
          }

           if(financedata[0].data!.length == 2){
            if(dataindex == 0){
              return financedata[0].data?[0].year;
            }
            if(dataindex == 1){
              return financedata[0].data?[1].year;
            }
          }
           if(financedata[0].data!.length == 3){
            if(dataindex == 0){
              return financedata[0].data?[0].year;
            }if(dataindex == 1){
              return financedata[0].data?[1].year;
            }if(dataindex == 2){
              return financedata[0].data?[2].year;
            }
            else {
              return "";
            }
          }

          if(yeardata.data != null && yeardata.data!.length  > 3){
            if(dataindex == 0){
              return financedata[0].data?[0].year;
            }if(dataindex == 1){
              return financedata[0].data?[1].year;
            }if(dataindex == 2){
              return financedata[0].data?[2].year;
            }
          }
           else {
            return "";
          }
        } else {
          return "";
        }
      }

    }

  }

   ChkFinanceValues(FinancialInformation? financialInformation, int i) {
var tstdata = financialInformation?.data;
    if(financialInformation?.data != null && financialInformation?.data?.length != 0){

      if(financialInformation?.data!.length == 3 ){
        if(i ==0){
          return financialInformation?.data?[i].value ?? "";
        }
        if(i ==1){
          return financialInformation?.data?[i].value ?? "";
        }
        if(i ==2){
          return financialInformation?.data?[i].value ?? "";
        }
      } else if(financialInformation?.data!.length == 2 ){
        if(i ==0){
          return financialInformation?.data?[i].value ?? "";
        }
        if(i ==1){
          return financialInformation?.data?[i].value ?? "";
        }
        if(i ==2){
          return "";
        }
      }else if(financialInformation?.data!.length == 1 ){
        if(i ==0){
          return financialInformation?.data?[i].value ?? "";
        }
        if(i ==1){
          return  "";
        }
        if(i ==2){
          return "";
        }
      }else if(tstdata != null && tstdata.length > 3 ){
        if(i ==0){
          return financialInformation?.data?[i].value ?? "";
        }if(i ==1){
          return financialInformation?.data?[i].value ?? "";
        } if(i ==2){
          return financialInformation?.data?[i].value ?? "";
        }
      }
    }
    else {
      if(i ==0){
        return "";
      }if(i ==1){
        return "";
      } if(i ==2){
        return "";
      }
    }

  }

}
