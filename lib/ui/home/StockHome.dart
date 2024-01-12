import 'package:base_flutter_provider_project/data/models/AdvisorModels/ConsultationListModel.dart';
import 'package:base_flutter_provider_project/data/models/Explore_model/ExploreModel.dart';
import 'package:base_flutter_provider_project/data/models/Explore_model/ExplorePerformModel.dart';
import 'package:base_flutter_provider_project/data/models/Insights_model/BlogsResponseModel.dart';
import 'package:base_flutter_provider_project/data/models/dashboard_model/DashBoardFilterModel.dart';
import 'package:base_flutter_provider_project/data/models/dashboard_model/DashboardResponseModel.dart';
import 'package:base_flutter_provider_project/data/models/dashboard_model/ProfileResponseModel.dart';
import 'package:base_flutter_provider_project/ui/Advisor&Broker/AdvisorandBroker.dart';
import 'package:base_flutter_provider_project/ui/Subscriptions/SubscriptionDetail.dart';
import 'package:base_flutter_provider_project/ui/PortFolio/portfoliopage.dart';

import 'package:base_flutter_provider_project/ui/Reward&Referrals/RewardandReferral.dart';
import 'package:base_flutter_provider_project/ui/TradeUnlist/TradeUnlisted.dart';
import 'package:base_flutter_provider_project/ui/TransactionHistory/TransactionHistory.dart';
import 'package:base_flutter_provider_project/ui/home/searchpage.dart';
import 'package:base_flutter_provider_project/ui/kyc/KYC_Advisor.dart';
import 'package:base_flutter_provider_project/ui/kyc/KYC_Dealer.dart';
import 'package:base_flutter_provider_project/ui/kyc/NewKycUser.dart';
import 'package:base_flutter_provider_project/ui/onboarding/onboarding.dart';
import 'package:base_flutter_provider_project/ui/welcome/welcome.dart';
import 'package:base_flutter_provider_project/viewModel/CommonProvider.dart';
import 'package:base_flutter_provider_project/viewModel/dashboard_view_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common_widgets/AppDrawer/FullScreenDrawer.dart';
import '../../common_widgets/Stock_widgets/StockSections.dart';
import '../../common_widgets/Stock_widgets/TopBrokerDetailPage.dart';
import '../../common_widgets/Stock_widgets/TopBrokers.dart';
import '../../common_widgets/Stock_widgets/TrendingStocks.dart';
import '../../common_widgets/alert_widgets/error_dialog.dart';
import '../../common_widgets/appbar_widgets/homepage_appbar.dart';

import '../../common_widgets/button_widgets/button_with_icon.dart';
import '../../common_widgets/loading_widgets/loader.dart';

import '../../constants/colors.dart';
import '../../constants/constant.dart';
import '../../constants/local_images.dart';
import '../../data/models/LocationsModel/ProfessionModel.dart';
import '../../utils/SharedHelper/PreferenceHelper.dart';
import '../../utils/SharedHelper/Preference_Constant.dart';
import '../../utils/common_functions.dart';
import '../../utils/common_textstyles.dart';
import '../../viewModel/base_view_model/base_view_model.dart';
import '../../viewModel/blogs_view_model.dart';
import '../../viewModel/performViewModel.dart';
import '../../viewModel/profession_view_model.dart';
import '../../viewModel/profile_view_model.dart';
import '../Advisor&Broker/ConsultationList.dart';
import '../Advisors/MyReviews.dart';
import '../ChatPage/ChatRoomPage.dart';
import '../CreateListing/MyListing.dart';
import '../CreateListing/create_listing.dart';
import '../Dealers/DealerChatPage/DealerInbox.dart';
import '../Dealers/DealerVerifyPending.dart';
import '../Dealers/UserDirectory/UserDirectories.dart';
import '../Dealers/select_payment.dart';
import '../Register/RegandKyc.dart';
import '../Register/RegisterPage.dart';
import '../Reward&Referrals/Promocode.dart';

import '../explore/exploreDetail.dart';

import 'StockViewall.dart';
import 'homepage.dart';
import 'notification.dart';

class StockHome extends StatefulWidget {
  const StockHome({Key? key}) : super(key: key);

  @override
  State<StockHome> createState() => _StockHomeState();
}

class _StockHomeState extends State<StockHome> {
  late DashboardViewModel _dashboardViewModel;
  late BlogsViewModel _blogsViewModel;
  late ProfileViewModel _profileViewModel;
  late CommonProvider _commonProvider;
  late PerformViewModel _performViewModel;
  late DropOptions _dropOptions;
  late ProfessionViewModel _professionViewModel;

   List<DrawerItem> drawerItems2 = [
    DrawerItem(iconAsset: LocalSVGImages.menu1, title: 'Profile'),
   // DrawerItem(iconAsset: LocalSVGImages.menu1, title: 'KYC Update'),
   // DrawerItem(iconAsset: LocalSVGImages.menu1, title: 'Profile'),
    DrawerItem(iconAsset: LocalSVGImages.menu5, title: 'Transaction History'),
    DrawerItem(iconAsset: LocalSVGImages.menu4, title: 'User Directory'),
    DrawerItem(iconAsset: LocalSVGImages.menu7, title: 'My Portfolio'),
    DrawerItem(iconAsset: LocalSVGImages.menu8, title: 'Chat With Sauda Team'),
    DrawerItem(iconAsset: LocalSVGImages.menu8, title: 'Consultations'),
    DrawerItem(iconAsset: LocalSVGImages.menu3, title: 'Rewards & Referrals'),
    DrawerItem(iconAsset: LocalSVGImages.menu3, title: 'Promocode'),
  ];
  final List<DrawerItem> uniquelist = [
    DrawerItem(iconAsset: LocalSVGImages.menu1, title: 'Profile'),
   // DrawerItem(iconAsset: LocalSVGImages.menu1, title: 'KYC Update'),
   // DrawerItem(iconAsset: LocalSVGImages.menu1, title: 'Profile'),
    DrawerItem(iconAsset: LocalSVGImages.menu5, title: 'Transaction History'),
    DrawerItem(iconAsset: LocalSVGImages.menu4, title: 'User Directory'),
    DrawerItem(iconAsset: LocalSVGImages.menu7, title: 'My Portfolio'),
    DrawerItem(iconAsset: LocalSVGImages.menu8, title: 'Chat With Sauda Team'),
    DrawerItem(iconAsset: LocalSVGImages.menu8, title: 'Consultations'),
    DrawerItem(iconAsset: LocalSVGImages.menu3, title: 'Rewards & Referrals'),
    DrawerItem(iconAsset: LocalSVGImages.menu3, title: 'Promocode'),
  ];

  final List<String> imgList = [
    LocalPNGImages.ad1,
    LocalPNGImages.ad2,
    LocalPNGImages.ad1,
    LocalPNGImages.ad2
  ];
  List<String?> Bannerimages = [];

  int _currentPageIndex = 0;
  String RollName = "";

  @override
  void initState() {
    super.initState();
    _dashboardViewModel = Provider.of<DashboardViewModel>(context, listen: false);
    _professionViewModel = Provider.of<ProfessionViewModel>(context, listen: false);
    _blogsViewModel = Provider.of<BlogsViewModel>(context, listen: false);
    _profileViewModel = Provider.of<ProfileViewModel>(context, listen: false);
    _commonProvider = Provider.of<CommonProvider>(context, listen: false);
    _dropOptions = Provider.of<DropOptions>(context, listen: false);
    print(
        '_professionViewModel.ProfessionList1 ${_professionViewModel.ProfessionList.length}');
    //UI render callback
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _profileViewModel.profileapi(onFailureRes: onProfileFailureRes, onSuccessRes: onProfileSuccessRes);

      _dropOptions.getDropOPtions(null);
      _dropOptions.getDropStocks(null);
      _dropOptions.getDropOPtionsStockid(0);

    });
  }

  @override
  Widget build(BuildContext context) {
    var deviceheight = MediaQuery.of(context).size.height;
    var devicewidth = MediaQuery.of(context).size.width;

    return Consumer<DashboardViewModel>(builder: (context, dashvm, child) {
      return Container(
        height: deviceheight,
        width: devicewidth,
        child: Consumer<DropOptions>(builder: (context, dropoption, child) {
          return Column(
            children: [
              Expanded(
                flex: 1,
                child: HomePageAppBar(
                    onPressedmenu: () {
                      //  Scaffold.of(context).openDrawer();
                      if (Constant.userRoll != "Guest") {
                        openFullScreenDrawer(context, deviceheight, drawerItems2);
                      }
                    },
                    onPressed: () {
                      // context.router.push(Searchpage());
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPage()));
                    },
                    logotag: "greenlogo",
                    devicewidth: devicewidth,
                    iconpath: LocalSVGImages.search),
              ),
              Expanded(
                flex: 6,
                child: Padding(
                  padding: const EdgeInsets.only(left: 18.0, top: 6, right: 18),
                  child: Container(
                    width: devicewidth,
                    child: SingleChildScrollView(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "What's new",
                          style: CustomTextStyle.txt24Rbblack,
                        ),
                        buildSizedBox(height: 10, width: 0),
                        SliderWidget(
                            devicewidth, _dashboardViewModel.dashboardResponseModel?.data?.banners ??
                                []), //Slider
                        Container(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(child: _buildDotIndicator()),
                        )),
                        Consumer<CommonProvider>(
                          builder: (context,chkCommVM,child){
                          return Consumer<ProfileViewModel>(
                              builder: (context, proviledata, child) {
                                hitProfileApi(chkCommVM.IsTriggerProfile);
                            return UnListed(
                                devicewidth: devicewidth,
                                onPressed: () {
                                  // context.router.push(Tradeunlisted());
                                  if (Constant.userRoll == "Brokers") {
                                    var chkProfile = proviledata.profileResponseModel?.user;
                                    var isMember = chkProfile?.isMemberShip;
                                    print('IsMember ${isMember}');
                                    if (chkProfile?.status == 3){
                                      if(isMember != null && isMember){
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => CreateListing()));
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
                                  } else if (Constant.userRoll == "Users" || Constant.userRoll == "Guest" || Constant.userRoll == "Advisors") {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => TradeUnlisted()));
                                  } else {}
                                });
                          });}
                        ),
                        Consumer<DashboardViewModel>(
                            builder: (context, dashTS, child) {
                          return TrendingStocks(
                            imagetag: "Trendingstocks",
                            secondtitle: "",
                            firsttitle: "Trending Stocks",
                            devicewidth: devicewidth,
                            onPressed: () {
                              print('discover more clicked');
                              Navigator.push(context, MaterialPageRoute(builder: (context) => StockViewallPage(stockname: "Trending Stocks")));
                            },
                            trendingstocks: dashTS.dashboardResponseModel?.data?.trendingstocks ?? [],
                            Filterdata: dashTS.dashboardFilterResponseModel2?.data ?? [],
                            OnTrengStocksPressed: (selectedTrendStocks) {
                              print('onpress trending stocks ${selectedTrendStocks?.stock?.name ?? ""}');
                              if (selectedTrendStocks?.stock != null) {
                                // Route route = MaterialPageRoute(builder: (context) => ExploreDetail(selectedstocks: selectedTrendStocks?.stock,isExplore: false,));
                                // Navigator.pushReplacement(context, route);
                                dropoption.getDropOPtionsStockid(selectedTrendStocks?.stock?.id);
                                _dropOptions.getDropStocks(null);
                                dropoption.getDropOPtions(SetCat(dashTS.dashboardResponseModel?.data?.category,selectedTrendStocks?.stock?.category?.id));
                                Navigator.push(context, MaterialPageRoute(builder: (context) => ExploreDetail(selectedstocks: selectedTrendStocks?.stock, isExplore: true,)));
                              }
                            },
                          );
                        }),
                        Container(
                          height: 500,
                          width: devicewidth,
                          child: Stack(
                            children: [
                              Hero(
                                  tag: "investmadeeasy",
                                  child: Image.asset(
                                    LocalPNGImages.investeasy,
                                    width: devicewidth,
                                    height: 500,
                                    fit: BoxFit.fill,
                                  )),
                              Container(
                                height: 500,
                                width: devicewidth,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 5.0, bottom: 15),
                                      child: RoundedContainer(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => AdvisorandBroker(IsClickForAdvisorHelp: true, selectedstocks: null)));
                                        },
                                        text: 'Explore Sauda Pros',
                                        iconData: Icons.arrow_forward,
                                        backgroundColor: Appcolors.black,
                                        textColor: Appcolors.white,
                                        borderColor: Appcolors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Consumer<DashboardViewModel>(
                            builder: (context, dashTBdata, child) {
                          //    print('dashTBdata.dashboardResponseModel?.data?.featuredBrokers ${dashTBdata.dashboardResponseModel?.data?.featuredBrokers}');
                          return dashTBdata.dashboardResponseModel?.data?.featuredBrokers != null && dashTBdata.dashboardResponseModel!.data!.featuredBrokers!.isEmpty
                              ? Container()
                              : TopBrokers(
                            IsViewPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => TopBrokerDetail(featuredBrokers: _dashboardViewModel.dashboardResponseModel?.data?.featuredBrokers)));
                                  },
                                  optionslist: [],
                                  firsttitle: "Featured",
                                  secondtitle: "Top Brokers",
                                  imagetag: "topbrokersviewall",

                                  topbrokers: _dashboardViewModel.dashboardResponseModel?.data?.featuredBrokers,
                                  serviceyear: _dashboardViewModel.serviceyears,
                                  devicewidth: devicewidth,
                                  devicehgt: deviceheight,  );
                        }),
                        SizedBox(height: 10),
                        Consumer<DashboardViewModel>(
                            builder: (context, dashfildata, child) {
                          //  print('dashfildata.catList length ${dashfildata.catList.length}');
                          return dashfildata.state == ViewState.busy
                              ? Loader()
                              : StocksSections(
                                  OnTopStocksPressed2: (selectedTopStocks2) {},
                                  Filterdata: dashfildata.dashboardFilterResponseModel?.data ?? [],
                                  OnIpoStocksPressed: (selectedIpoStocks) {},
                                  OnTopStocksPressed: (selectedTopStocks) {print('Top Stocks Clicked name${selectedTopStocks?.stock?.name ?? ""}');
                                    print('Top Stocks Clicked id${selectedTopStocks?.stock?.id ?? ""}');
                                    if (selectedTopStocks?.stock != null) {
                                      _dropOptions.getDropOPtionsStockid(selectedTopStocks?.stock?.id);
                                      _dropOptions.getDropStocks(null);
                                    //  _dropOptions.getDropStocks(selectedTopStocks?.stock);
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => ExploreDetail(selectedstocks: selectedTopStocks?.stock, isExplore: true,)));
                                    }
                                  },
                                  viewall: "viewall",
                                  optionslist: dashfildata.catList,
                                  firsttitle: "Featured",
                                  secondtitle: "Top Stocks",
                                  ViewallClick: (viewallclick) {
                                    print('viewall click 1 ${viewallclick}');
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => StockViewallPage(stockname: "Top Stocks")));
                                  },
                                  imagetag: "topstocksviewall",

                                  devicewidth: devicewidth,
                                  featuredStocks: _dashboardViewModel.dashboardResponseModel?.data?.featuredStocks,
                                  ipostocks: []);
                        }), // Featured Top Stocks
                        StocksSections(
                            OnTopStocksPressed2: (selectedTopStocks2) {},
                            Filterdata: [],
                            OnTopStocksPressed: (selectedTopStocks) {},
                            OnIpoStocksPressed: (selectedIpoStocks) {
                              print(
                                  'Top Stocks Clicked ${selectedIpoStocks?.stock?.name ?? ""}');
                              if (selectedIpoStocks?.stock != null) {
                                _dropOptions.getDropOPtionsStockid(selectedIpoStocks?.stock?.id);
                                _dropOptions.getDropOPtions(null);
                                _dropOptions.getDropStocks(null);
                                //  Provider.of<DropOptions>(context, listen: false).getDropOPtions(selectedIpoStocks?.stock?.category);
                                Provider.of<DropOptions>(context, listen: false).getDropOPtions(SetCat(_dashboardViewModel.dashboardResponseModel?.data?.category, selectedIpoStocks?.stock?.category?.id));

                                Navigator.push(context, MaterialPageRoute(builder: (context) => ExploreDetail(selectedstocks: selectedIpoStocks?.stock, isExplore: true,)));
                              }
                            },
                            featuredStocks: [],
                            viewall: "viewall",
                            optionslist: [],
                            firsttitle: "Upcoming",
                            secondtitle: "IPO & FPO",
                            ViewallClick: (viewallclick) {
                              print('viewall click 2${viewallclick}');
                              Navigator.push(context, MaterialPageRoute(builder: (context) => StockViewallPage(stockname: "IPO & FPO")));
                            },
                            imagetag: "upcomingciewall",

                            ipostocks: _dashboardViewModel
                                .dashboardResponseModel?.data?.ipoFpo,
                            devicewidth: devicewidth),
                        SizedBox(height: 20),
                      ],
                    )),
                  ),
                ),
              ),
            ],
          );
        }),
      );
    });
  }

  Container SliderWidget(double devicewidth, List<Banners> BnrimgList) {
    Bannerimages = BnrimgList.map((banner) => banner.imageUrl).toList();
    return Container(
        child: CarouselSlider(
      options: CarouselOptions(
        height: 200,
        aspectRatio: 1.0,
        viewportFraction: 0.95,
        clipBehavior: Clip.antiAlias,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        enlargeStrategy: CenterPageEnlargeStrategy.scale,
        onPageChanged: _onPageChanged,
        scrollDirection: Axis.horizontal,
      ),
      items: Bannerimages.map((item) => Container(
            width: devicewidth,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              /* child: Image.asset(
               item!,
                width: devicewidth,
                height: 500,
                fit: BoxFit.fill,
              )*/
              child: Image.network(
                item!,
                fit: BoxFit.cover,
              ),
            ),
          )).toList(),
    ));
  }

  Widget _buildDotIndicator() {
    return Container(
      child: DotsIndicator(
        dotsCount: Bannerimages.isNotEmpty ? Bannerimages.length : 1,
        position: _currentPageIndex.toDouble(),
        decorator: DotsDecorator(
          size: const Size.square(6.0),
          activeSize: const Size(10.0, 6.0),
          activeColor: Appcolors.black,
          color: Appcolors.black,
          activeShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        ),
      ),
    );
  }

  _onPageChanged(int index, CarouselPageChangedReason reason) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  onFailureRes(String p1) {}

  onSuccessRes(DashboardResponseModel? catdata) {
    print('TrendingStocks ${catdata?.data?.trendingstocks?.length}');
    if (catdata?.data?.category != null &&
        catdata!.data!.category!.isNotEmpty) {
      Provider.of<DropOptions>(context, listen: false).getDropOPtions(catdata.data?.category?[0]);
      // Provider.of<DropOptions>(context, listen: false).getDropOPtionsStockid(catdata.data?.stocks?[0].id);
    }

    Map<String, dynamic> filterparams = {
      "category_id": catdata?.data!.category?[0].id ?? 1,
      "type": "featured_stocks",
      "age": "",
      "sectors": "",
      "city": "",
    };
    _dashboardViewModel.dashboardfilterapi(
        onFailureRes: onFilterFailureRes,
        onSuccessRes: onFilterSuccessRes,
        filterparams: filterparams);

    callTrendFilterapi();

    _blogsViewModel.blogsapi(onFailureRes: onBlogFailureRes, onSuccessRes: onBlogsSuccessRes);
  }

  onBlogFailureRes(String p1) {}

  onBlogsSuccessRes(BlogsResponseModel? p1) {

  }

  onProfileFailureRes(String p1) {
    print('profile failure ${p1}');
    if (p1 == "Error Send Timeout" && Constant.userRoll != "Guest") {
      LogoutFun(context, true);
    }
  }

  Future<String> getSharedValue(String prefconstant) async {
    Constant.userRoll = await PreferenceHelper.getString(prefconstant);
    _commonProvider.setRollName(Constant.userRoll);
    print('stored Constant RollName in pref ${Constant.userRoll}');
    return Constant.userRoll;
  }

  onProfileSuccessRes(ProfileResponseModel? profileRes) {
    _dashboardViewModel.dashboardapi(onFailureRes: onFailureRes, onSuccessRes: onSuccessRes);
    print('Profile Res RollName:: ${profileRes?.user?.roleName}');
    PreferenceHelper.setString(PrefConstant.rollname, profileRes?.user?.roleName ?? "");
    getSharedValue(PrefConstant.rollname);

    if(profileRes?.user?.roleName == "Brokers" || profileRes?.user?.roleName == "Advisors"){
     /* drawerItems2.add(DrawerItem(iconAsset: LocalSVGImages.menu1, title: 'Subscription'));
      Constant.drawerItems2.add(DrawerItem(iconAsset: LocalSVGImages.menu1, title: 'Subscription'));*/
      Constant.drawerItems2.clear();

      for(DrawerItem item in drawerItems2){
        if(item.title != "Subscriptions Details"){
          drawerItems2.add(DrawerItem(iconAsset: LocalSVGImages.menu1, title: 'Subscriptions Details'));
        }
        if(profileRes?.user?.roleName == "Brokers"){
          if(item.title != "My Listings"){
            drawerItems2.add(DrawerItem(iconAsset: LocalSVGImages.menu1, title: 'My Listings'));
          }
        }
        else{
          //drawerItems2.add(addDrawerItem(profileRes?.user?.roleName));
          if(item.title != 'My Reviews'){
            drawerItems2.add(DrawerItem(iconAsset: LocalSVGImages.menu1, title: 'My Reviews'));
          }
        }
        Constant.drawerItems2 = drawerItems2;
      }

    }


    print('draweritem length ${ drawerItems2.length}');
    print('Constant.draweritem length ${ Constant.drawerItems2.length}');
  }

  Future<bool> _exitApp(BuildContext context) async {
    // Show a dialog to confirm app exit
    final exit = await showDialog(
        context: context,
        builder: (context) => ErrorDialog(
          titletxt: "",
            errorMsg: "Are you sure you want to exit the app?",
            onBackPress: () {
              Navigator.of(context).pop(true);
            })
        /*  AlertDialog(
        title: Text('Confirm Exit'),
        content: Text('Are you sure you want to exit the app?'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text('Exit'),
          ),
        ],
      ),*/
        );

    // If user confirmed, exit the app
    if (exit == true) {
      return true;
    }
    return false;
  }

  onFilterFailureRes(String p1) {}

  onFilterSuccessRes(DashBoardFilterModel? p1) {
  }

  void callTrendFilterapi() {
    print('_professionViewModel data ${_professionViewModel.UserAgeGroup}');
    Map<String, dynamic> filterparams2 = {
      "category_id": 0,
      "type": "trending_stocks",
      "age": "20-30",
      "sectors": "1",
      "city": "Chennai",
    };

    Provider.of<DashboardViewModel>(context, listen: false).dashboardfilterapi2(
        onFailureRes: onFilterFailureRes,
        onSuccessRes: onFilter2SuccessRes,
        filterparams: filterparams2);
  }

  onFilter2SuccessRes(DashBoardFilterModel? p1) {
    _professionViewModel.professionapi(
        onFailureRes: onProfFailureRes, onSuccessRes: onProfSuccessRes);
  }

  onProfFailureRes(String p1) {}

  onProfSuccessRes(ProfessionModel? p1) {
    if (_professionViewModel.FilterProfessionList != null &&
        _professionViewModel.FilterProfessionList.isNotEmpty) {
      print(
          '_professionViewModel.ProfessionList2 ${_professionViewModel.ProfessionList.length}');
      _professionViewModel
          .setUserProfessionTS(_professionViewModel.ProfessionList[1]);
    }
    if (_professionViewModel.AgeGroupList != null &&
        _professionViewModel.AgeGroupList.isNotEmpty) {
      _professionViewModel
          .setUserAgeGroup(_professionViewModel.AgeGroupList[0]);
    }
    if (_professionViewModel.filterCity != null &&
        _professionViewModel.filterCity.isNotEmpty) {
      _professionViewModel.setFilterCity(_professionViewModel.filterCity[1]);
    }
  }



  onPerSuccessRes(ExplorePerformModel? p1) {
  }

  void hitProfileApi(bool isTriggerProfile) {
    if(isTriggerProfile)
    _profileViewModel.profileapi(onFailureRes: onProfileFailureRes, onSuccessRes: onProfileSuccessRes);
  }
}

/*showCustomBottomSheet(BuildContext context, double devicehgt,double devicewdt, DashUser? selectedBroker) {

  print('ratings:: ${selectedBroker?.ratings}');
  print('chatEnable:: ${selectedBroker?.chatEnable.toString()}');

  showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(23.0),
      ),
    ),
    builder: (BuildContext context) {

  return  UserDetailFun(devicehgt,devicewdt,selectedBroker,context);
    },
  );
}*/








addDrawerItem(String? roleName) {
  if (roleName == "Brokers") {
    print('userRoll1 ${roleName}');
    return DrawerItem(iconAsset: LocalSVGImages.menu6, title: 'My Listings');
  } else if(roleName == "Advisors"){
    print('userRoll2 ${roleName}');
    return DrawerItem(iconAsset: LocalSVGImages.menu6, title: 'My Reviews');
  }else {
    print('userRoll3 ${roleName}');
    return DrawerItem(iconAsset: "", title: '');
  }
}


Category? SetCat(List<Category>? category, int? selectedCatId) {
  if (category != null) {
    for (Category item in category) {
      if (item.id == selectedCatId) {
        print('stock return in setcat ${item.categoryName}');
        return item;
      }
    }
  }
}

Stocks? SetStock(List<Stocks>? stocks, Stocks? stock) {
  print('stock return in setstock1 ${stocks?.length}');
  if (stocks != null) {
    for (Stocks item in stocks) {
      print('stock return in setstockname ${item.name}');
      if (item.id == stock?.id) {
        print('stock return in setstock ${item.name}');
        return item;
      }
    }
  }
}

void openFullScreenDrawer(BuildContext context, double deviceheight, List<DrawerItem> drawerItems2) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return FullScreenDrawer(
        drawerItems: drawerItems2,
        onPressChat: () {
          print("messgae inbox presed");
          inBoxNavfun(context);
          //Navigator.push(context, MaterialPageRoute(builder: (context) => SubscriptionDetail()));
        },
        onPressNotify: () {
          print("Notification presed");
          Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationPage()));
         // Navigator.push(context, MaterialPageRoute(builder: (context) => SelectPayment()));
        },
        onPressLogout: () {
          print("Log out");
          LogoutFun(context, false);
        },
        onItemSelected: (index,title) {
          print('Selected item index: $title');
          switch (title) {
           /* case "Profile":
              print("Profile presed");
              Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage(IsProfileEdit: true)));
              break;*/
              case "Profile":
              print("Profile presed");
              Navigator.push(context, MaterialPageRoute(builder: (context) => RegiterAndKyc()));
              break;
            case "KYC Update":
              print("update kyc presed roll: ${Constant.userRoll}");
              if (Constant.userRoll == "Users") {
                Navigator.push(context,MaterialPageRoute(builder: (context) => NewKycUser(IsKycUpdate: true)));
              } else if (Constant.userRoll == "Brokers") {
                Navigator.push(context, MaterialPageRoute(builder: (context) => KycDealer(IsKycUpdate: true)));
              } else if (Constant.userRoll == "Advisors") {
                Navigator.push(context, MaterialPageRoute(builder: (context) => KycAdvisor(IsKycUpdate: true)));
              } else {}
              break;
              case "Subscriptions Details":
              Navigator.push(context,MaterialPageRoute(builder: (context) => SubscriptionDetail()));
              break;
              case "Rewards & Referrals":
              print("Rewards presed");
              // context.router.push(const Rewardandreferal());
              Navigator.push(context, MaterialPageRoute(builder: (context) => RewardandReferral()));
              break;
            case "Promocode":
              print("promocode presed");
              // context.router.push(const Rewardandreferal());
              Navigator.push(context, MaterialPageRoute(builder: (context) => PromocodeList()));
              break;
            case "User Directory":
              print("User directory presed");
              // context.router.push(const Advisorandbroker());
              userDireNavFun(context);
              break;
            case "Transaction History":
              print("Transaction History presed");
              // context.router.push(const Transactionhistory());
              Navigator.push(context, MaterialPageRoute(builder: (context) => TransactionHistory()));
              break;
            case "My Portfolio":
              print("My potfolio presed");
              Navigator.push(context, MaterialPageRoute(builder: (context) => PortFolioPage()));
              break;
            case "Chat With Sauda Team":
              print("chat with sausa team");
              Navigator.push(context, MaterialPageRoute(builder: (context) => ChatRoomPage(chatuserID: 0, IsAdminChat: true,username: "Admin",)));
              break;
            case "Consultations":
              print("consultation list");
              Navigator.push(context, MaterialPageRoute(builder: (context) => ConsultationList()));
              break;
            case "My Listings":
              print("My listing presed");
              Navigator.push(context, MaterialPageRoute(builder: (context) => MyListingPage()));
              break;
            case "My Reviews":
              print("My Reviews presed");
              Navigator.push(context, MaterialPageRoute(builder: (context) => MyReviews()));
              break;
          }
        },
      );
    },
  );
}

void userDireNavFun(BuildContext context) {
  if (Constant.userRoll == 'Users' || Constant.userRoll == 'Guest') {
    Navigator.push(context, MaterialPageRoute(builder: (context) => AdvisorandBroker(IsClickForAdvisorHelp: false)));
  } else if (Constant.userRoll == 'Brokers') {
    Navigator.push(context, MaterialPageRoute(builder: (context) => DealerUserDirectory()));
  } else {
    Navigator.push(context, MaterialPageRoute(builder: (context) => AdvisorandBroker(IsClickForAdvisorHelp: false)));
  }
}

void LogoutFun(BuildContext context, bool isUnAuth) {
  print('logout pref ${Constant.isLoggedIn}');

  /* Route route = MaterialPageRoute(builder: (context) => WelcomePage());
    Navigator.pushReplacement(context, route);*/
  /*   Navigator.of(context).pushReplacement( MaterialPageRoute(builder: (context) => WelcomePage(),));*/
  showDialog(
      context: context,
      builder: (context) => ErrorDialog(
        titletxt: isUnAuth ?"Session Expired": "",
          errorMsg: isUnAuth
              ? "Your session has expired.You will be redirected to the Login page"
              : "Are you sure you want to Logout? ",
          onBackPress: () {
            PreferenceHelper.setString(PrefConstant.isLoggedIn, "false");
            PreferenceHelper.setString(PrefConstant.authtoken, "");
            // PreferenceHelper.remove(PrefConstant.authtoken);
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => WelcomePage()),
                (route) => false);
          }));
}

void inBoxNavfun(BuildContext context) {
  if (Constant.userRoll == 'Users' || Constant.userRoll == 'Guest') {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => DealerInbox()));
  } else if (Constant.userRoll == 'Brokers') {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => DealerInbox()));
  } else {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => DealerInbox()));
  }
}
