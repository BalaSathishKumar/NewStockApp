import 'package:base_flutter_provider_project/common_widgets/search_widgets/common_search.dart';
import 'package:base_flutter_provider_project/constants/local_images.dart';
import 'package:base_flutter_provider_project/data/models/SearchModel/SearchModel.dart';
import 'package:base_flutter_provider_project/utils/common_functions.dart';
import 'package:base_flutter_provider_project/utils/common_textstyles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common_widgets/appbar_widgets/common_appbar.dart';
import '../../constants/colors.dart';
import '../../viewModel/search_view_model.dart';
import 'homepage.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late SearchViewModel _searchViewModel;
  final List<ListItem> searchitems = [
    ListItem(
        lotsize: "Lot size - Rs 48,000",
        stattxt: "Stat",
        statres: "E-Mobility",
        statres2: "100k",
        toprated: "Top Rated",
        text: 'Yellow Studios',
        statyears: "5+ years",
        rate: '132',
        shname: 'YLW',
        colors: 1,
        imageUrl:
        'https://cdn.educba.com/academy/wp-content/uploads/2022/01/Joint-Stock-Company.jpg'),
    ListItem(
        lotsize: "Lot size - Rs 1,48,000",
        stattxt: "Stat",
        statres: "E-Mobility",
        statres2: "100k",
        toprated: "Pharma Focused",
        statyears: "5+ years",
        text: 'Purple Flame Co.',
        rate: '1681',
        shname: 'PFC',
        colors: 2,
        imageUrl:
        'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80'),
    ListItem(
        lotsize: "Lot size - Rs 48,000",
        stattxt: "Stat",
        statres: "E-Mobility",
        statres2: "100k",
        toprated: "Crypto",
        statyears: "5+ years",
        text: 'Dino Pharma',
        rate: '541',
        shname: 'DRL',
        colors: 3,
        imageUrl:
        'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80'),
    ListItem(
        lotsize: "Lot size - Rs 1,50,000",
        stattxt: "Stat",
        statres: "E-Mobility",
        statres2: "100k",
        toprated: "Top Rated",
        statyears: "5+ years",
        text: 'API Holdings',
        rate: '321',
        shname: 'API',
        colors: 4,
        imageUrl:
        'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80'),
    ListItem(
        lotsize: "Lot size - Rs 72,000",
        stattxt: "Stat",
        statres: "E-Mobility",
        statres2: "100k",
        toprated: "Top Rated",
        statyears: "5+ years",
        text: 'Abservetech',
        rate: '150',
        shname: 'ABS',
        colors: 5,
        imageUrl:
        'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80'),

    ListItem(
        lotsize: "Lot size - Rs 60,000",
        stattxt: "Stat",
        statres: "E-Mobility",
        statres2: "100k",
        toprated: "Top Rated",
        statyears: "5+ years",
        text: 'Yellow Studios',
        rate: '132',
        shname: 'YLW',
        colors: 6,
        imageUrl:
        'https://cdn.educba.com/academy/wp-content/uploads/2022/01/Joint-Stock-Company.jpg'),
    ListItem(
        lotsize: "Lot size - Rs 99,000",
        stattxt: "Stat",
        statres: "E-Mobility",
        statres2: "100k",
        toprated: "Top Rated",
        statyears: "5+ years",
        text: 'Purple Flame Co.',
        rate: '1681',
        shname: 'PFC',
        colors: 7,
        imageUrl:
        'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80'),
    ListItem(
        lotsize: "Lot size - Rs 38,000",
        stattxt: "Stat",
        statres: "E-Mobility",
        statres2: "100k",
        toprated: "Top Rated",
        statyears: "5+ years",
        text: 'Dino Pharma',
        rate: '541',
        shname: 'DRL',
        colors: 5,
        imageUrl:
        'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80'),
  ];


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

    filteredItems2 = searchitems;
  }

  void searchItem(String query) {
    setState(() {
      print("searched word${query}");
      querytxt = query;
    //  filteredItems2 = searchitems.where((element) => element.text.toLowerCase().contains(query.toLowerCase())).toList();
      if(_searchViewModel.searchModel?.stocks != null){
        apifilteredItems = _searchViewModel.searchModel?.stocks?.where((element) => element.name!.toLowerCase().contains(query.toLowerCase())).toList();
      }

    });
  }

  String _searchText = '';

  @override
  Widget build(BuildContext context) {
    var deviceheight = MediaQuery.of(context).size.height;
    var devicewidth = MediaQuery.of(context).size.width;
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
                          querytxt.isNotEmpty? Text("${apifilteredItems?.length ?? ""} results for \"${querytxt}\"",style: CustomTextStyle.txt12Rmtxtblk,):Container(),
                        ],
                      ),
                    )),
                Expanded(
                  child: ListView.builder(
                 //    itemCount: filteredItems2.length,
                    itemCount: apifilteredItems?.length ?? 0,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: (){
                          print('selected stocks in search ${apifilteredItems?[index].name}');
                       /*   if (selectedTopStocks?.stock != null) {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ExploreDetail(selectedstocks: selectedTopStocks?.stock,isExplore: false,)));
                          }*/
                        },
                        child: ListTile(
                          leading:    ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: apifilteredItems?[index].photoUrl != null && apifilteredItems![index].photoUrl!.isEmpty?Image.asset(LocalPNGImages.placeholder, width: 50,
                              height: 50,
                              fit: BoxFit.cover,):Image.network(
                              apifilteredItems?[index].photoUrl ?? "",
                            //  filteredItems2[index].imageUrl,
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                          ),
                          title: Text(apifilteredItems?[index].name ?? "",style: CustomTextStyle.txt14Rrtxtblk,),
                          subtitle: Text(apifilteredItems?[index].maturity ?? "",style: CustomTextStyle.txt14Rbtxtblk,),
                          trailing: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text( "\u20B9 ${apifilteredItems?[index].sellingPrice ?? ""}",style: CustomTextStyle.txt14Rrtxtblktxtpurple),
                                Text("Lot size - Rs ${apifilteredItems?[index].lotSize ?? ""}",style: CustomTextStyle.txt12Rrtxtlotblk),
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
