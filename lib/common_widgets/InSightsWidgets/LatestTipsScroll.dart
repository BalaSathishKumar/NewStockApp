import 'package:base_flutter_provider_project/data/models/Insights_model/LatestTipsModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';
import '../../constants/local_images.dart';
import '../../ui/home/homepage.dart';
import '../../utils/common_functions.dart';
import '../../utils/common_textstyles.dart';
import '../dropdown_widgets/common_dropdown.dart';

class LatestTips extends StatelessWidget {
  const LatestTips({
    super.key,
    required this.items,
    required this.onPressed,
    required this.latesttips,

  });
  final List<ListItem> items;
  final List<Insights> latesttips;
  //final Function(ListItem) onPressed;
  final Function(Insights) onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Container(
            height: 250,
         //   color: Colors.green,
            child: ListView.builder(
               // itemCount: items.length,
                itemCount: latesttips.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      children: [
                        InkWell(
                          onTap:(){
                            onPressed(latesttips[index]);
                          },
                          child: Container(
                              height: 204,
                              width: 114,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(16),
                                      topRight: Radius.circular(16),
                                      bottomRight: Radius.circular(16),
                                      bottomLeft: Radius.circular(16)),
                                  image: DecorationImage(
                                    //image:AssetImage( items[index].imageUrl,),
                                    image:  NetworkImage(
                                      latesttips[index].imageUrl ?? "",
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

                      ],
                    ),
                  );
                }),
          ),

        ],
      ),
    );
  }


}


