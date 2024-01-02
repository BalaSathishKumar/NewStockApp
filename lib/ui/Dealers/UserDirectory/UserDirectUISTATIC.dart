import 'package:base_flutter_provider_project/utils/common_textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';

import '../../../common_widgets/Explore_widgets/QuickStats.dart';
import '../../../constants/colors.dart';
import '../../../constants/local_images.dart';
import '../../Advisor&Broker/AdvisorandBroker.dart';
import '../../home/homepage.dart';
import '../DealerChatPage/DealerChatPage.dart';
class UserDirUI extends StatefulWidget {
  const UserDirUI({super.key});

  @override
  State<UserDirUI> createState() => _UserDirUIState();
}

class _UserDirUIState extends State<UserDirUI> {
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
  Widget build(BuildContext context) {
    var deviceheight = MediaQuery.of(context).size.height;
    var devicewidth = MediaQuery.of(context).size.width;
    final List<String> imageList = [
      "assets/png_icons/image0.jpg",
      "assets/png_icons/image1.jpg",
      "assets/png_icons/image2.jpg",
      "assets/png_icons/image3.jpg",
      "assets/png_icons/image4.jpg",
      "assets/png_icons/image5.jpg",
      "assets/png_icons/image6.jpg",
      "assets/png_icons/image7.jpg",
      "assets/png_icons/image7.jpg",
    ];
    return  SafeArea(
      child: Scaffold(
          backgroundColor:Colors.white,
          body: Padding(
            padding: const EdgeInsets.all(15),
            child: MasonryGridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
             // itemCount: imageList.length,
              itemCount: items.length,
              itemBuilder: (context, index) {
                          if (index == 0) {
                         return SvgPicture.asset(LocalSVGImages.discoveryImg,
                           fit: BoxFit.fill,
                           height: 134,
                           width: 180,);

                           /*Image.network(
                          'https://cdn.pixabay.com/photo/2019/03/15/09/49/girl-4056684_960_720.jpg',
                      fit: BoxFit.cover,
                            );*/
                          }
                return MasonryGridTile(
                  image: imageList[index],
                  item:items[index],
                  listitem: items,
                );
              },
            ),
          ))
    );
  }
}


class MasonryGridTile extends StatelessWidget {
  final String image;
  final ListItem item;
  final List<ListItem> listitem;
  const MasonryGridTile({Key? key,
    required this.image,
    required  this.item,
  required this.listitem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var deviceheight = MediaQuery.of(context).size.height;
    var devicewidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: (){
        print('selected directry : ${item.text}');
        showCustomBottomSheet(deviceheight,devicewidth,context,item,listitem);
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              color: Colors.white),
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
                              image: AssetImage(item.imageUrl),
                              fit: BoxFit.fill,
                            ),
                          /* Image.network(
                                    image,
                                   )*/
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
                            //  color: Colors.red,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Flexible(
                                    child: Text(item.text,
                                      maxLines: 2,overflow: TextOverflow.ellipsis,),
                                  ),
                                ],
                              )),
                          Container(
                            height: 30,
                         //   color: Colors.green,
                            child: Row(
                              children: [
                                Flexible(child: Text("Broker",maxLines: 2,overflow: TextOverflow.ellipsis,)),
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
                      height: 80,

                     // color:Colors.red.shade50 ,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                flex:1,
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
                                       "Pharma",
                                        style: CustomTextStyle.txt12Rrtxtgry95,
                                        maxLines: 1,
                                        softWrap: false,
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 3.0),
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
                                         "Construction",
                                          style: CustomTextStyle.txt12Rrtxtgry95,
                                          maxLines: 1,
                                          softWrap: false,
                                          overflow: TextOverflow.ellipsis),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 5.0,top: 8),
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
                                        "AI/ML",
                                        style: CustomTextStyle.txt12Rrtxtgry95,
                                        maxLines: 1,
                                        softWrap: false,
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 5.0,top: 8),
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
                                        "E-Sports",
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

  showCustomBottomSheet(double deviceheight,double devicewidth, BuildContext context, ListItem item,final List<ListItem> listitem) {
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
          height: deviceheight/2+300,
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

                          child: CircleAvatar(
                            radius: 60,
                            backgroundImage: AssetImage(item.imageUrl)

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
                        Text(item.text,style: CustomTextStyle.txt16Rmtxtblk),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(item.toprated,style: CustomTextStyle.txt16Rl),
                            SizedBox(width: 8),
                            Text("4.5",style: CustomTextStyle.txt16Rmtxtblk),
                            Icon(Icons.star,color: Colors.yellow,size: 16,)
                          ],
                        ),
                        SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.only(left: 18.0,right: 18.0),
                          child: Container(
                            // color: Colors.red.shade100,
                            height: 50,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: listitem.length,
                                itemBuilder: (context,index){
                                  return  Padding(
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
                                }),
                          ),
                        ),
                        SizedBox(height: 8),
                        Container(
                          height: 100,
                          //  color: Colors.red,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 18.0,right: 18),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("About me",style: CustomTextStyle.txt14gpquickstatsgrey,),
                                Text("This section is reserved for about me from the dealer or broker, not more than 2 to 3 sentences showing how they can be of help to the end users.",
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
                            /*  buildQuickStat(devicewidth,"Industry Experience ","10+ years","With Sauda","2+ years"),
                              buildQuickStat(devicewidth,"Users Helped ","100+","Deals done ","1200+ "),
                              buildQuickStat(devicewidth,"Total Txn Size","10 Crores","Avg Txn Size","5.2 Lakh"),*/
                            ],
                          ),
                        ),
                        SizedBox(height: 8),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => DealerChatPage(chatuserID: 1)));

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







