import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';
import '../../constants/local_images.dart';
import 'package:base_flutter_provider_project/data/models/User_Directory_model/ChatUsersList.dart';
import '../../data/models/dashboard_model/DashboardResponseModel.dart';
import '../../ui/home/StockHome.dart';
import '../../ui/home/homepage.dart';
import '../../utils/common_functions.dart';
import '../../utils/common_textstyles.dart';
import '../../viewModel/dashboard_view_model.dart';
import '../dropdown_widgets/common_dropdown.dart';
import 'TopBrokerDetailPage.dart';

class TopBrokers extends StatelessWidget {
  const TopBrokers({
    super.key,
    required this.firsttitle,
    required this.secondtitle,
    required this.optionslist,
    required this.imagetag,

    required this.devicewidth,
    required this.devicehgt,
    required this.topbrokers,
    required this.serviceyear,
    required this.IsViewPressed,

  });

  final String firsttitle;
  final String secondtitle;
  final String imagetag;
  final List<String> optionslist;

  final List<FeaturedBroker>? topbrokers;
  final double devicewidth;
  final double devicehgt;
  final List<String?> serviceyear;
  final VoidCallback IsViewPressed;


  @override
  Widget build(BuildContext context) {
    return  Consumer<DashboardViewModel>(
        builder: (context, dashTBdata, child) {

      return Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: Text(
                    firsttitle,
                    style: CustomTextStyle.txt12Rmtxtblk,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      secondtitle,
                      style: CustomTextStyle.txt24Rbblack,
                    ),
                  ],
                ),
                Container(
                  height: 290,
                 // color: Colors.green.shade50,
                  child: ListView.builder(
                    // itemCount: items.length,
                      itemCount: topbrokers?.length ?? 0,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {

                        return GestureDetector(
                       //   onTap: onFeaturedBroPressed(topbrokers?[index].user),
                          onTap: (){
                            print('selectedBroker:: ${topbrokers?[index].user?.name }');

                            showBrokerBottomSheet(
                                context,
                              topbrokers?[index],
                             devicehgt,devicewidth,);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Column(
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                        height: 200,
                                        width: 130,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(6),
                                                topRight: Radius.circular(30),
                                                bottomRight: Radius.circular(30),
                                                bottomLeft: Radius.circular(30)),
                                            image: DecorationImage(
                                              image: topbrokers?[index].user?.photoUrl != null ?
                                              NetworkImage(
                                                topbrokers?[index].user?.photoUrl ?? "",
                                              ) : PlaceholderImage(),
                                              //fit: BoxFit.fill
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
                                    Container(
                                   //   height: 200,
                                      width: 130,

                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 5.0, top: 8),
                                            child: Container(
                                              height: 24,
                                              padding: EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                  BorderRadius.circular(60)),
                                              child: FittedBox(
                                                fit: BoxFit.contain,
                                                child: Text(
                                                    topbrokers?[index].user?.professionName ?? "",
                                                    //items[index].toprated,
                                                    style: CustomTextStyle
                                                        .txt10Rmtxtblk,
                                                    maxLines: 1,
                                                    softWrap: false,
                                                    overflow: TextOverflow
                                                        .ellipsis),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                Container(
                                    // color: Colors.red,
                                    width: 130,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        buildSizedBox(height: 10, width: 0),
                                        Container(
                                       //       color: Colors.yellow,
                                          child: Text(
                                            topbrokers?[index].user?.name ?? "",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: CustomTextStyle
                                                .txt14Rbtxttbblacktxt,
                                          ),
                                        ),
                                        buildSizedBox(height: 5, width: 0),
                                        Divider(
                                          color: Appcolors.txtlitegreen2,
                                          height: 5,
                                          thickness: 2,
                                        ),
                                        buildStat("Experience:",  topbrokers?[index].user?.userMetaData),
                                        buildStat("Specaiality:",  topbrokers?[index].user?.userMetaData),

                                      ],
                                    ))
                              ],
                            ),
                          ),
                        );
                      }),
                ),
                Container(
                    height: 60,
                    width: devicewidth,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              height: 50,
                              width: devicewidth / 2,
                              child: Divider(
                                color: Appcolors.splashbgcolor,
                                height: 2,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              //  height: 60,
                            //     color: Colors.redAccent,
                                width: devicewidth,
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
                                      onTap: IsViewPressed,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 8.0),
                                        child: Row(
                                          children: [
                                            Text(" View all ",style: CustomTextStyle.txt14Rmtxtpurp,),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 8.0),
                                              child: Hero(
                                                tag: imagetag,
                                                child: SvgPicture.asset(LocalSVGImages.viewall,
                                                    height: 14, width: 14),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                        ],
                      ),
                    ))
              ],
            ),
          );
        });
  }

   buildStat(String stattitle,  List<UserMetaData>? userMetaData,  ) {
   // print('userMetaData list ${userMetaData?.length}');

     if(stattitle == "Specaiality:"){
       for(UserMetaData usermeta in userMetaData ?? []){
         // print('usermeta.key == ${usermeta.key}');
         if(usermeta.key == "expertise"){  //expertise
           return Container(
             height: 20,
             width: 130,
             // color: Colors.blue,
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
                     flex: 1,
                     child: Padding(
                       padding: const EdgeInsets.only(left: 5.0),
                       child: Text(
                         usermeta.value ?? "",
                         style: CustomTextStyle.txt12Rrtxtgry2,
                       ),
                     ))
               ],
             ),
           );
         }  //expertise

         }
     }else{
       for(UserMetaData usermeta in userMetaData ?? []){
         // print('usermeta.key == ${usermeta.key}');
         if(usermeta.key == "service_year"){  //expertise
           return Container(
             height: 20,
             width: 130,
             // color: Colors.blue,
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
                     flex: 1,
                     child: Padding(
                       padding: const EdgeInsets.only(left: 5.0),
                       child: Text(
                         usermeta.value ?? "",
                         style: CustomTextStyle.txt12Rrtxtgry2,
                       ),
                     ))
               ],
             ),
           );
         }


       }
     }
     }



  }


class DropOptionsS with ChangeNotifier {
  String _dropoptiions = "Stock Category";

  String get dropoptions => _dropoptiions;

  void getDropOPtions(String pcd) {
    _dropoptiions = pcd;
    notifyListeners();
  }
}


