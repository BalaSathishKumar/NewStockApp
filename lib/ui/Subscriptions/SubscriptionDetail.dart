import 'package:base_flutter_provider_project/data/models/DealerModels/SubscriptionDetailModel.dart';
import 'package:base_flutter_provider_project/utils/common_textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../common_widgets/appbar_widgets/common_appbar.dart';
import '../../constants/colors.dart';
import '../../constants/constant.dart';
import '../../constants/local_images.dart';
import '../../viewModel/paymentPlan_viewmodel.dart';
import 'ActivePlan.dart';
import 'PlanHistory.dart';


class SubscriptionDetail extends StatefulWidget {
  const SubscriptionDetail({super.key});

  @override
  State<SubscriptionDetail> createState() => _SubscriptionDetailState();
}

class _SubscriptionDetailState extends State<SubscriptionDetail> {
  late PaymentPlanViewModel _subscriptionViewModel;

  @override
  void initState() {
    super.initState();
    _subscriptionViewModel =  Provider.of<PaymentPlanViewModel>(context, listen: false);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _subscriptionViewModel.SubscriptionDetailapi(onFailureRes: onFailureRes, onSuccessRes: onSuccessRes);
    });
  }

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
     backgroundColor: Appcolors.white,
        appBar: CustomAppBar(height: 60.0, title: 'Subscription Details', appbarclr: Appcolors.white),
      body: Consumer<PaymentPlanViewModel>(
        builder: (context,subsdetailVM,child) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ActivePlan(subscriptions: subsdetailVM.subscriptionDetailResponseModel?.subscriptions),
                ),
                PlanHistory(history: subsdetailVM.subscriptionDetailResponseModel?.history ?? [])
              ],
            ),
          );
        }
      ),
    );
  }

  onFailureRes(String p1) {
  }

  onSuccessRes(SubscriptionDetailModel? p1) {
  }
}




