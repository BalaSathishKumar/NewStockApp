import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../common_widgets/button_widgets/common_button.dart';
import '../../constants/colors.dart';
import '../../constants/constant.dart';
import '../../constants/local_images.dart';
import '../../data/models/DealerModels/PayementPlanModel.dart';
import '../../utils/common_textstyles.dart';
import '../../viewModel/CommonProvider.dart';
import '../../viewModel/paymentPlan_viewmodel.dart';
import '../home/homepage.dart';


class PaymentPlanDetails extends StatefulWidget {
  const PaymentPlanDetails({

    required this.devicewidth,
    required this.deviceheight,
    required this.items,
    required this.onPressed
  });


  final double devicewidth;
  final double deviceheight;
  final List<ListItem> items;
  final Function(Plans?) onPressed;

  @override
  State<PaymentPlanDetails> createState() => _PaymentPlanDetailsState();
}

class _PaymentPlanDetailsState extends State<PaymentPlanDetails> {
  late CommonProvider _commonProvider;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _commonProvider = Provider.of<CommonProvider>(context,listen: false);
      _commonProvider.setIsExpand(false);
    });

  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PaymentPlanViewModel>(
        builder: (context,paymentplans,child) {
          return Container(

              child: ListView.builder(
                //itemCount: widget.items.length,
                  itemCount: paymentplans.PaymentPlanResponseModel?.plans?.length ?? 0,
                  itemBuilder: (context, index) {
                    var paymentpln = paymentplans.PaymentPlanResponseModel?.plans;
                    return Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Container(
                        decoration: BoxDecoration(
                          // color: Appcolors.white,
                          border: Border.all(
                              width: 1, color: Appcolors.txtpurple),

                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: ExpansionTileCard(
                          elevation: 0,
                          onExpansionChanged: (exp) {
                            print('isExpansion ${exp}');
                            _commonProvider.setIsExpand(exp);
                          },
                          borderRadius: BorderRadius.circular(16),
                          shadowColor: Colors.transparent,
                          baseColor: Appcolors.white,
                          title: Container(
                            //  color: Colors.white,
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text("${paymentpln?[index].durationType} Plan" ?? "",
                                      style: CustomTextStyle.txt16Rbtxtpurple,),
                                    Container(
                                      //  color: Colors.white,
                                      height: 50,
                                      width: widget.devicewidth / 2,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                              "Good choice if you want to try our app before you commit fulltime.",
                                              style: CustomTextStyle
                                                  .txt12Rrtxtgry,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2),
                                        ],
                                      ),
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
                                //  color: Colors.white,
                                child: Column(
                                  children: [
                                    Text('${Constant.rupeeSymbol} ${paymentpln?[index].amount ?? ""}',
                                      style: CustomTextStyle.txt16Rbtxtpurple,),
                                  //  SizedBox(height: 4),
                                    Text(setDurationText(paymentpln?[index].durationType ?? ""), style: CustomTextStyle.txt12Rrtxtgry),
                                    commonprovider.IsExpand ? SvgPicture.asset(
                                        LocalSVGImages.drop2,
                                        height: 15, width: 15) : SvgPicture.asset(
                                        LocalSVGImages.drop1,
                                        height: 15, width: 15),
                                  ],
                                ),
                              );
                            },

                          ),
                          children: [
                            PlanDetails(paymentpln?[index].description ?? ""),
                            /* PlanDetails("Get priority support"),
                          PlanDetails("Increased Visibility amongs members"),
                          PlanDetails("Premium Subscriber badge"),*/
                            ButtonBar(
                              alignment: MainAxisAlignment.spaceAround,
                              buttonHeight: 52.0,
                              buttonMinWidth: 90.0,
                              children: <Widget>[
                                Container(
                                  height: 50,
                                  width: widget.devicewidth,
                                  child: CustomMaterialButton(
                                      text: 'Get the ${paymentpln?[index].durationType} plan',
                                      onPressed: (){
                                        if(paymentpln?[index] != null){
                                          widget.onPressed(paymentpln?[index]);
                                        }
                                      }
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  })


          );
        }
    );
  }

  Padding PlanDetails(String plantxt) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        height: 40,
        width: MediaQuery.of(context).size.width,
        //color: Colors.red,
        child: Row(
          children: [
            Icon(Icons.star,color: Colors.amberAccent,size: 20,),
            SizedBox(width: 10),
            Container(
                height: 25,
                width: MediaQuery.of(context).size.width/2+70,
                child: Text(plantxt,style: CustomTextStyle.txt16Rr,maxLines: 1,overflow: TextOverflow.ellipsis,))
          ],
        ),
      ),
    );
  }

  String setDurationText(String durationtxt) {

    if(durationtxt == "daily"){
      return  'daily';
    }else if(durationtxt == "weekly") {
      return  'per week';
    }else if(durationtxt == "monthly") {
      return 'per month';
    }else if (durationtxt == "yearly") {
      return 'per year';
    }else {
      return  '';
    }


  }
}