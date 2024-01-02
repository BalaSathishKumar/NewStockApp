import 'package:base_flutter_provider_project/viewModel/base_view_model/base_view_model.dart';
import 'package:base_flutter_provider_project/viewModel/performViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';
import '../../data/models/Explore_model/ExplorePerformModel.dart';
import '../../ui/home/homepage.dart';
import '../../utils/common_functions.dart';
import '../../utils/common_textstyles.dart';
import '../../viewModel/explore_view_model.dart';
import '../loading_widgets/loader.dart';

class ExploreScroll extends StatelessWidget {
  const ExploreScroll({
    super.key,
    required this.firsttitle,
    required this.secondtitle,
    required this.optionslist,
    required this.imagetag,
       required this.devicewidth,
    required this.onPressed,
  });

  final String firsttitle;
  final String secondtitle;
  final String imagetag;
  final List<String> optionslist;
  final double devicewidth;
  final Function(BrowsingLists) onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Consumer<PerformViewModel>(
            builder: (context,performdata,child) {
              return performdata.state == ViewState.busy? Loader():Container(
                height: 250,
                color: Appcolors.white,
                child: ListView.builder(
                   // itemCount: items.length,
                    itemCount: performdata.explorePerformModel?.browsingLists?.length ?? 0,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      var perfmlst = performdata.explorePerformModel?.browsingLists;
                      return Padding(
                        padding: const EdgeInsets.all(5),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                GestureDetector(
                                  onTap:(){
                                    if(perfmlst != null){
                                      onPressed(perfmlst[index]);
                                    }

                                  },
                                  child: Container(
                                      height: 230,
                                      width: 240,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(16),
                                              topRight: Radius.circular(16),
                                              bottomRight: Radius.circular(16),
                                              bottomLeft: Radius.circular(16)),
                                          image: DecorationImage(
                                            image:
                                            /*AssetImage(
                                              items[index].imageUrl,),*/
                                              NetworkImage(perfmlst?[index].imageUrl ?? ""
                                          ),
                                            fit: BoxFit.fill,
                                          )),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          buildSizedBox(height: 20, width: 10),
                                          /*     Image.network(
                                          items[index].imageUrl,

                                          fit: BoxFit.cover,
                                        ),*/
                                        ],
                                      )),
                                ),
                                Container(
                                  height: 200,
                                  width: 230,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8.0, top: 8),
                                        child: Container(
                                          height: 150,
                                          width: 160,
                                          child: Column(
                                            children: [
                                              Flexible(
                                                child: Text(
                                                ""),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),

                                    ],
                                  ),
                                )
                              ],
                            ),

                          ],
                        ),
                      );
                    }),
              );
            }
          ),

        ],
      ),
    );
  }

  Container buildStat(String stattitle, String stateresponse) {
    return Container(
      height: 20,
      width: 130,
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Text(
                  stattitle,
                  style: CustomTextStyle.txt12Rltxtlitegrey2,
                ),
              )),
          Expanded(
              flex: 3,
              child: Text(
                stateresponse,
                style: CustomTextStyle.txt12Rrtxtgry2,
              ))
        ],
      ),
    );
  }
}

class DropOptionsCHECK with ChangeNotifier {
  String _dropoptiions = "Stock Category";

  String get dropoptions => _dropoptiions;

  void getDropOPtions(String pcd) {
    _dropoptiions = pcd;
    notifyListeners();
  }
}
