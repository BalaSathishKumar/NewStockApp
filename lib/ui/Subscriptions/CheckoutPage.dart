import 'package:base_flutter_provider_project/common_widgets/button_widgets/common_button.dart';
import 'package:base_flutter_provider_project/constants/colors.dart';
import 'package:base_flutter_provider_project/data/models/DealerModels/PayementPlanModel.dart';
import 'package:base_flutter_provider_project/data/models/StatusandMessageModel.dart';
import 'package:base_flutter_provider_project/viewModel/base_view_model/base_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common_widgets/loading_widgets/loader.dart';
import '../../constants/constant.dart';
import '../../data/models/DealerModels/CheckoutResModel.dart';
import '../../utils/common_functions.dart';
import '../../utils/common_textstyles.dart';
import '../../viewModel/paymentPlan_viewmodel.dart';

class CheckOutPage extends StatefulWidget {
  final Plans? selectedPlans;
  final VoidCallback onPressed;
   CheckOutPage({required this.selectedPlans,required this.onPressed});

  @override
  State<CheckOutPage> createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  Plans? get selectedPlans => widget.selectedPlans;
  late final TextEditingController controller;
  late PaymentPlanViewModel _applycouponViewModel;
  @override
  void initState() {
    super.initState();
  controller = TextEditingController();
    _applycouponViewModel =  Provider.of<PaymentPlanViewModel>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    var deviceheight =MediaQuery.of(context).size.height;
    var devicewidth =    MediaQuery.of(context).size.width;
    return Consumer<PaymentPlanViewModel>(
        builder: (context,couponVM,child){
        var chkCouponStatus =couponVM.CheckoutresponseModel?.status;
      return Scaffold(
        appBar: AppBar(
            centerTitle: false,
            title: Text("Checkout"),backgroundColor: Appcolors.white),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  // height: 100,
                  width: devicewidth,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Appcolors.txtpurple),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: PlanCard(selectedPlans: selectedPlans),
                ),
                SizedBox(height: 12),
                Container(
                  width: devicewidth,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Appcolors.txtpurple),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                          Text("Apply Coupon (if any)"),
                        Row(
                          children: [
                          Expanded(
                            flex:2,
                            child: ApplyCouponCard(controller),
                          ),
                            Expanded(
                              flex:1,
                              child: Container(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: CustomMaterialButton(text: "Apply", onPressed: (){
                                      Map<String, dynamic> couponparam = {
                                        "plan_id": selectedPlans?.id,
                                        "total": selectedPlans?.amount,
                                        "coupon_code":controller.text  //"SUSFLAT2"
                                      };
                                      _applycouponViewModel.ApplyCouponApi(onFailureRes: onFailureRes, onSuccessRes: onSuccessRes, verifyparam: couponparam);

                                    }),
                                  )),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 12),
                AppliedCard(devicewidth,"Discount Applied"," (remove)","${couponVM.CheckoutresponseModel?.data?.discountAmount ?? "0"}"),
                AppliedCard(devicewidth,"Total","",couponVM.CheckoutresponseModel?.data?.total.toString() ?? "${ selectedPlans?.amount.toString()}"),
                SizedBox(height: 24),
                couponVM.state == ViewState.busy? Loader():   Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 50,
                    width: devicewidth,
                    child: CustomMaterialButton(text: "Proceed to payment", onPressed: widget.onPressed),
                  ),
                )
              ],
            ),
          ),
        ),
      );}
    );
  }

  Container AppliedCard(double devicewidth,String txt1,String txt2,String price) {
    return Container(
            width: devicewidth,
         //   color: Colors.red.shade50,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: buildRichText(
                            TextSpan(text: txt1),
                            TextSpan(text: txt2,
                                style: CustomTextStyle.txt12Rlred),
                            CustomTextStyle.txt12Rlblk,
                          ),
                        ),
                      ),
                      Expanded(
                          flex: 1,
                          child:Align(
                              alignment: Alignment.centerRight,
                              child: Text("${Constant.rupeeSymbol} $price",style: txt1 == "Total" ?CustomTextStyle.txt16Rmtxtblk: CustomTextStyle.txt16Rmtxtred,)))
                    ],
                  ),

                ],
              ),
            ),
          );
  }

  TextField ApplyCouponCard(TextEditingController controller, ) {
    return TextField(

                    controller: controller,
                    keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          hintText: "Enter coupon code",
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Appcolors.splashbgcolor, width: 1.0),
                          )
                      ),
                  );
  }

  onFailureRes(String p1) {
  }

  onSuccessRes(CheckoutResponseModel? p1) {
    var checkstatus = p1?.status;
    if( checkstatus != null && !checkstatus){
      showToast("Coupon Not Exists");
    }else{
      showToast("Coupon Applied!");
    }
  }
}

class PlanCard extends StatelessWidget {
  const PlanCard({
    super.key,
    required this.selectedPlans,
  });

  final Plans? selectedPlans;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${selectedPlans?.durationType ?? ""} Plan",style: CustomTextStyle.txt14Rrtxtblktxtpurple,),
                      SizedBox(height: 10,),
                      Text("Good choice if you want to try our app before you commit fulltime.",style: CustomTextStyle.txt12Rrlitegrey,maxLines: 2,),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Text("${Constant.rupeeSymbol} ${selectedPlans?.amount.toString() ?? ""}",style: CustomTextStyle.txt14Rrtxtblktxtpurple,),
                      SizedBox(height: 10,),
                      Text("${selectedPlans?.durationType ?? ""}",style: CustomTextStyle.txt12Rrlitegrey,maxLines: 2,),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
