
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';
import '../../constants/local_images.dart';

import '../../utils/common_textstyles.dart';
import '../../viewModel/explore_detail_view_model.dart';

class ExploreAdvisorSpeak extends StatelessWidget {


  ExploreAdvisorSpeak();


  @override
  Widget build(BuildContext context) {
    var deviceheight = MediaQuery.of(context).size.height;
    var devicewidth = MediaQuery.of(context).size.width;
    return  Consumer<ExploreDetailViewModel>(
        builder: (context, expDetaildata, child) {
          return expDetaildata.exploredetailModel?.stocks?.advisorReviews == null ||
              expDetaildata.exploredetailModel!.stocks!.advisorReviews!.isEmpty
              ? Center(child: Text("No data found!"))
              : Column(
                children: [
                  Container(
               child: Padding(
                 padding: const EdgeInsets.only(left: 18.0,right: 18,top: 15,bottom: 15),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Container(
                       child: Text("What our experts say",style: CustomTextStyle.txt16Rb,),
                     ),
                     SizedBox(
                       height: 10,
                     ),
                     Container(
                       child: Text("These individual opions are from our expert users who share market opinion at their discretion.",style: CustomTextStyle.txt14gpquickstatsgrey),
                     ),
                   ],
                 ),
               ),
                  ),
                  Expanded(
                    child: ListView.builder(
                    itemCount: expDetaildata.exploredetailModel?.stocks?.advisorReviews?.length ?? 0,
                    itemBuilder: (context, index) {
                      var AdvisorRvw = expDetaildata.exploredetailModel?.stocks?.advisorReviews;
                      return Container(
                          //height: 160,
                        //  color: Colors.red,
                          child: Column(
                            children: [
                              ListTile(
                                subtitle: Container(
                                  child: Row(
                                    children: [
                                      Container(
                                      //  width: 35,
                                        decoration: BoxDecoration(
                                          color: Appcolors.ratingbg,
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(3.0),
                                              topRight: Radius.circular(3.0),
                                              bottomLeft: Radius.circular(3.0),
                                              bottomRight: Radius.circular(3.0),
                                            )
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(AdvisorRvw?[index].ratings.toString() ?? "",style: CustomTextStyle.txt16Rrblk,),
                                            Icon(
                                              Icons.star,
                                              size: 15,
                                              color: Colors.yellow,
                                            )
                                          ],
                                        ),
                                      )

                                    ],
                                  ),
                                ),

                                leading: Container(
                                  height: 45,
                                  width: 45,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.network(
                                      AdvisorRvw?[index].user?.photoUrl ?? "",
                                    // "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQmz2ZD78Wo0yuSPn5FjkioQn9ZdZi8xryh5uzvDELu&s",
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),

                               // Image.network(),
                                title: Row(
                                  children: [
                                    Text(AdvisorRvw?[index].user?.name ?? ""),
                                    SizedBox(width: 10),
                                    InkWell(
                                      onTap: () {
                                        // _selectedstocks
                                        //   context.router.push( Reviewandrating(selectedstocks: _selectedstocks));
                                        //     Navigator.push(context, MaterialPageRoute(builder: (context)=> ReviewandRatings(selectedstocks: _selectedstocks)));
                                      },
                                      child: SvgPicture.asset(
                                          LocalSVGImages.mailredirect,
                                          height: 15, width: 15),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 18.0, right: 18),
                                child: Container(
                                    //height: 60,
                                    width: devicewidth,
                             //       color: Colors.red,
                                    child: Text(AdvisorRvw?[index].text ?? "",
                                      style: CustomTextStyle.txt14Rrtxtblk,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,)),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 18.0,top: 10),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex:1,
                                      child: DottedLine(
                                        direction: Axis.horizontal,
                                        alignment: WrapAlignment.center,
                                       // lineLength: double.infinity,
                                        lineThickness: 1.0,
                                        dashLength: 4.0,
                                        dashColor: Appcolors.dotgrey,
                                        dashRadius: 0.0,
                                        dashGapLength: 4.0,
                                        dashGapRadius: 0.0,
                                      ),
                                    ),
                                    Expanded(
                                        flex:1,
                                        child: Container())
                                  ],
                                ),
                              )
                            ],
                          ));
                    }),
                  ),
                ],
              );
        }
    );
  }
}
