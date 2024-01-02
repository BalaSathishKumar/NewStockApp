import 'package:base_flutter_provider_project/data/models/AdvisorModels/AdvisorReviewModel.dart';
import 'package:base_flutter_provider_project/ui/explore/exploreDetail.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../common_widgets/Explore_widgets/ExploreDetail_Topwidget.dart';
import '../../common_widgets/appbar_widgets/common_appbar.dart';
import '../../constants/colors.dart';
import '../../constants/local_images.dart';
import '../../utils/common_textstyles.dart';
import '../../viewModel/AdvisorReview_viewmodel.dart';

class MyReviews extends StatefulWidget {
  const MyReviews({super.key});

  @override
  State<MyReviews> createState() => _MyReviewsState();
}

class _MyReviewsState extends State<MyReviews> {

  late AdvisorReviewViewModel _advisorReviewViewModel;
  
  @override
  void initState() {
    super.initState();
    _advisorReviewViewModel = Provider.of<AdvisorReviewViewModel>(context,listen: false);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _advisorReviewViewModel.advisorReviewListapi(onFailureRes: onFailureRes, onSuccessRes: onSuccessRes);
    });
  }
  
  
  @override
  Widget build(BuildContext context) {
    var deviceheight = MediaQuery.of(context).size.height;
    var devicewidth = MediaQuery.of(context).size.width;
    return Consumer<AdvisorReviewViewModel>(
      builder: (context,reviewListVM,child) {
        return Scaffold(
            backgroundColor: Appcolors.white,
            appBar: CustomAppBar(
                height: 60.0, title: 'My Reviews', appbarclr: Appcolors.white),
            body: Container(
              height: deviceheight,
              width: devicewidth,
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        itemCount: reviewListVM.AdvisorReviewList?.data?.length ?? 0,
                        itemBuilder: (context, index) {
                          var ReviewList = reviewListVM.AdvisorReviewList?.data;
                          return Container(
                              width: devicewidth,
                              height: 160,
                              //  color: Colors.red,
                              child: Column(
                                children: [
                                  ListTile(
                                    subtitle: Container(
                                      child: Row(
                                        children: [
                                          Container(
                                            //  width: devicewidth,
                                            decoration: BoxDecoration(
                                                color: Appcolors.ratingbg,
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(3.0),
                                                  topRight: Radius.circular(
                                                      3.0),
                                                  bottomLeft: Radius.circular(
                                                      3.0),
                                                  bottomRight: Radius.circular(
                                                      3.0),
                                                )
                                            ),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text(ReviewList?[index].ratings.toString() ?? "",
                                                  style: CustomTextStyle.txt16Rrblk,),
                                                Icon(
                                                  Icons.star,
                                                  size: 15,
                                                  color: Colors.yellow,
                                                ),
                                                SizedBox(width: 8),
                                                Container(
                                                    height: 25,
                                                    width: 60,
                                                    decoration: BoxDecoration(
                                                        color: ReviewList?[index].statusText == "Pending" || ReviewList?[index].statusText == "Rejected"?Appcolors.red:Appcolors.splashbgcolor2,
                                                        borderRadius: BorderRadius.circular(4)
                                                    ),
                                                    child: Center(
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(5),
                                                        child: Text(ReviewList?[index].statusText ?? "",
                                                          style: TextStyle(fontSize: 10, color: ReviewList?[index].statusText == "Pending" || ReviewList?[index].statusText == "Rejected"?Appcolors.white : Appcolors.black),),
                                                      ),
                                                    ))
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
                                          ReviewList?[index].stock?.photoUrl ?? "",
                                        //  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQmz2ZD78Wo0yuSPn5FjkioQn9ZdZi8xryh5uzvDELu&s",
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),

                                    // Image.network(),
                                    title: Row(
                                      children: [
                                        Text(ReviewList?[index].stock?.name ?? ""),
                                        SizedBox(width: 10),
                                        InkWell(
                                          onTap: () {
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => ExploreDetail(selectedstocks: ReviewList?[index].stock, isExplore: true,)));
                                          },
                                          child: SvgPicture.asset(
                                              LocalSVGImages.mailredirect,
                                              height: 15, width: 15),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 18.0, right: 18),
                                    child: Container(
                                      //height: 60,
                                        width: devicewidth,
                                        //       color: Colors.red,
                                        child: Text(ReviewList?[index].text ?? "",
                                          style: CustomTextStyle.txt14Rrtxtblk,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,)),
                                  ),

                                  Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        GestureDetector(
                                          onTap: (){
                                            ShowDetailsPopup(context,"About",ReviewList?[index].stock?.about ?? "");
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.only(top: 8.0,left: 18),
                                            child: Row(
                                              children: [
                                                Text("Read more",style: CustomTextStyle.txt14Rmtxtpurp,),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 8.0),
                                                  child: Hero(
                                                    tag: "edreadmore",
                                                    child: SvgPicture.asset(LocalSVGImages.viewall,
                                                        height: 15, width: 16),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 18.0, top: 10,right: 18),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          //flex: 1,
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

                                      ],
                                    ),
                                  )
                                ],
                              ));
                        }),
                  ),
                ],
              ),
            )
        );
      }
    );
  }

  onFailureRes(String p1) {
  }

  onSuccessRes(AdvisorReviewListModel? p1) {
  }
}
