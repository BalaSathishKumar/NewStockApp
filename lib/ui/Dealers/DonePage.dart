import 'package:base_flutter_provider_project/constants/colors.dart';
import 'package:base_flutter_provider_project/ui/home/homepage.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../common_widgets/button_widgets/common_button.dart';
import '../../constants/constant.dart';
import '../../constants/local_images.dart';
import '../../utils/CustomBorderClipper.dart';
import '../../utils/common_functions.dart';
import '../../utils/common_textstyles.dart';
import '../../viewModel/CreateList_ViewModel.dart';
import '../../viewModel/buy_Sell_viewmodel.dart';
import '../../viewModel/paymentPlan_viewmodel.dart';


class DonePage extends StatefulWidget {
  String purchaseType;
  bool? isCrreateList;
  bool? isPaymentPage;
  DonePage({
    required this.purchaseType,
    this.isCrreateList,
    this.isPaymentPage,
});

  @override
  State<DonePage> createState() => _DonePageState();
}

class _DonePageState extends State<DonePage> {


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var deviceheight = MediaQuery.of(context).size.height;
    var devicewidth = MediaQuery.of(context).size.width;
    return Consumer<BuySellViewModel>(
      builder: (context,buysellVM,child){
     return Consumer<CreateListViewModel>(
       builder: (context,createListVM,child){
       return Consumer<PaymentPlanViewModel>(
         builder: (context,paymentVM,child){
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 367,
                      width: 282,
                      // color: Colors.red,
                      child: Padding(
                          padding: const EdgeInsets.only(top:20.0,left: 20,right: 20),
                          child: SvgPicture.asset(LocalSVGImages.done,
                            fit: BoxFit.fill,)
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 60,vertical: 10),
                      child: Container(
                        height: 85,
                        width: devicewidth,
                        color: Colors.white,
                        child: Column(
                          children: [
                          Text(showDoneContent(widget.isCrreateList,buysellVM.buysellResponseModel?.message ?? "",createListVM.createLResponseModel?.message ?? "",widget.isPaymentPage,paymentVM.verifyPaymentModel?.message ?? ""),
                          textAlign:TextAlign.center,
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          style: CustomTextStyle.txt16Rr,)
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        height: 50,
                        width: devicewidth,
                        child: CustomMaterialButton(
                          text: 'Okay!',
                          onPressed: () {
                            Route route = MaterialPageRoute(builder: (context) => SaudaHomePage());
                            Navigator.pushReplacement(context, route);
                          //  Navigator.push(context, MaterialPageRoute(builder: (context)=> SaudaHomePage()));
                            print('Button pressed!');
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 50,
                      width: 300,
                  //    color: Colors.yellow,
                      child: ClipRect(
                        clipper: CustomClipperExample(),
                       child: DottedBorder(
                  dashPattern: [4, 4],
                  strokeWidth: 2,

                  color: Appcolors.splashbgcolor,
                  strokeCap: StrokeCap.square,
                  borderType: BorderType.RRect,
                  radius: Radius.circular(0),
                  child:Center(
                      child: Container(
                          height: 30,
                    //    color: Colors.red,
                        child:  Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            buildRichText2(
                              textspanlist(),
                              CustomTextStyle.txt16Rllisttilegrey,
                            ),
                          ],
                        ),
                      ),
                  )),
                   ),
                    )
                  ],
                ),
              ),
            ),
          );}
       );}
     );}
    );
  }

  List<TextSpan> textspanlist() {
    List<TextSpan> spans = [
      TextSpan(text: "Looking to sell in bulk?"),
      TextSpan(text: " Contact us", style: CustomTextStyle.txt14Rblisttilegrey),
    ];
    return spans;
  }

  showDoneContent(bool? isCreateList, String buysellmessage, String createlistmessage, bool? isPaymentPage, String paymentmessgae) {
    print('showDoneContent ${isCreateList}');
    if(isCreateList != null && isCreateList){
   return createlistmessage;
 }else{
      if(isPaymentPage != null && isPaymentPage){
        return paymentmessgae;
      }else{
        return buysellmessage;
      }
    }
  }
}
