import 'package:base_flutter_provider_project/data/models/Explore_model/ExploreDetailModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';
import '../../viewModel/explore_detail_view_model.dart';
import '../appbar_widgets/logotxtappbar.dart';
import 'QuickStats.dart';


class QuickStatDetail extends StatefulWidget {
  const QuickStatDetail( {super.key});

  @override
  State<QuickStatDetail> createState() => _QuickStatDetailState();
}

class _QuickStatDetailState extends State<QuickStatDetail> {
  @override
  Widget build(BuildContext context) {
    final crossAxisCount = 2;
    final containerWidth = 150.0;
    final containerHeight = 50.0;

    final aspectRatio = containerWidth / containerHeight;
    var devicewidth = MediaQuery.of(context).size.width;
    return Consumer<ExploreDetailViewModel>(
        builder: (context, expDetaildata, child) {
         // print('stock view consumer: ${expDetaildata.exploredetailModel?.stocks?.metaData?[15].type} ');
          num conthgt = expDetaildata.exploredetailModel?.stocks?.metaData
              ?.length ?? 1.0 * 50;
          return Scaffold(
            backgroundColor: Appcolors.white,
            body: Column(
              children: [
                SizedBox(height: 60),
                LogoTxtAppbar(logotag: "mylisting",
                    title: "Quick Stats",
                    Isportfolio: false,
                    onPressed: () {}),
                Expanded(child: Container(
                  height: 310,
                  width: devicewidth,
                  //color: Colors.red.shade100,
                  child: GridView.builder(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: crossAxisCount,
                          // Number of columns in the grid
                          childAspectRatio: aspectRatio
                      ),
                      itemCount: expDetaildata.exploredetailModel?.stocks
                          ?.metaData?.length ?? 0,
                      itemBuilder: (context, index) {
                        if (expDetaildata.exploredetailModel?.stocks
                            ?.metaData?[index].type == "ratings") {
                          print('metadata type1::: ${expDetaildata
                              .exploredetailModel?.stocks?.metaData?[index]
                              .type}');
                        } else {
                          print('metadata type empty');
                        }

                        return buildQuickStat2(
                            context,
                            devicewidth,
                            expDetaildata.exploredetailModel?.stocks
                                ?.metaData?[index].key ?? "",
                            expDetaildata.exploredetailModel?.stocks
                                ?.metaData?[index].value ?? "",
                            expDetaildata.exploredetailModel?.stocks
                                ?.metaData?[index].data ?? [],
                            expDetaildata.exploredetailModel?.stocks
                                ?.metaData?[index].type ?? "",
                            [],
                          index
                        );
                      }),
                ),)
              ],
            ),
          );
        }
    );
  }

  Widget buildQuickStat2(BuildContext context, double devicewidth, String s, String t, List<Data> list, String u, List list2, int index) {
    return Container();
  }
}
