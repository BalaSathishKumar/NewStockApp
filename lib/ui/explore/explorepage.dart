
import 'package:base_flutter_provider_project/common_widgets/Explore_widgets/explore_scroll.dart';
import 'package:base_flutter_provider_project/data/models/Explore_model/ExploreModel.dart';
import 'package:base_flutter_provider_project/data/models/Explore_model/ExplorePerformModel.dart';

import 'package:base_flutter_provider_project/ui/explore/exploreDetail.dart';
import 'package:base_flutter_provider_project/ui/explore/exploreFilter.dart';
import 'package:base_flutter_provider_project/viewModel/CommonProvider.dart';
import 'package:base_flutter_provider_project/viewModel/performViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../common_widgets/Explore_widgets/Tab_Containers.dart';
import '../../common_widgets/Stock_widgets/StockSections.dart';
import '../../common_widgets/appbar_widgets/common_appbar.dart';
import '../../common_widgets/appbar_widgets/homepage_appbar.dart';
import '../../common_widgets/loading_widgets/loader.dart';
import '../../common_widgets/search_widgets/common_search.dart';
import '../../common_widgets/tablayout/common_tablayout.dart';
import '../../constants/colors.dart';
import '../../constants/constant.dart';
import '../../constants/local_images.dart';
import '../../data/models/dashboard_model/DashboardResponseModel.dart';
import '../../utils/common_functions.dart';
import '../../viewModel/base_view_model/base_view_model.dart';
import '../../viewModel/dashboard_view_model.dart';
import '../../viewModel/explore_view_model.dart';
import '../../viewModel/profession_view_model.dart';
import '../home/StockHome.dart';
import '../home/StockViewall.dart';
import '../home/homepage.dart';
import 'MyFavouriteStocks.dart';

class Explorepage extends StatefulWidget {
  const Explorepage({Key? key}) : super(key: key);

  @override
  State<Explorepage> createState() => _ExplorepageState();
}

class _ExplorepageState extends State<Explorepage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  Color _backgroundColor = Colors.blue;

   late final int Tablength;
  late DashboardViewModel _dashboardViewModel;
  late ExploreViewModel _exploreViewModel;
  late PerformViewModel _performViewModel;
  late CommonProvider _commonProvider;
  final  List<Category> catList = [];
  final  List<String> catListName = [];
  final List<TabData> tabs = [];
  final FocusNode _focusNode = FocusNode();
  @override
  void initState() {
    super.initState();
    _dashboardViewModel = Provider.of<DashboardViewModel>(context, listen: false);
    _exploreViewModel = Provider.of<ExploreViewModel>(context, listen: false);
    _performViewModel = Provider.of<PerformViewModel>(context, listen: false);
    _commonProvider = Provider.of<CommonProvider>(context, listen: false);
    print('_dashboardViewModel length ${_dashboardViewModel.dashboardResponseModel?.data?.category?.length}');

    if(_dashboardViewModel.dashboardResponseModel?.data?.category != null){
      Tablength = _dashboardViewModel.dashboardResponseModel?.data?.category?.length ?? 0 +1;
      _tabController = TabController(length: Tablength +1, initialIndex: 1,vsync: this);
      print('_dashboardViewModel length ${_tabController.length}');
      _tabController.addListener(_updateBackgroundColor);
      addCatList();
    }else{
      Tablength = 0;
      _tabController = TabController(length: Tablength, vsync: this);
      _tabController.addListener(_updateBackgroundColor);
      addCatList();
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
   //   _exploreViewModel.explorePerformapi(onFailureRes: onFailureRes, onSuccessRes: onPerSuccessRes);
      _performViewModel.explorePerformapi(onFailureRes: onFailureRes, onSuccessRes: onPerSuccessRes);
      _commonProvider.setIsFilterApi(false);
    });
   // _tabController = TabController(length: 6, vsync: this);


  }


  @override
  Widget build(BuildContext context) {
    var deviceheight = MediaQuery.of(context).size.height;
    var devicewidth = MediaQuery.of(context).size.width;


    return Scaffold(
        appBar: CustomAppBar(height: 60.0, title: 'Sauda Explores', appbarclr: Appcolors.white),
        body: Container(
      height: deviceheight,
      width: devicewidth,
      child: Consumer<CommonProvider>(
        builder: (context, commonVM, child){
          moveTab(commonVM);
        return SingleChildScrollView(
          child: Column(
            children: [
    /*    Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: HomePageAppBar(
                  onPressedmenu: (){
                    if(Constant.userRoll != "Guest"){
                      openFullScreenDrawer(context,deviceheight,(Constant.drawerItems2));
                    }
                  },
                    onPressed: () {
                      // context.router.push(Searchpage());
                    },
                    logotag: "greenlogo",
                    devicewidth: devicewidth,
                    iconpath: "menu"),
              ),*/
              Padding(
                padding: const EdgeInsets.only(left: 18.0, top: 6, right: 18),
                child: Container(
                  height: 950,
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
                                onFocusNode: _focusNode,
                                onSearchTextChanged: (text) {
                                  print('keyword in explore $text  catid:${_commonProvider.ExploreCatId} pageno: ${_commonProvider.PageNoExplore}');

                                  if(text != null && text.length >3 || text == ""){
                                    _exploreViewModel.exploreapi(onFailureRes: onFailureRes, onSuccessRes: onSuccessRes, catID: _commonProvider.ExploreCatId,PageNo: _commonProvider.PageNoExplore,keyword:text,isExploreSearch: text == ""?false:true,iSsearchclick: true);
                                  }
                                  },
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: (){
                             // context.router.push( Explorefilter());
                             Navigator.push(context, MaterialPageRoute(builder: (context)=> ExploreFilter()));
                             //   _tabController.animateTo(1);
                            },
                            child: Hero(
                              tag: "newfilter",
                              child: Row(
                                children: [
                                  SvgPicture.asset(LocalSVGImages.newfilter,
                                      height: 50, width: 50),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      buildSizedBox(height: 10, width: 0),
                      ExploreScroll(
                        onPressed: (selectedperform){
                          print('selected browsing list ${selectedperform.name}');
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>StockViewallPage(
                            stockname: "Browsing List",
                            browswid:  selectedperform.id,browsename: selectedperform.name,)));
                          },
                          optionslist: [],
                          firsttitle: "Featured",
                          secondtitle: "Top Brokers",
                          imagetag: "topbrokersviewall",

                          devicewidth: devicewidth),
                      buildSizedBox(height: 10, width: 0),
                      Expanded(
                        child: Container(
                          height: deviceheight,
                          width: devicewidth,
                          child: CommonTabLayout(
                            IsExplore: true,
                            DynamicTabs: tabs,
                            tabTitles:catListName,
                            tabContents: [],
                            tabController: _tabController,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );}
      ),
    ));
  }

  void addCatList() {
    if(_dashboardViewModel.dashboardResponseModel?.data?.category != null){
      catList.addAll(_dashboardViewModel.dashboardResponseModel?.data?.category ?? []);
     
  /*    for(var i=0; i<catList.length; i++){
        tabs.add(
            TabData(
          title: _dashboardViewModel.dashboardResponseModel?.data?.category?[i].categoryName ?? "",
          content: Center(child:
         // Text('Content for Tab $i')
            Tab1Content(catId: _dashboardViewModel.dashboardResponseModel?.data?.category?[i].id ?? 0)
          ),
        ));
        catListName.add(_dashboardViewModel.dashboardResponseModel?.data?.category?[i].categoryName ?? "");
      }*/
        tabs.add(TabData(title: "", content: MyFavStocks()));


          for(var i=0; i<catList.length; i++){
        tabs.add(
            TabData(
          title: _dashboardViewModel.dashboardResponseModel?.data?.category?[i].categoryName ?? "",
          content: Center(child:
         // Text('Content for Tab $i')
            Tab1Content(catId: _dashboardViewModel.dashboardResponseModel?.data?.category?[i].id ?? 0,selectedCategory: _dashboardViewModel.dashboardResponseModel?.data?.category?[i],)
          ),
        ));
        catListName.add(_dashboardViewModel.dashboardResponseModel?.data?.category?[i].categoryName ?? "");
      }


    }
  }

  onFailureRes(String p1) {
  }

  onPerSuccessRes(ExplorePerformModel? p1) {
    print('onPerSuccessRes...........');
  }

  onSuccessRes(ExploreModel? p1) {
    FocusScope.of(context).unfocus();
  }

  void moveTab(CommonProvider commonVM) {
    // _tabController.animateTo(1);
    if(commonVM.ChangeTab != -1){
      //  for(Category item in catList){
      for(var i = 0; i < catList.length; i++){
        if(catList[i].id == commonVM.ChangeTab){
          _tabController.animateTo(i+1);
        }
      }

    }

  }



/*
  void _updateBackgroundColor() {
    _commonProvider.setIsFilterApi(false);
  }*/

  void _updateBackgroundColor() {
/*    print('_updateBackgroundColor in exd');
    if (_commonProvider.IsFilterApi){
      _commonProvider.setIsFilterApi(false);
    }else{
      _commonProvider.setIsFilterApi(true);
    }*/
  }


}

class Tab1Content extends StatefulWidget {
  Tab1Content({
    required this.catId,
    required this.selectedCategory
});
  final int catId;
  final Category? selectedCategory;
  @override
  State<Tab1Content> createState() => _Tab1ContentState();
}

class _Tab1ContentState extends State<Tab1Content> {


  get categoryId => widget.catId;
  late ExploreViewModel _exploreViewModel;
  late CommonProvider _commonProvider;
  late DropOptions _dropOptions;
  late ProfessionViewModel _professionViewModel;

  @override
  void initState() {
    super.initState();
    print('CatId: ${categoryId}');
    _exploreViewModel = Provider.of<ExploreViewModel>(context, listen: false);
    _commonProvider = Provider.of<CommonProvider>(context, listen: false);
    _dropOptions = Provider.of<DropOptions>(context, listen: false);
    _professionViewModel = Provider.of<ProfessionViewModel>(context, listen: false);
       //UI render callback
    WidgetsBinding.instance.addPostFrameCallback((_) {
      //Calling api after UI gets rendered successfully
      _dropOptions.getDropOPtions(widget.selectedCategory);
       _commonProvider.setExploreCatId(categoryId.toString());
       _commonProvider.setChangeTab(categoryId??-1);

      print('_commonProvider.IsFilterApi in exp ${_commonProvider.IsFilterApi}');
      if(!_commonProvider.IsFilterApi){
         _exploreViewModel.exploreapi(onFailureRes: onFailureRes, onSuccessRes: onSuccessRes, catID: categoryId.toString(),PageNo: "1");
       }else{
        _exploreViewModel.exploreapi(
            onFailureRes: onFailureRes,
            onSuccessRes: onSuccessRes,
            catID: categoryId.toString(),
            PageNo: "",
            pricemin: _professionViewModel.UserMinPriceExpFilter,
            pricemax: _professionViewModel.UserMaxPriceExpFilter,
            sortbyprice: _professionViewModel.SortByPriceExpFilter,
            sortbysaudarating: _professionViewModel.SaudaRatingExpFilter,
            sortbyuserrating: _professionViewModel.UserRatingExpFilter,
            type: "city",
            top: _professionViewModel.UserCityExpFilter?.name,
            isFilter: true
        );
      }

    });

  }
  @override
  Widget build(BuildContext context) {

    var deviceheight = MediaQuery.of(context).size.height;
    var devicewidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body:Consumer<ExploreViewModel>(
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
              //  context.router.push( Exploredetail(selectedstocks: selecteditems,));
                _dropOptions.getDropOPtionsStockid(selecteditems?.id);
               // Provider.of<DropOptions>(context, listen: false).getDropStocks(SetStock(exmodel.exploreModel?.data?.stocks,selecteditems));
              //  Provider.of<DropOptions>(context, listen: false).getDropStocks(selecteditems);
                _dropOptions.getDropStocks(null);
                Navigator.push(context, MaterialPageRoute(builder: (context)=> ExploreDetail(selectedstocks: selecteditems,isExplore: true,)));
                },

            )
        );
        }
      ),
    );
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




