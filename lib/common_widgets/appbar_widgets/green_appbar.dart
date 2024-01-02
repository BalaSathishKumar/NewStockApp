import 'package:base_flutter_provider_project/constants/colors.dart';
import 'package:base_flutter_provider_project/utils/common_textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/local_images.dart';

class GreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String icn1tag;
  final String icn1;
  final String icn2;
  final String icn2tag;
  final bool isDealerChat;
  final bool hidemore;
  final dynamic height;
  final VoidCallback onPressBack;
  final VoidCallback onPressStar;
  final VoidCallback onPressSend;
  final Color appbarclr;
  final bool? IsAdvisorHelp;
  final String? isfrom;

  const GreenAppBar(
      {Key? key,
      required this.title,
      required this.icn1tag,
      required this.icn1,
      required this.icn2,
      required this.icn2tag,
      required this.isDealerChat,
      required this.height,
      required this.onPressBack,
      required this.onPressStar,
      required this.onPressSend,
      required this.appbarclr,
     required this.hidemore,
      this.IsAdvisorHelp,
      this.isfrom})
      : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
  //  print('is hidemore ${hidemore}');
    return AppBar(
      automaticallyImplyLeading: false,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Appcolors.black, // Border color
              width: 1.0, // Border width
              style: BorderStyle.solid, // Border style
            ),
          ),
        ),
        child: isfrom != 'Chat with a Pro' && isfrom != "Chat with Admin"?
        Column(
          mainAxisAlignment: isDealerChat?  MainAxisAlignment.end : MainAxisAlignment.end,
          children: [
            isDealerChat?
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: onPressBack,
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 16.0, left: 10),
                            child: Icon(Icons.arrow_back),
                          )),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20.0, left: 10),
                        child: Text(title, style: CustomTextStyle.txt18Rbblk,maxLines: 1,overflow: TextOverflow.ellipsis,),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: InkWell(
                        onTap: onPressStar,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 20.0, left: 10),
                          child: Icon(Icons.more_horiz,color: Appcolors.black,)
                        /*  Hero(
                            tag: "chatsettings",
                            child: SvgPicture.asset(LocalSVGImages.question,
                                height: 25, width: 16),
                          ),*/
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ) :
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: onPressBack,
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 16.0, left: 10),
                          child: Icon(Icons.arrow_back),
                        )),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20.0, left: 10),
                      child: Text(title,maxLines: 2, style: CustomTextStyle.txt18Rbblk),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Visibility(
                  visible: SetFilterVisibility(IsAdvisorHelp),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: InkWell(
                        onTap: onPressStar,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 20.0, left: 10),
                          child: Hero(
                            tag: icn1tag,
                            child: SvgPicture.asset(icn1,
                                height: 25, width: 25),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: InkWell(
                      onTap: onPressSend,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: Hero(
                          tag: icn2tag,
                          child: SvgPicture.asset(icn2,
                              height: 25, width: 25),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

          ],
        ) :
        Column(
          mainAxisAlignment:MainAxisAlignment.end ,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: onPressBack,
                    child: Center(child: Icon(Icons.arrow_back)),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    height: height,
                    // color: Colors.red,
                      child: Row(
                    children: [
                      Text(title, style: CustomTextStyle.txt18Rbblk,maxLines: 1,overflow: TextOverflow.ellipsis,),
                    ],
                  )),
                ),
                Expanded(
                  flex: 1,
                  child: Visibility(
                    visible: hidemore,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: InkWell(
                        onTap: onPressStar,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 20.0, left: 10),
                          child: Icon(Icons.more_horiz)
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        )
      ),
      backgroundColor: appbarclr,
    );
  }

  SetFilterVisibility(bool? isAdvisorHelp) {

    if(isAdvisorHelp != null && isAdvisorHelp) {
      return false;
    }else{
      return true;
    }

  }
}
