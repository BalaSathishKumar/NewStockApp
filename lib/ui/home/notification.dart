import 'package:base_flutter_provider_project/constants/colors.dart';
import 'package:base_flutter_provider_project/data/models/home_model/notificationpagemodel.dart';
import 'package:base_flutter_provider_project/viewModel/notificationpage_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common_widgets/appbar_widgets/common_appbar.dart';
import '../../common_widgets/appbar_widgets/logotxtappbar.dart';
import '../../utils/common_textstyles.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {

  late NotificationPageViewModel _notificationPageViewModel;
  
  @override
  void initState() {
    super.initState();
    _notificationPageViewModel =  Provider.of<NotificationPageViewModel>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {

      _notificationPageViewModel.notificationpageapi(onFailureRes: onFailureRes, onSuccessRes: onSuccessRes);

    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(height: 60.0, title: 'Notifications', appbarclr: Appcolors.white),
      backgroundColor: Appcolors.white,
      body: Consumer<NotificationPageViewModel>(
        builder: (context,notifydatas,child) {
          return Container(
            child: Column(
              children: [
              /*  SizedBox(height: 60),
                LogoTxtAppbar(logotag: "notify",title: "Notifications",Isportfolio: false,onPressed: (){}),
*/
                Expanded(
                  child: CheckNotification(notifydatas.NotifyPageResponseModel?.notifications)  ?Center(child: Text("No Notification")):ListView.builder(
                    //   itemCount: items.length,
                      itemCount: notifydatas.NotifyPageResponseModel?.notifications?.length ?? 0,
                      itemBuilder: (context, index) {
                        var notifydata = notifydatas.NotifyPageResponseModel?.notifications;
                        return Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, right: 8, bottom: 0),
                          child: InkWell(
                            onTap: () {},
                            child: Card(
                              elevation: 8,
                              child: ListTile(

                                title: Text(notifydata?[index].title ?? "", style: CustomTextStyle.txt16Rb,),
                                subtitle: Text(notifydata?[index].message ?? "", maxLines: 3, overflow: TextOverflow.ellipsis, style: CustomTextStyle.txt14Rlblk,)
                              ),
                            )
                          ),
                        );
                      }),
                ),
              ],
            ),
          );
        }
      ),
    );
  }

  onFailureRes(String p1) {
  }

  onSuccessRes(Notificationpagemodel? p1) {
  }

  CheckNotification(List<Notifications>? notifications) {
    if(notifications != null && notifications.isEmpty){
      return true;
    }else{
      return false;
    }
  }
}
