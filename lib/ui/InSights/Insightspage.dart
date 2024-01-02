

import 'package:base_flutter_provider_project/data/models/Insights_model/BlogsResponseModel.dart';
import 'package:base_flutter_provider_project/data/models/Insights_model/CatBasedBlogsModel.dart';

import 'package:base_flutter_provider_project/viewModel/blogs_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common_widgets/InSightsWidgets/LatestTipsScroll.dart';
import '../../common_widgets/Listtile_widgets/inSughts_Listtile.dart';
import '../../common_widgets/appbar_widgets/common_appbar.dart';
import '../../common_widgets/appbar_widgets/logotxtappbar.dart';
import '../../common_widgets/loading_widgets/loader.dart';
import '../../common_widgets/tablayout/common_tablayout.dart';
import '../../common_widgets/tablayout/tab_with_border.dart';
import '../../constants/colors.dart';
import '../../constants/local_images.dart';
import '../../utils/common_functions.dart';
import '../../utils/common_textstyles.dart';
import '../../viewModel/base_view_model/base_view_model.dart';
import '../../viewModel/cat_based_blogs_view_model.dart';
import '../../viewModel/latest_tips_view_model.dart';
import '../home/homepage.dart';
import 'BlogDetailPage.dart';
import 'TipsStatus.dart';

class InsightsPage extends StatefulWidget {
  const InsightsPage({Key? key}) : super(key: key);

  @override
  State<InsightsPage> createState() => _InsightsPageState();
}

class _InsightsPageState extends State<InsightsPage>  with SingleTickerProviderStateMixin{

  late TabController _blogtabController;
  late LatestTipsViewModel _latestTipsViewModel;
  late BlogsViewModel _blogsViewModel;
  final List<ListItem> items = [
    ListItem(
        lotsize: "1",
        stattxt: "Stat",
        statres: "E-Mobility",
        statres2: "100k",
        toprated: "Top Performing Stocks",
        text: 'Yellow Studios',
        statyears: "5+ years",
        rate: '132',
        shname: 'YLW',
        colors: 0xFF3366FF,
        imageUrl: LocalPNGImages.story1),
    ListItem(
        lotsize: "1",
        stattxt: "Stat",
        statres: "E-Mobility",
        statres2: "100k",
        toprated: "Pharma Focused",
        statyears: "5+ years",
        text: 'Purple Flame Co.',
        rate: '1681',
        shname: 'PFC',
        colors: 0xFF3366FF,
        imageUrl: LocalPNGImages.story2),
    ListItem(
        lotsize: "1",
        stattxt: "Stat",
        statres: "E-Mobility",
        statres2: "100k",
        toprated: "Crypto",
        statyears: "5+ years",
        text: 'Dino Pharma',
        rate: '541',
        shname: 'DRL',
        colors: 0xFF3366FF,
        imageUrl: LocalPNGImages.story3),
    ListItem(
        lotsize: "1",
        stattxt: "Stat",
        statres: "E-Mobility",
        statres2: "100k",
        toprated: "Top Rated",
        statyears: "5+ years",
        text: 'API Holdings',
        rate: '321',
        shname: 'API',
        colors: 0xFF3366FF,
        imageUrl: LocalPNGImages.story1),
    ListItem(
        lotsize: "1",
        stattxt: "Stat",
        statres: "E-Mobility",
        statres2: "100k",
        toprated: "Top Rated",
        statyears: "5+ years",
        text: 'Abservetech',
        rate: '150',
        shname: 'ABS',
        colors: 0xFF3366FF,
        imageUrl: LocalPNGImages.story2),
    ListItem(
        lotsize: "1",
        stattxt: "Stat",
        statres: "E-Mobility",
        statres2: "100k",
        toprated: "Top Rated",
        statyears: "5+ years",
        text: 'Yellow Studios',
        rate: '132',
        shname: 'YLW',
        colors: 0xFF3366FF,
        imageUrl: LocalPNGImages.story3),
    ListItem(
        lotsize: "1",
        stattxt: "Stat",
        statres: "E-Mobility",
        statres2: "100k",
        toprated: "Top Rated",
        statyears: "5+ years",
        text: 'Purple Flame Co.',
        rate: '1681',
        shname: 'PFC',
        colors: 0xFF3366FF,
        imageUrl: LocalPNGImages.story1),
    ListItem(
        lotsize: "1",
        stattxt: "Stat",
        statres: "E-Mobility",
        statres2: "100k",
        toprated: "Top Rated",
        statyears: "5+ years",
        text: 'Dino Pharma',
        rate: '541',
        shname: 'DRL',
        colors: 0xFF3366FF,
        imageUrl: LocalPNGImages.story2),
    ListItem(
        lotsize: "1",
        stattxt: "Stat",
        statres: "E-Mobility",
        statres2: "100k",
        toprated: "Top Rated",
        statyears: "5+ years",
        text: 'Dino PharmaTEST',
        rate: '541',
        shname: 'DRL',
        colors: 0xFF3366FF,
        imageUrl: LocalPNGImages.story3),

  ];
  final List<TabData> tabs = [];
  late final int Tablength;
  final List<BlogCategory>? Blogcatlist =[];
  final List<String> blogCat = [];

  @override
  void initState() {
    super.initState();
    _latestTipsViewModel = Provider.of<LatestTipsViewModel>(context, listen: false);
    _blogsViewModel = Provider.of<BlogsViewModel>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
   //   _blogsViewModel.blogsapi(onFailureRes: onBlogFailureRes, onSuccessRes: onBlogsSuccessRes);
      _latestTipsViewModel.latesttipsapi(onFailureRes: onFailureRes,);

    });
    if(_blogsViewModel.blogsResponseModel?.category != null){
      Tablength = _blogsViewModel.blogsResponseModel?.category?.length ??0;
      _blogtabController = TabController(length:Tablength, vsync: this);
      addCatList();
    }else{
      print('_blogsViewModel cat length init ${_blogsViewModel.blogsResponseModel?.category?.length}');
    }

  }

  @override
  void dispose() {
    _blogtabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var deviceheight = MediaQuery.of(context).size.height;
    var devicewidth = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Appcolors.white,
        appBar: CustomAppBar(height: 60.0, title: 'Sauda Insights', appbarclr: Appcolors.white),
      body: Container(
        height: deviceheight,
        width: devicewidth,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SizedBox(height: 60),
              // LogoTxtAppbar(logotag: "saudainsgs",title: "Sauda Insights",Isportfolio: false,onPressed: (){}),

            //  SizedBox(height: 40),
              Padding(padding: const EdgeInsets.only(left: 18.0,right: 18),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildtxtandRichtxt("We help you Trade better with","LATEST"," TIPS"),
                  Consumer<LatestTipsViewModel>(
                      builder: (context, latesttips, child) {
                     return latesttips.state == ViewState.busy?Loader():
                     LatestTips(
                         latesttips:latesttips.latesttipsModel?.insights ?? [],
                         items: items,
                         onPressed: (selecteditems){
                        print('latest tips list clicked ${selecteditems}');
                  //    context.router.push( Exploredetail(selectedstocks: selecteditems,));
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>TipStatus( latesttips:latesttips.latesttipsModel?.insights ?? [],)));
                      });}),

                    buildtxtandRichtxt("Learn whats trending with","OUR"," BLOGS"),
                  Consumer<BlogsViewModel>(
                      builder: (context, blogsviewmodel, child) {
                       return blogsviewmodel.state == ViewState.busy?Loader():Container(
                        height: 600,
                        width: devicewidth,
                        child: Column(
                          children: [
                            Expanded(
                              child: TabWithBorder(
                                DynamicTabs: tabs,
                                tabTitles: blogCat,
                                tabContents: [],
                                tabController: _blogtabController,
                              ),
                            ),
                          ],
                        ),
                    );}
                     ),
                  ],
                ),
              ),
              ],
          ),
        ),
      )

    );
  }

  Column buildtxtandRichtxt(String titile,String span1,String span2) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(titile),
        buildRichText(
          TextSpan(text: span1),
          TextSpan(text: span2, style: CustomTextStyle.txt24Rlblk), CustomTextStyle.txt24Rbblack,
        ),
      ],
    );
  }



  onFailureRes(String p1) {
  }


  void addCatList() {
    if(_blogsViewModel.blogsResponseModel?.category != null){
      Blogcatlist?.addAll(_blogsViewModel.blogsResponseModel?.category ?? []);

      for(var i=0; i<Blogcatlist!.length; i++){
        tabs.add(
            TabData(
              title: Blogcatlist?[i].categoryName??"",
              content: Center(child: InsightsTabContent(BlogCatId: Blogcatlist?[i].id??0)),
            ));
        blogCat.add(Blogcatlist?[i].categoryName??"");
      }

   }
  }
}


class InsightsTabContent extends StatefulWidget {

  InsightsTabContent({
    required this.BlogCatId,
});
  final int BlogCatId;

  @override
  State<InsightsTabContent> createState() => _InsightsTabContentState();
}

class _InsightsTabContentState extends State<InsightsTabContent> {
  final List<ListItem> items = [
    ListItem(
        lotsize: "1",
        stattxt: "Stat",
        statres: "E-Mobility",
        statres2: "100k",
        toprated: "Top Performing Stocks",
        text: 'M&C Pharma soaring high with Cancer treatment',
        statyears: "5+ years",
        rate: '132',
        shname: 'YLW',
        colors: 0xFF00FF7F,
        imageUrl:
        'https://cdn.educba.com/academy/wp-content/uploads/2022/01/Joint-Stock-Company.jpg'),
    ListItem(
        lotsize: "1",
        stattxt: "Stat",
        statres: "E-Mobility",
        statres2: "100k",
        toprated: "Pharma Focused",
        statyears: "5+ years",
        text: 'Our experts are predicting a Crypto crash this year',
        rate: '1681',
        shname: 'PFC',
        colors: 0xFFFF1493,
        imageUrl:
        'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80'),
    ListItem(
        lotsize: "1",
        stattxt: "Stat",
        statres: "E-Mobility",
        statres2: "100k",
        toprated: "Crypto",
        statyears: "5+ years",
        text: 'Dino Pharma',
        rate: '541',
        shname: 'DRL',
        colors: 0xFF00FFFF,
        imageUrl:
        'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80'),
    ListItem(
        lotsize: "1",
        stattxt: "Stat",
        statres: "E-Mobility",
        statres2: "100k",
        toprated: "Top Rated",
        statyears: "5+ years",
        text: 'API Holdings',
        rate: '321',
        shname: 'API',
        colors: 0xFFFFA500,
        imageUrl:
        'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80'),
    ListItem(
        lotsize: "1",
        stattxt: "Stat",
        statres: "E-Mobility",
        statres2: "100k",
        toprated: "Top Rated",
        statyears: "5+ years",
        text: 'Abservetech',
        rate: '150',
        shname: 'ABS',
        colors: 0xFF9900CC,
        imageUrl:
        'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80'),
    ListItem(
        lotsize: "1",
        stattxt: "Stat",
        statres: "E-Mobility",
        statres2: "100k",
        toprated: "Top Rated",
        statyears: "5+ years",
        text: 'Yellow Studios',
        rate: '132',
        shname: 'YLW',
        colors: 0xFF00FF00,
        imageUrl:
        'https://cdn.educba.com/academy/wp-content/uploads/2022/01/Joint-Stock-Company.jpg'),
    ListItem(
        lotsize: "1",
        stattxt: "Stat",
        statres: "E-Mobility",
        statres2: "100k",
        toprated: "Top Rated",
        statyears: "5+ years",
        text: 'Purple Flame Co.',
        rate: '1681',
        shname: 'PFC',
        colors: 0xFFFF0000,
        imageUrl:
        'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80'),
    ListItem(
        lotsize: "1",
        stattxt: "Stat",
        statres: "E-Mobility",
        statres2: "100k",
        toprated: "Top Rated",
        statyears: "5+ years",
        text: 'Dino Pharma',
        rate: '541',
        shname: 'DRL',
        colors: 0xFF3366FF,
        imageUrl:
        'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80'),
    ListItem(
        lotsize: "1",
        stattxt: "Stat",
        statres: "E-Mobility",
        statres2: "100k",
        toprated: "Top Performing Stocks",
        text: 'Yellow Studios',
        statyears: "5+ years",
        rate: '132',
        shname: 'YLW',
        colors: 0xFF00FF7F,
        imageUrl:
        'https://cdn.educba.com/academy/wp-content/uploads/2022/01/Joint-Stock-Company.jpg'),
    ListItem(
        lotsize: "1",
        stattxt: "Stat",
        statres: "E-Mobility",
        statres2: "100k",
        toprated: "Pharma Focused",
        statyears: "5+ years",
        text: 'Purple Flame Co.',
        rate: '1681',
        shname: 'PFC',
        colors: 0xFFFF1493,
        imageUrl:
        'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80'),
    ListItem(
        lotsize: "1",
        stattxt: "Stat",
        statres: "E-Mobility",
        statres2: "100k",
        toprated: "Crypto",
        statyears: "5+ years",
        text: 'Dino Pharma',
        rate: '541',
        shname: 'DRL',
        colors: 0xFF00FFFF,
        imageUrl:
        'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80'),
    ListItem(
        lotsize: "1",
        stattxt: "Stat",
        statres: "E-Mobility",
        statres2: "100k",
        toprated: "Top Rated",
        statyears: "5+ years",
        text: 'API Holdings',
        rate: '321',
        shname: 'API',
        colors: 0xFFFFA500,
        imageUrl:
        'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80'),
    ListItem(
        lotsize: "1",
        stattxt: "Stat",
        statres: "E-Mobility",
        statres2: "100k",
        toprated: "Top Rated",
        statyears: "5+ years",
        text: 'Abservetech',
        rate: '150',
        shname: 'ABS',
        colors: 0xFF9900CC,
        imageUrl:
        'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80'),
    ListItem(
        lotsize: "1",
        stattxt: "Stat",
        statres: "E-Mobility",
        statres2: "100k",
        toprated: "Top Rated",
        statyears: "5+ years",
        text: 'Yellow Studios',
        rate: '132',
        shname: 'YLW',
        colors: 0xFF00FF00,
        imageUrl:
        'https://cdn.educba.com/academy/wp-content/uploads/2022/01/Joint-Stock-Company.jpg'),
    ListItem(
        lotsize: "1",
        stattxt: "Stat",
        statres: "E-Mobility",
        statres2: "100k",
        toprated: "Top Rated",
        statyears: "5+ years",
        text: 'Purple Flame Co.',
        rate: '1681',
        shname: 'PFC',
        colors: 0xFFFF0000,
        imageUrl:
        'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80'),
    ListItem(
        lotsize: "1",
        stattxt: "Stat",
        statres: "E-Mobility",
        statres2: "100k",
        toprated: "Top Rated",
        statyears: "5+ years",
        text: 'Dino Pharma',
        rate: '541',
        shname: 'DRL',
        colors: 0xFF3366FF,
        imageUrl:
        'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80'),
    ListItem(
        lotsize: "1",
        stattxt: "Stat",
        statres: "E-Mobility",
        statres2: "100k",
        toprated: "Top Performing Stocks",
        text: 'Yellow Studios',
        statyears: "5+ years",
        rate: '132',
        shname: 'YLW',
        colors: 0xFF00FF7F,
        imageUrl:
        'https://cdn.educba.com/academy/wp-content/uploads/2022/01/Joint-Stock-Company.jpg'),
    ListItem(
        lotsize: "1",
        stattxt: "Stat",
        statres: "E-Mobility",
        statres2: "100k",
        toprated: "Pharma Focused",
        statyears: "5+ years",
        text: 'Purple Flame Co.',
        rate: '1681',
        shname: 'PFC',
        colors: 0xFFFF1493,
        imageUrl:
        'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80'),
    ListItem(
        lotsize: "1",
        stattxt: "Stat",
        statres: "E-Mobility",
        statres2: "100k",
        toprated: "Crypto",
        statyears: "5+ years",
        text: 'Dino Pharma',
        rate: '541',
        shname: 'DRL',
        colors: 0xFF00FFFF,
        imageUrl:
        'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80'),
    ListItem(
        lotsize: "1",
        stattxt: "Stat",
        statres: "E-Mobility",
        statres2: "100k",
        toprated: "Top Rated",
        statyears: "5+ years",
        text: 'API Holdings',
        rate: '321',
        shname: 'API',
        colors: 0xFFFFA500,
        imageUrl:
        'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80'),
    ListItem(
        lotsize: "1",
        stattxt: "Stat",
        statres: "E-Mobility",
        statres2: "100k",
        toprated: "Top Rated",
        statyears: "5+ years",
        text: 'Abservetech',
        rate: '150',
        shname: 'ABS',
        colors: 0xFF9900CC,
        imageUrl:
        'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80'),
    ListItem(
        lotsize: "1",
        stattxt: "Stat",
        statres: "E-Mobility",
        statres2: "100k",
        toprated: "Top Rated",
        statyears: "5+ years",
        text: 'Yellow Studios',
        rate: '132',
        shname: 'YLW',
        colors: 0xFF00FF00,
        imageUrl:
        'https://cdn.educba.com/academy/wp-content/uploads/2022/01/Joint-Stock-Company.jpg'),
    ListItem(
        lotsize: "1",
        stattxt: "Stat",
        statres: "E-Mobility",
        statres2: "100k",
        toprated: "Top Rated",
        statyears: "5+ years",
        text: 'Purple Flame Co.',
        rate: '1681',
        shname: 'PFC',
        colors: 0xFFFF0000,
        imageUrl:
        'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80'),
    ListItem(
        lotsize: "1",
        stattxt: "Stat",
        statres: "E-Mobility",
        statres2: "100k",
        toprated: "Top Rated",
        statyears: "5+ years",
        text: 'Dino Pharma',
        rate: '541',
        shname: 'DRL',
        colors: 0xFF3366FF,
        imageUrl:
        'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80'),
  ];
  late CatBasedBlogsViewModel _catBasedBlogsViewModel;
@override
  void initState() {
  super.initState();
  print('Blog Cat list: ${widget.BlogCatId}');

  _catBasedBlogsViewModel = Provider.of<CatBasedBlogsViewModel>(context, listen: false);
  WidgetsBinding.instance.addPostFrameCallback((_) {
    _catBasedBlogsViewModel.catbasedblogsapi(onFailureRes: onFailureRes, onSuccessRes: onSuccessRes,BlogCatId:widget.BlogCatId);
  });
}
  @override
  Widget build(BuildContext context) {
    var deviceheight = MediaQuery.of(context).size.height;
    var devicewidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer<CatBasedBlogsViewModel>(
          builder: (context, catbasedblg, child) {
       return Padding(
         padding: const EdgeInsets.only(top: 18.0),
         child: Container(
              width: devicewidth,
              child:catbasedblg.state == ViewState.busy ? Loader()
                  :CheckCatlist() ? Align(
                  alignment: Alignment.topCenter,
                  child: Text("No Data Found"))
                  :  ListView.builder(
                  //itemCount: items.length,
                  itemCount: catbasedblg.ctbasedblogsResponseModel?.blogs?.length ?? 0,
                  itemBuilder: (context, index) {
                    var calist = catbasedblg.ctbasedblogsResponseModel?.blogs;
                    return GestureDetector(
                      onTap: (){
                        print('selected blog ${calist?[index].title}');
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> BlogDetail(calist:calist?[index])));
                        },
                      child: InSightListTile(
                        //title: items[index].text,
                        title: calist?[index].title ??"",
                        subtitle: items[index].shname,
                        trailingImage: calist?[index].imageUrl ?? "",
                        imgtag: "",
                      ),
                    );
                  })),
       );},
      ),
    );
  }

  onFailureRes(String p1) {
  }

  onSuccessRes(CatBasedBlogsModel? p1) {
   // print('cat basd blg img ${p1?.blogs?[0].imageUrl}');
  }

  CheckCatlist() {
    if(_catBasedBlogsViewModel.ctbasedblogsResponseModel?.blogs == null || _catBasedBlogsViewModel.ctbasedblogsResponseModel!.blogs!.isEmpty) {
      return true;
    }else {
      return false;
    }

  }
}