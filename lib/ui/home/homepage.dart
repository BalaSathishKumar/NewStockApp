import 'package:base_flutter_provider_project/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../common_widgets/AppDrawer/AppDrawer.dart';
import '../../common_widgets/button_widgets/button_with_icon.dart';
import '../../constants/constant.dart';
import '../../constants/local_images.dart';
import '../AboutUs/AboutAsPage.dart';
import '../InSights/Insightspage.dart';
import '../PortFolio/portfoliopage.dart';
import '../explore/explorepage.dart';
import 'StockHome.dart';

class SaudaHomePage extends StatefulWidget {
  final int? bottomindx;
  const SaudaHomePage({Key? key,this.bottomindx}) : super(key: key);

  @override
  State<SaudaHomePage> createState() => _SaudaHomePageState();
}

class _SaudaHomePageState extends State<SaudaHomePage> {

  int _currentIndexBottomNav = 0;


  void _onTabSelected(int index) {
    Provider.of<portfolioBoolProvider>(context, listen: false).getmyBoolValue(false);
    setState(() {
      _currentIndexBottomNav = index;
    });
  }
  List<Widget> _pages = [
    StockHome(),
    PortFolioPage(),
    Explorepage(),
    InsightsPage(),
    AboutUsPage(),
  ];


  @override
  void initState() {
    super.initState();
    if(widget.bottomindx == null){
      _currentIndexBottomNav = 0;
    }else{
      _currentIndexBottomNav = widget.bottomindx!;
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Appcolors.white,
    /*   drawer: AppDrawer(
         onItemSelected: (index) {
           // Handle the item selection here based on the index.
           // For example, you can use a switch statement or if-else conditions.
           print('Selected item index: $index');
         },
         drawerItems: drawerItems,
       ),*/
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10,
        showUnselectedLabels: true,
        unselectedItemColor: Appcolors.txtlitegrey,
        backgroundColor: Appcolors.txtlitegrey,
        selectedItemColor: Appcolors.black,
        currentIndex: _currentIndexBottomNav,
        onTap: _onTabSelected,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(LocalSVGImages.in_activehome,
                height: 25, width: 16),
            activeIcon: SvgPicture.asset(LocalSVGImages.ic_activehome,
                height: 25, width: 16),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(LocalSVGImages.in_inactiveportfolio,
                height: 25, width: 16),

            activeIcon: SvgPicture.asset(LocalSVGImages.activeportfolio,
                height: 25, width: 16),
            label: 'Portfolio',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(LocalSVGImages.in_activeexplore,
                height: 25, width: 16),
            activeIcon:SvgPicture.asset(LocalSVGImages.activeexplore,
                height: 25, width: 16),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(LocalSVGImages.in_activeinsights,
                height: 25, width: 16),
            activeIcon: SvgPicture.asset(LocalSVGImages.activeinsights,
                height: 25, width: 16),
            label: 'Insights',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(LocalSVGImages.in_activemore,
                height: 25, width: 16),
            activeIcon: SvgPicture.asset(LocalSVGImages.activemore,
                height: 25, width: 16),
            label: 'More',
          ),
        ],
      ),
      body:_pages[_currentIndexBottomNav]

    );
  }

}



class UnListed extends StatelessWidget {
  const UnListed({
    super.key,
    required this.devicewidth,
    required this.onPressed
  });

  final double devicewidth;
  final  VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: devicewidth,
      child: Stack(
        children: [
          Container(

            width: devicewidth,
            child: Hero(
                tag: "unlistedbg",
                child:SvgPicture.asset(LocalSVGImages.unlistbg, fit: BoxFit.fill,),
                /*Image.asset(
                  LocalPNGImages.unlistbg,
                )*/

            ),
          ),
          Container(
            height: 157,
            width: devicewidth,
       //   color: Colors.red,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 18,left: 8,right: 8,bottom: 8),
                  child: CardDiscriptions(),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: RoundedContainer(
                    onPressed: onPressed,
                    text: textChange(),
                    iconData: Icons.arrow_forward,
                    backgroundColor: Appcolors.txtlitegreen2,
                    textColor: Appcolors.black,
                    borderColor: Appcolors.black,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Container CardDiscriptions() {

    if(Constant.userRoll=='Brokers'){
      return Container(
        child: Text("List your stocks and shares for thousands of our users on the Sauda platform. ",
            textAlign: TextAlign.center),
      );
    }else if(Constant.userRoll=='Users' || Constant.userRoll=='Guest'|| Constant.userRoll=='Advisors'){
      return Container(
        child: Text("This is the unlisted stocks promotion section,  please write an attractive content about unlisted stocks here.",
            textAlign: TextAlign.center),
      );
    }else{
      return Container(child: Text(""));
    }


  }

  textChange() {
    if(Constant.userRoll=='Brokers'){
   return 'Create a Listing';
    }else if(Constant.userRoll=='Users' || Constant.userRoll=='Guest'|| Constant.userRoll=='Advisors'){
    return  'Trade Unlisted';
    }else{
      return "";
    }
  }
}

class ListItem {
  final String text;
  final String stattxt;
  final String statres;
  final String statres2;
  final String toprated;
  final String statyears;
  final String imageUrl;
  final String shname;
  final String rate;
  final int colors;
  final String lotsize;

  ListItem({
    required this.text,
    required this.stattxt,
    required this.statres,
    required this.statres2,
    required this.toprated,
    required this.statyears,
    required this.imageUrl,
    required this.shname,
    required this.rate,
    required this.colors,
    required this.lotsize,
  });
}


