
import 'package:base_flutter_provider_project/data/models/dashboard_model/DashboardResponseModel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:base_flutter_provider_project/data/models/User_Directory_model/ChatUsersList.dart';
import '../../constants/colors.dart';
import '../../ui/Advisor&Broker/AdvisorandBroker.dart';
import '../../ui/ChatPage/ChatRoomPage.dart';
import '../../utils/common_functions.dart';
import '../../utils/common_textstyles.dart';
import '../appbar_widgets/common_appbar.dart';

class TopBrokerDetail extends StatefulWidget {
  final List<FeaturedBroker>? featuredBrokers;
  TopBrokerDetail({
    required this.featuredBrokers,
});
  @override
  State<TopBrokerDetail> createState() => _TopBrokerDetailState();
}

class _TopBrokerDetailState extends State<TopBrokerDetail> {


  List<FeaturedBroker>?  get TopBrokers => widget.featuredBrokers;

  @override
  Widget build(BuildContext context) {
    var deviceheight = MediaQuery.of(context).size.height;
    var devicewidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CustomAppBar(height: 60.0, title: 'Top Brokers', appbarclr: Appcolors.white),
      body: Container(
        child: Column(
          children: [
            Expanded(
                child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8),
                    child: Container(
                      height: deviceheight,
                      width: devicewidth,
                      child:
                      ChkBroker(TopBrokers)?Center(child: Text("No Top Brokes found")):  ListView.builder(
                          itemCount: TopBrokers?.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  left: 8.0, right: 8, bottom: 8),
                              child: GestureDetector(
                                onTap: (){
                                  print('chat enabled in TOPBROKER ${ TopBrokers?[index].user?.chatEnable}');
                                  showBrokerBottomSheet(
                                      context,
                                      TopBrokers?[index],deviceheight,devicewidth);
                                },
                                child: Container(
                                    height: 120,
                                    //     color: Colors.red.shade50,
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Appcolors.splashbgcolor,
                                          // Border color
                                          width: 1.0,
                                          // Border width
                                          style: BorderStyle
                                              .solid, // Border style
                                        ),
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            //      color: Colors.yellow,
                                              child: CircleAvatar(
                                                radius: 30,
                                                backgroundImage:
                                                TopBrokers?[index].user?.photoUrl != null ?
                                                CachedNetworkImageProvider(
                                                    TopBrokers?[index].user?.photoUrl ?? "",
                                                    errorListener: () {
                                                      print('image error');
                                                      //   AssetImage(LocalPNGImages.connection_error) ;
                                                    }
                                                ) : PlaceholderImageProvider(),

                                                //:AssetImage(items[index].imageUrl)
                                              )),
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: Container(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Expanded(
                                                      flex: 3,
                                                      child: Container(
                                                          width: devicewidth,
                                                          //  color: Colors.green.shade50,
                                                          child: Column(
                                                            mainAxisAlignment: MainAxisAlignment.end,
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              Text(TopBrokers?[index].user?.name ?? "", style: CustomTextStyle.txt16Rmtxtblk,),
                                                            ],
                                                          ))),

                                                  Expanded(
                                                      flex: 1,
                                                      child: Container(
                                                          width: devicewidth,
                                                          //         color: Colors.blue.shade50,
                                                          child: Column(
                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              Text(
                                                                TopBrokers?[index].user?.professionName ?? "",
                                                                style: CustomTextStyle.txt14Rlblk,),
                                                            ],
                                                          ))),

                                                  Expanded(
                                                      flex: 3,
                                                      child: Container(
                                                          width: devicewidth,
                                                          //  color: Colors.orange.shade50,
                                                          child: Column(
                                                            crossAxisAlignment: CrossAxisAlignment
                                                                .start,
                                                            children: [
                                                              Text(
                                                                TopBrokers?[index].user?.roleName ?? "",
                                                                style: CustomTextStyle
                                                                    .txt12Rmtxtlisttilegrey12,),
                                                            ],
                                                          ))),

                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Visibility(
                                            visible: false,
                                            child: Container(
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    flex: 1,
                                                    child: InkWell(
                                                      onTap: () {

                                                      },
                                                      child: Container(
                                                        height: 120,
                                                        //  color: Colors.red.shade100,
                                                        child: Column(
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          children: [
                                                            Icon(
                                                                Icons.more_horiz),

                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 1,
                                                    child:   chkStatus(TopBrokers?[index].user?.chatEnable) ?
                                                    GestureDetector(
                                                      onTap: () {
                                                        print('on chat clicked in top brokers ${TopBrokers?[index].user?.status}');
                                                        Navigator.push(context, MaterialPageRoute(builder: (context) => ChatRoomPage(chatuserID: TopBrokers?[index].user?.id ?? 0, IsAdminChat: false, username:TopBrokers?[index].user?.name)));
                                                        },
                                                      child: Container(
                                                        height: 120,
                                                        //          color: Colors.yellow,
                                                        child: Column(
                                                          mainAxisAlignment: MainAxisAlignment
                                                              .center,
                                                          children: [
                                                            Container(
                                                              height: 35,
                                                              width: 50,
                                                              decoration: BoxDecoration(
                                                                //     color: Colors.green,
                                                                  border: Border
                                                                      .all(
                                                                      color: Appcolors
                                                                          .black,
                                                                      width: 0.5),
                                                                  borderRadius: BorderRadius
                                                                      .circular(
                                                                      12)
                                                              ),
                                                              child: Center(
                                                                  child: Text(
                                                                    "Chat",
                                                                    style: CustomTextStyle
                                                                        .txt12Rmtxtlisttilegrey12,)),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ): SizedBox.shrink()
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    )


                                ),
                              ),
                            );
                          }),
                    )
                )

            )
          ],
        ),
      ),
    );
  }

  ChkBroker(List<FeaturedBroker>? topBrokers) {
    if(topBrokers != null && topBrokers.isEmpty){
      return true;
    }else{
      return false;
    }
  }




}

showBrokerBottomSheet(BuildContext context, FeaturedBroker? topBroker, double deviceheight, double devicewidth, ) {
  showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(23.0),
      ),
    ),
    builder: (BuildContext context) {
      return Container(
        height: deviceheight/2+260,
        decoration: BoxDecoration(
            color: Appcolors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(23.0),
              topRight: Radius.circular(23.0),
            )),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 50,
                width: devicewidth,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(23.0),
                      topRight: Radius.circular(23.0),
                    )),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.close, color: Appcolors.black, size: 25,))
                    ],
                  ),
                ),
              ),
              Container(
                  color: Appcolors.white,
                  child: Column(
                    children: [
                      Container(
                        //      color: Colors.yellow,
                          child: CircleAvatar(
                            radius: 60,
                            backgroundImage: topBroker?.user?.photoUrl != null?
                            CachedNetworkImageProvider(
                                topBroker?.user?.photoUrl  ?? "",
                                errorListener: (){
                                  print('error');
                                }
                            )
                                :PlaceholderImage(),
                            /* AssetImage(item.imageUrl)*/
                          )
                      ),
                      SizedBox(height: 8),
                      Text(topBroker?.user?.name??"",style: CustomTextStyle.txt16Rmtxtblk),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(topBroker?.user?.professionName.toString()??"",style: CustomTextStyle.txt16Rl),
                          SizedBox(width: 8),
                          Text(topBroker?.user?.ratings ?? "",style: CustomTextStyle.txt16Rmtxtblk),
                          Icon(Icons.star,color: Colors.yellow,size: 16,)
                        ],
                      ),
                      SizedBox(height: 8),
                      /*  Padding(
                          padding: const EdgeInsets.only(left: 18.0,right: 18.0),
                          child: Container(
                            // color: Colors.red.shade100,
                            height: 50,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: professionAndpremium.length,
                                itemBuilder: (context,index){
                                  return  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(

                                      // padding: EdgeInsets.all(25),
                                      decoration: BoxDecoration(
                                        // color: Color(widget.items[index].colors).withOpacity(0.1),
                                          color: Colors.green.withOpacity(0.1),
                                          borderRadius:
                                          BorderRadius.circular(60)),
                                      child: FittedBox(
                                        fit: BoxFit.contain,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                              professionAndpremium[index],
                                              style: TextStyle(
                                                  color: Color(widget.items[index].colors).withOpacity(0.4)
                                              ),
                                              // style: CustomTextStyle.txt14Rrtxttitlegrey4,
                                              maxLines: 1,
                                              softWrap: false,
                                              overflow: TextOverflow.ellipsis),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        ),*/
                      SizedBox(height: 8),
                      Container(
                        // height: 100,
                        width: devicewidth,
                        //color: Colors.red.shade100,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 18.0,right: 18),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("About me",style: CustomTextStyle.txt14gpquickstatsgrey,),
                              SizedBox(height: 10),
                              Text(topBroker?.user?.about ?? "",
                                style: CustomTextStyle.txt14Rrtxtblk,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,)
                            ],
                          ),
                        ),
                      ),
                      Container(
                        // color: Colors.red,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            buildpopupcontainers(devicewidth,"Deals done  ",  getMetaDataa(topBroker?.user?.userMetaData,1)?? "NA"),
                            buildpopupcontainers(devicewidth,"Industry Experience  ",  getMetaDataa(topBroker?.user?.userMetaData,2)?? "NA"),
                            buildpopupcontainers(devicewidth,"Expertise  ",   getMetaDataa(topBroker?.user?.userMetaData,3)?? "NA"),

                          ],
                        ),
                      ),
                      SizedBox(height: 8),

                      chkStatus(topBroker?.user?.chatEnable) ?  GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ChatRoomPage(chatuserID: topBroker?.user?.id ?? 0, IsAdminChat: false,)));
                        },
                        child: Container(
                          height: 50,
                          width: devicewidth/2+20,
                          //  color: Colors.red,
                          child: Padding(
                              padding: const EdgeInsets.only(left: 0,right: 0),
                              child: ArrowBtn(
                                height: 50,
                                width: devicewidth,
                                bgclr: Appcolors.btnbggrey,
                                btntxt: "Chat with me",
                                icnclr: Appcolors.black,
                                iconData: Icons.arrow_forward,
                              )
                          ),
                        ),
                      ): SizedBox.shrink()

                    ],
                  ))
            ],
          ),
        ),
      );
    },
  );
}

String? getMetaDataa(List<UserMetaData>? userMetaData, int i) {

  if(userMetaData != null && userMetaData.isNotEmpty){
    for(UserMetaData item in userMetaData ?? []){
      if(i==1 ){
        if(item.key == "done"){
          return item.value ?? "";
        }

      }
      else if(i==2){
        if( item.key == "service_year"){
          return item.value ?? "";
        }

      }
      else if(i==3){
        if( item.key == "expertise"){
          return item.value ?? "";
        }
      }
      else{
        return "NA";
      }
    }
  }


}