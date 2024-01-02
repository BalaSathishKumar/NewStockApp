import 'package:base_flutter_provider_project/data/models/home_model/FAQmodel.dart';
import 'package:base_flutter_provider_project/viewModel/base_view_model/FAQunlisted_viewmodel.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../common_widgets/appbar_widgets/common_appbar.dart';
import '../../constants/colors.dart';
import '../../constants/local_images.dart';
import '../../utils/common_textstyles.dart';
import '../../viewModel/CommonProvider.dart';

import '../home/homepage.dart';

class FAQUnlisted extends StatefulWidget {
  const FAQUnlisted({super.key});

  @override
  State<FAQUnlisted> createState() => _FAQUnlistedState();
}

class _FAQUnlistedState extends State<FAQUnlisted> {
  final GlobalKey<ExpansionTileCardState> cardA = GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardB = GlobalKey();
  final List<ListItem> items = [
    ListItem(
        lotsize: "1",
        stattxt: "per week",
        statres: "E-Mobility",
        statres2: "100k",
        toprated: "499",
        text: 'Weekly Plan',
        statyears: "5+ years",
        rate: '132',
        shname: 'YLW',
        colors: 0xFF3366FF,
        imageUrl: LocalPNGImages.story1),

    ListItem(
        lotsize: "1",
        stattxt: "per month",
        statres: "E-Mobility",
        statres2: "100k",
        toprated: "1800",
        text: 'Monthly Plan',
        statyears: "5+ years",
        rate: '132',
        shname: 'YLW',
        colors: 0xFF3366FF,
        imageUrl: LocalPNGImages.story1),

    ListItem(
        lotsize: "1",
        stattxt: "every 3 month",
        statres: "E-Mobility",
        statres2: "100k",
        toprated: "4100",
        text: 'Quarterly Plan',
        statyears: "5+ years",
        rate: '132',
        shname: 'YLW',
        colors: 0xFF3366FF,
        imageUrl: LocalPNGImages.story1),

    ListItem(
        lotsize: "1",
        stattxt: "per year",
        statres: "E-Mobility",
        statres2: "100k",
        toprated: "9999",
        text: 'Annual Plan',
        statyears: "5+ years",
        rate: '132',
        shname: 'YLW',
        colors: 0xFF3366FF,
        imageUrl: LocalPNGImages.story1),

    ListItem(
        lotsize: "1",
        stattxt: "per week",
        statres: "E-Mobility",
        statres2: "100k",
        toprated: "499",
        text: 'Weekly Plan',
        statyears: "5+ years",
        rate: '132',
        shname: 'YLW',
        colors: 0xFF3366FF,
        imageUrl: LocalPNGImages.story1),

    ListItem(
        lotsize: "1",
        stattxt: "per month",
        statres: "E-Mobility",
        statres2: "100k",
        toprated: "1800",
        text: 'Monthly Plan',
        statyears: "5+ years",
        rate: '132',
        shname: 'YLW',
        colors: 0xFF3366FF,
        imageUrl: LocalPNGImages.story1),

    ListItem(
        lotsize: "1",
        stattxt: "every 3 month",
        statres: "E-Mobility",
        statres2: "100k",
        toprated: "4100",
        text: 'Quarterly Plan',
        statyears: "5+ years",
        rate: '132',
        shname: 'YLW',
        colors: 0xFF3366FF,
        imageUrl: LocalPNGImages.story1),

    ListItem(
        lotsize: "1",
        stattxt: "per year",
        statres: "E-Mobility",
        statres2: "100k",
        toprated: "9999",
        text: 'Annual Plan',
        statyears: "5+ years",
        rate: '132',
        shname: 'YLW',
        colors: 0xFF3366FF,
        imageUrl: LocalPNGImages.story1),

  ];
  int selectedindex = 0;
  List<bool> _isExpandedList = [];
  late CommonProvider _commonProvider;
  late FAQunlistedViewModel _faQunlistedViewModel;
  @override
  void initState() {
    super.initState();
    _commonProvider =Provider.of<CommonProvider>(context,listen: false);
    _faQunlistedViewModel =Provider.of<FAQunlistedViewModel>(context,listen: false);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _faQunlistedViewModel.FaQunlistedapi(onFailureRes: onFailureRes, onSuccessRes: onSuccessRes);
    });
    
  }

  @override
  Widget build(BuildContext context) {
    var deviceheight = MediaQuery.of(context).size.height;
    var devicewidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Appcolors.white,
      appBar: CustomAppBar(height: 60.0, title: 'FAQ Unlisted', appbarclr: Appcolors.white),
      body: Container(
        height: deviceheight,
        width: devicewidth,
        child: Column(
          children: [
     SizedBox(height: 40,),
            Expanded(
              child: Consumer<FAQunlistedViewModel>(
                builder: (context,faqdata,child) {
                  return Container(
                      height: deviceheight,
                      width: devicewidth,
                      child: ListView.builder(
                          itemCount: faqdata.FaQunlistedModel?.faq?.length ?? 0,
                          itemBuilder: (context, index) {
                            var faqdatas = faqdata.FaQunlistedModel?.faq;
                            return Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: Appcolors.txtpurple),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: ExpansionTileCard(

                                  elevation: 0,
                                  onExpansionChanged: (exp) {
                                    print('isExpansion ${exp}');
                                    _commonProvider.setIsExpand(exp);
                                    _isExpandedList[index] = exp;
                                  },
                                  borderRadius: BorderRadius.circular(16),
                                  shadowColor: Colors.transparent,
                                  baseColor: Appcolors.white,
                                  title: Container(
                                    height: 60,
                                      width: devicewidth,
                                   //   color: Colors.red.shade100,
                                    child: Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              height: 60,
                                             width: devicewidth/2 +50,
                                             // color: Colors.red,
                                              child: Text("${faqdatas?[index].title} ",
                                                maxLines: 3,
                                                overflow: TextOverflow.ellipsis,
                                                softWrap: true,
                                                style: CustomTextStyle.txt16Rbtxtpurple,),
                                            ),

                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  expandedTextColor: Appcolors.txtpurple,
                                  trailing: Consumer<CommonProvider>(
                                    builder: (context, commonprovider, child) {
                                      return Container(
                                           //  color: Colors.red,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            _isExpandedList[index]
                                                ? SvgPicture.asset(LocalSVGImages.drop2, height: 15, width: 15)
                                                : SvgPicture.asset(LocalSVGImages.drop1, height: 15, width: 15),
                                          ],
                                        ),
                                      );
                                    },

                                  ),
                                  children: [
                                    const Divider(
                                      thickness: 1.0,
                                      height: 1.0,
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 16.0,
                                          vertical: 8.0,
                                        ),
                                        child: Text(
                                         "${faqdatas?[index].description}",
                                          style: Theme
                                              .of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(fontSize: 16),
                                        ),
                                      ),
                                    ),

                                    ButtonBar(
                                      alignment: MainAxisAlignment.spaceAround,
                                      buttonHeight: 52.0,
                                      buttonMinWidth: 90.0,
                                      children: <Widget>[],
                                    ),

                                  ],
                                ),
                              ),
                            );
                          })
                  );
                }
              ),
            )

          ],
        ),
      ),
    );
  }

  onFailureRes(String p1) {
  }

  onSuccessRes(FaQmodel? faqdatas) {
    if(faqdatas?.faq != null || faqdatas!.faq!.isEmpty){
      _isExpandedList = List<bool>.generate(faqdatas!.faq!.length, (index) => false);
    }

  }
}
