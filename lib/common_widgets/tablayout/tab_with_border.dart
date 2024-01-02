import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';
import 'common_tablayout.dart';

class TabWithBorder extends StatefulWidget {
  final List<String> tabTitles;
  final List<Widget> tabContents;
  final TabController tabController;
  final List<TabData> DynamicTabs;
  TabWithBorder({
    required this.tabTitles,
    required this.tabContents,
    required this.tabController,
    required this.DynamicTabs,
  });

  @override
  State<TabWithBorder> createState() => _TabWithBorderState();
}

class _TabWithBorderState extends State<TabWithBorder> {
  final List<bool> isSelected = []; // Track selected tabs

 List<Widget> buildTabs = [];
  late selectblogprovider _selectblogprovider;

@override
  void initState() {
    super.initState();
    addBool();
    isSelected.fillRange(0, 1, true);
    print('isselected in init ${isSelected[0]}, title: ${widget.tabTitles.length}');
    _selectblogprovider = Provider.of<selectblogprovider>(context, listen: false);
  }

  void _handleTabChange(int index) {

    setState(() {
      widget.tabController.index = index; // Manually set the tab controller's index
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.white,
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 40,
                child: TabBar(
                //  indicatorPadding: EdgeInsets.all(8),
                  indicator: BoxDecoration(
                    border: Border.all(
                        color: Appcolors.splashbgcolor, width: 2.0),
                   // color:_selectblogprovider.selectedindex?Appcolors.splashbgcolor:Colors.transparent,
                    color:Appcolors.splashbgcolor,
                    borderRadius: BorderRadius.circular(10), // Border radius
                  ),
                  controller: widget.tabController,
                  tabs: addTabs(),
                  /*[
                    buildCustomTab(widget.tabTitles[0], 0),
                    buildCustomTab(widget.tabTitles[1], 1),
                    buildCustomTab(widget.tabTitles[2], 2),
                    buildCustomTab(widget.tabTitles[3], 3),
      ],*/
                  onTap: (index) {
                 /*   _selectblogprovider.getCatList(true,isSelected,index);
                       widget.tabController.index = _selectblogprovider.buystock;
                       print('blog tapped ${index}, selected ${_selectblogprovider.buystock} and ${_selectblogprovider.selectedindex}');*/

                    // Provider.of<selectblogprovider>(context, listen: false).getCatList(true,isSelected,index);

                    /*  setState(() {
              isSelected.fillRange(0, isSelected.length, false);
              isSelected[index] = true;
          });*/
                  },

                  indicatorColor: Colors.transparent,
                  isScrollable: true,

                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                controller: widget.tabController,
                children: widget.DynamicTabs.map((tabData) => tabData.content).toList(),//widget.tabContents,
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildTabBarItems() {

    return widget.DynamicTabs.map((TabData) => Container(
      height: 40,
            decoration: BoxDecoration(
              color: Appcolors.splashbgcolor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(TabData.title,style: TextStyle(color: Colors.white),
              ),
            )))
        .toList();
  }

  Widget buildCustomTab(String text, int index) {
    return Consumer<selectblogprovider>(
        builder: (context, selecteddata, child) {
     return GestureDetector(
       onTap: (){
         _handleTabChange(index);
         setState(() {
           isSelected.fillRange(0, isSelected.length, false);
           isSelected[index] = true;
         });
       },
       child: Container(
         height: 40,
         decoration: BoxDecoration(
           color: !isSelected[index] ?Appcolors.tabbarbg:Colors.transparent,
         //  color: !_selectblogprovider.selectedindex ?Colors.transparent:Appcolors.tabbarbg,
         //  color: !selecteddata.selectedindex ?Colors.transparent:Appcolors.tabbarbg,
          // border: Border.all(color: !isSelected[index] ?Appcolors.tabbarbg:Colors.transparent, width: 1),
          // border: Border.all(color: !_selectblogprovider.selectedindex ?Appcolors.tabbarbg:Colors.transparent, width: 1),
           borderRadius: BorderRadius.circular(10),
         ),

         child: Align(
           alignment: Alignment.center,
           child: Padding(
             padding: const EdgeInsets.all(8.0),
             child: Text(
               text,
               style: TextStyle(
               color: !isSelected[index] ? Colors.white : Colors.black, // Change the text color here
                // color: !selecteddata.selectedindex ? Colors.black : Colors.white, // Change the text color here
                 fontWeight: FontWeight.bold,
                 fontSize: 16,
               ),
             ),
           ),
         ),
       ),
     );
        });

  }
  List<Widget> addTabs() {
    buildTabs.clear();
    print('dynamictab length ${widget.DynamicTabs.length}');
    for(int i = 0; i < widget.DynamicTabs.length; i++) {
      buildTabs.add(buildCustomTab(widget.DynamicTabs[i].title, i));
      print('dynamictab length2 ${buildTabs.length}');
    }
    return buildTabs;
  }

  List<bool> addBool() {
  for(int i = 0; i <= widget.DynamicTabs.length; i++) {
    isSelected.add(false);
    print('bool value ${isSelected[i]} and ${isSelected.length}');
    }
  return isSelected;
  }

}

class selectblogprovider with ChangeNotifier {
  int _buystock = 0;
  bool _selectecindex = true;
  int get buystock => _buystock;
  bool get selectedindex => _selectecindex;

  void getCatList(bool pcd, List<bool> isSelected, int index) {
    isSelected.fillRange(0, isSelected.length, false);
    isSelected[index] = true;
    _buystock = index;
    _selectecindex =  isSelected[index];
    notifyListeners();
  }
}


