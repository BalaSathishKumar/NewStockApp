import 'package:base_flutter_provider_project/constants/colors.dart';
import 'package:base_flutter_provider_project/data/models/DealerModels/MyListingModel.dart';
import 'package:base_flutter_provider_project/data/models/Explore_model/PerformDetailModel.dart';
import 'package:base_flutter_provider_project/data/models/dashboard_model/DashBoardFilterModel.dart';
import 'package:base_flutter_provider_project/data/models/dashboard_model/DashboardResponseModel.dart';
import 'package:base_flutter_provider_project/ui/home/homepage.dart';
import 'package:base_flutter_provider_project/utils/common_functions.dart';
import 'package:base_flutter_provider_project/utils/common_textstyles.dart';
import 'package:base_flutter_provider_project/viewModel/performViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../constants/constant.dart';
import '../../constants/local_images.dart';
import '../../data/models/Explore_model/ExploreModel.dart';
import '../../data/models/Explore_model/GetFavouriteModel.dart';
import '../../viewModel/CommonProvider.dart';
import '../../viewModel/CreateList_ViewModel.dart';
import '../../viewModel/base_view_model/base_view_model.dart';
import '../../viewModel/dashboard_view_model.dart';
import '../../viewModel/explore_detail_view_model.dart';
import '../../viewModel/explore_view_model.dart';
import '../loading_widgets/loader.dart';

class TabContainers extends StatefulWidget {
  const TabContainers({
    super.key,

    required this.onPressed,
    required this.IsFavorite,
    required this.IsMylisting,
    required this.IsTopStocks,
    required this.IsIpo,
    required this.IsBrowsing,
    required this.IsTendingStocks,
    required this.IsExplorePage,
  });


  final Function(Stocks?) onPressed;
  final bool IsFavorite;
  final bool IsMylisting;
  final bool IsTopStocks;
  final bool IsIpo;
  final bool IsBrowsing;
  final bool IsTendingStocks;
  final bool IsExplorePage;

  @override
  State<TabContainers> createState() => _TabContainersState();
}

class _TabContainersState extends State<TabContainers> {
  final List<Stocks>? ExploreStocks = [];
  final List<Stocks>? favstocks = [];
  final List<Stocks>? performdetail = [];
  final List<Stocks>? mylistingStocks = [];
  final List<Stocks>? HomeIpoStocks = [];
  final List<Stocks>? HomeTopStocks = [];
  final List<Stocks>? Browsingstocks = [];
  final List<Stocks>? TrendingStocks = [];
  late CommonProvider _commonProvider;
  late ExploreViewModel _exploreViewModel;
  ScrollController? _scrollController;
   double? _scrollPosition = 0.0;
   int pageNo = 1;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController?.position.pixels;
      if (_scrollPosition == 0) {
       // print('At top');
      //  print('_scrollPosition... ${_scrollPosition}');
      } else {
      //  print('At bottom and cat id: ${_commonProvider.ExploreCatId}');
      //  _scrollController.position.pixels == _scrollController.position.maxScrollExtent
      //  print('_scrollPosition... ${_scrollPosition} and max scroll ${_scrollController?.position.maxScrollExtent}');

        if(_scrollPosition == _scrollController?.position.maxScrollExtent){
          if(!_commonProvider.IsLastPage){
            pageNo++;
            _commonProvider.setPageNoExplore(pageNo.toString());
            _exploreViewModel.exploreapi(onFailureRes: onFailureRes, onSuccessRes: onSuccessRes, catID: _commonProvider.ExploreCatId,PageNo: pageNo.toString());
          }

        }

      }

    });
  }

  @override
  void initState() {
    _commonProvider = Provider.of<CommonProvider>(context, listen: false);
    _exploreViewModel = Provider.of<ExploreViewModel>(context, listen: false);
    ExploreStocks?.clear();
    _scrollController = ScrollController();
    _scrollController?.addListener(_scrollListener);

    super.initState();
  }




  @override
  Widget build(BuildContext context) {

    var deviceheight = MediaQuery.of(context).size.height;
    var devicewidth = MediaQuery.of(context).size.width;
    return Consumer<CreateListViewModel>(
      builder: (context,mylistdata,child) {
        addMyListStocks(mylistdata.MyListResponseModel?.listings);   //add create list stocks
        return ( Consumer<DashboardViewModel>(
            builder: (context, dashdata, child) {
              addipoStocks(dashdata.dashboardResponseModel?.data?.ipoFpo); // add ipo
              addTopStocks(dashdata.dashboardFilterResponseModel?.data); // add top stocks
              addTrendingStocks(dashdata.dashboardFilterResponseModel2?.data); // add trending stocks
              return Scaffold(
                  backgroundColor: Appcolors.white,
                  body: Consumer<ExploreDetailViewModel>(
                      builder: (context, favdata, child) {
                        addFavStocks(favdata.getFavModel?.favorites); //add fav stocks
                        return Consumer<PerformViewModel>(
                            builder: (context, pfmdata, child) {
                          return Container(
                            child: Consumer<ExploreViewModel>(
                                builder: (context, expdata, child) {
                                  addBrowsingStocks(pfmdata.PFDexploreModel?.data?.stocks);//add brows stocks
                                //  addExploreData(expdata.exploreModel?.data?.stocks);//add exp stocks
                                //  return expdata.state == ViewState.busy ? Loader() : CheckCatlist(expdata.exploreModel?.data?.stocks,expdata.ExploreStocksVM) //ExploreStocks
                                  return  CheckCatlist(expdata.exploreModel?.data?.stocks,expdata.ExploreStocksVM) //ExploreStocks
                                      ? Container(
                                    height: 50,
                                    width: devicewidth,
                                    //  color: Colors.red,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text("No Data Found"),
                                      ],
                                    ),
                                  )
                                      : ListView.builder(
                                    //itemCount: items.length,
                                      controller: _scrollController,
                                      itemCount: widget.IsExplorePage ?  expdata.ExploreStocksVM?.length ?? 0 + 1:getItemCount(
                                          favdata.getFavModel?.favorites?.length,
                                          expdata.exploreModel?.data?.stocks?.length,
                                          mylistdata.MyListResponseModel?.listings?.length,
                                          dashdata.dashboardResponseModel?.data?.ipoFpo?.length,
                                          dashdata.dashboardFilterResponseModel?.data?.length,
                                          pfmdata.PFDexploreModel?.data?.stocks?.length,
                                          dashdata.dashboardFilterResponseModel2?.data?.length,
                                          expdata.ExploreStocksVM?.length
                                      ),
                                      // widget.IsFavorite ? favdata.getFavModel?.favorites?.length ?? 0
                                      // : expdata.exploreModel?.data?.stocks?.length ?? 0,
                                      itemBuilder: (context, index) {
                                        //var calist = widget.IsFavorite ? favstocks : expdata.exploreModel?.data?.stocks;
                                        List<Stocks> calist = getCatList(expdata.exploreModel?.data?.stocks, expdata.ExploreStocksVM);

                                        if(widget.IsExplorePage){
                                          if(index < expdata.ExploreStocksVM.length){
                                            return
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: InkWell(
                                                onTap: () {
                                                  if (calist != null) {
                                                    if (calist[index].listData != null && calist[index].listData!.isNotEmpty) {
                                                      print(
                                                          " on click tab ${calist[index].listData?[0].key}");
                                                    } else {
                                                      print('wish null');
                                                    }

                                                    widget.onPressed(calist[index]);
                                                  }
                                                },
                                                child: Container(
                                                  height: 120,
                                                  decoration: BoxDecoration(
                                                    color: Color(
                                                      //  widget.items[index].colors).withOpacity(0.1),
                                                        0xFF00FF7F).withOpacity(0.1),
                                                    borderRadius: BorderRadius.only(
                                                        topLeft: Radius.circular(16),
                                                        topRight: Radius.circular(16),
                                                        bottomRight: Radius.circular(
                                                            16),
                                                        bottomLeft: Radius.circular(
                                                            16)),
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(
                                                        8.0),
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
                                                                  // color: Colors.blue,
                                                                  child: Padding(
                                                                    padding: const EdgeInsets
                                                                        .all(8.0),
                                                                    child: ClipRRect(
                                                                      borderRadius: BorderRadius
                                                                          .circular(
                                                                          15),
                                                                      child: calist[index]
                                                                          .photoUrl !=
                                                                          null &&
                                                                          calist[index]
                                                                              .photoUrl !=
                                                                              ""
                                                                          ? Image
                                                                          .network(
                                                                        calist[index]
                                                                            .photoUrl ??
                                                                            "",
                                                                        width: 60,
                                                                        height: 40,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      )
                                                                          : PlaceholderImage(),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                flex: 1,
                                                                child: Container(
                                                                  //     color: Colors.green,
                                                                  child: Padding(
                                                                    padding: const EdgeInsets
                                                                        .only(
                                                                        top: 3.0),
                                                                    child: Column(
                                                                      crossAxisAlignment: CrossAxisAlignment
                                                                          .start,
                                                                      mainAxisAlignment: MainAxisAlignment
                                                                          .center,
                                                                      children: [
                                                                        Expanded(
                                                                            flex: 1,
                                                                            child: Text(
                                                                              //calist?[index].lotSize ?? "",
                                                                              widget.IsMylisting ? ""
                                                                                  : setFirstValue(
                                                                                  calist[index].listData),
                                                                              maxLines: 1,
                                                                              overflow: TextOverflow
                                                                                  .ellipsis,
                                                                              style: CustomTextStyle
                                                                                  .txt12Rbtxtblk,
                                                                            )),
                                                                        Expanded(
                                                                            flex: 1,
                                                                            child: Text(
                                                                              //"Lot Size",
                                                                                widget.IsMylisting ? "Status: ${calist[index]
                                                                                    .statusText}"
                                                                                    : setFirstKey(
                                                                                    calist[index]
                                                                                        .listData),
                                                                                maxLines: 1,
                                                                                overflow: TextOverflow
                                                                                    .ellipsis,
                                                                                style: widget
                                                                                    .IsMylisting
                                                                                    ? CustomTextStyle
                                                                                    .txt12Rrtxtred
                                                                                    : CustomTextStyle
                                                                                    .txt12Rrtxtblk)),
                                                                      ],
                                                                    ),
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
                                                                flex: 2,
                                                                child: Container(
                                                                  //   color: Colors.red.shade50,    // bgclr 3
                                                                  child: Column(
                                                                    crossAxisAlignment: CrossAxisAlignment
                                                                        .start,
                                                                    children: [
                                                                      Expanded(
                                                                        flex: 1,
                                                                        child: Container(
                                                                          //      color: Colors.yellow,  // bgclr 4
                                                                          child: Row(
                                                                            mainAxisAlignment: MainAxisAlignment
                                                                                .spaceBetween,
                                                                            crossAxisAlignment: CrossAxisAlignment
                                                                                .end,
                                                                            children: [
                                                                              Expanded(
                                                                                  flex: 1,
                                                                                  child: Text(
                                                                                    //  items[index].text,
                                                                                    calist[index]
                                                                                        .name ??
                                                                                        "",
                                                                                    maxLines: 1,
                                                                                    overflow: TextOverflow
                                                                                        .ellipsis,
                                                                                    style: CustomTextStyle
                                                                                        .txt16Rb,
                                                                                  )),
                                                                              Expanded(
                                                                                flex: 1,
                                                                                child:
                                                                                Container(
                                                                                  height: 50,
                                                                                  width: 80,
                                                                                  //       color: Colors.lightBlue,
                                                                                  child: Row(
                                                                                    crossAxisAlignment: CrossAxisAlignment
                                                                                        .end,
                                                                                    children: [
                                                                                      Expanded(
                                                                                          child: Padding(
                                                                                            padding: const EdgeInsets
                                                                                                .only(
                                                                                                right: 5.0),
                                                                                            child:
                                                                                            Align(
                                                                                              alignment: Alignment
                                                                                                  .bottomRight,
                                                                                              child: Text(
                                                                                                  "${Constant.rupeeSymbol}${calist[index]
                                                                                                      .buyingPrice}",
                                                                                                  maxLines: 1,
                                                                                                  overflow: TextOverflow
                                                                                                      .ellipsis,
                                                                                                  style: CustomTextStyle
                                                                                                      .txt16Rb),
                                                                                            ),
                                                                                          )),
                                                                                      buildSizedBox(
                                                                                height: 0,
                                                                                width: 5),
                                                                                      SvgPicture
                                                                                          .asset(
                                                                                          LocalSVGImages
                                                                                              .stockdown,
                                                                                          height: 15,
                                                                                          width: 15),
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
                                                                          //       color: Colors.red,
                                                                          child: Row(
                                                                            mainAxisAlignment: MainAxisAlignment
                                                                                .spaceBetween,
                                                                            crossAxisAlignment: CrossAxisAlignment
                                                                                .start,
                                                                            children: [
                                                                              Expanded(
                                                                                  flex: 1,
                                                                                  child: Text(
                                                                                    calist[index]
                                                                                        .maturity ??
                                                                                        "",
                                                                                    maxLines: 1,
                                                                                    overflow: TextOverflow
                                                                                        .ellipsis,
                                                                                    style: CustomTextStyle
                                                                                        .txt14Rrtxtblktxtpurple,
                                                                                  )),
                                                                              Expanded(
                                                                                flex: 1,
                                                                                child:
                                                                                Container(
                                                                                  height: 50,
                                                                                  width: 80,
                                                                                  //   color: Colors.lightGreenAccent,
                                                                                  child: Row(
                                                                                    children: [
                                                                                      Expanded(

                                                                                          child: Padding(
                                                                                            padding: const EdgeInsets
                                                                                                .only(
                                                                                                right: 5.0),
                                                                                            child:
                                                                                            Align(
                                                                                              alignment: Alignment.centerRight,
                                                                                              child: Text(
                                                                                                  "${Constant.rupeeSymbol} ${calist[index].sellingPrice}",
                                                                                                  maxLines: 1,
                                                                                                  overflow: TextOverflow
                                                                                                      .ellipsis,
                                                                                                  style: CustomTextStyle
                                                                                                      .txt14Rrtxtblk),
                                                                                            ),
                                                                                          )),
                                                                                          buildSizedBox(
                                                                                height: 0,
                                                                                width: 5),
                                                                                      SvgPicture
                                                                                          .asset(
                                                                                          LocalSVGImages
                                                                                              .stockup,
                                                                                          height: 15,
                                                                                          width: 15),
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
                                                              ),
                                                              Expanded(
                                                                flex: 1,
                                                                child: Container(
                                                                  //  color: Colors.orange,                     // bgclr 5
                                                                  child: Row(
                                                                    children: [
                                                                      Expanded(
                                                                        flex: 2,
                                                                        child: Container(
                                                                          //  color: Colors.yellow,
                                                                          height: deviceheight,
                                                                          child: Column(
                                                                            mainAxisAlignment:
                                                                            MainAxisAlignment
                                                                                .center,
                                                                            children: [
                                                                              Expanded(
                                                                                flex: 1,
                                                                                child:
                                                                                Container(
                                                                                  height: deviceheight,
                                                                                  width: devicewidth,
                                                                                  //   color: Colors.red,
                                                                                  child:
                                                                                  Padding(
                                                                                    padding: const EdgeInsets
                                                                                        .only(
                                                                                        right: 8.0),
                                                                                    child:
                                                                                    Column(
                                                                                      crossAxisAlignment: CrossAxisAlignment
                                                                                          .end,
                                                                                      children: [
                                                                                        Flexible(
                                                                                          child: Text(
                                                                                            // "\u20B9${calist?[index].High}" ?? "",
                                                                                              widget
                                                                                                  .IsMylisting
                                                                                                  ? ""
                                                                                                  : setSecondValue(
                                                                                                  calist[index]
                                                                                                      .listData),
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
                                                                                child:
                                                                                Container(
                                                                                  //  color: Colors.blue,
                                                                                  height:
                                                                                  deviceheight,
                                                                                  width:
                                                                                  devicewidth,
                                                                                  child:
                                                                                  Padding(
                                                                                    padding: const EdgeInsets
                                                                                        .only(
                                                                                        right:
                                                                                        8.0),
                                                                                    child:
                                                                                    Column(
                                                                                      crossAxisAlignment:
                                                                                      CrossAxisAlignment
                                                                                          .end,
                                                                                      children: [
                                                                                        Flexible(
                                                                                          child: Text(
                                                                                            // "High",
                                                                                              widget
                                                                                                  .IsMylisting
                                                                                                  ? ""
                                                                                                  : setSecondKey(
                                                                                                  calist[index]
                                                                                                      .listData),
                                                                                              maxLines: 1,
                                                                                              overflow: TextOverflow
                                                                                                  .ellipsis,
                                                                                              textAlign: TextAlign
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
                                                                                  child:
                                                                                  Container(
                                                                                    height: 20,
                                                                                    width:
                                                                                    devicewidth,
                                                                                    //   color: Colors.white,
                                                                                    child:
                                                                                    Padding(
                                                                                      padding: const EdgeInsets
                                                                                          .only(
                                                                                          left: 8.0),
                                                                                      child:
                                                                                      Column(
                                                                                        crossAxisAlignment:
                                                                                        CrossAxisAlignment
                                                                                            .start,
                                                                                        children: [
                                                                                          Flexible(
                                                                                            child:
                                                                                            Text(
                                                                                              // "\u20B9${calist?[index].Low}" ?? "",
                                                                                                widget
                                                                                                    .IsMylisting
                                                                                                    ? ""
                                                                                                    : setThirdValue(
                                                                                                    calist[index]
                                                                                                        .listData),
                                                                                                style: CustomTextStyle
                                                                                                    .txt12Rbtxtorange),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  )),
                                                                              Expanded(
                                                                                  flex: 1,
                                                                                  child:
                                                                                  Container(
                                                                                    height: deviceheight,
                                                                                    width: devicewidth,
                                                                                    //  color: Colors.green,
                                                                                    child: Padding(
                                                                                      padding: const EdgeInsets
                                                                                          .only(
                                                                                          left: 8.0),
                                                                                      child:
                                                                                      Column(
                                                                                        crossAxisAlignment: CrossAxisAlignment
                                                                                            .start,
                                                                                        children: [
                                                                                          Flexible(
                                                                                            child:
                                                                                            Text(
                                                                                                widget
                                                                                                    .IsMylisting
                                                                                                    ? ""
                                                                                                    : setThirdKey(
                                                                                                    calist[index]
                                                                                                        .listData),
                                                                                                maxLines: 1,
                                                                                                overflow: TextOverflow
                                                                                                    .ellipsis,
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
                                                                                child:
                                                                                Container(
                                                                                  height:
                                                                                  deviceheight,
                                                                                  width:
                                                                                  devicewidth,
                                                                                  //      color: Colors.lightGreenAccent,
                                                                                  child:
                                                                                  Padding(
                                                                                    padding: const EdgeInsets
                                                                                        .only(
                                                                                        left:
                                                                                        2.0),
                                                                                    child: Row(
                                                                                      crossAxisAlignment:
                                                                                      CrossAxisAlignment
                                                                                          .start,
                                                                                      mainAxisAlignment:
                                                                                      MainAxisAlignment
                                                                                          .center,
                                                                                      children: [
                                                                                        Text(
                                                                                            calist?[index]
                                                                                                .userRating ??
                                                                                                "",
                                                                                            style:
                                                                                            CustomTextStyle
                                                                                                .txt12Rrtxtblk),
                                                                                        Icon(
                                                                                          Icons
                                                                                              .star,
                                                                                          color:
                                                                                          Colors
                                                                                              .yellow,
                                                                                          size:
                                                                                          15,
                                                                                        )
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Expanded(
                                                                                  flex: 1,
                                                                                  child:
                                                                                  Container(
                                                                                    height:
                                                                                    deviceheight,
                                                                                    width:
                                                                                    devicewidth,
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
                                                                                child:
                                                                                Container(
                                                                                  height:
                                                                                  deviceheight,
                                                                                  width:
                                                                                  devicewidth,
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
                                                                                          calist?[index]
                                                                                              .saudaRating ??
                                                                                              "",
                                                                                          style:
                                                                                          CustomTextStyle
                                                                                              .txt12Rrtxtblk),
                                                                                      Icon(
                                                                                        Icons
                                                                                            .star,
                                                                                        color: Colors
                                                                                            .yellow,
                                                                                        size:
                                                                                        15,
                                                                                      )
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Expanded(
                                                                                  flex: 1,
                                                                                  child:
                                                                                  Container(
                                                                                    height:
                                                                                    deviceheight,
                                                                                    width:
                                                                                    devicewidth,
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
                                          }else{
                                            return Loader();
                                          }
                                        }
                                        //print('in builder listdata ${ calist[0].statusText}');
                                        return Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: InkWell(
                                            onTap: () {
                                              if (calist != null) {
                                                if (calist[index].listData != null && calist[index].listData!.isNotEmpty) {
                                                  print(
                                                      " on click tab ${calist[index].listData?[0].key}");
                                                } else {
                                                  print('wish null');
                                                }

                                                widget.onPressed(calist[index]);
                                              }
                                            },
                                            child: Container(
                                              height: 120,
                                              decoration: BoxDecoration(
                                                color: Color(
                                                  //  widget.items[index].colors).withOpacity(0.1),
                                                    0xFF00FF7F).withOpacity(0.1),
                                                borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(16),
                                                    topRight: Radius.circular(16),
                                                    bottomRight: Radius.circular(
                                                        16),
                                                    bottomLeft: Radius.circular(
                                                        16)),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.all(
                                                    8.0),
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
                                                              // color: Colors.blue,
                                                              child: Padding(
                                                                padding: const EdgeInsets
                                                                    .all(8.0),
                                                                child: ClipRRect(
                                                                  borderRadius: BorderRadius
                                                                      .circular(
                                                                      15),
                                                                  child: calist[index].photoUrl != null && calist[index].photoUrl != ""
                                                                      ? Image.network(calist[index].photoUrl ?? "",
                                                                    width: 60,
                                                                    height: 40,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  )
                                                                      : PlaceholderImage(),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            flex: 1,
                                                            child: Container(
                                                              //     color: Colors.green,
                                                              child: Padding(
                                                                padding: const EdgeInsets
                                                                    .only(
                                                                    top: 3.0),
                                                                child: Column(
                                                                  crossAxisAlignment: CrossAxisAlignment
                                                                      .start,
                                                                  mainAxisAlignment: MainAxisAlignment
                                                                      .center,
                                                                  children: [
                                                                    Expanded(
                                                                        flex: 1,
                                                                        child: Text(
                                                                          //calist?[index].lotSize ?? "",
                                                                          widget.IsMylisting ? ""
                                                                              : setFirstValue(
                                                                              calist[index].listData),
                                                                          maxLines: 1,
                                                                          overflow: TextOverflow
                                                                              .ellipsis,
                                                                          style: CustomTextStyle
                                                                              .txt12Rbtxtblk,
                                                                        )),
                                                                    Expanded(
                                                                        flex: 1,
                                                                        child: Text(
                                                                          //"Lot Size",
                                                                            widget.IsMylisting ? "Status: ${calist[index]
                                                                                .statusText}"
                                                                                : setFirstKey(
                                                                                calist[index]
                                                                                    .listData),
                                                                            maxLines: 1,
                                                                            overflow: TextOverflow
                                                                                .ellipsis,
                                                                            style: widget
                                                                                .IsMylisting
                                                                                ? CustomTextStyle
                                                                                .txt12Rrtxtred
                                                                                : CustomTextStyle
                                                                                .txt12Rrtxtblk)),
                                                                  ],
                                                                ),
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
                                                            flex: 2,
                                                            child: Container(
                                                              //   color: Colors.red.shade50,    // bgclr 3
                                                              child: Column(
                                                                crossAxisAlignment: CrossAxisAlignment
                                                                    .start,
                                                                children: [
                                                                  Expanded(
                                                                    flex: 1,
                                                                    child: Container(
                                                                      //      color: Colors.yellow,  // bgclr 4
                                                                      child: Row(
                                                                        mainAxisAlignment: MainAxisAlignment
                                                                            .spaceBetween,
                                                                        crossAxisAlignment: CrossAxisAlignment
                                                                            .end,
                                                                        children: [
                                                                          Expanded(
                                                                              flex: 1,
                                                                              child: Text(
                                                                                //  items[index].text,
                                                                                calist[index]
                                                                                    .name ??
                                                                                    "",
                                                                                maxLines: 1,
                                                                                overflow: TextOverflow
                                                                                    .ellipsis,
                                                                                style: CustomTextStyle
                                                                                    .txt16Rb,
                                                                              )),
                                                                          Expanded(
                                                                            flex: 1,
                                                                            child:
                                                                            Container(
                                                                              height: 50,
                                                                              width: 80,
                                                                       //       color: Colors.lightBlue,
                                                                              child: Row(
                                                                                crossAxisAlignment: CrossAxisAlignment
                                                                                    .end,
                                                                                children: [
                                                                                  Expanded(
                                                                                      child: Padding(
                                                                                        padding: const EdgeInsets
                                                                                            .only(
                                                                                            right: 5.0),
                                                                                        child:
                                                                                        Align(
                                                                                          alignment: Alignment
                                                                                              .bottomRight,
                                                                                          child: Text(
                                                                                              "${Constant.rupeeSymbol}${calist[index]
                                                                                                  .buyingPrice}",
                                                                                              maxLines: 1,
                                                                                              overflow: TextOverflow
                                                                                                  .ellipsis,
                                                                                              style: CustomTextStyle
                                                                                                  .txt16Rb),
                                                                                        ),
                                                                                      )),
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
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    flex: 1,
                                                                    child: Container(
                                                                      //       color: Colors.red,
                                                                      child: Row(
                                                                        mainAxisAlignment: MainAxisAlignment
                                                                            .spaceBetween,
                                                                        crossAxisAlignment: CrossAxisAlignment
                                                                            .start,
                                                                        children: [
                                                                          Expanded(
                                                                              flex: 1,
                                                                              child: Text(
                                                                                calist[index]
                                                                                    .maturity ??
                                                                                    "",
                                                                                maxLines: 1,
                                                                                overflow: TextOverflow
                                                                                    .ellipsis,
                                                                                style: CustomTextStyle
                                                                                    .txt14Rrtxtblktxtpurple,
                                                                              )),
                                                                          Expanded(
                                                                            flex: 1,
                                                                            child:
                                                                            Container(
                                                                              height: 50,
                                                                              width: 80,
                                                                              //   color: Colors.lightGreenAccent,
                                                                              child: Row(
                                                                                children: [
                                                                                  Expanded(

                                                                                      child: Padding(
                                                                                        padding: const EdgeInsets
                                                                                            .only(
                                                                                            right: 5.0),
                                                                                        child:
                                                                                        Align(
                                                                                          alignment: Alignment.centerRight,
                                                                                          child: Text(
                                                                                              "${Constant.rupeeSymbol} ${calist[index].sellingPrice}",
                                                                                              maxLines: 1,
                                                                                              overflow: TextOverflow
                                                                                                  .ellipsis,
                                                                                              style: CustomTextStyle
                                                                                                  .txt14Rrtxtblk),
                                                                                        ),
                                                                                      )),
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
                                                              //  color: Colors.orange,                     // bgclr 5
                                                              child: Row(
                                                                children: [
                                                                  Expanded(
                                                                    flex: 2,
                                                                    child: Container(
                                                                      //  color: Colors.yellow,
                                                                      height: deviceheight,
                                                                      child: Column(
                                                                        mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                        children: [
                                                                          Expanded(
                                                                            flex: 1,
                                                                            child:
                                                                            Container(
                                                                              height: deviceheight,
                                                                              width: devicewidth,
                                                                              //   color: Colors.red,
                                                                              child:
                                                                              Padding(
                                                                                padding: const EdgeInsets
                                                                                    .only(
                                                                                    right: 8.0),
                                                                                child:
                                                                                Column(
                                                                                  crossAxisAlignment: CrossAxisAlignment
                                                                                      .end,
                                                                                  children: [
                                                                                    Flexible(
                                                                                      child: Text(
                                                                                        // "\u20B9${calist?[index].High}" ?? "",
                                                                                          widget
                                                                                              .IsMylisting
                                                                                              ? ""
                                                                                              : setSecondValue(
                                                                                              calist[index]
                                                                                                  .listData),
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
                                                                            child:
                                                                            Container(
                                                                              //  color: Colors.blue,
                                                                              height:
                                                                              deviceheight,
                                                                              width:
                                                                              devicewidth,
                                                                              child:
                                                                              Padding(
                                                                                padding: const EdgeInsets
                                                                                    .only(
                                                                                    right:
                                                                                    8.0),
                                                                                child:
                                                                                Column(
                                                                                  crossAxisAlignment:
                                                                                  CrossAxisAlignment
                                                                                      .end,
                                                                                  children: [
                                                                                    Flexible(
                                                                                      child: Text(
                                                                                        // "High",
                                                                                          widget
                                                                                              .IsMylisting
                                                                                              ? ""
                                                                                              : setSecondKey(
                                                                                              calist[index]
                                                                                                  .listData),
                                                                                          maxLines: 1,
                                                                                          overflow: TextOverflow
                                                                                              .ellipsis,
                                                                                          textAlign: TextAlign
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
                                                                              child:
                                                                              Container(
                                                                                height: 20,
                                                                                width:
                                                                                devicewidth,
                                                                                //   color: Colors.white,
                                                                                child:
                                                                                Padding(
                                                                                  padding: const EdgeInsets
                                                                                      .only(
                                                                                      left: 8.0),
                                                                                  child:
                                                                                  Column(
                                                                                    crossAxisAlignment:
                                                                                    CrossAxisAlignment
                                                                                        .start,
                                                                                    children: [
                                                                                      Flexible(
                                                                                        child:
                                                                                        Text(
                                                                                          // "\u20B9${calist?[index].Low}" ?? "",
                                                                                            widget
                                                                                                .IsMylisting
                                                                                                ? ""
                                                                                                : setThirdValue(
                                                                                                calist[index]
                                                                                                    .listData),
                                                                                            style: CustomTextStyle
                                                                                                .txt12Rbtxtorange),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              )),
                                                                          Expanded(
                                                                              flex: 1,
                                                                              child:
                                                                              Container(
                                                                                height: deviceheight,
                                                                                width: devicewidth,
                                                                                //  color: Colors.green,
                                                                                child: Padding(
                                                                                  padding: const EdgeInsets
                                                                                      .only(
                                                                                      left: 8.0),
                                                                                  child:
                                                                                  Column(
                                                                                    crossAxisAlignment: CrossAxisAlignment
                                                                                        .start,
                                                                                    children: [
                                                                                      Flexible(
                                                                                        child:
                                                                                        Text(
                                                                                            widget
                                                                                                .IsMylisting
                                                                                                ? ""
                                                                                                : setThirdKey(
                                                                                                calist[index]
                                                                                                    .listData),
                                                                                            maxLines: 1,
                                                                                            overflow: TextOverflow
                                                                                                .ellipsis,
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
                                                                            child:
                                                                            Container(
                                                                              height:
                                                                              deviceheight,
                                                                              width:
                                                                              devicewidth,
                                                                              //      color: Colors.lightGreenAccent,
                                                                              child:
                                                                              Padding(
                                                                                padding: const EdgeInsets
                                                                                    .only(
                                                                                    left:
                                                                                    2.0),
                                                                                child: Row(
                                                                                  crossAxisAlignment:
                                                                                  CrossAxisAlignment
                                                                                      .start,
                                                                                  mainAxisAlignment:
                                                                                  MainAxisAlignment
                                                                                      .center,
                                                                                  children: [
                                                                                    Text(
                                                                                        calist?[index]
                                                                                            .userRating ??
                                                                                            "",
                                                                                        style:
                                                                                        CustomTextStyle
                                                                                            .txt12Rrtxtblk),
                                                                                    Icon(
                                                                                      Icons
                                                                                          .star,
                                                                                      color:
                                                                                      Colors
                                                                                          .yellow,
                                                                                      size:
                                                                                      15,
                                                                                    )
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                              flex: 1,
                                                                              child:
                                                                              Container(
                                                                                height:
                                                                                deviceheight,
                                                                                width:
                                                                                devicewidth,
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
                                                                            child:
                                                                            Container(
                                                                              height:
                                                                              deviceheight,
                                                                              width:
                                                                              devicewidth,
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
                                                                                      calist?[index]
                                                                                          .saudaRating ??
                                                                                          "",
                                                                                      style:
                                                                                      CustomTextStyle
                                                                                          .txt12Rrtxtblk),
                                                                                  Icon(
                                                                                    Icons
                                                                                        .star,
                                                                                    color: Colors
                                                                                        .yellow,
                                                                                    size:
                                                                                    15,
                                                                                  )
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                              flex: 1,
                                                                              child:
                                                                              Container(
                                                                                height:
                                                                                deviceheight,
                                                                                width:
                                                                                devicewidth,
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
                                      });
                                }),
                          );}
                        );
                      }));
            }
        ));
      }
    );
  }

  CheckCatlist(List<Stocks>? stocks, List<Stocks>? exploreStocks) {
   // print('stock print in tab container ${stocks?[0].category?.categoryName ?? "sffsf"}');

    if(widget.IsMylisting){
     if(mylistingStocks != null && mylistingStocks!.isEmpty) {
      return true;
    }else{
       return false;
     }
    }
    else if(widget.IsIpo){
      if(HomeIpoStocks != null && HomeIpoStocks!.isEmpty) {
        return true;
      }else{
        return false;
      }
    }
    else if(widget.IsTopStocks){
      if(HomeTopStocks != null && HomeTopStocks!.isEmpty) {
        return true;
      }else{
        return false;
      }
    }
    else if(widget.IsBrowsing){
      if(Browsingstocks != null && Browsingstocks!.isEmpty) {
        print('browsing stock length ${Browsingstocks?.length}');
        return true;
      }else{
        return false;
      }
    } else if(widget.IsTendingStocks){
      if(TrendingStocks != null && TrendingStocks!.isEmpty) {
        return true;
      }else{
        return false;
      }
    }


    else{
      if (exploreStocks == null || exploreStocks.isEmpty) {
   //   if (stocks == null || stocks.isEmpty) {           //stocks altered
        return true;
      }

      else {
        return false;
      }
    }


  }

  void addFavStocks(List<Favorites>? favorites) {
    if (favorites != null && favorites.isNotEmpty) {
      print('fav lenth n fun ${favorites.length}');
      favstocks?.clear();
      for (Favorites favdata in favorites ?? []) {
        if (favdata.stock != null) {
          favstocks?.add(favdata.stock!);
        }
      }
    }
  }
  void addipoStocks(List<IpoFpo>? ipoFpo) {
    if(ipoFpo != null && ipoFpo.isNotEmpty){
    //  print('ipofpo lenth n fun ${ipoFpo.length}');
      HomeIpoStocks?.clear();
      for(IpoFpo ipodata in ipoFpo ?? []) {
        if(ipodata.stock != null){
          HomeIpoStocks?.add(ipodata.stock!);
        }
      }
    }
  }

  void addTopStocks(List<FDataa>? TopStocks) {
    if(TopStocks != null && TopStocks.isNotEmpty){
      //print('TopStocks lenth n fun ${TopStocks.length}');
      HomeTopStocks?.clear();
      for(FDataa topstockdata in TopStocks ?? []) {
        if(topstockdata.stock != null){
          HomeTopStocks?.add(topstockdata.stock!);
        }
      }
    }
  }

  void addTrendingStocks(List<FDataa>? TrendStocks) {

    if(TrendStocks != null && TrendStocks.isNotEmpty){
     // print('TrendStocks lenth n fun ${TrendStocks.length}');
      TrendingStocks?.clear();
      for(FDataa trendstocks in TrendStocks ?? []) {
        if(trendstocks.stock != null){
          TrendingStocks?.add(trendstocks.stock!);
        }
      }
    }

  }

  void addBrowsingStocks(List<StocksPD>? browsingstocks) {
    if(browsingstocks != null && browsingstocks.isNotEmpty){
      print('browsingstocks lenth n fun ${browsingstocks.length}');
      Browsingstocks?.clear();
      for(StocksPD brwsstockdata in browsingstocks) {
        if(brwsstockdata.stock != null){
          Browsingstocks?.add(brwsstockdata.stock!);
        }
      }
    }
  }
  void addExploreData(List<Stocks>? exploreStocks) {
    if(exploreStocks != null && exploreStocks.isNotEmpty){
      print('exploreStocks lenth n fun ${exploreStocks.length}');

      ExploreStocks?.clear();
      for(Stocks explorestocks in exploreStocks) {
        if(explorestocks != null){
          ExploreStocks?.add(explorestocks);
        }
      }
    }else{
      ExploreStocks?.clear();
    }
  }

  void addMyListStocks(List<Stocks>? mylistingstocks) {
    if (mylistingstocks == null || mylistingstocks.isNotEmpty) {
     // print('mylistingstocks lenth n fun ${mylistingstocks?.length}');
      mylistingStocks?.clear();
      for (Stocks mylistdata in mylistingstocks ?? []) {
        if (mylistdata != null) {
          mylistingStocks?.add(mylistdata);
        }
      }
    }
  }

  getItemCount(
    int? favlength,
    int? explorelength,
      int? mylistlength, int? ipolength, int? topstklength, int? brwsestcklength, int? trendstocklength, int? expStkLength,
  ) {
    if (widget.IsFavorite) {
      return favlength;
    }else if(widget.IsMylisting){
      return mylistlength;
    }else if(widget.IsIpo){
      return ipolength;
    }else if(widget.IsTopStocks){
      return topstklength;
    }else if(widget.IsBrowsing){
      return brwsestcklength;
    }else if(widget.IsTendingStocks){
      return trendstocklength;
    }
    else {
    //  return explorelength;
     // return ExploreStocks?.length ?? 0;
      return expStkLength  ?? 0 + 1;
    }
  }

  getCatList(List<Stocks>? stocks, List<Stocks>? exploreStocksVM) {
    if (widget.IsFavorite) {
      return favstocks;
    }else if(widget.IsMylisting){
     // print('mylistingStocks length::: ${mylistingStocks?[0].statusText}');
      return mylistingStocks;
    }else if(widget.IsIpo){
      return HomeIpoStocks;
    }else if(widget.IsTopStocks){
      return HomeTopStocks;
    }else if(widget.IsBrowsing){
      return Browsingstocks;
    }else if(widget.IsTendingStocks){
      return TrendingStocks;
    }
    else {
    //  print('list data length::: ${stocks?[0].listData?[0].key}');
     // return stocks;
     // return ExploreStocks;
      return exploreStocksVM;
    }
  }

  String setFirstKey(List<ListData>? listData) {
    //print('listdata length:: ${listData?.length}');
    if (listData != null && listData.isNotEmpty) {
      return listData[0].key ?? "";
    } else {
      return "";
    }
  }

  String setFirstValue(List<ListData>? listData) {
   // print('listdata length:: ${listData?.length}');
    if (listData != null && listData.isNotEmpty) {
      return listData[0].value ?? "";

    } else {
      return "";
    }
  }

  String setSecondKey(List<ListData>? listData) {
  //  print('listdata length:: ${listData?.length}');
    if (listData != null && listData.isNotEmpty) {

      if(listData.length >2){
        return listData[1].key ?? "";
      }else{
        return "";
      }


    } else {
      return "";
    }
  }

  String setSecondValue(List<ListData>? listData) {
    //print('listdata SecondValue:: ${listData?.length}');
    if (listData != null && listData.isNotEmpty) {
      if(listData.length >2){
        return listData[1].value ?? "";
      }else{
        return "";
      }

    } else {
      return "";
    }
  }

  String setThirdKey(List<ListData>? listData) {
    //print('listdata length:: ${listData?.length}');
    if (listData != null && listData.isNotEmpty) {
      if(listData.length == 3){
        return listData[2].key ?? "";
      }else{
        return "";
      }

    } else {
      return "";
    }
  }
  String setThirdValue(List<ListData>? listData) {
   // print('listdata length:: ${listData?.length}');


    if (listData != null && listData.isNotEmpty) {

      if(listData.length ==3){
        return listData[2].value ?? "";
      }else{
        return "";
      }
    } else {
      return "";
    }
  }







  onFailureRes(String p1) {
  }

  onSuccessRes(ExploreModel? explorestocks) {
    var scrollExpData = explorestocks?.data?.pageing;
   if(scrollExpData?.lastPage == scrollExpData?.currentPage){
     _commonProvider.setIsLastPage(true);
   }else{
     _commonProvider.setIsLastPage(false);
   }


  }
}
