import 'package:base_flutter_provider_project/data/models/Explore_model/ExploreModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../ui/InSights/BlogDetailPage.dart';
import '../../ui/home/homepage.dart';
import '../../utils/common_functions.dart';
import '../../viewModel/explore_detail_view_model.dart';
import '../Listtile_widgets/ListileWithHtml.dart';

class ExploreDetailTabContent extends StatelessWidget {


  ExploreDetailTabContent();

  @override
  Widget build(BuildContext context) {
    var deviceheight = MediaQuery.of(context).size.height;
    var devicewidth = MediaQuery.of(context).size.width;
    return     Consumer<ExploreDetailViewModel>(
        builder: (context, expDetaildata, child) {
          return expDetaildata.exploredetailModel?.stocks?.saudaInsights == null || expDetaildata.exploredetailModel!.stocks!.saudaInsights!.isEmpty ?Center(child: Text("No data found!")) :
          Scaffold(
            backgroundColor: Colors.white,
            body: Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: Container(
                  //height: 300,
                  width: devicewidth,
                 // color: Colors.red,
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                            itemCount: expDetaildata.exploredetailModel?.stocks?.saudaInsights?.length ?? 0,
                            itemBuilder: (context, index) {
                           //   print('dfsdfsdf ${expDetaildata.exploredetailModel?.stocks?.saudaInsights?[0].title}');
                          return GestureDetector(
                            onTap: (){
                              print('suda insights in exD ${expDetaildata.exploredetailModel?.stocks?.saudaInsights?[index].title}');
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> BlogDetail(calist:expDetaildata.exploredetailModel?.stocks?.saudaInsights?[index])));
                                  },
                            child: ListTileWithHtml(

                              date: formatDate2(expDetaildata.exploredetailModel?.stocks?.saudaInsights?[index].createdAt ?? "")+', '+ formatYear(expDetaildata.exploredetailModel?.stocks?.saudaInsights?[index].createdAt ?? "").toString(),
                                  title: expDetaildata.exploredetailModel?.stocks?.saudaInsights?[index].description ?? "",
                                  subtitle: expDetaildata.exploredetailModel?.stocks?.saudaInsights?[index].authorName ?? "",

                                  trailingImage: expDetaildata.exploredetailModel?.stocks?.saudaInsights?[index].imageUrl ?? "",
                                  imgtag: "",
                                ),
                          );
                            }),
                      ),
                    ],
                  )),
            ),
          );
        }
    );
  }
}