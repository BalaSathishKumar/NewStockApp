import 'package:base_flutter_provider_project/data/models/DealerModels/MyListingModel.dart';
import 'package:base_flutter_provider_project/viewModel/base_view_model/base_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common_widgets/Explore_widgets/Tab_Containers.dart';
import '../../common_widgets/appbar_widgets/logotxtappbar.dart';
import '../../common_widgets/loading_widgets/loader.dart';
import '../../common_widgets/search_widgets/common_search.dart';
import '../../constants/local_images.dart';
import '../../viewModel/CreateList_ViewModel.dart';
import '../home/homepage.dart';

class MyListingPage extends StatefulWidget {
  const MyListingPage({super.key});
  @override
  State<MyListingPage> createState() => _MyListingPageState();
}

class _MyListingPageState extends State<MyListingPage> {
  late CreateListViewModel _createListViewModel;


  @override
  void initState() {
    super.initState();
    _createListViewModel= Provider.of<CreateListViewModel>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _createListViewModel.mylistingapi(onFailureRes: onFailureRes, onSuccessRes: onSuccessRes);
    });
  }

  @override
  Widget build(BuildContext context) {
    var deviceheight = MediaQuery.of(context).size.height;
    var devicewidth = MediaQuery.of(context).size.width;

    return  Scaffold(
      backgroundColor: Colors.white,
      body:Container(
          height: deviceheight,
          width: devicewidth,
          child: Column(
            children: [
              SizedBox(height: 60),
              LogoTxtAppbar(logotag: "mylisting",title: "My Listings",Isportfolio: false,onPressed: (){}),
              SizedBox(height: 20),
        /*      Container(
                height: 50,
                child: CommonSearch(
                  hinttxt: 'Search stocks by name',
                  onSearchTextChanged: (text) {},
                ),
              ),*/
              Expanded(
                child: Consumer<CreateListViewModel>(
                    builder: (context, createListVM, child) {
                  return createListVM.state == ViewState.busy
                      ? Loader()
                      : TabContainers(
                          IsMylisting: true,
                          IsFavorite: false,
                          IsIpo: false,
                          IsTopStocks: false,
                    IsBrowsing: false,
                    IsTendingStocks: false,
                    IsExplorePage: false,
                    onPressed: (selecteditems) {
                      print('explorre list clicked ${selecteditems?.wishList ?? "sfsdfsf"}');
                      //  context.router.push( Exploredetail(selectedstocks: selecteditems,));
                      //    Navigator.push(context, MaterialPageRoute(builder: (context)=> ExploreDetail(selectedstocks: selecteditems,isExplore: true,)));
                    },

                  );}
                ),
              ),
            ],
          )),
    );
  }

  onFailureRes(String p1) {
  }

  onSuccessRes(MyListingModel? p1) {
  }
}
