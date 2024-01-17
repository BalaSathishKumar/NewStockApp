import 'package:base_flutter_provider_project/common_widgets/Explore_widgets/FormWidgets/MutualForm.dart';
import 'package:base_flutter_provider_project/common_widgets/Explore_widgets/FormWidgets/PropertiesForm.dart';
import 'package:base_flutter_provider_project/common_widgets/appbar_widgets/green_appbar.dart';
import 'package:base_flutter_provider_project/data/models/Explore_model/ExploreDetailModel.dart';
import 'package:base_flutter_provider_project/data/models/StatusandMessageModel.dart';
import 'package:base_flutter_provider_project/ui/kyc/NewKycUser.dart';
import 'package:base_flutter_provider_project/ui/welcome/welcome.dart';
import 'package:base_flutter_provider_project/utils/common_textstyles.dart';
import 'package:base_flutter_provider_project/viewModel/base_view_model/base_view_model.dart';
import 'package:base_flutter_provider_project/viewModel/profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import '../../common_widgets/Explore_widgets/BuySellForm.dart';
import '../../common_widgets/Explore_widgets/ExBuySell.dart';
import '../../common_widgets/Explore_widgets/ExTab1.dart';
import '../../common_widgets/Explore_widgets/ExTab2.dart';
import '../../common_widgets/Explore_widgets/ExploreDetail_Topwidget.dart';
import '../../common_widgets/Explore_widgets/FinancialInfo.dart';
import '../../common_widgets/Explore_widgets/QuickStats.dart';
import '../../common_widgets/Stock_widgets/StockSections.dart';
import '../../common_widgets/alert_widgets/error_dialog.dart';
import '../../common_widgets/button_widgets/LGgRoundedBtn.dart';
import '../../common_widgets/button_widgets/ParallelButtons.dart';
import '../../common_widgets/loading_widgets/loader.dart';
import '../../common_widgets/tablayout/common_tablayout.dart';
import '../../constants/colors.dart';
import '../../constants/constant.dart';
import '../../constants/local_images.dart';
import '../../data/models/Explore_model/ExploreModel.dart';
import '../../data/models/Insights_model/CatBasedBlogsModel.dart';
import '../../data/models/dashboard_model/ProfileResponseModel.dart';
import '../../utils/common_functions.dart';
import '../../viewModel/CommonProvider.dart';
import '../../viewModel/explore_detail_view_model.dart';
import '../../viewModel/explore_view_model.dart';
import '../Advisors/AdvisorReviewPage.dart';
import '../Dealers/DealerVerifyPending.dart';
import '../Dealers/DonePage.dart';
import '../Dealers/select_payment.dart';
import '../Register/RegandKyc.dart';
import '../home/StockHome.dart';
import '../home/homepage.dart';
import '../kyc/KYC_Advisor.dart';
import '../kyc/KYC_Dealer.dart';
import 'SaInsightsandAdSpeak.dart';
import 'exploreFilter.dart';

class ExploreDetail extends StatefulWidget {
  final Stocks? selectedstocks;
  final bool isExplore;

  const ExploreDetail({Key? key, required this.selectedstocks,required this.isExplore})
      : super(key: key);

  @override
  State<ExploreDetail> createState() => _ExploreDetailState();
}

class _ExploreDetailState extends State<ExploreDetail>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  Stocks? get _selectedstocks => widget.selectedstocks;
  late ExploreDetailViewModel _exploredetailViewModel;
  late ExploreViewModel _exploreViewModel;
  late CommonProvider _commonProvider;
  late buystockbutn _purchaseType;
  List<MetaDataa>? metalist = [];
  List<MetaDataa>? metalist2 = [];
  List<MetaDataa>? ratinglist = [];

  @override
  void initState() {
    super.initState();
    print('selected slug: ${_selectedstocks?.slugs}');
    print('selected cat name: ${_selectedstocks?.category?.categoryName}');
    _tabController = TabController(length: 2, vsync: this);
    _exploredetailViewModel = Provider.of<ExploreDetailViewModel>(context, listen: false);
    _exploreViewModel = Provider.of<ExploreViewModel>(context, listen: false);
    _commonProvider = Provider.of<CommonProvider>(context, listen: false);
    _purchaseType = Provider.of<buystockbutn>(context, listen: false);
     _tabController.addListener(_updateBackgroundColor);
   // print("Sauda Insights initstate ${ _commonProvider.IsSaudaInsights}   ${ _commonProvider.IsAdvisorsSpeak}");

    WidgetsBinding.instance.addPostFrameCallback((_) {

      _exploredetailViewModel.exploredetailapi(onFailureRes: onFailureRes,slugID: _selectedstocks?.slugs.toString() ?? "",onSuccessRes: OnEdsucess);
      _commonProvider.setSaudaInsights(true);
    });
  }

  @override
  Widget build(BuildContext context) {
    var deviceheight = MediaQuery.of(context).size.height;
    var devicewidth = MediaQuery.of(context).size.width;

    return  Consumer<ExploreDetailViewModel>(
        builder: (context,favdata,child){
          return Scaffold(
              backgroundColor: Appcolors.white,
              appBar: GreenAppBar(
                hidemore: true,
                  // icn1: favdata.addFavModel?.message == "Succssfully Added"?LocalSVGImages.exylw2star:LocalSVGImages.exstar,
                  icn1: FavStarFun(favdata.exploredetailModel?.stocks?.wishList) ?LocalSVGImages.exylw2star:LocalSVGImages.exstar,
                  icn1tag: "star",
                  icn2: LocalSVGImages.sendblack,
                  icn2tag: "send",
                  isDealerChat: false,
                  onPressBack: () {
                    Navigator.pop(context);
                  },
                  onPressStar: () {
                    print('star pressed');

                    if(Constant.userRoll != "Guest"){
                      Map<String,dynamic> stockid =
                      {
                        "stock_id" : "${_selectedstocks?.id.toString() ?? ""}"
                      };
                      _exploredetailViewModel.addfavapi(onFailureRes: onFailureRes,onSuccessRes: onFavSuccess, stockid: stockid);
                    }else{
                    //  showToast("Please Login.");
                      errorAlert(context, "Please Login",onBackPress: (){
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => WelcomePage()), (route) => false);
                      });
                    }

                  },
                  onPressSend: () {
                    print('send stock detail');
                  //  Hi Welcome to sauda! "App link " "Stock name"
                    final box = context.findRenderObject() as RenderBox?;
                    Share.share("Hi Welcome to sauda! ${_selectedstocks?.name ?? ""}",
                        subject: "",
                        sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
                },
                  height: 80.0,
                  title: _selectedstocks?.name ?? "",
                  appbarclr: Appcolors.splashbgcolor2),
              body: _exploredetailViewModel.state == ViewState.busy?Loader():Container(
                height: deviceheight,
                width: devicewidth,
                child:  Consumer<ProfileViewModel>(
          builder: (context,proviledata,child) {
                 return Stack(children: [
                    SingleChildScrollView(
                        child: Column(
                          children: [
                            ExploreDetailTopDetails(selectedstocks: _selectedstocks,isAdvisorReview: false),
                            ExBuySell(devicewidth: devicewidth,selectedstocks: _selectedstocks),
                            showAdvisorReview(devicewidth, deviceheight, _selectedstocks,proviledata.profileResponseModel),  //Only for advisor
                            QuickStats(),
                            Consumer<ExploreDetailViewModel>(
                                builder: (context, expDetaildata, child) {
                                  return DynamicContent(
                                      devicewidth: devicewidth,
                                      metaModeldata: expDetaildata.exploredetailModel?.stocks?.metaData ?? []
                                  );}
                            ),
                            //Tentative(),
                            Consumer<ExploreDetailViewModel>(
                                builder: (context, expDetaildata, child) {
                                  return
                                    expDetaildata.exploredetailModel?.stocks?.financialInformation != null  &&
                                        expDetaildata.exploredetailModel!.stocks!.financialInformation!.isNotEmpty ? FinancialInfo():Container();}),
                            Container(
                              height: 350,
                              width: devicewidth,
                              child: CommonTabLayout(
                                IsExplore: false,
                                DynamicTabs: [],
                                tabTitles: [
                                  'Sauda Insights',
                                  'Advisor Speak',
                                ],
                                tabContents: [
                                  ExploreDetailTabContent(),
                                  ExploreAdvisorSpeak(),
                                ],
                                tabController: _tabController,
                              ),
                            ),
                            Consumer<ExploreDetailViewModel>(
                             builder: (context, expDetaildata, child) {
                               return  setBtnVisibility(expDetaildata.exploredetailModel?.stocks?.saudaInsights,expDetaildata.exploredetailModel?.stocks?.advisorReviews)? GestureDetector(
                                 onTap: () {
                                   print("Sauda Insights ${ _commonProvider.IsSaudaInsights}   ${ _commonProvider.IsAdvisorsSpeak}");
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => SaInsightsAdSpeakDetail()));
                                 },
                                 child: Container(
                                     height: 200,
                                     width: devicewidth,
                                     color: Colors.white,
                                     child: Column(
                                       children: [
                                         Container(
                                             height: 80,
                                             width: devicewidth,
                                             child: Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: Row(
                                                 mainAxisAlignment: MainAxisAlignment.center,
                                                 children: [
                                                   Container(
                                                     width: devicewidth / 2,
                                                     child: Padding(
                                                       padding: const EdgeInsets
                                                           .all(8.0),
                                                       child: LgRoundedBtn(
                                                         height: 100,
                                                         width: 150,
                                                         text: 'Discover More',
                                                         iconData: Icons
                                                             .arrow_forward,
                                                         backgroundColor:
                                                         Appcolors.txtlitegreen2,
                                                         textColor: Appcolors
                                                             .black,
                                                       ),
                                                     ),
                                                   ),
                                                 ],
                                               ),
                                             )),

                                       ],
                                     )),
                               ):SizedBox.shrink();
                             }
                            )
                          ],
                        )

                    ),
                    Consumer<ProfileViewModel>(
                      builder: (context,proviledata,child) {
                        return _selectedstocks?.buyingPrice == "0" && _selectedstocks?.sellingPrice == "0"? SizedBox.shrink():Align(
                          alignment: Alignment.bottomCenter,
                          child: ParallelButtons(
                              btn1clr: Appcolors.splashbgcolor,
                              btn1txtclr: Appcolors.black,
                              btn2clr: Appcolors.black,
                              btn2txtclr: Appcolors.white,
                              fontFamily: "Roboto-Regular",
                              fontSize: 14,
                              devicewidth: devicewidth,
                              btn1name: "BUY",
                              btn2name: "SELL",
                              btn1onpressed: () {
                                Provider.of<buystockbutn>(context, listen: false).setBuy(true);
                                Provider.of<buystockbutn>(context, listen: false).setsell(false);
                                if (Constant.userRoll != "Guest" && proviledata.profileResponseModel?.user?.status == 3) {
                                  var isMember = proviledata.profileResponseModel?.user?.isMemberShip;
                                 if(isMember != null && isMember){
                                   showCustomBottomSheet(context,favdata.exploredetailModel?.stocks);
                                 }else {
                                  // showToast("Your Subscription Membership is not active.");
                                   Navigator.push(context, MaterialPageRoute(builder: (context) => DealerVerifyPending(
                                       onPressed: (){
                                     if (Constant.userRoll != "Users") {
                                       Navigator.push(context, MaterialPageRoute(builder: (context)=> (SelectPayment())));
                                     }
                                       })));
                                 }

                                } else {
                                 // showToast("Please Login to buy.");
                                 if (Constant.userRoll == "Guest") {

                                   showDialog(
                                       context: context,
                                       builder: (context) => ErrorDialog(
                                           titletxt: "Login required",
                                           errorMsg: "Your are in Guest Mode. please login to buy/sell",
                                           onBackPress: () {
                                             Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => WelcomePage()), (route) => false);
                                           }));


                                }else{
                                   Navigator.push(context, MaterialPageRoute(builder: (context) => DealerVerifyPending(onPressed: (){
                                    if (Constant.userRoll == "Users") {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => RegiterAndKyc()));
                                    }else if(Constant.userRoll == "Brokers"){
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => RegiterAndKyc()));
                                    }else{
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => RegiterAndKyc()));
                                    }

                                   })));
                                 }
                                }
                              },
                              btn2onpressed: () {
                                Provider.of<buystockbutn>(context, listen: false).setBuy(false);
                                Provider.of<buystockbutn>(context, listen: false).setsell(true);
                                if (Constant.userRoll != "Guest" && proviledata.profileResponseModel?.user?.status == 3) {

                                  var isMember = proviledata.profileResponseModel?.user?.isMemberShip;
                                  if(isMember != null && isMember){
                                    showCustomBottomSheet(context,favdata.exploredetailModel?.stocks);
                                  }else {
                                   // showToast("Your Subscription Membership is not active.");
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => DealerVerifyPending(
                                        onPressed: (){
                                          if (Constant.userRoll != "Users") {
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=> (SelectPayment())));
                                          }
                                        })));
                                  }
                                }
                                else {
                                //  showToast("Please Login to sell.");
                                  if (Constant.userRoll == "Guest") {

                                    showDialog(
                                        context: context,
                                        builder: (context) => ErrorDialog(
                                            titletxt: "Login required",
                                            errorMsg: "Your are in Guest Mode. please login to buy/sell",
                                            onBackPress: () {
                                              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => WelcomePage()), (route) => false);
                                            }));

                                  }
                                  else{
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => DealerVerifyPending(onPressed: (){
                                      if (Constant.userRoll == "Users") {
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => RegiterAndKyc()));
                                      }else if(Constant.userRoll == "Brokers"){
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => RegiterAndKyc()));
                                      }else{
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => RegiterAndKyc()));
                                      }
                                    },)));
                                  }
                                }
                              }),
                        );
                      }
                    )
                  ]);}
                ),
              ));

        },
    );
  }

  void showCustomBottomSheet(BuildContext context, Stockss? stocksViewData) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16.0),
        ),
      ),
      builder: (BuildContext context) {
        return Consumer<buystockbutn>(
          builder: (context,buysellVM,child){
          return Container(
            child: Padding(
             padding:  EdgeInsets.only(
                 bottom: MediaQuery.of(context).viewInsets.bottom),
                child: builForm(stocksViewData,buysellVM._buy)
              /*      BuySellForm(
              selectedstocks: _selectedstocks,
              isExplore: widget.isExplore,
              stocksviewdata: stocksViewData,
              onBuySuccess: (buysucc){
                //  Navigator.push(context, MaterialPageRoute(builder: (context) => DonePage()));
                //   Route route = MaterialPageRoute(builder: (context) => DonePage());
                //   Navigator.pushReplacement(context, route);
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => DonePage()), (route) => false);
              },
            ),
              */

            ),
          );}
        );
      },
    );
  }

  onFailureRes(String p1) {
  }

  showAdvisorReview( double devicewidth,  double deviceheight, Stocks? selectedstocks, ProfileResponseModel? profiledata) {
    var isStatus = profiledata?.user?.status;
    var isMember = profiledata?.user?.isMemberShip;
    if(Constant.userRoll == "Advisors"){

      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: (){


            if (isStatus == 3){
              if(isMember != null && isMember){
                Navigator.push(context, MaterialPageRoute(builder: (context) => AdvisorReviewPage( selectedstocks: selectedstocks,)));
              }else{
                Navigator.push(context, MaterialPageRoute(builder: (context) => DealerVerifyPending(
                    onPressed: (){
                      if (Constant.userRoll != "Users") {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> (SelectPayment())));
                      }
                    })));
              }

            } else {
              Navigator.push(context, MaterialPageRoute(builder: (context) => DealerVerifyPending(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => RegiterAndKyc()));
                  })));
            }

          },
          child: Container(
            height: 182,
            width: devicewidth,
            color: Colors.white,
            child:  SvgPicture.asset(
                LocalSVGImages.advisor_reivew,fit: BoxFit.fill),
          ),
        ),
      );

    }else{
      return Container(
        width: devicewidth,);
    }
  }

 Widget DynamicContent({required List<MetaDataa> metaModeldata, required double devicewidth}) {
    if(metaModeldata != null || metaModeldata.isNotEmpty){
      for (MetaDataa dynamicdata in metaModeldata) {
     // for(int i = 0; i <= metaModeldata.length; i++){
        if(dynamicdata.data != null && dynamicdata.data!.isNotEmpty)
        {
          return Padding(
            padding: const EdgeInsets.only(left: 18.0,right: 18,top: 10),
            child: Column(
              children: [
                Container(
                    width: devicewidth,
                    //color: Colors.red,
                    child: Text("${dynamicdata.key}",style: CustomTextStyle.txt16Rb,)),
                SizedBox(height: 10),
                Container(
                  height: 200,
                    width: devicewidth,
                 //   color: Colors.yellow.shade50,
                    child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: dynamicdata.data?.length ??0,
                        itemBuilder: (context,index){
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: devicewidth,
                                height: 30,
                                child: Text(dynamicdata.data?[index].label ?? ""),
                              ),
                              Container(
                                width: devicewidth,
                                height: 30,
                                child: Text(dynamicdata.data?[index].value.toString() ?? "", style: CustomTextStyle.txt14gpquickstatsgrey),
                              ),
                            ],
                          );
                        })),
              ],
            ),
          );
        }
        else{
          print('metaModeldata[i].data2 ${dynamicdata.data}');
         // return Container();

        }

      }
    }


return Container();

  }





  onFavSuccess(StatusandMessageModel? p1) {
  //  showToast(p1?.message ?? "");
    _exploredetailViewModel.exploredetailapi(onFailureRes: onFailureRes,slugID: _selectedstocks?.slugs.toString() ?? "",onSuccessRes: OnEdsucess);
  }

  FavStarFun(bool? wishList) {
    if(wishList != null && wishList){
      return true;
    }else{
      return false;
    }
  }

  OnEdsucess(ExploreDetailModel? eddata) {
    print('categoryName:: ${eddata?.stocks?.category?.categoryName}');
    _exploreViewModel.exploreapi(onFailureRes: onFailureRes, onSuccessRes: onExpSuccessRes, catID: eddata?.stocks?.category?.id.toString() ?? "",PageNo: "1");
  }

  builForm(Stockss? stocksViewData, bool buy) {


    if(stocksViewData?.category?.categoryName == "Properties/Land Assets"){
      return  PropertiesForm(
        selectedstocks: _selectedstocks,
        isExplore: widget.isExplore,
        stocksviewdata: stocksViewData,
        onBuySuccess: (buysucc){
          //  Navigator.push(context, MaterialPageRoute(builder: (context) => DonePage()));
          //   Route route = MaterialPageRoute(builder: (context) => DonePage());
          //   Navigator.pushReplacement(context, route);
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => DonePage(purchaseType: buy?"Buy" : "Sell",)), (route) => false);
        },
      );
    }
    else if(stocksViewData?.category?.categoryName == "Mutual Funds"){
      return MutualForm(
        selectedstocks: _selectedstocks,
        isExplore: widget.isExplore,
        stocksviewdata: stocksViewData,
        onBuySuccess: (buysucc){
          //  Navigator.push(context, MaterialPageRoute(builder: (context) => DonePage()));
          //   Route route = MaterialPageRoute(builder: (context) => DonePage());
          //   Navigator.pushReplacement(context, route);
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => DonePage(purchaseType: buy?"Buy" : "Sell",)), (route) => false);
        },
      );
    }
    else{
      return BuySellForm(
        selectedstocks: _selectedstocks,
        isExplore: widget.isExplore,
        stocksviewdata: stocksViewData,
        onBuySuccess: (buysucc){
          //  Navigator.push(context, MaterialPageRoute(builder: (context) => DonePage()));
          //   Route route = MaterialPageRoute(builder: (context) => DonePage());
          //   Navigator.pushReplacement(context, route);
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => DonePage(purchaseType: buy?"Buy" : "Sell",)), (route) => false);
        },
      );
    }



  /*  switch (stocksViewData?.category?.categoryName) {
      case "Unlisted Stocks":
        print('Unlisted ---');
   return BuySellForm(
    selectedstocks: _selectedstocks,
    isExplore: widget.isExplore,
    stocksviewdata: stocksViewData,
    onBuySuccess: (buysucc){
    //  Navigator.push(context, MaterialPageRoute(builder: (context) => DonePage()));
    //   Route route = MaterialPageRoute(builder: (context) => DonePage());
    //   Navigator.pushReplacement(context, route);
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => DonePage()), (route) => false);
    },
    );

      case "Properties/Land Assets":
        print('Properties ---');
        return PropertiesForm(
          selectedstocks: _selectedstocks,
          isExplore: widget.isExplore,
          stocksviewdata: stocksViewData,
          onBuySuccess: (buysucc){
            //  Navigator.push(context, MaterialPageRoute(builder: (context) => DonePage()));
            //   Route route = MaterialPageRoute(builder: (context) => DonePage());
            //   Navigator.pushReplacement(context, route);
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => DonePage()), (route) => false);
          },
        );

    }*/
  }

  onExpSuccessRes(ExploreModel? p1) {
  }

  void _updateBackgroundColor() {
    switch (_tabController.index) {
      case 0:
        _commonProvider.setSaudaInsights(true);
        _commonProvider.setAdvisorsSpeak(false);
        print("Sauda Insights ${ _commonProvider.IsSaudaInsights}   ${ _commonProvider.IsAdvisorsSpeak}");

        break;
      case 1:

        _commonProvider.setAdvisorsSpeak(true);
        Provider.of<CommonProvider>(context, listen: false).setSaudaInsights(false);
        print("Advisors speak Insights ${ _commonProvider.IsAdvisorsSpeak} ${ _commonProvider.IsSaudaInsights}");
        break;
    }
  }

  setBtnVisibility(List<Blogs>? saudaInsights, List<AdvisorReviews>? advisorReviews) {

    if(saudaInsights != null && saudaInsights.length > 2 || advisorReviews != null && advisorReviews.length > 2){
      return true;
    }else {
      return false;
    }
  }
}



ContainerButton2({required double devicewidth, required String buttonname, required String stars}) {

  return stars =="SBR"? Consumer<FilterPriceSelect6>(
      builder: (context, FilterPrice6, child) {
        return Container(
          height: 40,
          width: devicewidth,
          decoration: BoxDecoration(
              color: FilterPrice6.FilterPriceSelectF6
                  ? Appcolors.splashbgcolor2
                  : Appcolors.white,
              border:
              Border.all(color: Appcolors.black, width: 1),
              borderRadius: BorderRadius.circular(6)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(buttonname,
                  style: CustomTextStyle.txt14Rmtxtblk,
                  maxLines: 1,
                  softWrap: false,
                  overflow: TextOverflow.ellipsis),
            ],
          ),
        );
      })
      : Consumer<FilterPriceSelect7>(
          builder: (context, FilterPrice7, child) {
            return Container(
              height: 40,
              width: devicewidth,
              decoration: BoxDecoration(
                  color: FilterPrice7.FilterPriceSelectF7
                      ? Appcolors.splashbgcolor2
                      : Appcolors.white,
                  border:
                  Border.all(color: Appcolors.black, width: 1),
                  borderRadius: BorderRadius.circular(6)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(buttonname,
                      style: CustomTextStyle.txt14Rmtxtblk,
                      maxLines: 1,
                      softWrap: false,
                      overflow: TextOverflow.ellipsis),
                ],
              ),
            );
          });

}











class buystockbutn with ChangeNotifier {
  bool _buystock = false;
  bool _buy = false;
  bool _sell = false;
  bool _legalyes = false;
  bool _legalno = false;
  bool _propdealeryes = false;
  bool _propdealerno = false;

  bool get buystock => _buystock;
  bool get buy => _buy;
  bool get sell => _sell;
  bool get legalyes => _legalyes;
  bool get legalno => _legalno;
  bool get PropDealeryes => _propdealeryes;
  bool get PropDealerno => _propdealerno;

  void getBuystock(bool pcd) {
    _buystock = pcd;
    notifyListeners();
  }

  void setBuy(bool pcd) {
    _buy = pcd;
    notifyListeners();
  }

  void setsell(bool pcd) {
    _sell = pcd;
    notifyListeners();
  }
  void setlegalyes(bool pcd) {
    _legalyes = pcd;
    notifyListeners();
  }
  void setlegalno(bool pcd) {
    _legalno = pcd;
    notifyListeners();
  }
  void setPropDealerYes(bool pcd) {
    _propdealeryes = pcd;
    notifyListeners();
  }

  void setPropDealerNo(bool pcd) {
    _propdealerno = pcd;
    notifyListeners();
  }
}