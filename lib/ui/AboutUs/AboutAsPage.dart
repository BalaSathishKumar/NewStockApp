import 'package:base_flutter_provider_project/constants/colors.dart';
import 'package:base_flutter_provider_project/utils/common_textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../common_widgets/appbar_widgets/common_appbar.dart';
import '../../common_widgets/appbar_widgets/logotxtappbar.dart';
import '../../constants/local_images.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  @override
  Widget build(BuildContext context) {
    var deviceheight = MediaQuery.of(context).size.height;
    var devicewidth = MediaQuery.of(context).size.width;
    return Scaffold(
        /*appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBar(
            backgroundColor: Appcolors.white,
            leading: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: SvgPicture.asset(LocalSVGImages.ic_brand_logo_green,
                  height: 25, width: 16),
            ),
            title: Text(
              "House of Investing",
              style: CustomTextStyle.txt18Rbblk,
            ),

          ),
        ),*/
        appBar: CustomAppBar(height: 60.0, title: 'House of Investing', appbarclr: Appcolors.white),
        backgroundColor: Appcolors.white,
        body: Container(
          height: deviceheight,
          width: devicewidth,
          //color: Colors.green,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
               /*   Padding(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: Container(
                      height: 100,
                       color: Colors.yellow,
                      child:  Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      //    LogoTxtAppbar(logotag: "abtusappbar",title: "House of Investing",Isportfolio: false,onPressed: (){}),
                        ],
                      ),
                    ),
                  ),*/
                  Stack(
                    children: [
                      Container(
                        //color: Colors.red.shade100,
                        child: SvgPicture.asset(LocalSVGImages.moregroup),
                      ),
                     /* Container(
                        height: 416,
                       child: Column(
                         children: [
                           Container(
                             height: 160,
                             width: devicewidth,
                             color: Colors.red,
                             child: Column(
                               mainAxisAlignment: MainAxisAlignment.end,
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Container(
                                   height: 50,
                                   width: 120,
                                   color: Colors.transparent,
                                 )
                               ],
                             ),
                           )
                         ],
                       ),
                       // color: Colors.red.shade50,
                      )*/
                    ],
                  ),





                /*  Container(                         // old flow
                    height: 500,
                    width: devicewidth,
                    // color: Colors.red.shade100,

                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 20.0, left: 8, right: 8),
                      child: Stack(
                        children: [
                          // Widget 1 (Positioned at the top left)
                          Positioned(
                            top: 20,
                            left: 5,
                            child: Container(
                              width: devicewidth,
                              //  color: Colors.red,
                              child: Hero(
                                tag: "abus1",
                                child: SvgPicture.asset(
                                  LocalSVGImages.aboutusgnew1,
                                  height: 150,
                                  width: devicewidth,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            child: Container(
                              width: 180,
                              height: 310,
                            //    color: Colors.orange,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Hero(
                                    tag: "abus4",
                                    child: SvgPicture.asset(
                                      LocalSVGImages.aboutusg4,
                                      height: 150,
                                      width: devicewidth,
                                    ),
                                  ),
                                  Hero(
                                    tag: "abus5",
                                    child: SvgPicture.asset(
                                      LocalSVGImages.aboutusg5,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Hero(
                                    tag: "abus6",
                                    child: SvgPicture.asset(
                                      LocalSVGImages.aboutusg6,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          Positioned(
                            bottom: 190,
                            right: 0,
                            child: Container(
                              width: 200,
                              height: 170,
                              // color: Colors.yellow,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Hero(
                                  tag: "abus3",
                                  child: SvgPicture.asset(
                                    LocalSVGImages.aboutusgasd,
                                    height: 150,
                                    width: devicewidth,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          Positioned(
                            bottom: 130,
                            right: 0,
                            child: Container(
                              width: 167,
                              height: 68,
                          //      color: Colors.yellow,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Hero(
                                  tag: "abus3",
                                  child: SvgPicture.asset(
                                    LocalSVGImages.abuss3,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          Positioned(
                            bottom: 70,
                            right: 0,
                            child: Container(
                              width:200,
                              height: 50,
                               //  color: Colors.yellow,
                              child: Hero(
                                tag: "abus7",
                                child: SvgPicture.asset(
                                  LocalSVGImages.aboutusg7,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),*/
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0,top: 60),
                    child: Container(
                      height: 100,
                    //  color: Colors.yellow,
                      width: devicewidth,
                      child: Column(
                        children: [
                          RichText(
                            textAlign: TextAlign.left,
                            text: TextSpan(
                              style: CustomTextStyle.txt24Rlblk,
                              children: <TextSpan>[
                                TextSpan(text: "WE OPEN"),
                                TextSpan(
                                    text: "POSSIBILITIES & OPPORTUNITIES",
                                    style: CustomTextStyle.txt24Rbblack),
                                TextSpan(text: "TO THE WORLD OF"),
                                TextSpan(
                                    text: "INVESTING",
                                    style: CustomTextStyle.txt24Rbblack),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ));
  }
}


