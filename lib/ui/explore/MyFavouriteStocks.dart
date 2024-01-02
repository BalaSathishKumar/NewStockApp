
import 'package:base_flutter_provider_project/data/models/Explore_model/GetFavouriteModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common_widgets/Explore_widgets/Tab_Containers.dart';
import '../../common_widgets/loading_widgets/loader.dart';
import '../../constants/local_images.dart';
import '../../data/models/Explore_model/ExploreModel.dart';
import '../../viewModel/explore_detail_view_model.dart';
import '../../viewModel/explore_view_model.dart';
import '../home/homepage.dart';
import 'exploreDetail.dart';

class MyFavStocks extends StatefulWidget {

  @override
  State<MyFavStocks> createState() => _MyFavStocksState();
}

class _MyFavStocksState extends State<MyFavStocks> {


  late ExploreDetailViewModel _exploredetailViewModel;
  @override
  void initState() {
    super.initState();

    _exploredetailViewModel = Provider.of<ExploreDetailViewModel>(context, listen: false);
    //UI render callback
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _exploredetailViewModel.getFavapi(onFailureRes: onFailureRes, onSuccessRes: onGetFavSuccessRes);
    });

  }
  @override
  Widget build(BuildContext context) {

    var deviceheight = MediaQuery.of(context).size.height;
    var devicewidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body:Container(
          height: deviceheight,
          width: devicewidth,
          child: Consumer<ExploreDetailViewModel>(
            builder: (context,favdata,child)
            {
              return favdata.getFavModel?.favorites == null || favdata.getFavModel!.favorites!.isEmpty  ?Center(child: Text("No Favourite stocks")):
              TabContainers(
                IsMylisting: false,
                IsFavorite: true,
                IsIpo: false,
                IsTopStocks: false,
                IsBrowsing: false,
                IsTendingStocks: false,
                IsExplorePage: false,
                onPressed: (selecteditems) {
                  print('explorre list clicked ${selecteditems?.name ?? "sfsdfsf"}');
                  //  context.router.push( Exploredetail(selectedstocks: selecteditems,));
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> ExploreDetail(selectedstocks: selecteditems,isExplore: true,)));
                },

              );

            },
          )),
    );
  }

  onFailureRes(String p1) {
  }

  onSuccessRes(ExploreModel? p1) {
  }



  onGetFavSuccessRes(GetFavouriteModel? p1) {
  }
}