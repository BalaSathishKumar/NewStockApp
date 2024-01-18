import 'package:base_flutter_provider_project/utils/common_textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';
import '../../constants/constant.dart';
import '../../constants/local_images.dart';
import '../../viewModel/base_view_model/base_view_model.dart';
import '../../viewModel/profile_view_model.dart';

class FullScreenDrawer extends StatefulWidget {
  final Function(int,String) onItemSelected;
  final VoidCallback onPressChat;
  final VoidCallback onPressNotify;
  final VoidCallback onPressLogout;
  final List<DrawerItem> drawerItems;

  FullScreenDrawer({
    required this.onItemSelected,
    required this.drawerItems,
    required this.onPressChat,
    required this.onPressNotify,
    required this.onPressLogout,
  });

  @override
  State<FullScreenDrawer> createState() => _FullScreenDrawerState();
}

class _FullScreenDrawerState extends State<FullScreenDrawer> {
  late ProfileViewModel _profileViewModel;
@override
  void initState() {
  super.initState();
  _profileViewModel = Provider.of<ProfileViewModel>(context, listen: false);
  }
  @override
  Widget build(BuildContext context) {
    var deviceheight = MediaQuery.of(context).size.height;
    var devicewidth = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.white,
      height: deviceheight,
      //  height: MediaQuery.of(context).size.height * 0.85, // Adjust the height as needed.
      child: Padding(
        padding: const EdgeInsets.only(left: 18.0,right: 18),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child:  Consumer<ProfileViewModel>(
           builder: (context, profilvm, child) {
             return Container(
             //  height: 200,
             //    color: Colors.red,
               child: Stack(
                 children: [
                   Align(
                     alignment: Alignment.bottomCenter,
                     child: Container(
                       height: 150,
                       width: devicewidth,
                       decoration: BoxDecoration(
                           color: Appcolors.splashbgcolor2.withOpacity(0.4),
                           borderRadius: BorderRadius.circular(16)
                       ),

                       child: Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Column(
                           mainAxisAlignment: MainAxisAlignment.end,
                           children: [
                            SizedBox(height: 20,),
                             Text(profilvm.profileResponseModel?.user?.name ?? "",
                                 style: CustomTextStyle.txt16Rmtxtblk),
                             Text("${profilvm.profileResponseModel?.user?.roleName ?? ""} Account",
                                 style: CustomTextStyle.txt14Rmtxtpurp),
                             Text(profilvm.profileResponseModel?.user?.statusText ?? "",
                                 style: CustomTextStyle.txt14Rmtxtblk),
                             SizedBox(height: 10,)
                           ],
                         ),
                       ),

                     ),
                   ),
                   Align(
                     alignment: Alignment.center,
                     child: Container(
                       height: 150,
                       width: devicewidth,
                     //     color: Colors.yellow,
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment:  CrossAxisAlignment.start,
                         children: [
                           Expanded(
                             flex: 2,
                             child: Container(
                               //   color: Colors.green,
                                 child: Column(
                                   crossAxisAlignment: CrossAxisAlignment.end,
                                   children: [
                                     Container(
                                       height: 120,
                                       width: 120,
                                       child: CircleAvatar(
                                         radius: 30,
                                         backgroundImage: NetworkImage(profilvm.profileResponseModel?.user?.photoUrl ?? "")),
                                     ),
                                   ],
                                 )

                               /* ClipOval(
                                        child: SizedBox.fromSize(
                                          size: Size.fromRadius(50), // Image radius
                                          child: Image.network(profilvm.profileResponseModel?.user?.photoUrl ?? "")

                                          */ /*Image.asset(
                                            LocalPNGImages.samplepropic,
                                            fit: BoxFit.cover,
                                          ),*/ /*
                                        ),
                                      );*/


                             ),
                           ),
                           Expanded(
                             flex: 1,
                           child: Padding(
                             padding: const EdgeInsets.only(bottom: 8.0),
                             child: Container(
                               height: 120,
                               width: 120,
                           //    color: Colors.orange.shade100,
                               child: Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   GestureDetector(
                                     onTap: widget.onPressChat,
                                     child: Container(
                                       //  color: Colors.green.shade100,
                                         width: 30,
                                         height: 30,
                                         child:  Column(
                                           mainAxisAlignment: MainAxisAlignment.end,
                                           children: [
                                             // Text("sdsdfsdf")
                                            // Icon(Icons.chat),
                                             SvgPicture.asset(LocalSVGImages.chaticon,
                                                 height: 20, width: 20),
                                           ],
                                         )),
                                   ),
                               GestureDetector(
                                   onTap: widget.onPressNotify,
                                     child: Container(
                                       //  color: Colors.green.shade100,
                                         width: 30,
                                         height: 30,
                                         child:  Column(
                                           mainAxisAlignment: MainAxisAlignment.end,
                                           children: [
                                             // Text("sdsdfsdf")
                                             Icon(Icons.notifications),
                                           ],
                                         )),
                                   ),
                               GestureDetector(
                                   onTap: widget.onPressLogout,
                                     child: Container(
                                     //    color: Colors.green.shade100,
                                         width: 30,
                                         height: 30,
                                         child:  Column(
                                           mainAxisAlignment: MainAxisAlignment.end,
                                           children: [
                                             // Text("sdsdfsdf")
                                             Icon(Icons.logout),
                                           ],
                                         )),
                                   ),
                                 ],
                               ),
                             ),
                           ),
                         )

                         ],
                       ),
                     ),
                   ),
                 ],
               ),
             );
           }
              ),
            ),
            Expanded(
              flex: 5,
              child: ListView.builder(
              //  physics: NeverScrollableScrollPhysics(),
                itemCount:  widget.drawerItems.length,
                itemBuilder: (context, index) {

                  chkRoll( widget.drawerItems[index]);

                  return   widget.drawerItems[index].title != "" && widget.drawerItems[index].iconAsset != ""?

                  ListTile(
                    leading: SvgPicture.asset(widget.drawerItems[index].iconAsset,
                        height: 20, width: 20),
                    title: Text(widget.drawerItems[index].title,style: CustomTextStyle.txt16Rmtxtblk,),
                    onTap: () {
                      widget.onItemSelected(index,widget.drawerItems[index].title);
                    /*  print('Selected item index: $index');
                      Navigator.pop(context); // Close the drawer after selection.*/
                    },
                  ):SizedBox.shrink();
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                width: devicewidth,
                height: 50,
                color: Colors.white,
                child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.close, color: Appcolors.black, size: 25,)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void chkRoll(DrawerItem drawerItem) {

    if(drawerItem.title == "Subscriptions Details"&& Constant.userRoll != 'Brokers' || Constant.userRoll != 'Advisors' ){
      print('drawerItem.title::aa: ${drawerItem.title}');
   // widget.drawerItems.remove(drawerItem);
  }
  }


}
class DrawerItem {
  final String iconAsset;
  final String title;

  DrawerItem({required this.iconAsset, required this.title});
}