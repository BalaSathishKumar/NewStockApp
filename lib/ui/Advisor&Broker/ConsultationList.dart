import 'package:base_flutter_provider_project/data/models/AdvisorModels/ConsultationListModel.dart';
import 'package:base_flutter_provider_project/viewModel/Consultation_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common_widgets/appbar_widgets/common_appbar.dart';
import '../../common_widgets/appbar_widgets/logotxtappbar.dart';
import '../../common_widgets/my_trans_widget/PurchaseRequested.dart';
import '../../common_widgets/my_trans_widget/Purchased.dart';
import '../../constants/colors.dart';
import '../../constants/constant.dart';
import '../../utils/common_functions.dart';
import '../../utils/common_textstyles.dart';
import '../ChatPage/ChatRoomPage.dart';

class ConsultationList extends StatefulWidget {
  const ConsultationList({super.key});

  @override
  State<ConsultationList> createState() => _ConsultationListState();
}

class _ConsultationListState extends State<ConsultationList> {
  late ConsultationViewModel _consultationViewModel;

  @override
  void initState() {
    super.initState();
    _consultationViewModel =  Provider.of<ConsultationViewModel>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {

      _consultationViewModel.consultlistapi(onFailureRes: onFailureRes, onSuccessRes: onSuccessRes);

    });
  }
  @override
  Widget build(BuildContext context) {
    var deviceheight = MediaQuery.of(context).size.height;
    var devicewidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Appcolors.white,
      appBar: CustomAppBar(height: 60.0, title: 'Consultations', appbarclr: Appcolors.white),
      body: Consumer<ConsultationViewModel>(
          builder: (context,consultlist,child) {
            print('consult list length ${consultlist.ConsultationListResponseModel?.consultations?.length}');
        return Container(
              child: Column(
                children: [
                 /* SizedBox(height: 60),
                  LogoTxtAppbar(logotag: "consult",title: "Consultations",Isportfolio: false,onPressed: (){}),*/

                  Expanded(
                    child:   consultlist.ConsultationListResponseModel?.consultations != null && consultlist.ConsultationListResponseModel!.consultations!.isEmpty?
                    Container(
                        //color: Colors.red,
                        child: Center(child: Text("No Consultations"))) : ListView.builder(
                      //   itemCount: items.length,
                        itemCount: consultlist.ConsultationListResponseModel?.consultations?.length ?? 0,
                        itemBuilder: (context, index) {
                          List<Consultations>? consultdata = consultlist.ConsultationListResponseModel?.consultations;
                          print('consultation list ${consultdata?.length}');
                      return
                        Padding(
                              padding: const EdgeInsets.only(left: 18.0, right: 18, bottom: 7,top: 8),
                              child: Container(
                                //  height: 300,
                                  decoration: BoxDecoration(color: Appcolors.splashbgcolor2.withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(15.0)),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 18.0, right: 18, top: 18),
                                    child: Column(
                                      children: [
                                        Container(
                                          //height: 100,
                                          // color: Colors.red,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                  flex: 1,
                                                  child: buildNamewithHeading(
                                                      devicewidth,
                                                      Constant.userRoll == "Advisors"?"User Name":"Advisor Name",
                                                      SetName(consultdata?[index]),
                                                      //Constant.userRoll == "Advisors"? consultdata?[index].advisor?.name  : ,
                                                      CustomTextStyle.txt12Rrtxtgry2,
                                                      CustomTextStyle.txt16Rmtxtblk,
                                                      Colors.transparent,null)),
                                              Expanded(
                                                  flex: 1,
                                                  child: buildNamewithHeading(
                                                      devicewidth,
                                                      "Status",
                                                      consultdata?[index].statusTxt ?? "", CustomTextStyle.txt12Rrtxtsoldtxtred, CustomTextStyle.txt16Rmtxtsoldtxtred,
                                                      Colors.transparent,null)),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          child: Row(
                                            children: [
                                              Expanded(
                                                  flex: 1,
                                                  child: buildNamewithHeading(
                                                      devicewidth,
                                                      "Category",
                                                      consultdata?[index].category?.categoryName ?? "",
                                                      CustomTextStyle.txt12Rrtxtltegreen,
                                                      CustomTextStyle.txt16Rmtxtltegreen,
                                                      Colors.transparent,null)),
                                              Expanded(
                                                flex: 1,
                                                child:    buildNamewithHeading(
                                                    devicewidth,
                                                    "Stock",
                                                    consultdata?[index].stock?.name ?? "",
                                                    CustomTextStyle.txt12Rrtxtgry2,
                                                    CustomTextStyle.txt16Rmtxtblk,
                                                    Colors.transparent,null),),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                child: buildNamewithHeading(
                                                    devicewidth,
                                                    "Request Date",
                                                  formatDate( consultdata?[index].createdAt ?? ""),
                                                    CustomTextStyle.txt12Rrtxtgry2,
                                                    CustomTextStyle .txt16Rmtxtblk,
                                                    Colors.transparent,
                                                    "sfsf"),
                                              ),
                                            ),
                                            Expanded(
                                                flex: 1,
                                                child:
                                                ShowChat(consultdata?[index].status)
                                                    ?
                                              GestureDetector(
                                                onTap: (){
                                                  Constant.userRoll == "Advisors"?
                                                  Navigator.push(context, MaterialPageRoute(builder: (context) => ChatRoomPage(chatuserID: consultdata?[index].userId ??0,username: consultdata?[index].user?.name??"",IsAdminChat: false,)))
                                                  :Navigator.push(context, MaterialPageRoute(builder: (context) => ChatRoomPage(chatuserID: consultdata?[index].advisorId ??0,username: consultdata?[index].advisor?.name ?? "",IsAdminChat: false,)));
                                                },
                                                child: Container(
                                                    height: 80,
                                                    // color: Colors.red.shade100,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 24),
                                                          child: Icon(Icons.chat, size: 20,),
                                                        ),
                                                        Text( Constant.userRoll == "Advisors"?"(Chat With User)":"(Chat With Advisor)")
                                                      ],
                                                    ),
                                                  ),
                                              )
                                                 : SizedBox.shrink())
                                          ],
                                        ),

                                      ],
                                    ),
                                  )),
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

  onFailureRes(String p1){
  }

  onSuccessRes(ConsultationListModel? p1) {
  }

   SetName(Consultations? consultdata) {
    if(Constant.userRoll == "Advisors"){
      return consultdata?.user?.name ?? "";
    }else if(Constant.userRoll == "Users"){
      return consultdata?.advisor?.name ?? "";
    }
  }
}
