import 'package:flutter/material.dart';

import '../../common_widgets/appbar_widgets/common_appbar.dart';
import '../../common_widgets/tablayout/common_tablayout.dart';
import '../../constants/colors.dart';
import '../../constants/constant.dart';
import '../kyc/KYC_Advisor.dart';
import '../kyc/KYC_Dealer.dart';
import '../kyc/NewKycUser.dart';
import 'RegisterPage.dart';


class RegiterAndKyc extends StatefulWidget {
  const RegiterAndKyc({super.key});

  @override
  State<RegiterAndKyc> createState() => _RegiterAndKycState();
}

class _RegiterAndKycState extends State<RegiterAndKyc>  with SingleTickerProviderStateMixin{

  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    var deviceheight = MediaQuery.of(context).size.height;
    var devicewidth = MediaQuery.of(context).size.width;

    return  Scaffold(
      backgroundColor: Appcolors.white,
      appBar: CustomAppBar(height: 60.0, title: '', appbarclr: Appcolors.white),
      body:    Container(
        height: deviceheight,
        width: devicewidth,
        child: CommonTabLayout(
          IsExplore: false,
          DynamicTabs: [],
          tabTitles: [
            'Profile',
            'KYC',
          ],
          tabContents: [
            RegisterPage(IsProfileEdit: true,IsRegandKy: true ),
            showKyc()
          ],
          tabController: _tabController,
        ),
      ),
    );
  }

  showKyc() {
    if (Constant.userRoll == "Users") {
     return NewKycUser(IsKycUpdate: true,IsRegandKy: true);
    } else if (Constant.userRoll == "Brokers") {
      return KycDealer(IsKycUpdate: true,IsRegandKy: true,);
    } else if (Constant.userRoll == "Advisors") {
      return KycAdvisor(IsKycUpdate: true,IsRegandKy: true,);
    } else {}

  }
}
