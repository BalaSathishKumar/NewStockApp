import 'package:base_flutter_provider_project/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../constants/constant.dart';
import '../../constants/local_images.dart';
import '../../data/models/Portfolio_model/InvestedStock.dart';
import '../../ui/home/homepage.dart';
import '../../utils/common_functions.dart';
import '../../utils/common_textstyles.dart';

import '../../viewModel/portfolio_view_model.dart';
import '../button_widgets/LGgRoundedBtn.dart';
import 'MyAssetBottomSheet.dart';

class PortfolioTab1 extends StatefulWidget {

  @override
  State<PortfolioTab1> createState() => _PortfolioTab1State();
}

class _PortfolioTab1State extends State<PortfolioTab1> {
  late MyPortfolioViewModel _myPortfolioViewModel;
  @override
  void initState() {
    super.initState();
    _myPortfolioViewModel= Provider.of<MyPortfolioViewModel>(context,listen: false);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _myPortfolioViewModel.MyPortfolioapi(onFailureRes: onFailureRes, onSuccessRes: onSuccessRes);
    });
  }
  
  @override
  Widget build(BuildContext context) {
    var deviceheight = MediaQuery.of(context).size.height;
    var devicewidth = MediaQuery.of(context).size.width;
    String rupeeSymbol = Constant.rupeeSymbol;


    return Scaffold(
      backgroundColor: Appcolors.white,
      body: Consumer<MyPortfolioViewModel>(
        builder: (context,investedvm,child) {
          return Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  investedvm.MyPortfolioResponseModel?.data?.invested == null || investedvm.MyPortfolioResponseModel!.data!.invested!.isEmpty  ?
                  Container(
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        buildFolioValue(devicewidth, rupeeSymbol, "0.00","FOLIO","VALUE"),
                        SizedBox(height: 80),
                        Container(
                          //color: Colors.yellow,
                          child: Hero(
                            tag: "locker",
                            child: SvgPicture.asset(
                              LocalSVGImages.locker,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Center(
                          child: Container(
                           // height: 60,
                            width: devicewidth,
                           //   color: Colors.red,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 20.0, right: 20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [

                                  Text("No Stocks Invested",
                                      style: CustomTextStyle.txt24Rbblack),
                                  Text(
                                      'Your purchased assets will appear here automatically when you transact with us.',
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
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Container(
                             // height: 140,
                              width: devicewidth,
                             //   color: Colors.red,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap:(){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=> SaudaHomePage(bottomindx: 2,)));
                                    },
                                    child: Container(
                                      height: 50,
                                      width: devicewidth / 2,
                                      child: LgRoundedBtn(
                                        height: 100,
                                        width: 150,
                                        text: 'Start Trading',
                                        iconData: Icons.arrow_forward,
                                        backgroundColor: Appcolors.txtlitegreen2,
                                        textColor: Appcolors.black,

                                      ),
                                    ),
                                  ),
                                ],
                              )),
                        )
                      ],
                    ),
                  ) :
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 18),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 20),
                            buildFolioValue(devicewidth, rupeeSymbol, "${investedvm.MyPortfolioResponseModel?.data?.folioValue ?? ""}","FOLIO","VALUE"),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: buildRichText(
                                TextSpan(text: "MY"),
                                TextSpan(text: "ASSETS",
                                    style: CustomTextStyle.txt24Rbblack),
                                CustomTextStyle.txt24Rlblk,
                              ),
                            ),
                            ListView.builder  (
                                shrinkWrap: true,
                               // itemCount: items.length,
                                physics:NeverScrollableScrollPhysics(),
                                  itemCount: investedvm.MyPortfolioResponseModel?.data?.invested?.length ?? 0,
                                itemBuilder: (context, index) {
                                  var investeddata = investedvm.MyPortfolioResponseModel?.data?.invested;
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, right: 8, bottom: 7),
                                    child: InkWell(
                                      onTap: () {
                                        showMyAssetottomSheet(context, investeddata?[index]);
                                      },
                                      child: Container(
                                          height: 100,
                                          decoration: BoxDecoration(
                                            color: Color( 0xFF00FF7F).withOpacity(0.1),
                                            borderRadius: BorderRadius.circular(
                                                15.0),
                                          ),
                                          child: Column(

                                            children: [

                                              Row(
                                                children: [
                                                  Expanded(
                                                      flex: 1,
                                                      child: Container(
                                                        height: 60,
                                                        //   color: Colors.red,
                                                        child: Column(mainAxisAlignment: MainAxisAlignment.start,
                                                          children: [
                                                             Image.network(investeddata?[index].stock?.photoUrl ?? "")
                                                       /*     Image.asset(
                                                              items[index]
                                                                  .imageUrl,
                                                              height: 35,
                                                              width: 35,
                                                            ),*/
                                                          ],
                                                        ),
                                                      )),
                                                  SizedBox(width: 5,),
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
                                                                      Text(//items[index].text,
                                                                        investeddata?[index].companyName ?? "",
                                                                          maxLines: 1,
                                                                          overflow: TextOverflow.ellipsis,
                                                                          style: CustomTextStyle.txt16Rb),
                                                                    ],
                                                                  ))),

                                                          Expanded(
                                                              flex: 1,
                                                              child: Container(
                                                                // color: Colors.blue.shade50,
                                                                  child: Column(
                                                                    children: [
                                                                      Text(
                                                                       // items[index].shname,
                                                                        investeddata?[index].dealerName ?? "",
                                                                        maxLines: 1,
                                                                        overflow: TextOverflow.ellipsis,
                                                                        style: CustomTextStyle
                                                                            .txt14Rlblk,),
                                                                    ],
                                                                  ))),

                                                          Expanded(
                                                            flex: 1,
                                                            child: Container(
                                                              //  color: Colors.yellow.shade50,
                                                                child: Column(
                                                                  children: [
                                                                    Text("Holding : ${ investeddata?[index].buyShareSize ?? ""} shares",
                                                                    //  "Holding : 6000 shares",
                                                                      style: CustomTextStyle
                                                                          .txt12Rbtitlegrey3,
                                                                      maxLines: 1,
                                                                      overflow: TextOverflow
                                                                          .ellipsis,),
                                                                  ],
                                                                )),
                                                          )

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
                                                            "${rupeeSymbol} ${ investeddata?[index].total ?? ""}",
                                                         // "${rupeeSymbol} 12000 ",
                                                          style: CustomTextStyle
                                                              .txt16Rb,
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,)),)
                                                ],
                                              )


                                              /*  ListTile(
                                              leading: Image.asset(items[index].imageUrl),
                                              title:  Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [

                                                  Expanded(
                                                      flex:1,
                                                      child: Text(items[index].text,style: CustomTextStyle.txt16Rb,)),

                                                  Expanded(
                                                      flex: 1,
                                                      child: Text(items[index].shname,style: CustomTextStyle.txt14Rlblk,)),

                                                  Expanded(
                                                    flex:1,
                                                    child: Container(
                                                        height: 30,
                                                        //   color: Colors.red,
                                                        child: Text(
                                                          "Holding : 6000 shares",
                                                          style:CustomTextStyle.txt12Rbtitlegrey3,
                                                          maxLines: 1,
                                                          overflow: TextOverflow.ellipsis,)),
                                                  )
                                                ],
                                              ),
                                              trailing:   Container(
                                                  height: 30,
                                                  //   color: Colors.red,
                                                  child: Text(
                                                    "${rupeeSymbol} 496987.60",
                                                    style:CustomTextStyle.txt16Rb,
                                                    maxLines: 1,
                                                    overflow: TextOverflow.ellipsis,)),
                                            ),*/

                                            ],
                                          )),
                                    ),
                                  );
                                })
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        }
      ),
    );
  }



  void showMyAssetottomSheet(BuildContext context, Invested? item) {
    showModalBottomSheet<void>(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16.0),
        ),
      ),
      builder: (BuildContext context) {
        return MyAssetBottomSheet(selectedstocks: item);
      },
    );
  }

  onFailureRes(String p1) {
  }





  onSuccessRes(InvestedStocks? p1) {
    //print('InvestedStock ${p1?.data?.invested?[0].stock?.category?.categoryName ?? "sdfsf"}');
  }
}

Center buildFolioValue(double devicewidth, String rupeeSymbol, String amnt, String txt1, String txt2) {
  return Center(
    child: Container(
     // height: 60,
      width: devicewidth,
         //color: Colors.red,
      child:    Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          buildRichText(
            TextSpan(text: txt1),
            TextSpan(text: txt2, style: CustomTextStyle.txt24Rbblack), CustomTextStyle.txt24Rlblk,
          ),
          Text('${rupeeSymbol} $amnt',style: CustomTextStyle.txt24Rmtxtblk2,maxLines: 1,overflow: TextOverflow.ellipsis,),

        ],
      ),
    ),
  );
}
