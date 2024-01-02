import 'package:base_flutter_provider_project/common_widgets/button_widgets/common_button.dart';
import 'package:base_flutter_provider_project/data/models/Explore_model/ExploreModel.dart';
import 'package:base_flutter_provider_project/data/models/StatusandMessageModel.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../common_widgets/Explore_widgets/ExploreDetail_Topwidget.dart';
import '../../common_widgets/appbar_widgets/common_appbar.dart';
import '../../constants/colors.dart';
import '../../constants/local_images.dart';
import '../../utils/CustomBorderClipper.dart';
import '../../utils/common_functions.dart';
import '../../utils/common_textstyles.dart';
import '../../viewModel/AdvisorReview_viewmodel.dart';


class AdvisorReviewPage extends StatefulWidget {
  final Stocks? selectedstocks;
AdvisorReviewPage({
  required this.selectedstocks,
});

  @override
  State<AdvisorReviewPage> createState() => _AdvisorReviewPageState();
}

class _AdvisorReviewPageState extends State<AdvisorReviewPage> {

  double _initialRating = 2.0;
  bool _isVertical = false;
  late double _rating;
  late final _ratingController;
  late AdvisorReviewViewModel _advisorReviewViewModel;
TextEditingController thoughtscontroller = TextEditingController();
String finalthoughts = "";
  @override
  void initState() {
    super.initState();
    _advisorReviewViewModel = Provider.of<AdvisorReviewViewModel>(context,listen: false);
    print('selected stock id:: ${widget.selectedstocks?.id.toString()}');
    _ratingController = TextEditingController(text: '3.0');
    _rating = _initialRating;
  }

  @override
  Widget build(BuildContext context) {
    var deviceheight = MediaQuery.of(context).size.height;
    var devicewidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Appcolors.white,
      appBar: CustomAppBar(height: 60.0, title: 'Write Expert Opinion', appbarclr: Appcolors.white),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRect(
                  clipper: TopBorderClipper(2.0),
                  child: DottedBorder(
                      dashPattern: [8, 4],
                      strokeWidth: 1,
                      color: Appcolors.kyctxtgrey,
                      strokeCap: StrokeCap.square,
                      borderType: BorderType.RRect,
                      radius: Radius.circular(0),
                      child: ExploreDetailTopDetails(selectedstocks: widget.selectedstocks,isAdvisorReview: true),

                  )),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: buildRichText(
                  TextSpan(text: "OVERALL",style: CustomTextStyle.txt24Rbblack),
                  TextSpan(text: "RATING", ), CustomTextStyle.txt24Rlblk,
                ),
              ),
              Container(
                  height: 80,
                  width: devicewidth,
                  //  color: Colors.red,
                  child:Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _ratingBar(),
                      ],
                    ),
                  ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: buildRichText(
                  TextSpan(text: "FINAL",style: CustomTextStyle.txt24Rbblack),
                  TextSpan(text: "THOUGHTS", ), CustomTextStyle.txt24Rlblk,
                ),
              ),
              CommentTextField(txtcontroller: thoughtscontroller,onChanged: (value){
                finalthoughts = value;
              }),

              Padding(
                padding:
                const EdgeInsets.only(top: 8.0, left: 24, right: 24,bottom: 10),
                child: Container(
                  height: 50,
                  width: devicewidth,
                  child:CustomMaterialButton(text: "Submit Review", onPressed: (){
                    print('stock id : ${widget.selectedstocks?.id.toString()}, rating :: ${_rating}, finalthoughts ${finalthoughts}');

                    Map<String,dynamic> advisorrevwparams = {
                      "stock_id":"${widget.selectedstocks?.id.toString()}",
                      "ratings":"${_rating}",
                      "review":"${finalthoughts}",
                    };

                    _advisorReviewViewModel.advisorreviewapi(onFailureRes: onFailureRes, advisorrevwparams: advisorrevwparams,onSuccessRes: onSuccessRes);
                        })
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  _ratingBar() {
    return  RatingBar.builder(
      initialRating: _initialRating,
      minRating: 1,
      direction: _isVertical ? Axis.vertical : Axis.horizontal,
      allowHalfRating: true,
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
        print('user selected rating :: ${_rating}');
      },
      updateOnDrag: true,
    );
  }

  onFailureRes(String p1) {
  }
  onSuccessRes(StatusandMessageModel? p1) {
    showToast("Review Submitted successfully!");
    thoughtscontroller.clear();
    Navigator.pop(context);
  }
}
class CommentTextField extends StatelessWidget {
 final TextEditingController txtcontroller;
 final ValueChanged<String> onChanged;
  CommentTextField({
    required this.txtcontroller,
    required this.onChanged,
});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: TextField(
        controller: txtcontroller,
        maxLines: 15, // Allow unlimited lines of text
        keyboardType: TextInputType.multiline,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: '',
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}