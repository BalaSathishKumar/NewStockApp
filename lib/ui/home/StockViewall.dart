import 'package:base_flutter_provider_project/data/models/Explore_model/ExploreModel.dart';
import 'package:base_flutter_provider_project/data/models/Explore_model/PerformDetailModel.dart';
import 'package:base_flutter_provider_project/viewModel/CommonProvider.dart';
import 'package:base_flutter_provider_project/viewModel/base_view_model/base_view_model.dart';
import 'package:base_flutter_provider_project/viewModel/performViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common_widgets/Explore_widgets/Tab_Containers.dart';
import '../../common_widgets/Stock_widgets/StockSections.dart';
import '../../common_widgets/appbar_widgets/common_appbar.dart';
import '../../common_widgets/appbar_widgets/logotxtappbar.dart';
import '../../common_widgets/loading_widgets/loader.dart';
import '../../common_widgets/search_widgets/common_search.dart';
import '../../constants/colors.dart';
import '../../constants/local_images.dart';
import '../../data/models/DealerModels/MyListingModel.dart';
import '../../data/models/Explore_model/viewAllModel.dart';
import '../../viewModel/CreateList_ViewModel.dart';
import '../../viewModel/dashboard_view_model.dart';
import '../../viewModel/explore_view_model.dart';
import '../explore/exploreDetail.dart';
import 'StockHome.dart';
import 'homepage.dart';



class StockViewallPage extends StatefulWidget {
  final String stockname;
  final num? browswid;
  final String? browsename;
  StockViewallPage({
    required this.stockname,
    this.browswid,
    this.browsename,
});

  @override
  State<StockViewallPage> createState() => _StockViewallPageState();
}

class _StockViewallPageState extends State<StockViewallPage> {

  late PerformViewModel _exploreViewModel;
  late ExploreViewModel _viewAllModel;
  late CommonProvider _commonProvider;


  @override
  void initState() {
    super.initState();

    _exploreViewModel = Provider.of<PerformViewModel>(context, listen: false);
    _viewAllModel = Provider.of<ExploreViewModel>(context, listen: false);
    _commonProvider = Provider.of<CommonProvider>(context, listen: false);

    if(widget.browswid != null){
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _exploreViewModel.performdetailapi(onFailureRes: onFailureRes, onSuccessRes: onPerSuccessRes, BrowseID: widget.browswid.toString());
      });
    }else if(widget.stockname == "Top Stocks"){
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _viewAllModel.ViewallStock?.clear();
      _viewAllModel.viewallapi(onFailureRes: onFailureRes, onSuccessRes: onViewallSuccessRes, title: "featured_stocks",pageNo: "1");
      });
    }else if(widget.stockname == "IPO & FPO"){
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _viewAllModel.ViewallStock?.clear();
      _viewAllModel.viewallapi(onFailureRes: onFailureRes, onSuccessRes: onViewallSuccessRes, title: "ipo_fpo",pageNo: "1");
      });
    }else if(widget.stockname == "Trending Stocks"){
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _viewAllModel.ViewallStock?.clear();
      _viewAllModel.viewallapi(onFailureRes: onFailureRes, onSuccessRes: onViewallSuccessRes, title: "trending_stocks",pageNo: "1");
      });
    }
    
    else{
      print('browse id null');
    }
  }

  @override
  Widget build(BuildContext context) {
    var deviceheight = MediaQuery.of(context).size.height;
    var devicewidth = MediaQuery.of(context).size.width;

    return  Consumer<PerformViewModel>(
        builder: (context, pfdata, child) {
      return Consumer<ExploreViewModel>(
      builder: (context, expdata, child) {
        return Consumer<DashboardViewModel>(
            builder: (context, dashdata, child) {
         return Scaffold(
            backgroundColor: Colors.white,
            appBar: CustomAppBar(height: 60.0, title: ' ${widget.browsename ?? "${widget.stockname}"}', appbarclr: Appcolors.white),
            body:pfdata.state == ViewState.busy ? Loader():Container(
                height: deviceheight,
                width: devicewidth,
                child: Column(
                  children: [
                  /*  const SizedBox(height: 60),
                    LogoTxtAppbar(logotag: "viewall",title: " ${widget.stockname}",Isportfolio: false,onPressed: (){}),*/
                    SizedBox(height: 20),
                    Expanded(
                      child: expdata.state == ViewState.busy ? Loader():TabContainers(
                        IsMylisting: false,
                        IsFavorite: false,
                        IsIpo: widget.stockname == "IPO & FPO"?true : false,
                        IsTopStocks: widget.stockname == "Top Stocks"?true : false,
                        IsBrowsing: widget.stockname == "Browsing List"?true : false,
                        IsTendingStocks: widget.stockname == "Trending Stocks"?true : false,
                        IsExplorePage: false,
                        onPressed: (selecteditems) {
                          print('explorre list clicked ${selecteditems?.wishList ?? "checkkk"}');
                          //  context.router.push( Exploredetail(selectedstocks: selecteditems,));
                          Provider.of<DropOptions>(context, listen: false).getDropOPtionsStockid(selecteditems?.id);
                          Provider.of<DropOptions>(context, listen: false).getDropStocks(null);
                          Provider.of<DropOptions>(context, listen: false).getDropOPtions(SetCat(dashdata.dashboardResponseModel?.data?.category,selecteditems?.category?.id));
                           Navigator.push(context, MaterialPageRoute(builder: (context)=> ExploreDetail(selectedstocks: selecteditems,isExplore: true,)));
                        },

                      ),
                    ),
                  ],
                )),
          );
         }
        );
      }
      );}
    );
  }

  onFailureRes(String p1) {
  }

  onSuccessRes(MyListingModel? p1) {
  }

  onPerSuccessRes(PerformDetailModel? p1) {
    print('onPerSuccessRes::::ddd');
  }

  onViewallSuccessRes(viewAllModel? p1) {
    var scrollExpData = p1?.data?.pageing;
    if (scrollExpData?.lastPage == scrollExpData?.currentPage) {
      _commonProvider.setIsLastPage(true);
    } else {
      _commonProvider.setIsLastPage(false);
    }
  }
  }

