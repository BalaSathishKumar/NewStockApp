import 'package:base_flutter_provider_project/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../common_widgets/appbar_widgets/common_appbar.dart';
import '../../common_widgets/portfolio_widgets/AddEntrybottomSheet.dart';
import '../../common_widgets/portfolio_widgets/portfoliiotab1.dart';
import '../../common_widgets/portfolio_widgets/portfoliotab2.dart';
import '../../common_widgets/tablayout/common_tablayout.dart';
import '../../constants/constant.dart';


class PortFolioPage extends StatefulWidget {
  const   PortFolioPage({Key? key}) : super(key: key);

  @override
  State<PortFolioPage> createState() => _PortFolioPageState();
}

class _PortFolioPageState extends State<PortFolioPage>  with SingleTickerProviderStateMixin{
  late TabController _tabController;


  Color _backgroundColor = Colors.blue;
  bool isPortfolio = false;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_updateBackgroundColor);
  }
  void _updateBackgroundColor() {
  //  setState(() {
      // Change the background color based on the selected tab index
      switch (_tabController.index) {
        case 0:
          _backgroundColor = Colors.blue;
          print("tab1");

          Provider.of<portfolioBoolProvider>(context, listen: false).getmyBoolValue(false);
          break;
        case 1:
          _backgroundColor = Colors.green;
        //  Provider.of<portfolioBoolProvider>(context, listen: false).myBoolValue = !myBoolValue;
          Provider.of<portfolioBoolProvider>(context, listen: false).getmyBoolValue(true);

          print("tab2");
          break;
          default:
          _backgroundColor = Colors.blue;
          print("tab4");
      }
   // });
  }
  @override
  Widget build(BuildContext context) {
    bool myBoolValue = Provider.of<portfolioBoolProvider>(context).myBoolValue;
    var deviceheight = MediaQuery.of(context).size.height;
    var devicewidth = MediaQuery.of(context).size.width;
    return   Consumer<portfolioBoolProvider>(
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: CustomAppBar(height: 60.0,
                title: 'My Portfolio',
                appbarclr: Appcolors.white,
                Isportfolio: true,
                onPressed: () {
                  if (Constant.userRoll != "Guest") {
                    showCustomBottomSheet(context);
                  }
                },
            IsAddAsset: viewModel.myBoolValue,
            ),
            backgroundColor: Appcolors.white,
            body: Container(
              height: deviceheight,
              width: devicewidth,
              //  color: Colors.red,
              child: Column(
                children: [
                  /*    Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: Container(
                  height: 100,
                   //color: Colors.yellow,
                  child:  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    */ /*  Consumer<portfolioBoolProvider>(
                          builder: (context, viewModel, child) {
                            return LogoTxtAppbar(logotag: "portfolio",title: "My Portfolio",Isportfolio: viewModel.myBoolValue,onPressed: (){
                              if(Constant.userRoll != "Guest") {
                                showCustomBottomSheet(context);
                              }
                            },onMenuPressed: (){
                              if(Constant.userRoll != "Guest"){
                                openFullScreenDrawer(context,deviceheight,(Constant.drawerItems2));
                              }
                            },);
                          }),*/ /*
                    ],
                  ),
                ),
              ),
*/
                  Expanded(
                    child: Container(
                      height: deviceheight,
                      width: devicewidth,
                      color: Colors.white,
                      child: CommonTabLayout(
                        IsExplore: false,
                        DynamicTabs: [],
                        tabTitles: [
                          'Invested',
                          '3rd Party Traded',
                        ],
                        tabContents: [
                          PortfolioTab1(),
                          PortFolioTab2(),
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
    );
  }

  void showCustomBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16.0),
        ),
      ),
      builder: (BuildContext context) {
        return Container(
          child: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: AddEntryBottomSheet(),
          ),
        );
      },
    );
  }



  onFailureRes(String p1) {
  }


}


class portfolioBoolProvider extends ChangeNotifier {
  bool _myBool = false;

  bool get myBoolValue => _myBool;

  void getmyBoolValue(bool newValue) {
    _myBool = newValue;
    notifyListeners();
  }
}
//bool _FilterPriceSelectF = false;

/*
bool get FilterPriceSelectF => _FilterPriceSelectF;

void getFilterPriceSelectF(bool pcd) {
  _FilterPriceSelectF = pcd;
  notifyListeners();
}*/
