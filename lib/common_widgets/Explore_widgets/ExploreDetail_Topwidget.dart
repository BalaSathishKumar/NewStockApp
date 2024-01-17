import 'package:base_flutter_provider_project/constants/colors.dart';
import 'package:base_flutter_provider_project/ui/home/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:webview_flutter/webview_flutter.dart';

import '../../constants/local_images.dart';
import '../../data/models/Explore_model/ExploreModel.dart';
import '../../ui/Advisor&Broker/AdvisorandBroker.dart';

import '../../utils/common_functions.dart';
import '../../utils/common_textstyles.dart';
import 'QuickStats.dart';

class ExploreDetailTopDetails extends StatelessWidget {
  Stocks? selectedstocks;
  bool isAdvisorReview;

  ExploreDetailTopDetails({required this.selectedstocks, required  this.isAdvisorReview});

  @override
  Widget build(BuildContext context) {
    var deviceheight = MediaQuery.of(context).size.height;
    var devicewidth = MediaQuery.of(context).size.width;
    return Container(
      height: isAdvisorReview?150:310,
   // color: Colors.red.shade100,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 100,
                    width: 100,
                   // color: Colors.red,// bgclr 1
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                   /*     child: Image.asset( selectedstocks.imageUrl,
                            width: 50,
                            height: 50,
                            fit: BoxFit.fill),*/
                        child:selectedstocks?.photoUrl != null? Image.network(
                          selectedstocks?.photoUrl  ?? "",
                          width: 60,
                          height: 40,
                          fit: BoxFit.cover,
                        ):PlaceholderImage(),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      Container(
                        height: 130,
                        // bgclr 3
                     //   color: Colors.red.shade50,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Container(
                                width: devicewidth,
                                decoration: BoxDecoration(
                                     //color: Colors.green,  // bgclr 4
                                    border: Border(
                                  bottom: BorderSide(
                                    color: Appcolors.dividergrey,
                                    // Border color
                                    width: 1.0,
                                    // Border width
                                    style: BorderStyle.solid, // Border style
                                  ),
                                )),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Flexible(
                                        child: Text(
                                      selectedstocks?.name ?? "",
                                      style: CustomTextStyle.txt16Rb,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                    )),
                                    Flexible(
                                        child: Text(selectedstocks?.category?.categoryName ?? "",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: CustomTextStyle.txt14Rlblk)),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                //   color: Colors.lightBlue,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SvgPicture.asset(LocalSVGImages.mailredirect,
                                              height: 15, width: 15),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          GestureDetector(
                                            onTap:(){
                                              openUrl(selectedstocks?.website ?? "");
                                          //    openUrl("dwirandyh.medium.com/securing-your-flutter-app-by-adding-ssl-pinning-474722e38518");
                                            //  _launchPhonePe(selectedstocks?.website ?? "");
                                            },
                                        child: Text(selectedstocks?.website ?? "",
                                              maxLines: 1,
                                              style: CustomTextStyle.txt14Rrtxtblktxtpurple,
                                            ),
                                          ),
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

                    ],
                  ),
                ),
              ],
            ),
            isAdvisorReview?Container(): Expanded(
              child: Container(
                width: devicewidth,
               //color: Colors.green,
                child:  Padding(
                  padding: const EdgeInsets.only(left: 8.0,right: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0,bottom: 8),
                        child: Text("Summary"),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Container(
                          //height: 50,
                       //   color: Colors.red,
                          child: Text(selectedstocks?.about ?? "",
                            maxLines: 3,
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                            style: CustomTextStyle.txt14Rrtxtblk,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0,bottom: 8),
                        child: Row(
                          children: [
                            Text("Listed By : ",style:  CustomTextStyle.txt14gpquickstatsgrey,),
                            Expanded(child: Text("${selectedstocks?.dealerDetails?.name ?? ""}",maxLines: 2,overflow: TextOverflow.ellipsis,)),
                          ],
                        ),
                      ),

                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: (){
                                ShowDetailsPopup(context,"Summary",selectedstocks?.about ?? "");
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(top: 8.0),
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
                            GestureDetector(
                              onTap: (){
                                print('selected stock cat in exd  ${selectedstocks?.category?.categoryName}');
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => AdvisorandBroker(IsClickForAdvisorHelp: true,selectedstocks: selectedstocks) ));
                              },
                              child: Container(
                                child:   Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Row(
                                    children: [
                                      Text("Click for Advisor help",style: CustomTextStyle.txt14Rmtxtpurp,),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8.0),
                                        child: Hero(
                                          tag: "advhlp",
                                          child: SvgPicture.asset(LocalSVGImages.viewall,
                                              height: 15, width: 16),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container ListedByContainer(double devicewidth, String title, String values) {
    return Container(
                     height: 60,
                      width: devicewidth,
                      // color: Colors.red,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(child: Text(title,style: CustomTextStyle.txt14gpquickstatsgrey,)),
                          SizedBox(height: 5),
                          Flexible(child: Text(values,style: CustomTextStyle.txt14Rbtxtblk,maxLines: 1,overflow: TextOverflow.ellipsis,)),

                        ],
                      ),

                    );
  }

  Future<void> openUrl(String apiurl) async {
 /*   final _url = Uri.parse(url);
    if (!await launchUrl(_url, mode: LaunchMode.externalApplication)) { // <--
      throw Exception('Could not launch $_url');
    }*/

    if(apiurl != null && apiurl != ""){
      String url = "https://$apiurl";
      Uri loadlink = Uri.parse(url);
      var urllaunchable = await  canLaunchUrl(loadlink); //canLaunch is from url_launcher package
      if(urllaunchable){
        await  launchUrl(loadlink); //launch is from url_launcher package to launch URL
      }else{
        print("URL can't be launched.");
      }
    } else{

    }


  }




/*
  Future<void> _launchPhonePe(String s) async {
    final url = Uri.parse("https://flutter.dev");
    if (await canLaunchUrl(url)) {
      await launchUrl(
        url,
        forceSafariVC: false,
        forceWebView: false,
        enableJavaScript: true,
        universalLinksOnly: true,
      );
    } else {
      throw 'Could not launch $url';
    }
  }*/
  }
void ShowDetailsPopup(context, String subtitle1, String title1) {

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 50),
          child: Container(
            decoration: BoxDecoration(
              color: Appcolors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: SingleChildScrollView(child: Text(title1)),
            ),
          ),
        );
      });
}