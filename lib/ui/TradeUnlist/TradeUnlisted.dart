import 'package:base_flutter_provider_project/ui/TradeUnlist/SendEnquiry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../common_widgets/Stock_widgets/StockSections.dart';
import '../../common_widgets/Stock_widgets/TrendingStocks.dart';
import '../../common_widgets/appbar_widgets/common_appbar.dart';
import '../../common_widgets/loading_widgets/loader.dart';
import '../../common_widgets/search_widgets/common_search.dart';
import '../../constants/colors.dart';
import '../../constants/local_images.dart';
import '../../viewModel/base_view_model/base_view_model.dart';
import '../../viewModel/dashboard_view_model.dart';
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
  final List<ListItem> items = [
    ListItem(
        lotsize: "1",
        stattxt: "Stat",
        statres: "E-Mobility",
        statres2: "100k",
        toprated: "Top Rated",
        text: 'Yellow Studios',
        statyears: "5+ years",
        rate: '132',
        shname: 'YLW',
        colors: 2,
        imageUrl: LocalPNGImages.cp1),
    ListItem(
        lotsize: "1",
        stattxt: "Stat",
        statres: "E-Mobility",
        statres2: "100k",
        toprated: "Pharma Focused",
        statyears: "5+ years",
        text: 'Purple Flame Co.',
        rate: '1681',
        shname: 'PFC',
        colors: 2,
        imageUrl: LocalPNGImages.cp2),
    ListItem(
        lotsize: "1",
        stattxt: "Stat",
        statres: "E-Mobility",
        statres2: "100k",
        toprated: "Crypto",
        statyears: "5+ years",
        text: 'Dino Pharma',
        rate: '541',
        shname: 'DRL',
        colors: 2,
        imageUrl: LocalPNGImages.cp3),
    ListItem(
        lotsize: "1",
        stattxt: "Stat",
        statres: "E-Mobility",
        statres2: "100k",
        toprated: "Top Rated",
        statyears: "5+ years",
        text: 'API Holdings',
        rate: '321',
        shname: 'API',
        colors: 2,
        imageUrl: LocalPNGImages.cp4),
    ListItem(
        lotsize: "1",
        stattxt: "Stat",
        statres: "E-Mobility",
        statres2: "100k",
        toprated: "Top Rated",
        statyears: "5+ years",
        text: 'Abservetech',
        rate: '150',
        shname: 'ABS',
        colors: 5,
        imageUrl: LocalPNGImages.cp5),

    ListItem(
        lotsize: "1",
        stattxt: "Stat",
        statres: "E-Mobility",
        statres2: "100k",
        toprated: "Top Rated",
        statyears: "5+ years",
        text: 'Yellow Studios',
        rate: '132',
        shname: 'YLW',
        colors: 5,
        imageUrl: LocalPNGImages.cp1),
    ListItem(
        lotsize: "1",
        stattxt: "Stat",
        statres: "E-Mobility",
        statres2: "100k",
        toprated: "Top Rated",
        statyears: "5+ years",
        text: 'Purple Flame Co.',
        rate: '1681',
        shname: 'PFC',
        colors: 6,
        imageUrl: LocalPNGImages.cp2),
    ListItem(
        lotsize: "1",
        stattxt: "Stat",
        statres: "E-Mobility",
        statres2: "100k",
        toprated: "Top Rated",
        statyears: "5+ years",
        text: 'Dino Pharma',
        rate: '541',
        shname: 'DRL',
        colors: 6,
        imageUrl: LocalPNGImages.cp3),
  ];
  late DashboardViewModel _dashboardViewModel;

  @override
  void initState() {
    super.initState();
    _dashboardViewModel = Provider.of<DashboardViewModel>(context, listen: false);
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
      /*  Consumer<DashboardViewModel>(
        builder: (context, dashoardviewmodel, child) {
          return   StocksSections(
            OnTopStocksPressed2: (selectedTopStocks2){},
            OnTopStocksPressed: (selectedTopStocks){},
              OnIpoStocksPressed: (selectedIpoStocks){},
              Filterdata: [],
              ipostocks: [],
              featuredStocks: dashoardviewmodel.dashboardResponseModel?.data?.featuredStocks,
              viewall: "viewallul",
              optionslist: [],
              firsttitle: "Fetured",
              secondtitle: "Top Stocks",
              imagetag: "topstocksviewall",
              items: items,
              devicewidth: devicewidth);
        }),*/
                Consumer<DashboardViewModel>(
                    builder: (context, dashfildata, child) {
                      return  dashfildata.state == ViewState.busy? Loader():StocksSections(
                        ViewallClick: (v){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => StockViewallPage(stockname: "Top Stocks")));
                        },
                          OnTopStocksPressed2: (selectedTopStocks2){},
                          Filterdata: dashfildata.dashboardFilterResponseModel?.data ?? [],
                          OnIpoStocksPressed: (selectedIpoStocks) {},
                          OnTopStocksPressed: (selectedTopStocks) {
                            print('Top Stocks Clicked name${selectedTopStocks?.stock?.name ?? ""}');
                            print('Top Stocks Clicked id${selectedTopStocks?.stock?.id ?? ""}');
                            if (selectedTopStocks?.stock != null) {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => ExploreDetail(selectedstocks: selectedTopStocks?.stock,isExplore: false,)));
                            }
                          },
                          viewall: "viewall",
                          optionslist: dashfildata.catList,
                          /*  optionslist: [
                                        'Stock Category',
                                        'Medical',
                                        'Software'
                                      ],*/
                          firsttitle: "Fetured",
                          secondtitle: "Top Stocks",
                          imagetag: "topstocksviewall",
                          items: items,
                          devicewidth: devicewidth,
                          featuredStocks: _dashboardViewModel
                              .dashboardResponseModel?.data
                              ?.featuredStocks,
                          ipostocks: []);
                    }
                ),

                Consumer<DashboardViewModel>(
                builder: (context, dashTS, child) {
                  return TrendingStocks(
                    imagetag: "Trendingstocks",
                    secondtitle: "",
                    firsttitle: "Trending Stocks",
                    devicewidth: devicewidth,
                    onPressed: () {
                      print('discover more clicked in trade unlisted');
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>StockViewallPage(stockname: "Trending Stocks")));
                    },
                    trendingstocks: dashTS.dashboardResponseModel?.data?.trendingstocks ?? [],
                    Filterdata: dashTS.dashboardFilterResponseModel2?.data ?? [],
                    OnTrengStocksPressed: (selectedTrendStocks){
                      print('onpress trending stocks ${selectedTrendStocks?.stock?.name ?? ""}');
                      if (selectedTrendStocks?.stock != null) {
                        // Route route = MaterialPageRoute(builder: (context) => ExploreDetail(selectedstocks: selectedTrendStocks?.stock,isExplore: false,));
                        // Navigator.pushReplacement(context, route);
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ExploreDetail(selectedstocks: selectedTrendStocks?.stock,isExplore: true,)));
                      }
                    },
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
}
