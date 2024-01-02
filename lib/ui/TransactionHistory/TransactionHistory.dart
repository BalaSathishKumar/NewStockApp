import 'package:base_flutter_provider_project/constants/colors.dart';
import 'package:base_flutter_provider_project/data/models/TransactionModel/PurchaseRequestModel.dart';
import 'package:base_flutter_provider_project/viewModel/MyTransView_Model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../common_widgets/appbar_widgets/WhiteAppbar.dart';
import '../../common_widgets/my_trans_widget/PurchaseRequested.dart';
import '../../common_widgets/my_trans_widget/SellRequested.dart';
import '../../common_widgets/my_trans_widget/Sold.dart';
import '../../common_widgets/my_trans_widget/Purchased.dart';
import '../../common_widgets/search_widgets/common_search.dart';
import '../../common_widgets/tablayout/common_tablayout.dart';
import '../../constants/local_images.dart';

class TransactionHistory extends StatefulWidget {
  const TransactionHistory({Key? key}) : super(key: key);

  @override
  State<TransactionHistory> createState() => _TransactionHistoryState();
}

class _TransactionHistoryState extends State<TransactionHistory> with SingleTickerProviderStateMixin{
  late TabController _tabController;
  late MyTransViewModel _myTransViewModel;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _myTransViewModel = Provider.of<MyTransViewModel>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      //_myTransViewModel.MyTransapi(onFailureRes: onFailureRes, onSuccessRes: onSuccessRes);
    });
  }
  @override
  Widget build(BuildContext context) {
    var deviceheight = MediaQuery.of(context).size.height;
    var devicewidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Appcolors.white,
      appBar:WhiteAppbarwithIcon(
        backgroundColor: Colors.white,
        title: "My Transactions",
        centerTitle: false,
        actions: [
    /*      Padding(
            padding: const EdgeInsets.only(right: 18.0),
            child: Hero(
              tag: "transfilter",
              child: Row(
                children: [
                  SvgPicture.asset(LocalSVGImages.filter, height: 20, width: 15),
                ],
              ),
            ),
          ),*/
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Container(
                height: deviceheight,
                width: devicewidth,
                color: Colors.white,
                child: CommonTabLayout(
                  IsExplore: false,
                  DynamicTabs: [],
                  tabTitles: ['Purchase Requested','Purchased','Sell Request','Sold'],
                  tabContents: [
                    PurchaseRequested(),
                    Purchased(),
                    SellRequested(),
                    SoldPage(),
                  ],
                  tabController: _tabController,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  onFailureRes(String p1) {
  }

  onSuccessRes(PurchaseRequestModel? p1) {
  }


}




