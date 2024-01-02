import 'package:base_flutter_provider_project/data/models/dashboard_model/RewardResponseModel.dart';
import 'package:base_flutter_provider_project/ui/Reward&Referrals/RedeemReward.dart';
import 'package:base_flutter_provider_project/ui/Reward&Referrals/RewardHistory.dart';
import 'package:base_flutter_provider_project/viewModel/Reward_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../common_widgets/appbar_widgets/GreenContainer.dart';
import '../../common_widgets/appbar_widgets/green_appbar.dart';
import '../../common_widgets/button_widgets/common_button.dart';
import '../../constants/colors.dart';
import '../../constants/local_images.dart';
import '../../data/models/dashboard_model/ProfileResponseModel.dart';
import '../../utils/common_functions.dart';
import '../../utils/common_textstyles.dart';
import '../../viewModel/profile_view_model.dart';

class RewardandReferral extends StatefulWidget {
  const RewardandReferral({Key? key}) : super(key: key);

  @override
  State<RewardandReferral> createState() => _RewardandReferralState();
}

class _RewardandReferralState extends State<RewardandReferral> {
  late RewardViewModel _rewardViewModel;

  @override
  void initState() {
    super.initState();
    _rewardViewModel = Provider.of<RewardViewModel>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _rewardViewModel.rewardapi(onFailureRes: onFailureRes, onSuccessRes: onSuccessRes);
    });
  }

  @override
  Widget build(BuildContext context) {
    var deviceheight = MediaQuery.of(context).size.height;
    var devicewidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Appcolors.white,
      body: Container(
          height: deviceheight,
          width: devicewidth,
          child: SingleChildScrollView(child:
              Consumer<ProfileViewModel>(builder: (context, profilvm, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RewardCard(devicewidth, deviceheight, profilvm),
                MyCredits(onPressed: () {
                  // context.router.push(const Rewardhistory());
                  Navigator.push(context, MaterialPageRoute(builder: (context) => RewardHistory()));
                }),
                Container(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 18.0, right: 18, top: 18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildRichText(
                          TextSpan(text: "REDEEM"),
                          TextSpan(
                              text: " REWARDS",
                              style: CustomTextStyle.txt24Rbblack),
                          CustomTextStyle.txt24Rlblk,
                        ),
                        SizedBox(height: 10),
                        InkWell(
                          onTap: () {
                            // context.router.push(const Redeemreward());
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RedeemRewardPage()));
                          },
                          child: Container(
                            width: devicewidth,
                            height: 223,
                            child: Hero(
                              tag: "redeem",
                              child: SvgPicture.asset(LocalSVGImages.redeem, fit: BoxFit.fill,),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            );
          }))),
    );
  }

  Container RewardCard(
      double devicewidth, double deviceheight, ProfileViewModel profilvm) {
    return Container(
        height: 350,
        width: devicewidth,
        color: Colors.white,
        child: Stack(
          children: [
            GreenTopContainer(
                title: "My Rewards",
                imgtag: "question",
                imgurl: LocalSVGImages.question,
                onArrowpress: () {
                  Navigator.pop(context);
                },
                onPressIcon: () {
                  _openHowItWorks(context, deviceheight, devicewidth);
                }),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 18.0, right: 18, top: 20, bottom: 10),
                child: Container(
                  height: 240,
                  width: devicewidth,
                  decoration: BoxDecoration(
                      color: Appcolors.black,
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                            height: 34,
                            width: devicewidth,
                            //      color: Colors.yellow,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  profilvm.profileResponseModel?.user
                                          ?.referalCode ??
                                      "",
                                  style: CustomTextStyle.txt33Rbwhite,
                                ),
                              ],
                            )),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                            height: 24,
                            //       color: Colors.red,
                            width: devicewidth / 2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Share your referral ID to your friends & familiy to earn credits & rewards",
                                  style: CustomTextStyle.txt14Rrtxtwht,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            )),
                      ),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 8.0, left: 18, right: 18, bottom: 10),
                          child: Container(
                            height: 50,
                            width: devicewidth,
                            child: CustomMaterialButton(
                              text: 'Share & Earn',
                              onPressed: () {
                                final box = context.findRenderObject() as RenderBox?;
                                Share.share(
                                   "Hi, your referral is ${profilvm.profileResponseModel?.user?.referalCode ?? ""}",
                                    subject:
                                        "Share your referral ID to your friends & familiy to earn credits & rewards",
                                    sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
                                print('Button pressed!');
                              },
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }

  void _openHowItWorks(
      BuildContext context, double deviceheight, double devicewidth) {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(26.0),
          ),
        ),
        isScrollControlled: true,
        builder: (BuildContext context) {
          return Container(
            height: deviceheight / 2,
            decoration: BoxDecoration(
              color: Appcolors.white,
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 18),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 50,
                      width: devicewidth,
                      decoration: BoxDecoration(
                        color: Appcolors.white,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 5,
                            width: 30,
                            decoration: BoxDecoration(
                              color: Appcolors.dividergrey,
                              borderRadius: BorderRadius.circular(2.0),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: buildRichText2(
                          textspanlist(), CustomTextStyle.txt24Rbblack),
                    ),
                    Container(
                        height: 250,
                        width: devicewidth,
                        color: Appcolors.redeemgreen,
                        child: Consumer<ProfileViewModel>(
                            builder: (context, profilvm, child) {
                          return ListView.builder(
                              itemCount: profilvm.profileResponseModel
                                      ?.howitwork?.length ??
                                  0,
                              itemBuilder: (context, index) {
                                return RedeemSteps(
                                    index.toString(),
                                    [
                                      LocalSVGImages.step1,
                                      LocalSVGImages.step2,
                                      LocalSVGImages.step3
                                    ],
                                    profilvm.profileResponseModel
                                        ?.howitwork?[index]);
                              });
                        })

                        /*Column(
                 children: [

                   RedeemSteps("step1","Step 1 : Invite","Your app has an unique invitation code shown above. Share this to your friends & family and ask them to sign up with Sauda.",LocalSVGImages.step1),
                   SizedBox(height: 10,),
                   RedeemSteps("step2","Step 2 : Win Credits","When your friend makes their first transaction, we give you credits too!",LocalSVGImages.step2),
                   SizedBox(height: 10,),
                   RedeemSteps("step3","Step 3 : Redeem","Use your earned credits towards purchase of new stocks & assets with Sauda.",LocalSVGImages.step3),
                   SizedBox(height: 10,)
                 ],
               ),*/
                        )
                  ],
                ),
              ),
            ),
          );
        });
  }

  ListTile RedeemSteps(
      String imgtag, List<String> icons, Howitwork? howitwork) {
    return ListTile(
      tileColor: Colors.red.shade50,
      leading: Hero(tag: imgtag, child: setImag(imgtag, icons)),
      title: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Text(
          howitwork?.title ?? "",
          style: CustomTextStyle.txt16Rbtxtpurple,
        ),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Text(
          howitwork?.description ?? "",
          style: CustomTextStyle.txt14Rrtxtlisttilegrey,
        ),
      ),
    );
  }

  List<TextSpan> textspanlist() {
    List<TextSpan> spans = [
      TextSpan(text: "HOW ", style: CustomTextStyle.txt24Rlblk),
      TextSpan(text: "IT", style: CustomTextStyle.txt24Rlblk),
      TextSpan(
        text: " WORKS",
      ),
    ];
    return spans;
  }

  setImag(String imgtag, List<String> icons) {
    if (imgtag == "0") {
      return SvgPicture.asset(
        icons[0],
        height: 25,
        width: 25,
      );
    } else if (imgtag == "1") {
      return SvgPicture.asset(
        icons[1],
        height: 25,
        width: 25,
      );
    } else {
      return SvgPicture.asset(
        icons[2],
        height: 25,
        width: 25,
      );
    }
  }

  onFailureRes(String p1) {}

  onSuccessRes(RewardResponseModel? p1) {
    //_rewardViewModel.redeemrewardapi(onFailureRes: onFailureRes);
  }
}

class MyCredits extends StatelessWidget {
  const MyCredits({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 18.0, top: 10,right: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildRichText(
              TextSpan(text: "MY"),
              TextSpan(text: " CREDITS", style: CustomTextStyle.txt24Rbblack),
              CustomTextStyle.txt24Rlblk,
            ),
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 110,
                  child: Hero(
                    tag: "tktbg",
                    child: SvgPicture.asset(LocalSVGImages.tktbg, fit: BoxFit.fill,),
                  ),
                ),
                Container(
                  height: 110,
                  // color: Colors.red.shade50,
                  child: Consumer<RewardViewModel>(
                      builder: (context, rewardvm, child) {
                    return Row(
                      children: [
                        Expanded(
                            flex: 3,
                            child: Container(
                              // color: Colors.red,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    //  color: Colors.red,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          "Credits",
                                          style: CustomTextStyle.txt12Rrtxtblk,
                                        ),
                                        Text(
                                          rewardvm.rewardResponseModel?.rewards?.totalPoints.toString() ?? "",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: CustomTextStyle.txt33Rbblk,
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )),
                        Expanded(
                            flex: 2,
                            child: Container(
                              //    color: Colors.yellow,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text("Referrals",
                                            style:
                                                CustomTextStyle.txt12Rrtxtblk),
                                        Text(
                                            rewardvm.rewardResponseModel?.rewards?.totalReferrals.toString() ?? "",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: CustomTextStyle.txt33Rbblk)
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ))
                      ],
                    );
                  }),
                )
              ],
            ),
            Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap: onPressed,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 18.0),
                    child: Container(
                        child: Text(
                      "View Rewards History",
                      style: CustomTextStyle.txt14Rmtxtpurpul,
                    )),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
