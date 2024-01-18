import 'package:base_flutter_provider_project/data/models/Explore_model/ExploreModel.dart';
import 'package:base_flutter_provider_project/ui/TradeUnlist/SendEnquiry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../common_widgets/Explore_widgets/Tab_Containers.dart';
import '../../common_widgets/Stock_widgets/StockSections.dart';
import '../../common_widgets/Stock_widgets/TrendingStocks.dart';
import '../../common_widgets/appbar_widgets/common_appbar.dart';
import '../../common_widgets/loading_widgets/loader.dart';
import '../../common_widgets/search_widgets/common_search.dart';
import '../../constants/colors.dart';
import '../../constants/local_images.dart';
import '../../viewModel/base_view_model/base_view_model.dart';
import '../../viewModel/dashboard_view_model.dart';
import '../../viewModel/explore_view_model.dart';
import '../explore/exploreDetail.dart';
import '../home/StockViewall.dart';
import '../home/homepage.dart';
import 'FAQunlisted.dart';

class TradeUnlisted extends StatefulWidget {
  const TradeUnlisted({Key? key}) : super(key: key);

  @override
  State<TradeUnlisted> createState() => _TradeUnlistedState();
}

class _TradeUnlistedState extends State<TradeUnlisted> {

  late DashboardViewModel _dashboardViewModel;
  late ExploreViewModel _exploreViewModel;
  @override
  void initState() {
    super.initState();
    _dashboardViewModel = Provider.of<DashboardViewModel>(context, listen: false);
    _exploreViewModel = Provider.of<ExploreViewModel>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      //Calling api after UI gets rendered successfully
      _exploreViewModel.exploreapi(onFailureRes: onFailureRes, onSuccessRes: onSuccessRes, catID: "1",PageNo: "1");

    });
  }

  @override
  Widget build(BuildContext context) {
    var deviceheight = MediaQuery.of(context).size.height;
    var devicewidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Appcolors.white,
      appBar: CustomAppBar(height: 60.0, title: 'Trade Unlisted', appbarclr: Appcolors.white),
      body: Container(
        height: deviceheight,
        width: devicewidth,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 18.0, right: 18),
            child: Column(
              children: [
            /*    CommonSearch(
                  hinttxt: "Search unlisted stocks by name",
                  onSearchTextChanged: (text) {},
                ),*/
                Stack(
                    children: [
                      Container(
                        height:235,
                         width: devicewidth,
                        // color: Colors.yellow,
                        child:  Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Hero(
                              tag: "tradeul",
                              child: SvgPicture.asset(
                                LocalSVGImages.tradeul4,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Image.asset(
                          LocalPNGImages.rocket,
                          width: 108,
                          height: 108,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        child: InkWell(
                          onTap: (){
                            print('send enguiry clicked');
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> SendEnquiry()));
                      },
                          child: Container(
                            height:60,
                            width: devicewidth/2,
                         //   color: Colors.red,
                          ),
                        ),
                      ),
                      Positioned(

                        bottom: 0,
                        right: 0,
                        child: InkWell(
                          onTap: (){
                            print('whatsapp clicked ');
                            openWhatsApp('+918882997496'); // Replace with the desired phone number

                          },
                          child: Container(
                            height:60,
                            width: devicewidth/2-50,
                           // color: Colors.green,
                          ),
                        ),
                      )
                    ]
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    print('faq clicked ');
                    Navigator.push(context, MaterialPageRoute(builder: (context) => FAQUnlisted()));
                  },
                  child: Container(

                    //  color: Colors.yellow,
                    child: Hero(
                      tag: "tradeul2",
                      child: SvgPicture.asset(
                        LocalSVGImages.tradeul2,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Consumer<ExploreViewModel>(
                    builder: (context,exmodel,child) {
                      return exmodel.state == ViewState.busy ? Loader():Container(
                          height: deviceheight,
                          width: devicewidth,
                          child: TabContainers(
                            IsMylisting: false,
                            IsFavorite: false,
                            IsIpo: false,
                            IsTopStocks: false,
                            IsBrowsing: false,
                            IsTendingStocks: false,
                            IsExplorePage: true,
                            onPressed: (selecteditems) {
                              print('explorre list clicked ${selecteditems?.categoryButtons?.length ?? "Cat Name is null"}');

                              Navigator.push(context, MaterialPageRoute(builder: (context)=> ExploreDetail(selectedstocks: selecteditems,isExplore: true,)));
                            },

                          )
                      );
                    }
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }

  void openWhatsApp(String phoneNumber) async {
   // Uri url = Uri.parse('whatsapp://send?phone=$phoneNumber');
    String whatsappUrl = "whatsapp://send?phone=$phoneNumber";

    Uri url = Uri.parse(whatsappUrl);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      // Handle an error if the URL can't be launched.
      print('Could not launch WhatsApp');
    }
  }

  onFailureRes(String p1) {
  }

  onSuccessRes(ExploreModel? p1) {
  }
}
