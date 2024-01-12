import 'package:base_flutter_provider_project/data/models/User_Directory_model/ChatUsersList.dart';
import 'package:base_flutter_provider_project/utils/common_functions.dart';
import 'package:base_flutter_provider_project/utils/common_textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../common_widgets/Explore_widgets/QuickStats.dart';
import '../../../common_widgets/tablayout/common_tablayout.dart';
import '../../../constants/colors.dart';
import '../../../constants/local_images.dart';
import '../../../viewModel/ChatUsers_view_model.dart';
import '../../Advisor&Broker/AdvisorandBroker.dart';
import '../../home/homepage.dart';
import '../DealerChatPage/DealerChatPage.dart';
class UserDirUI extends StatefulWidget {
  final int directoryindex;
  UserDirUI({
    required this.directoryindex
});

  @override
  State<UserDirUI> createState() => _UserDirUIState();
}

class _UserDirUIState extends State<UserDirUI> {
  int get DirIndx => widget.directoryindex;
  List<String> imageList2 = [
    'https://cdn.pixabay.com/photo/2019/03/15/09/49/girl-4056684_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/12/15/16/25/clock-5834193__340.jpg',
    'https://cdn.pixabay.com/photo/2020/09/18/19/31/laptop-5582775_960_720.jpg',
    'https://media.istockphoto.com/photos/woman-kayaking-in-fjord-in-norway-picture-id1059380230?b=1&k=6&m=1059380230&s=170667a&w=0&h=kA_A_XrhZJjw2bo5jIJ7089-VktFK0h0I4OWDqaac0c=',
    'https://cdn.pixabay.com/photo/2019/11/05/00/53/cellular-4602489_960_720.jpg',
    'https://cdn.pixabay.com/photo/2017/02/12/10/29/christmas-2059698_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/01/29/17/09/snowboard-4803050_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/02/06/20/01/university-library-4825366_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/11/22/17/28/cat-5767334_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/12/13/16/22/snow-5828736_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/12/09/09/27/women-5816861_960_720.jpg',
  ];
  final List<ListItem> items = [
    ListItem(
        lotsize: "1",
        stattxt: "Stat",
        statres: "E-Mobility",
        statres2: "100k",
        toprated: "Top Rated",
        text: 'Rustem Tolstobrov',
        statyears: "5+ years",
        rate: '132',
        shname: 'YLW',
        colors: 0xFFF1FAD1,
        imageUrl: "assets/png_icons/image7.jpg"),
    ListItem(
        lotsize: "1",
        stattxt: "Stat",
        statres: "E-Mobility",
        statres2: "100k",
        toprated: "Pharma Focused",
        statyears: "5+ years",
        text: 'Henry Richardson',
        rate: '1681',
        shname: 'PFC',
        colors: 0xFFF1FAD1,
        imageUrl: "assets/png_icons/image6.jpg",),
    ListItem(
        lotsize: "1",
        stattxt: "Stat",
        statres: "E-Mobility",
        statres2: "100k",
        toprated: "Crypto",
        statyears: "5+ years",
        text: 'Jacqueline Likoki',
        rate: '541',
        shname: 'DRL',
         colors: 0xFFF1FAD1,
        imageUrl: "assets/png_icons/image5.jpg",),
    ListItem(
        lotsize: "1",
        stattxt: "Stat",
        statres: "E-Mobility",
        statres2: "100k",
        toprated: "Top Rated",
        statyears: "5+ years",
        text: 'Filipa Gaspar',
        rate: '321',
        shname: 'API',
         colors: 0xFFF1FAD1,
        imageUrl: "assets/png_icons/image4.jpg",),
    ListItem(
        lotsize: "1",
        stattxt: "Stat",
        statres: "E-Mobility",
        statres2: "100k",
        toprated: "Top Rated",
        statyears: "5+ years",
        text: 'Florieke Krebber',
        rate: '150',
        shname: 'ABS',
      colors: 0xFFF1FAD1,
        imageUrl:"assets/png_icons/image3.jpg",),

    ListItem(
        lotsize: "1",
        stattxt: "Stat",
        statres: "E-Mobility",
        statres2: "100k",
        toprated: "Top Rated",
        statyears: "5+ years",
        text: 'Jacqueline Likoki',
        rate: '132',
        shname: 'YLW',
      colors: 0xFFF1FAD1,
        imageUrl: "assets/png_icons/image2.jpg",),
    ListItem(
        lotsize: "1",
        stattxt: "Stat",
        statres: "E-Mobility",
        statres2: "100k",
        toprated: "Top Rated",
        statyears: "5+ years",
        text: 'Rustem Tolstobrov',
        rate: '1681',
        shname: 'PFC',
        colors: 0xFFF1FAD1,
        imageUrl: "assets/png_icons/image1.jpg",),
    ListItem(
        lotsize: "1",
        stattxt: "Stat",
        statres: "E-Mobility",
        statres2: "100k",
        toprated: "Top Rated",
        statyears: "5+ years",
        text: 'Henry Richardson',
        rate: '541',
        shname: 'DRL',
        colors: 0xFFF1FAD1,
        imageUrl: "assets/png_icons/image0.jpg",),
  ];


  @override
  void initState() {
    super.initState();
    print('usr dir indx : ${DirIndx}');
  }
  @override
  Widget build(BuildContext context) {

    return  Consumer<ChatUsersViewModel>(
      builder: (context,userdirdatavm,child) {
        return SafeArea(
            child: Scaffold(
                backgroundColor: Colors.white,
                body: Padding(
                  padding: const EdgeInsets.all(15),
                  child: MasonryGridView.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8.0,
                    crossAxisSpacing: 8.0,
                    // itemCount: items.length,
                    itemCount: getItemCount(userdirdatavm.getchatusersResponseModel?.data),
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return SvgPicture.asset(LocalSVGImages.discoveryImg,
                          fit: BoxFit.fill,
                          height: 134,
                          width: 180,);
                        Image.network(
                            'https://cdn.pixabay.com/photo/2019/03/15/09/49/girl-4056684_960_720.jpg',
                        fit: BoxFit.cover,
                              );
                      }
                      return MasonryGridTile(
                        item: getUserDirData(userdirdatavm.getchatusersResponseModel?.data,index), //userdirdatavm.getchatusersResponseModel?.data?.users?[index],
                      );
                    },
                  ),
                ))
        );
      }
    );
  }

  getItemCount(Data? data) {
    switch (DirIndx) {
      case 0:
        return data?.users?.length;
      case 1:
        return data?.dealers?.length;
      case 2:
        return data?.advisors?.length;
    }

  }

  getUserDirData(Data? data, int index) {
    switch (DirIndx) {
      case 0:

        return data?.users?[index];
      case 1:
        return data?.dealers?[index];
      case 2:
        return data?.advisors?[index];
    }
  }

}


class MasonryGridTile extends StatefulWidget {

  final Users? item;

  const MasonryGridTile({Key? key,
    required  this.item,
 }) : super(key: key);

  @override
  State<MasonryGridTile> createState() => _MasonryGridTileState();
}

class _MasonryGridTileState extends State<MasonryGridTile> {
  @override
  Widget build(BuildContext context) {
    var deviceheight = MediaQuery.of(context).size.height;
    var devicewidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: (){
        print('selected directry : ${widget.item?.name}');
        print('selected directry : ${widget.item?.id.toString()}');
        print('selected directry : ${widget.item?.professionName}');
        showCustomBottomSheet(deviceheight,devicewidth,context,widget.item);
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0), color: Colors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    flex:1,
                    child: Container(
                        height: 90,
                        width: 70,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8),
                                topRight: Radius.circular(8),
                                bottomRight: Radius.circular(8),
                                bottomLeft: Radius.circular(8)),
                            image: DecorationImage(
                              image: widget.item?.photoUrl != null && widget.item?.photoUrl != "" ?
                              NetworkImage(widget.item?.photoUrl ?? "") : PlaceholderImageProvider()),

                        ),),
                  ),


                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Column(
                        children: [
                          Container(
                              height: 40,
                              //color: Colors.red,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Flexible(
                                    child: Text(widget.item?.name ?? "",
                                      maxLines: 2,overflow: TextOverflow.ellipsis,),
                                  ),
                                ],
                              )),
                          Container(
                            height: 30,
                         //   color: Colors.green,
                            child: Row(
                              children: [
                                Flexible(child: Text(widget.item?.roleName ?? "",maxLines: 2,overflow: TextOverflow.ellipsis,)),
                                SizedBox(width: 5,),
                                Text("4.5"),
                                SizedBox(width: 5,),
                                Icon(Icons.star,color: Colors.yellow,size: 15,)
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DotWithTxt("10+ years in industry",context),
                    SizedBox(height: 5),
                    DotWithTxt("1M in sales till date",context),
                    SizedBox(height: 5),
                    DotWithTxt("Max 3 key points listed here",context),
                    SizedBox(height: 5),
                    Container(
                     // height: 80,
                     // color:Colors.red.shade50 ,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(

                                child: Container(
                                  height: 24,
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      color: Color(0xFFF1FAD1),
                                      borderRadius:
                                      BorderRadius.circular(60)),
                                  child: FittedBox(
                                    fit: BoxFit.contain,
                                    child: Text(
                                        widget.item?.professionName ?? "",
                                        style: CustomTextStyle.txt12Rrtxtgry95,
                                        maxLines: 1,
                                        softWrap: false,
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                ),
                              ),
                            ],
                          ),

                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Row DotWithTxt(String content, BuildContext context) {
    return Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(LocalSVGImages.dot,
                    fit: BoxFit.fill,
                  height: 6,
                  width: 16,),
                  SizedBox(width: 5),
                  Container(
                    height: 20,
                      width: MediaQuery.of(context).size.width/2-70,
                    //  color: Colors.yellow,
                      child: Text(content,style: CustomTextStyle.txt12Rrtxtblk,
                      maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ))
                ],
              );
  }

  showCustomBottomSheet(double deviceheight,double devicewidth, BuildContext context,Users? item) {
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

                          child:
                          CircleAvatar(
                            radius: 60,
                            backgroundImage:  item?.photoUrl != "" ?NetworkImage(item?.photoUrl ?? "") : PlaceholderImageProvider()
                            //AssetImage(item.imageUrl)
                          ),

                          /*decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8),
                                topRight: Radius.circular(8),
                                bottomRight: Radius.circular(8),
                                bottomLeft: Radius.circular(8)),
                            image: DecorationImage(
                              image: AssetImage(item.imageUrl),
                              fit: BoxFit.fill,
                            ),
                            *//* Image.network(
                                    image,
                                   )*//*
                          ),*/
                        ),

                        SizedBox(height: 8),
                        Text(item?.name ?? "",style: CustomTextStyle.txt16Rmtxtblk),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(item?.premiumType ?? "",style: CustomTextStyle.txt16Rl),
                            SizedBox(width: 8),
                            Text(item?.ratings ?? "",style: CustomTextStyle.txt16Rmtxtblk),
                            Icon(Icons.star,color: Colors.yellow,size: 16,)
                          ],
                        ),
                        SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.only(left: 18.0,right: 18.0),
                          child: Container(
                            // color: Colors.red.shade100,
                            height: 50,
                            child:    Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(

                                // padding: EdgeInsets.all(25),
                                decoration: BoxDecoration(
                                //   color: Color(listitem[index].colors),
                                  color: Color(0xFFF1FAD1),
                                    borderRadius:
                                    BorderRadius.circular(60)),
                                child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        item?.professionName ?? "",
                                        style: CustomTextStyle.txt12Rrtxtgry95,
                                        maxLines: 1,
                                        softWrap: false,
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                ),
                              ),
                            )

                           /* ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: listitem.length,
                                itemBuilder: (context,index){
                                  return
                                    Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(

                                      // padding: EdgeInsets.all(25),
                                      decoration: BoxDecoration(
                                          color: Color(listitem[index].colors),
                                          borderRadius:
                                          BorderRadius.circular(60)),
                                      child: FittedBox(
                                        fit: BoxFit.contain,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                              listitem[index].toprated,
                                              style: CustomTextStyle.txt12Rrtxtgry95,
                                              maxLines: 1,
                                              softWrap: false,
                                              overflow: TextOverflow.ellipsis),
                                        ),
                                      ),
                                    ),
                                  );
                                }),*/
                          ),
                        ),
                        SizedBox(height: 8),
                        Container(
                          width:devicewidth,
                          //height: 100,
                         //   color: Colors.red,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 18.0,right: 18),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("About me",style: CustomTextStyle.txt14gpquickstatsgrey,),
                                Text( item?.about ?? "",
                                  style: CustomTextStyle.txt14Rrtxtblk,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,)
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 12),
                        Container(
                          // color: Colors.red,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              buildpopupcontainers(devicewidth, "Deals done  ", getMetaData(item?.userMetaData, 1) ?? "NA"),
                              buildpopupcontainers(devicewidth, "Industry Experience  ", getMetaData(item?.userMetaData, 2) ?? "NA"),
                              buildpopupcontainers(devicewidth, "Expertise  ", getMetaData(item?.userMetaData, 3) ?? "NA"),
                      /*        buildQuickStat(devicewidth,"Industry Experience ","10+ years","With Sauda","2+ years"),
                              buildQuickStat(devicewidth,"Users Helped ","100+","Deals done ","1200+ "),
                              buildQuickStat(devicewidth,"Total Txn Size","10 Crores","Avg Txn Size","5.2 Lakh"),*/
                            ],
                          ),
                        ),
                        SizedBox(height: 8),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => DealerChatPage(chatuserID:  item?.id ?? 0,chatusername: item?.name ??"")));

                          },
                          child: Container(
                            height: 50,
                            width: devicewidth/2+20,
                            child: Padding(
                                padding: const EdgeInsets.only(left: 0,right: 0),
                                child: ArrowBtn(
                                  height: 50,
                                  width: devicewidth,
                                  bgclr: Appcolors.splashbgcolor,
                                  btntxt: "Chat with me",
                                  icnclr: Appcolors.black,
                                  iconData: Icons.arrow_forward,
                                )
                            ),
                          ),
                        ),

                      ],
                    ))
              ],
            ),
          ),
        );
      },
    );
  }
}







