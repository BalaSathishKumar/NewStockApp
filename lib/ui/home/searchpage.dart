import 'package:base_flutter_provider_project/common_widgets/search_widgets/common_search.dart';
import 'package:base_flutter_provider_project/constants/local_images.dart';
import 'package:base_flutter_provider_project/data/models/SearchModel/SearchModel.dart';
import 'package:base_flutter_provider_project/utils/common_functions.dart';
import 'package:base_flutter_provider_project/utils/common_textstyles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common_widgets/appbar_widgets/common_appbar.dart';
import '../../common_widgets/loading_widgets/loader.dart';
import '../../constants/colors.dart';
import '../../data/models/Explore_model/ExploreModel.dart';
import '../../viewModel/base_view_model/base_view_model.dart';
import '../../viewModel/search_view_model.dart';
import '../explore/exploreDetail.dart';
import 'homepage.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late SearchViewModel _searchViewModel;



String querytxt = "";

List<ListItem> filteredItems2 = [];
  List<Stocks>? apifilteredItems = [];

  @override
  void initState() {
    super.initState();
    _searchViewModel = Provider.of<SearchViewModel>(context, listen: false);
       //UI render callback
    WidgetsBinding.instance.addPostFrameCallback((_) {
      //Calling api after UI gets rendered successfully
      _searchViewModel.searchapi(onFailureRes: onFailureRes, onSuccessRes: onSuccessRes, searchparams: "");
    });


  }

  void searchItem(String query) {
   // setState(() {
      print("searched word1${query}");
      querytxt = query;
    //  filteredItems2 = searchitems.where((element) => element.text.toLowerCase().contains(query.toLowerCase())).toList();

      if(querytxt.length > 3){
        print("searched word2${query}");
        _searchViewModel.searchapi(onFailureRes: onFailureRes, onSuccessRes: onSuccessRes, searchparams: query);
      }else if(querytxt.length == 0){
        _searchViewModel.searchapi(onFailureRes: onFailureRes, onSuccessRes: onSuccessRes, searchparams: "");
      }
      if(_searchViewModel.searchModel?.stocks != null){
        apifilteredItems = _searchViewModel.searchModel?.stocks?.where((element) => element.name!.toLowerCase().contains(query.toLowerCase())).toList();
      }
   // });
  }

  String _searchText = '';

  @override
  Widget build(BuildContext context) {
    var deviceheight = MediaQuery.of(context).size.height;
    var devicewidth = MediaQuery.of(context).size.width;
    return Consumer<SearchViewModel>(
      builder: (context,searchVM,chid){
      return Scaffold(
        appBar: CustomAppBar(height: 60.0, title: 'search', appbarclr: Appcolors.white),
        body: Scaffold(
          backgroundColor: Appcolors.white,
          body: Container(
            height: deviceheight,
            width: devicewidth,
            child: Padding(
              padding: const EdgeInsets.all(0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonSearch(
                    hinttxt: 'Search stocks by name',
                    onSearchTextChanged: (text) {
                      searchItem(text);
                    },
                  ),
                  Container(
                      height: 20,
                      width: devicewidth,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: Row(
                          children: [
                            querytxt.isNotEmpty? Text("${searchVM.searchModel?.stocks?.length ?? 0} results for \"${querytxt}\"",style: CustomTextStyle.txt12Rmtxtblk,):Container(),
                          ],
                        ),
                      )),
                  Expanded(
                    child: searchVM.state == ViewState.busy?Loader(): searchVM.searchModel?.stocks == null || searchVM.searchModel!.stocks!.isEmpty? Center(child: Text("No data found")):ListView.builder(
                   //    itemCount: filteredItems2.length,
                    //  itemCount: apifilteredItems?.length ?? 0,
                      itemCount: searchVM.searchModel?.stocks?.length ?? 0,
                      itemBuilder: (context, index) {
                        var apiSearchItems = searchVM.searchModel?.stocks;
                        return GestureDetector(
                          onTap: (){
                            print('selected stocks in search ${apiSearchItems?[index].name}');
                            if (apiSearchItems?[index]!= null) {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => ExploreDetail(selectedstocks: apiSearchItems?[index],isExplore: false,)));
                            }
                          },
                          child: ListTile(
                            leading:    ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: apiSearchItems?[index].photoUrl != null && apiSearchItems![index].photoUrl!.isEmpty?Image.asset(LocalPNGImages.placeholder, width: 50,
                                height: 50,
                                fit: BoxFit.cover,):Image.network(
                                apiSearchItems?[index].photoUrl ?? "",
                              //  filteredItems2[index].imageUrl,
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                              ),
                            ),
                            title: Text(apiSearchItems?[index].name ?? "",style: CustomTextStyle.txt14Rrtxtblk,),
                            subtitle: Text(apiSearchItems?[index].maturity ?? "",style: CustomTextStyle.txt14Rbtxtblk,),
                            trailing: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text( "\u20B9 ${apiSearchItems?[index].sellingPrice ?? ""}",style: CustomTextStyle.txt14Rrtxtblktxtpurple),
                                 // Text("Lot size - Rs ${apifilteredItems?[index].lotSize ?? ""}",style: CustomTextStyle.txt12Rrtxtlotblk),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );}
    );
  }

  onFailureRes(String p1) {
  }

  onSuccessRes(List<Stocks>? p1) {

    if (p1 != null) {
      setState(() {
        apifilteredItems?.addAll(p1);
      });


    }
  }
}
