import 'package:base_flutter_provider_project/constants/local_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/colors.dart';


class CommonTabLayout extends StatelessWidget {
  final List<String> tabTitles;
  final List<Widget> tabContents;
  final List<TabData> DynamicTabs;
  final TabController tabController;
  final bool IsExplore;
  CommonTabLayout({
    required this.tabTitles,
    required this.tabContents,
    required this.tabController,
    required this.DynamicTabs,
    required this.IsExplore,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.white,

      body: Container(

        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(width:0.5, color: Appcolors.divdgrey),

                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: TabBar(
                    controller: tabController,
                    tabs: _buildTabBarItems(),
                    indicatorWeight: 3,
                    indicatorColor: Appcolors.txtlitegreen2,
                    isScrollable: true,
                  ),
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
               // children: tabContents,
                children: IsExplore?DynamicTabs.map((tabData) => tabData.content).toList():tabContents,
              ),
            ),

          ],
        ),
      ),

    );
  }

/*  List<Widget> _buildTabBarItems() {
    return tabTitles.map((title) => Tab(text: title,)).toList();
  }*/
  List<Widget> _buildTabBarItems() {
    return IsExplore?
    DynamicTabs.map((TabData) => TabData.title.isEmpty?Tab(icon: SvgPicture.asset(LocalSVGImages.exstar, height: 25, width: 25)):Tab(text: TabData.title)).toList() :
    
    tabTitles.map((title) => Tab(text: title,)).toList();
  }
}

class TabData {
  final String title;
  final Widget content;
  TabData({required this.title, required this.content});
}