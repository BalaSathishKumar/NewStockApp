import 'package:base_flutter_provider_project/data/models/dashboard_model/RewardResponseModel.dart';
import 'package:base_flutter_provider_project/utils/common_functions.dart';
import 'package:base_flutter_provider_project/viewModel/Reward_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common_widgets/appbar_widgets/common_appbar.dart';
import '../../constants/colors.dart';
import '../../constants/constant.dart';
import '../../constants/local_images.dart';
import '../../utils/common_textstyles.dart';
import '../home/homepage.dart';

class RewardHistory extends StatefulWidget {
  const RewardHistory({Key? key}) : super(key: key);

  @override
  State<RewardHistory> createState() => _RewardHistoryState();
}

class _RewardHistoryState extends State<RewardHistory> {
  @override
  Widget build(BuildContext context) {
    var deviceheight = MediaQuery.of(context).size.height;
    var devicewidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Appcolors.white,
      appBar: CustomAppBar(height: 60.0, title: 'Rewards History', appbarclr: Appcolors.white),
      body: Container(

        width: devicewidth,
        child: Consumer<RewardViewModel>(
          builder:(context, rewahistry, child) {
            print('rewardhistry length ${rewahistry.rewardResponseModel?.rewards?.rewardsHistory?.length}');
            return Column(
              children: [
                Expanded(
                  child: Container(
                    child: Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 18),
                        child: Container(
                          height: deviceheight,
                          width: devicewidth,
                          child:CheckReward(rewahistry.rewardResponseModel?.rewards?.rewardsHistory)?Center(child: Text("No Reward History")): ListView.builder(
                              itemCount: rewahistry.rewardResponseModel?.rewards?.rewardsHistory?.length ?? 0,
                              itemBuilder: (context, index) {
                                var rewardhistry = rewahistry.rewardResponseModel?.rewards?.rewardsHistory;
                              print('rewardhistry length ${rewardhistry?.length}');
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8.0, right: 8, bottom: 7),
                                  child: InkWell(
                                    onTap: () {},
                                    child: Container(
                                       // height: 220,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              15.0),
                                         /* gradient: LinearGradient(
                                            colors: [
                                              Appcolors.goldgradient2,
                                              Appcolors.goldgradient1
                                            ],
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                          ),*/
                                          color: Color(int.parse(rewardhistry?[index].colorText ?? "0xFFF1F3F6")),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 18.0, right: 18, top: 18),
                                          child: Column(
                                            children: [
                                              Container(
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                        flex: 1,
                                                        child: buildNamewithHeading(
                                                            devicewidth,
                                                            rewardhistry?[index].type == "reward"?"Reward added date": "Redeemed date",
                                                            formatDate2(  rewardhistry?[index].createdAt ?? "",)+", " +formatYear(rewardhistry?[index].createdAt ?? "").toString(),
                                                            CustomTextStyle.txt12Rrtxtgry2,
                                                            CustomTextStyle.txt16Rmtxtblk,
                                                            Colors.transparent)),
                                                    Expanded(
                                                        flex: 1,
                                                        child: buildNamewithHeading(devicewidth,
                                                            rewardhistry?[index].type == "reward"?"Reward added by": "Redeemed for",
                                                            rewardhistry?[index].purposeText ?? "",
                                                            CustomTextStyle.txt12Rrtxtgry2,
                                                            CustomTextStyle.txt16Rmtxtblk,
                                                            Colors.transparent)),
                                                  ],
                                                ),
                                              ),
                                              Container(

                                              ),
                                              Container(
                                                child: buildNamewithHeading(
                                                    devicewidth,
                                                    rewardhistry?[index].type == "reward"?"Reward points": "Redeemed points",
                                                    "${rewardhistry?[index].points ?? ""}",
                                                    CustomTextStyle.txt12Rrtxtgry2,
                                                    CustomTextStyle.txt16Rmtxtblk,
                                                    Colors.transparent),
                                              ),
                                              Container(
                                                child: buildNamewithHeading(
                                                    devicewidth,
                                                    "Status",
                                                    rewardhistry?[index].statusText ?? "",
                                                    CustomTextStyle.txt12Rrtxtgry2,
                                                    CustomTextStyle.txt16Rmtxtblk,
                                                    Colors.transparent),
                                              ),

                                            ],
                                          ),
                                        )),
                                  ),
                                );
                              }),
                        )
                    ),
                  ),
                )
              ],
            );
          }
        ),
      ),
    );
  }

  Container buildNamewithHeading(double devicewidth,String title,String description,TextStyle st1,TextStyle st2,Color bgclr) {
    return Container(
      height: 50,
      width: devicewidth,
      color: bgclr,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(child: Text(title,style: st1,maxLines: 1,overflow: TextOverflow.ellipsis,)),
          SizedBox(height: 10),
          Flexible(child: Text(description,style: description != "Pending"?st2 : CustomTextStyle.txt16Rmtxtwht ,maxLines: 1,overflow: TextOverflow.ellipsis))
        ],
      ),
    );
  }

  CheckReward(List<RewardsHistory>? rewardsHistory) {

    if(rewardsHistory != null && rewardsHistory.isEmpty){
      return true;
    }else{
      return false;
    }

  }
}
