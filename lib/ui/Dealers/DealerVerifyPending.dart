import 'package:base_flutter_provider_project/constants/colors.dart';
import 'package:base_flutter_provider_project/ui/home/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../common_widgets/button_widgets/common_button.dart';
import '../../constants/local_images.dart';
import '../../utils/common_functions.dart';
import '../../utils/common_textstyles.dart';
import '../../viewModel/profile_view_model.dart';


class DealerVerifyPending extends StatefulWidget {
  final VoidCallback onPressed;

  const DealerVerifyPending({super.key, required this.onPressed});

  @override
  State<DealerVerifyPending> createState() => _DealerVerifyPendingState();
}

class _DealerVerifyPendingState extends State<DealerVerifyPending> {
  @override
  Widget build(BuildContext context) {
    var deviceheight = MediaQuery.of(context).size.height;
    var devicewidth = MediaQuery.of(context).size.width;
    return  Consumer<ProfileViewModel>(
        builder: (context,proviledata,child) {
     return Scaffold(
        backgroundColor: Appcolors.white,
        appBar: AppBar(
          backgroundColor: Appcolors.white,
          automaticallyImplyLeading: false,
        ),
        body: Container(
          height: deviceheight,
          width: devicewidth,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: deviceheight/2+200,
                     width: devicewidth,
                     // color: Colors.red,
                      child: Padding(
                        padding: const EdgeInsets.only(top:0.0,left: 20,right: 20),
                        child: SvgPicture.asset(LocalSVGImages.pvfy3,
                            fit: BoxFit.fill,)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:0.0,left: 20,right: 20),
                      child: Container(
                        height: deviceheight/2+200,
                        width: devicewidth,
                       // color: Colors.red.shade50,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  height: 100,
                                  width: devicewidth,
                                   // color: Colors.red,
                                  child:Text(proviledata.profileResponseModel?.user?.reviewMessage ?? "",textAlign: TextAlign.center,)
                              ),
                            ),

                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                height: 80,
                                width: MediaQuery.of(context).size.width,
                             //   color: Colors.red,
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 18.0,right: 18,bottom: 18),
                                    child: CustomMaterialButton(
                                      text: 'Okay',
                                      onPressed: widget.onPressed,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ),
                    ),

                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top:10.0,left: 30,right: 30),
                  child: Container(
                    height: 100,
                    color: Colors.white,
                    child: Column(
                      children: [
                        buildRichText2(
                         textspanlist(),
                          CustomTextStyle.txt16Rllisttilegrey,
                        ),

                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );}
    );
  }

  List<TextSpan> textspanlist() {
    List<TextSpan> spans = [
      TextSpan(text: "Most reviews take less than few hours.Helpline at"),
      TextSpan(text: " +91 7708143626", style: CustomTextStyle.txt14Rblisttilegrey),
      TextSpan(text: " or"),
      TextSpan(text: " hello@craftpixels.in ", style: CustomTextStyle.txt14Rblisttilegrey),
    ];
    return spans;
  }
}
