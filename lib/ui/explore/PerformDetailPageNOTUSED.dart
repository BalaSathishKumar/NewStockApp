

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../common_widgets/appbar_widgets/homepage_appbar.dart';
import '../../common_widgets/loading_widgets/loader.dart';
import '../../common_widgets/search_widgets/common_search.dart';
import '../../constants/local_images.dart';
import '../../data/models/Explore_model/ExploreModel.dart';
import '../../data/models/Explore_model/PerformDetailModel.dart';
import '../../utils/common_functions.dart';
import '../../utils/common_textstyles.dart';
import '../../viewModel/base_view_model/base_view_model.dart';
import '../../viewModel/explore_view_model.dart';
import '../home/homepage.dart';
import 'exploreDetail.dart';

class PerformDetailPage extends StatefulWidget {
  final num? browswid;
  PerformDetailPage({
    required this.browswid
});

  @override
  State<PerformDetailPage> createState() => _PerformDetailPageState();
}

class _PerformDetailPageState extends State<PerformDetailPage> {


  final List<ListItem> items = [
    ListItem(
        lotsize: "1",
        stattxt: "Stat",
        statres: "E-Mobility",
        statres2: "100k",
        toprated: "Top Performing Stocks",
        text: 'Yellow Studios',
        statyears: "5+ years",
        rate: '132',
        shname: 'YLW',
        colors: 0xFF3366FF,
        imageUrl: LocalPNGImages.exp3),
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
        colors: 0xFF3366FF,
        imageUrl: LocalPNGImages.exp4),
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
        colors: 0xFF3366FF,
        imageUrl: LocalPNGImages.exp3),
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
        colors: 0xFF3366FF,
        imageUrl: LocalPNGImages.exp4),
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
        colors: 0xFF3366FF,
        imageUrl: LocalPNGImages.exp3),
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
        colors: 0xFF3366FF,
        imageUrl: LocalPNGImages.exp4),
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
        colors: 0xFF3366FF,
        imageUrl: LocalPNGImages.exp3),
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
        colors: 0xFF3366FF,
        imageUrl: LocalPNGImages.exp4),
    ListItem(
        lotsize: "1",
        stattxt: "Stat",
        statres: "E-Mobility",
        statres2: "100k",
        toprated: "Top Rated",
        statyears: "5+ years",
        text: 'Dino PharmaTEST',
        rate: '541',
        shname: 'DRL',
        colors: 0xFF3366FF,
        imageUrl: LocalPNGImages.exp4),
  ];
  late ExploreViewModel _exploreViewModel;

  @override
  void initState() {
    super.initState();
    _exploreViewModel = Provider.of<ExploreViewModel>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      //Calling api after UI gets rendered successfully
     // _exploreViewModel.performdetailapi(onFailureRes: onFailureRes, onSuccessRes: onPerSuccessRes, BrowseID: widget.browswid.toString());
    });
  }



  @override
  Widget build(BuildContext context) {
    var deviceheight = MediaQuery.of(context).size.height;
    var devicewidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Container(
          height: deviceheight,
          width: devicewidth,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: HomePageAppBar(
                      onPressedmenu: (){},
                      onPressed: () {
                        // context.router.push(Searchpage());
                      },
                      logotag: "greenlogo",
                      devicewidth: devicewidth,
                      iconpath: ""),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18.0, top: 6, right: 18),
                  child: Container(
                    height: deviceheight,
                    width: devicewidth,
                    // color: Colors.red.shade100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Container(
                                height: 50,
                                child: CommonSearch(
                                  hinttxt: 'Search stocks by name',
                                  onSearchTextChanged: (text) {},
                                ),
                              ),
                            ),
                          ],
                        ),
                        buildSizedBox(height: 10, width: 0),
                        Expanded(
                          child: PerformContent()
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }



  onFailureRes(String p1) {
  }

  onPerSuccessRes(PerformDetailModel? p1) {


  }
}

class PerformContent extends StatefulWidget {

  @override
  State<PerformContent> createState() => _PerformContentState();
}

class _PerformContentState extends State<PerformContent> {
  final List<ListItem> items = [
    ListItem(
        lotsize: "1",
        stattxt: "Stat",
        statres: "E-Mobility",
        statres2: "100k",
        toprated: "Top Performing Stocks",
        text: 'Yellow Studios',
        statyears: "5+ years",
        rate: '132',
        shname: 'YLW',
        colors: 0xFF00FF7F,
        imageUrl: LocalPNGImages.exp3),
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
        colors: 0xFFFF1493,
        imageUrl: LocalPNGImages.exp4),
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
        colors: 0xFF00FFFF,
        imageUrl: LocalPNGImages.exp3),
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
        colors: 0xFFFFA500,
        imageUrl: LocalPNGImages.exp4),
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
        colors: 0xFF9900CC,
        imageUrl: LocalPNGImages.exp3),
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
        colors: 0xFF00FF00,
        imageUrl: LocalPNGImages.exp4),
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
        colors: 0xFFFF0000,
        imageUrl: LocalPNGImages.exp3),
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
        colors: 0xFF3366FF,
        imageUrl: LocalPNGImages.exp4),

    ListItem(
        lotsize: "1",
        stattxt: "Stat",
        statres: "E-Mobility",
        statres2: "100k",
        toprated: "Top Performing Stocks",
        text: 'Yellow Studios',
        statyears: "5+ years",
        rate: '132',
        shname: 'YLW',
        colors: 0xFF3366FF,
        imageUrl: LocalPNGImages.exp3),
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
        colors: 0xFF3366FF,
        imageUrl: LocalPNGImages.exp4),
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
        colors: 0xFF3366FF,
        imageUrl: LocalPNGImages.exp3),
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
        colors: 0xFF3366FF,
        imageUrl: LocalPNGImages.exp4),
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
        colors: 0xFF3366FF,
        imageUrl: LocalPNGImages.exp3),
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
        colors: 0xFF3366FF,
        imageUrl: LocalPNGImages.exp4),
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
        colors: 0xFF3366FF,
        imageUrl: LocalPNGImages.exp3),
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
        colors: 0xFF3366FF,
        imageUrl: LocalPNGImages.exp4),
    ListItem(
        lotsize: "1",
        stattxt: "Stat",
        statres: "E-Mobility",
        statres2: "100k",
        toprated: "Top Rated",
        statyears: "5+ years",
        text: 'Dino PharmaTEST',
        rate: '541',
        shname: 'DRL',
        colors: 0xFF3366FF,
        imageUrl: LocalPNGImages.exp4),
  ];


  late ExploreViewModel _exploreViewModel;

  @override
  void initState() {
    super.initState();



  }
  @override
  Widget build(BuildContext context) {

    var deviceheight = MediaQuery.of(context).size.height;
    var devicewidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer<ExploreViewModel>(
          builder: (context, performdetail, child) {

        return performdetail.state == ViewState.busy ? Loader():Container(
                height: deviceheight,
                width: devicewidth,
                child: getStockLength( performdetail.PFDexploreModel?.data?.stocks)?Center(child: Text("No Data Found")) :

                StockDetailContainer(
                            items: items,
                            deviceheight: deviceheight,
                            devicewidth: devicewidth,
                            stockitem: performdetail.PFDexploreModel?.data?.stocks ?? [],
                            onPressed: (selectedvalues){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> ExploreDetail(selectedstocks: selectedvalues?.stock,isExplore: true,)));
                            })

            );
          }
      ),
    );
  }

  onFailureRes(String p1) {
  }



  getStockLength(List<StocksPD>? stocks) {
    if(stocks != null && stocks.isEmpty){
      return true;
    } else{
      return false;
    }
  }
}

class StockDetailContainer extends StatelessWidget {
  const StockDetailContainer(  {
    super.key,
    required this.items,
    required this.stockitem,
    required this.deviceheight,
    required this.devicewidth,
    required this.onPressed,
  });

  final List<ListItem> items;
  final List<StocksPD?> stockitem;
  final Function(StocksPD?) onPressed;
  final double deviceheight;
  final double devicewidth;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        //itemCount: items.length,
          itemCount: stockitem.length,
          // widget.IsFavorite ? favdata.getFavModel?.favorites?.length ?? 0
          // : expdata.exploreModel?.data?.stocks?.length ?? 0,
          itemBuilder: (context, index) {
            //var calist = widget.IsFavorite ? favstocks : expdata.exploreModel?.data?.stocks;
            var calist = stockitem;
           print('pfdetailsssssse ${stockitem[0]?.stock?.name}');
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  onPressed(calist[index]);
                },
                child: Container(
                  height: 120,
                  decoration: BoxDecoration(
                    color: Color( 0xFF00FF7F).withOpacity(0.1),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                        bottomRight: Radius.circular(16),
                        bottomLeft: Radius.circular(16)),),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          // Flex factor of 2, takes up 2 parts out of 3
                          child: Column(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Container(
                                  // bgclr 1
                                  child: Padding(
                                    padding: const EdgeInsets
                                        .all(
                                        8.0),
                                    child: ClipRRect(
                                      borderRadius:
                                      BorderRadius.circular(
                                          15),
                                      /*   child: Image.asset( items[index].imageUrl,
                                            width: 60,
                                            height: 40,
                                            fit: BoxFit.cover),*/

                                      child: Image.network(
                                        calist[index]?.stock?.photoUrl ?? "",
                                        width: 60,
                                        height: 40,
                                        fit: BoxFit.cover,
                                      )

                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(

                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment
                                        .start,
                                    children: [
                                      Expanded(
                                          flex: 1,
                                          child: Text(
                                            //"1000 Shares",
                                            calist[index]?.stock?.lotSize ??
                                                "",
                                            style: CustomTextStyle
                                                .txt12Rbtxtblk,
                                          )),
                                      Expanded(
                                          flex: 1,
                                          child: Text(
                                              "Lot Size",
                                              style: CustomTextStyle
                                                  .txt12Rrtxtblk)),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          // Flex factor of 2, takes up 2 parts out of 3
                          child: Column(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(

                                  //   color: Colors.red.shade50,    // bgclr 3
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          //         color: Colors.yellow,  // bgclr 4
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment
                                                .spaceBetween,
                                            children: [
                                              Expanded(
                                                  flex: 1,
                                                  child: Text(
                                                    //  items[index].text,
                                                    calist[index]?.stock?.name ??
                                                        "",
                                                    maxLines: 1,
                                                    overflow: TextOverflow
                                                        .ellipsis,
                                                    style: CustomTextStyle
                                                        .txt16Rb,
                                                  )),
                                              Container(
                                                height: 50,
                                                width: 80,
                                                //          color: Colors.lightBlue,
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                        flex: 1,
                                                        child: Text(
                                                            "\u20B9 ${calist[index]?.stock?.buyingPrice}",
                                                            maxLines: 1,
                                                            overflow: TextOverflow
                                                                .ellipsis,
                                                            style: CustomTextStyle
                                                                .txt16Rb)),
                                                    /*buildSizedBox(
                                                                height: 0,
                                                                width: 5),*/
                                                    SvgPicture
                                                        .asset(
                                                        LocalSVGImages
                                                            .stockdown,
                                                        height: 15,
                                                        width: 15),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          //    color: Colors.red,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment
                                                .spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment
                                                .start,
                                            children: [
                                              Expanded(
                                                  flex: 1,
                                                  child: Text(
                                                    calist[index]?.stock?.maturity ??
                                                        "",
                                                    maxLines: 1,
                                                    overflow: TextOverflow
                                                        .ellipsis,
                                                    style: CustomTextStyle
                                                        .txt14Rrtxtblktxtpurple,
                                                  )),
                                              Container(
                                                height: 50,
                                                width: 80,
                                                //   color: Colors.lightGreenAccent,
                                                child: Row(
                                                  crossAxisAlignment: CrossAxisAlignment
                                                      .start,
                                                  children: [
                                                    Expanded(
                                                        flex: 1,
                                                        child: Text(
                                                            "\u20B9 ${calist[index]?.stock?.sellingPrice}",
                                                            maxLines: 1,
                                                            overflow: TextOverflow
                                                                .ellipsis,
                                                            style: CustomTextStyle
                                                                .txt14Rrtxtblk)),
                                                    /*    buildSizedBox(
                                                                height: 0,
                                                                width: 5),*/
                                                    SvgPicture
                                                        .asset(
                                                        LocalSVGImages
                                                            .stockup,
                                                        height: 15,
                                                        width: 15),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  //         color: Colors.orange,                     // bgclr 5
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Container(
                                          //             color: Colors.yellow,
                                          height: deviceheight,
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .center,
                                            children: [
                                              Expanded(
                                                flex: 1,
                                                child: Container(
                                                  height: deviceheight,
                                                  width: devicewidth,
                                                  //   color: Colors.red,
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                        .only(
                                                        right: 8.0),
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment
                                                          .end,
                                                      children: [
                                                        Flexible(
                                                          child: Text(
                                                              "\u20B9${calist[index]?.stock?.High}" ??
                                                                  "",
                                                              maxLines: 1,
                                                              style: CustomTextStyle
                                                                  .txt12Rbtxtgreen),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: Container(
                                                  //  color: Colors.blue,
                                                  height: deviceheight,
                                                  width: devicewidth,
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                        .only(
                                                        right: 8.0),
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment
                                                          .end,
                                                      children: [
                                                        Flexible(
                                                          child: Text(
                                                              "High",
                                                              textAlign:
                                                              TextAlign
                                                                  .right,
                                                              style: CustomTextStyle
                                                                  .txt12Rrtxtgreen),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Container(
                                          height: deviceheight,
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .center,
                                            children: [
                                              Expanded(
                                                  flex: 1,
                                                  child: Container(
                                                    height: 20,
                                                    width: devicewidth,
                                                    //   color: Colors.white,
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                          .only(
                                                          left: 8.0),
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment
                                                            .start,
                                                        children: [
                                                          Flexible(
                                                            child: Text(
                                                                "\u20B9${calist[index]?.stock?.Low}" ??
                                                                    "",
                                                                style: CustomTextStyle
                                                                    .txt12Rbtxtorange),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  )),
                                              Expanded(
                                                  flex: 1,
                                                  child: Container(
                                                    height: deviceheight,
                                                    width: devicewidth,
                                                    //  color: Colors.green,
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                          .only(
                                                          left: 8.0),
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment
                                                            .start,
                                                        children: [
                                                          Flexible(
                                                            child: Text(
                                                                "Low",
                                                                style: CustomTextStyle
                                                                    .txt12Rrtxtorange),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  )),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          height: deviceheight,
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .center,
                                            children: [
                                              Expanded(
                                                flex: 1,
                                                child: Container(
                                                  height: deviceheight,
                                                  width: devicewidth,
                                                  //      color: Colors.lightGreenAccent,
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                        .only(
                                                        left: 2.0),
                                                    child: Row(
                                                      crossAxisAlignment: CrossAxisAlignment
                                                          .start,
                                                      mainAxisAlignment: MainAxisAlignment
                                                          .center,
                                                      children: [
                                                        Text(
                                                            calist[index]?.stock?.userRating ??
                                                                "",
                                                            style: CustomTextStyle
                                                                .txt12Rrtxtblk),
                                                        Icon(
                                                          Icons
                                                              .star,
                                                          color:
                                                          Colors
                                                              .yellow,
                                                          size: 15,
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                  flex: 1,
                                                  child: Container(
                                                    height: deviceheight,
                                                    width: devicewidth,
                                                    //      color: Colors.purple,
                                                    child: Text(
                                                        "User",
                                                        style: CustomTextStyle
                                                            .txt12Rrtxtblk),
                                                  )),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          height: deviceheight,
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .center,
                                            children: [
                                              Expanded(
                                                flex: 1,
                                                child: Container(
                                                  height: deviceheight,
                                                  width: devicewidth,
                                                  // color: Colors.lightGreenAccent,
                                                  child: Row(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .start,
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .center,
                                                    children: [
                                                      Text(
                                                          calist[index]?.stock?.saudaRating ??
                                                              "",
                                                          style: CustomTextStyle
                                                              .txt12Rrtxtblk),
                                                      Icon(
                                                        Icons
                                                            .star,
                                                        color:
                                                        Colors
                                                            .yellow,
                                                        size: 15,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                  flex: 1,
                                                  child: Container(
                                                    height: deviceheight,
                                                    width: devicewidth,
                                                    //   color: Colors.red,
                                                    child: Text(
                                                        "Sauda",
                                                        style: CustomTextStyle
                                                            .txt12Rrtxtblk),
                                                  )),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}




