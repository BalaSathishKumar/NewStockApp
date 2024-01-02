import 'package:base_flutter_provider_project/data/models/Explore_model/ExploreDetailModel.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';
import '../../constants/local_images.dart';
import '../../ui/explore/Review&Rating.dart';
import '../../utils/CustomBorderClipper.dart';
import '../../utils/common_textstyles.dart';
import '../../viewModel/explore_detail_view_model.dart';
import '../alert_widgets/YesorNo_dialog.dart';
import 'QuickstateDetail.dart';


class QuickStats extends StatefulWidget {

   QuickStats({Key? key, }) : super(key: key);

  @override
  State<QuickStats> createState() => _QuickStatsState();
}

class _QuickStatsState extends State<QuickStats> {
   final ScrollController _controller = ScrollController();
   List<MetaDataa> newmetaData = [];

   @override
  void initState() {
     super.initState();
     newmetaData.clear();
     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
       double totalHeight = _controller.position.maxScrollExtent + _controller.position.viewportDimension;
       double initialOffset = totalHeight - _controller.position.viewportDimension;

       // Set the initialScrollOffset
       _controller.jumpTo(initialOffset);
     });


  }

  @override
  Widget build(BuildContext context) {

    final crossAxisCount = 2;
    final containerWidth = 150.0;
    final containerHeight = 50.0;

    final aspectRatio = containerWidth / containerHeight;

   /* final crossAxisCount = 2;
    final aspectRatio = (MediaQuery.of(context).size.width /
        crossAxisCount /
        (MediaQuery.of(context).size.height / crossAxisCount));*/
    var deviceheight = MediaQuery.of(context).size.height;
    var devicewidth = MediaQuery.of(context).size.width;
    return  Container(
     // height: 410,
      width: devicewidth,
 //    color: Colors.yellow.shade100,
        child: ClipRect(
        clipper: TopBorderClipper(20.0),
        child: DottedBorder(
          dashPattern: [8, 4],
          strokeWidth: 1,
          color: Appcolors.kyctxtgrey,
          strokeCap: StrokeCap.square,
          borderType: BorderType.RRect,
          radius: Radius.circular(0),
    child:  Consumer<ExploreDetailViewModel>(
    builder: (context, expDetaildata, child) {
      if(expDetaildata.exploredetailModel?.stocks?.metaData != null){
        newmetaData.clear();
         for(MetaDataa item in expDetaildata.exploredetailModel?.stocks?.metaData ?? []){
           if(item.data != null && item.data!.isEmpty){
             newmetaData.add(item);
           }
         }
      }

      return Column(
       children: [
         Container(
           height: 50,
           width: devicewidth,
         //  color: Colors.green,
           child: Padding(
             padding: const EdgeInsets.only(left: 18.0),
             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text("Quick Stats", style: CustomTextStyle.txt16Rb,),
               ],
             ),
           ),
         ),
         Container(
           //height: 310,
           width: devicewidth,
         //  color: Colors.red.shade100,
           child: GridView.builder(
                controller: _controller ,
                shrinkWrap: true,
                reverse: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    childAspectRatio: aspectRatio
                ),
                itemCount:newmetaData.length,
              //  itemCount:expDetaildata.exploredetailModel?.stocks?.metaData?.length ?? 0,
                itemBuilder: (context, index) {

            /*      return buildQuickStat2(
                      context,
                      devicewidth,
                      expDetaildata.exploredetailModel?.stocks?.metaData?[index].key ?? "",
                      expDetaildata.exploredetailModel?.stocks?.metaData?[index].value ?? "",
                      expDetaildata.exploredetailModel?.stocks?.metaData?[index].data ?? [],
                      expDetaildata.exploredetailModel?.stocks?.ratingList ?? [],
                      expDetaildata.exploredetailModel?.stocks?.metaData
                  );*/
                            return buildQuickStat2(context, devicewidth,
                                newmetaData[index].key ?? "",
                                newmetaData[index].value ?? "",
                                newmetaData[index].data ?? [],
                                expDetaildata.exploredetailModel?.stocks?.metaData ?? []);
                }),
         ),
         Visibility(
           visible: false,
           child: Container(
             //  height: 60,
             //   color: Colors.redAccent,
               width: devicewidth,
               child: Padding(
                 padding: const EdgeInsets.only(top: 14.0,left: 8,right: 8,bottom: 10),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Expanded(
                       child: Container(
                         height: 10,
                         width: devicewidth / 2,
                         // color: Appcolors.splashbgcolor,
                         child: Divider(
                           thickness: 1,
                           color: Appcolors.splashbgcolor,
                         ),
                       ),
                     ),
                     GestureDetector(
                       onTap: (){
                         print('viewall tapped');
                         Navigator.push(context, MaterialPageRoute(builder: (context) => QuickStatDetail()));
                                  },
                       child: Padding(
                         padding: const EdgeInsets.only(left: 8.0,),
                         child: Row(
                           children: [
                             Text(" View all ",style: CustomTextStyle.txt14Rmtxtpurp,),
                        /*     Padding(
                               padding: const EdgeInsets.only(left: 8.0),
                               child: Hero(
                                 tag: "dfgd",
                                 child: SvgPicture.asset(LocalSVGImages.viewall,
                                     height: 14, width: 14),
                               ),
                             ),*/
                           ],
                         ),
                       ),
                     ),
                   ],
                 ),
               )),
         )
       ],
     );
    }
    )


        ),
      )
    );



  }

  int setMetaLength(List<MetaDataa>? metaData) {
     if(metaData != null && metaData.isNotEmpty) {
       for(MetaDataa item in metaData) {
         if(item.data != null && item.data!.isEmpty ){
           return metaData.length-1;
         }else{
           return metaData.length;
         }
       }
     }

     return metaData?.length ??0;

  }

Padding buildQuickStat2(BuildContext ctx,double devicewidth,String title1,String subtitle1, List<Data> dataslist, List<MetaDataa>? metaData)  {
  return Padding(
    padding: const EdgeInsets.only(top: 8.0,left: 15,right: 15),
    child: dataslist.isNotEmpty?Container(
      color: Colors.greenAccent,
      // child: addData(metaData,ratinglist)
    ):
    Container(
      height: 60,
      width: devicewidth,
     //color: Colors.red,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(child: Row(
              children: [
                Flexible(child: Text(title1,style: CustomTextStyle.txt14gpquickstatsgrey,maxLines: 1,overflow: TextOverflow.ellipsis,)),
             //|| title1 == "Sauda Ratings"
                title1 == "User Ratings" ? InkWell(
                  onTap: (){
                    if(title1 == "User Ratings"){
                      print('nav to rating');
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ReviewandRatings()));}
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: SvgPicture.asset(LocalSVGImages.mailredirect,
                        height: 15, width: 16),
                  ),
                ):SizedBox.shrink(),
              ],
            )),
            SizedBox(height: 5),
            Row(
              children: [
                Flexible(child: Text(subtitle1,style: CustomTextStyle.txt14Rbtxtblk,maxLines: 1,overflow: TextOverflow.ellipsis,)),
                subtitle1.length >22 ?      InkWell(
                  onTap: (){
                    print('quick stats overflowed ${subtitle1}');
                    showCustomDialog(ctx,subtitle1,title1);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
                      children: [
                        //  Text("Read more",style: CustomTextStyle.txt14Rmtxtpurp,),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: SvgPicture.asset(
                              LocalSVGImages.viewall,
                              height: 15, width: 16),
                        ),
                      ],
                    ),
                  ),
                ) : Text(""),
              ],
            ),
            SizedBox(height: 5)
         //   Flexible(child: Text("Readmore",style: CustomTextStyle.txt14Rbtxtblk))
]
  )
  )
  );




   }

  addData(List<MetaDataa>? metaData, List<MetaDataa>? ratinglist) {
     if(ratinglist != null) {
       metaData?.addAll(ratinglist);
    return Container(
        height: 60,
       // width: devicewidth,
        //color: Colors.red,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(child: Text(metaData?.last.key ?? "",style: CustomTextStyle.txt14gpquickstatsgrey,)),
              SizedBox(height: 5),
              Row(
                children: [
                  Flexible(child: Text(metaData?.last.value ?? "",style: CustomTextStyle.txt14Rbtxtblk,maxLines: 1,overflow: TextOverflow.ellipsis,)),
                /*  metaData?.first.value?.length >22 ?      InkWell(
                    onTap: (){
                      print('quick stats overflowed ${subtitle1}');
                      _showCustomDialog(ctx,subtitle1,title1);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
                        children: [
                          //  Text("Read more",style: CustomTextStyle.txt14Rmtxtpurp,),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: SvgPicture.asset(LocalSVGImages.viewall,
                                height: 15, width: 16),
                          ),
                        ],
                      ),
                    ),
                  ) : Text(""),*/
                ],
              ),
              SizedBox(height: 5)
              //   Flexible(child: Text("Readmore",style: CustomTextStyle.txt14Rbtxtblk))
            ]
        )
    );
     }
  }
}



void showCustomDialog(context, String subtitle1, String title1) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomAlertDialog(
          title: title1,
          content: subtitle1,
          firstOptionText: '',
          secondOptionText: '',
          hidebutton: false,
          firstOptionCallback: () {
            // Perform action for Yes option
          },
          secondOptionCallback: () {
            // Perform action for No option
          },
        );
      });
}

Padding buildQuickStat(double devicewidth,String title1,String subtitle1,String title2,String subtitle2)  {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: 50,
      width: devicewidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 1,
            child: Container(

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(child: Text(title1,style: CustomTextStyle.txt14gpquickstatsgrey,)),
                  SizedBox(height: 10,),
                  Flexible(child: Text(subtitle1,style: CustomTextStyle.txt14Rbtxtblk)),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
            width: 20,
          ),
          Expanded(
            flex: 1,

            child: Container(

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(child: Text(title2,style: CustomTextStyle.txt14gpquickstatsgrey)),
                  SizedBox(height: 10,),
                  Flexible(child: Text(subtitle2,style: CustomTextStyle.txt14Rbtxtblk)),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}