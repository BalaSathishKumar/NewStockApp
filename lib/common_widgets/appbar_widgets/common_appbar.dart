import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../constants/constant.dart';
import '../../constants/local_images.dart';
import '../../ui/home/StockHome.dart';
import '../../viewModel/profession_view_model.dart';
import '../../viewModel/profile_view_model.dart';
import '../AppDrawer/FullScreenDrawer.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final dynamic height;
  final Color appbarclr;
  final bool? HideMenu;
  final bool? Isportfolio;
  final bool? IsAddAsset;
  final VoidCallback? onPressed;
  const CustomAppBar({Key? key, required this.title, required this.height, required this.appbarclr,this.HideMenu,this.Isportfolio,this.onPressed,this.IsAddAsset}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    var deviceheight = MediaQuery.of(context).size.height;
    var devicewidth = MediaQuery.of(context).size.width;
    return Consumer<ProfileViewModel>(
      builder: (context, profileVM, child){

        return Padding(
      //  padding: const EdgeInsets.only(top: 38.0),
        padding: const EdgeInsets.only(top: 0),
        child: AppBar(
          centerTitle: true,
          title: Container(
            height: 50,
            //  color: Colors.red.shade100,
              width: MediaQuery.of(context).size.width,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,style: TextStyle(fontFamily: "Roboto",fontSize: 18),),
                ],
              )),
          backgroundColor: appbarclr,
          actions: [
            HideMenuIcon()? SizedBox.shrink():
            Padding(
            padding: const EdgeInsets.only(right: 18.0),
            child: GestureDetector(
                onTap: (){
                  if(Constant.userRoll != "Guest"){
                    Provider.of<ProfessionViewModel>(context, listen: false).setUserProfessionExFilter(null);
                    Provider.of<ProfessionViewModel>(context, listen: false).setUserStateExFilter(null);
                    Provider.of<ProfessionViewModel>(context, listen: false).setUserCityExFilter(null);
                    openFullScreenDrawer(context,deviceheight,(Constant.drawerItems2));
                  }
                },
                child: Icon(Icons.menu)),
          ),

            ChkFolio(Isportfolio) &&  chkAddAsst(IsAddAsset)?  Padding(
              padding: const EdgeInsets.only(right: 18.0),
              child: InkWell(
                onTap: onPressed,
                child: SvgPicture.asset(
                    LocalSVGImages.addnewntry,
                    height: 25,
                    width: 16),
              ),
            ) : SizedBox.shrink(),

          ],
        ),
      );
      }
    );
  }

  HideMenuIcon() {
    if(HideMenu == null){
      return false;
    }else{
      return true;
    }
  }

  ChkFolio(bool? isportfolio) {
    if(isportfolio != null && isportfolio){
      return true;
    }else{
      return false;
    }
  }

  bool chkAddAsst(bool? isAddAsset) {
    if(isAddAsset != null && isAddAsset){
      return true;
    }else{
      return false;
    }
  }


}