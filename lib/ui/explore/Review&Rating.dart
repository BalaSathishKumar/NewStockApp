import 'package:base_flutter_provider_project/common_widgets/alert_widgets/dialog_textfield.dart';
import 'package:base_flutter_provider_project/data/models/StatusandMessageModel.dart';
import 'package:base_flutter_provider_project/utils/common_textstyles.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';
import '../../constants/local_images.dart';
import '../../data/models/Explore_model/ExploreDetailModel.dart';
import '../../utils/CustomBorderClipper.dart';
import '../../utils/common_functions.dart';
import '../../viewModel/AdvisorReview_viewmodel.dart';
import '../../viewModel/explore_detail_view_model.dart';
import '../home/homepage.dart';
import '../../common_widgets/appbar_widgets/common_appbar.dart';


class ReviewandRatings extends StatefulWidget {

 // final ListItem selectedstocks;
 // ReviewandRatings({
   // required this.selectedstocks
//});


  @override
  State<ReviewandRatings> createState() => _ReviewandRatingsState();
}

class _ReviewandRatingsState extends State<ReviewandRatings> {
 // ListItem get _selectedstocks => widget.selectedstocks;
  late final _ratingController;
  late double _rating;
  late AdvisorReviewViewModel _advisorReviewViewModel;
  double _userRating = 3.0;
  int _ratingBarMode = 1;
  double _initialRating = 2.0;
  bool _isVertical = false;
  IconData? _selectedIcon;
  @override
  void initState() {
    super.initState();
    _advisorReviewViewModel = Provider.of<AdvisorReviewViewModel>(context,listen: false);
    _ratingController = TextEditingController(text: '3.0');
    _rating = _initialRating;
  }

  @override
  Widget build(BuildContext context) {

    var deviceheight = MediaQuery.of(context).size.height;
    var devicewidth = MediaQuery.of(context).size.width;
    final List<ListItem> items = [
      ListItem(
          lotsize: "1",
          stattxt: "Stat",
          statres: "E-Mobility",
          statres2: "100k",
          toprated: "Top Rated",
          text: 'Yellow Studios',
          statyears: "5+ years",
          rate: '132',
          shname: 'YLW',
          colors: 2,
          imageUrl: LocalPNGImages.cp1),
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
          colors: 2,
          imageUrl: LocalPNGImages.cp2),
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
          colors: 2,
          imageUrl: LocalPNGImages.cp3),
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
          colors: 2,
          imageUrl: LocalPNGImages.cp4),
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
          colors: 5,
          imageUrl: LocalPNGImages.cp5),

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
          colors: 5,
          imageUrl: LocalPNGImages.cp1),
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
          colors: 6,
          imageUrl: LocalPNGImages.cp2),
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
          colors: 6,
          imageUrl: LocalPNGImages.cp3),
    ];
    return Consumer<ExploreDetailViewModel>(
        builder: (context, expDetaildata, child) {
          print('saudatxt ${  expDetaildata.exploredetailModel?.stocks?.saudaRatingText ?? ""}');
      return Scaffold(
            backgroundColor: Appcolors.white,
            appBar: CustomAppBar(
                height: 80.0,
                title: expDetaildata.exploredetailModel?.stocks?.name ?? "",
                appbarclr: Appcolors.white),
            body: Container(
                height: deviceheight,
                width: devicewidth,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                          child: ClipRect(
                            clipper: TopBorderClipper(10.0),
                            child: DottedBorder(
                              dashPattern: [8, 4],
                              strokeWidth: 1,
                              color: Appcolors.kyctxtgrey,
                              strokeCap: StrokeCap.square,
                              borderType: BorderType.RRect,
                              radius: Radius.circular(0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                      flex: 1,
                                      child: UserRating("User Rating",expDetaildata.exploredetailModel?.stocks?.userRating ?? "")),
                                  Expanded(
                                      flex: 1,
                                      child: UserRating("Sauda Rating",expDetaildata.exploredetailModel?.stocks?.saudaRating ?? "")),
                                ],
                              ),
                            ),)),
                      SizedBox(height: 20),
                      YourReviews(devicewidth),
                      expDetaildata.exploredetailModel?.stocks?.ratings == null || expDetaildata.exploredetailModel!.stocks!.ratings!.isEmpty?Container(): LatestReviews(devicewidth: devicewidth, items: items, ratings:expDetaildata.exploredetailModel?.stocks?.ratings),
                      SizedBox(height: 20),

                      expDetaildata.exploredetailModel?.stocks?.saudaRatingText == null || expDetaildata.exploredetailModel!.stocks!.saudaRatingText == ""?Container():  Container(
                        height: 150,
                        //    color: Colors.red.shade50,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 18.0, right: 18, top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: Text("Sauda Guru’s Says",
                                      style: CustomTextStyle.txt16Rb,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1)),
                              Expanded(
                                  flex: 3,
                                  child: HtmlWidget(
                                    ''' ${ expDetaildata.exploredetailModel?.stocks?.saudaRatingText ?? ""}''',
                                    onErrorBuilder: (context, element, error) => Text('$element error: $error'),
                                    onLoadingBuilder: (context, element, loadingProgress) => CircularProgressIndicator(),

                                    // this callback will be triggered when user taps a link
                                    /*  onTapUrl: (url) => print('tapped $url'),*/
                                    renderMode: RenderMode.column,
                                    textStyle: CustomTextStyle.txt16Rb,
                                  ),

                                 /* Text(
                                    expDetaildata.exploredetailModel?.stocks?.saudaRatingText ?? "",
                                    style: CustomTextStyle.txt16Rb,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 3,)*/

                              ),
                          /*    Expanded(
                                  flex: 2,
                                  child: Text(
                                      "The overall market size is growing which will benefit the company.",
                                      style: CustomTextStyle.txt16Rb,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2)),*/
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )),
          );
        }
    );
  }

  Container YourReviews(double devicewidth) {
    return Container(
                height: 160,
               // color: Colors.red,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16,right: 16,top: 10),
                      child: Text("Your review matters",style: CustomTextStyle.txt16Rb,),
                    ),
                    SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.only(left: 16,right: 16),
                      child: Text("Rating & reviews help others like you to  make informed decisions.",style: CustomTextStyle.txt12Rlquickstatsgrey,),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 80,
                      width: devicewidth,
                   //  color: Colors.red,
                      child:  ClipRect(
                          clipper: TopBorderClipper(2.0),
                          child: DottedBorder(
                     dashPattern: [8, 4],
                     strokeWidth: 1,
                  color: Appcolors.kyctxtgrey,
                     strokeCap: StrokeCap.square,
                    borderType: BorderType.RRect,
                radius: Radius.circular(0),
                   child:Padding(
                     padding: const EdgeInsets.all(18.0),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            _ratingBar(_ratingBarMode),
                          ],
                        ),
                   ),))
                    )

                  ],
                ),
              );
  }

  Container UserRating(String heading, String rating) {
    return Container(
                  height: 35,
      //color: heading == "User Rating"?Colors.red:Colors.green,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Text(heading,style: CustomTextStyle.txt14gpquickstatsgrey,),
                    SizedBox(width: 8),
                    Text(rating,style: CustomTextStyle.txt16Rrblk),
                    Icon(Icons.star,color: Colors.yellow,size: 15,)
                    ],
                  ),
                );
  }

  _ratingBar(int ratingBarMode) {
    return   Consumer<ExploreDetailViewModel>(
      builder:(context, expDetaildata, child) {
        return RatingBar.builder(
          initialRating: _initialRating,
          minRating: 1,
          direction: _isVertical ? Axis.vertical : Axis.horizontal,
          allowHalfRating: false,
          unratedColor: Colors.amber.withAlpha(50),
          itemCount: 5,
          itemSize: 35.0,
          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
          itemBuilder: (context, _) =>
              SvgPicture.asset(LocalSVGImages.rating1,
                  height: 15, width: 15),

/*          Icon(
          _selectedIcon ?? Icons.star,
          color: Colors.amber,
        ),*/
          onRatingUpdate: (rating) {
            setState(() {
              _rating = rating;
            });
            Map<String, dynamic> advisorrevwparams = {
              "stock_id": expDetaildata.exploredetailModel?.stocks?.id.toString() ?? "",
              "ratings": "${_rating}",
              "review": "",
            };

            _advisorReviewViewModel.advisorreviewapi(onFailureRes: onFailureRes,
                advisorrevwparams: advisorrevwparams,
                onSuccessRes: onSuccessRes);
          },
          updateOnDrag: true,
        );
      }
    );
  }

  onFailureRes(String p1) {
  }

  onSuccessRes(StatusandMessageModel? p1) {
    showToast("Thanks for rating!");
  }
}

class LatestReviews extends StatelessWidget {
  const LatestReviews({
    super.key,
    required this.devicewidth,
    required this.ratings,
    required this.items,
  });

  final double devicewidth;
  final List<AdvisorReviews>? ratings;
  final List<ListItem> items;

  @override
  Widget build(BuildContext context) {
    final crossAxisCount = 2;
    final aspectRatio = (MediaQuery.of(context).size.width /
        crossAxisCount /
        (MediaQuery.of(context).size.height / crossAxisCount));
    return Container(
     // height: 300,
      width: devicewidth,
    //    color: Colors.green.shade50,
      child: ClipRect(
        clipper: TopBorderClipper(2.0),
    child: DottedBorder(
    dashPattern: [8, 4],
    strokeWidth: 1,
    color: Appcolors.kyctxtgrey,
    strokeCap: StrokeCap.square,
    borderType: BorderType.RRect,
    radius: Radius.circular(0),
    child:Padding(
      padding: const EdgeInsets.only(bottom: 18.0),
      child: GridView.builder(
        shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: ratings?.length ?? 0,
          itemBuilder: (context, index){
            if(ratings !=null){
              return ItemTile(ratings?[index]);
            }
          },
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3,

          ),
        ),
    )))
    );
  }
}

class ItemTile extends StatelessWidget {
//  final ListItem itemNo;
  final AdvisorReviews? itemNo;

  const ItemTile(
      this.itemNo,
      );

  @override
  Widget build(BuildContext context) {
  //  final Color color = Colors.primaries[itemNo % Colors.primaries.length];
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
      //  tileColor: Color(itemNo.colors).withOpacity(0.3),
        onTap: () {},
        leading: Container(
          height: 50,
          width: 50,
          //width: devicewidth,
          //    color: Colors.orange,
          child: Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child:
              /*Image.asset( itemNo.imageUrl,
                  width: 40,
                  height: 40,
                  fit: BoxFit.fill),*/

              itemNo?.user?.photoUrl == null? PlaceholderImage():Image.network(
                   itemNo?.user?.photoUrl ?? "",
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.fill,
                                  ),
            ),
          ),
        ),
        title: Container(
        //  color: Colors.red,
          child: Text(
            '${itemNo?.userName ?? ""}',style: CustomTextStyle.txt14Rmtxtblk ,maxLines: 1,
            overflow: TextOverflow.ellipsis,
            key: Key('text_$itemNo'),
          ),
        ),
        subtitle: Container(
          height: 35,
          //color: heading == "User Rating"?Colors.red:Colors.green,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(itemNo?.ratings.toString() ?? "",style: CustomTextStyle.txt14Rmtxtblk,),
              Icon(Icons.star,color: Colors.yellow,size: 15,)
            ],
          ),
        )
      ),
    );
  }
}
