import 'package:base_flutter_provider_project/constants/colors.dart';
import 'package:base_flutter_provider_project/constants/constant.dart';
import 'package:base_flutter_provider_project/utils/common_functions.dart';
import 'package:base_flutter_provider_project/utils/common_textstyles.dart';
import 'package:base_flutter_provider_project/viewModel/Reward_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../common_widgets/appbar_widgets/common_appbar.dart';
import '../../common_widgets/appbar_widgets/logotxtappbar.dart';
import '../../constants/local_images.dart';
import '../../data/models/dashboard_model/PromocodeModel.dart';
import '../home/homepage.dart';

class PromocodeList extends StatefulWidget {
  const PromocodeList({super.key});

  @override
  State<PromocodeList> createState() => _PromocodeListState();
}

class _PromocodeListState extends State<PromocodeList> {
  late RewardViewModel _rewardViewModel;

  @override
  void initState() {
    super.initState();
    _rewardViewModel = Provider.of<RewardViewModel>(context, listen: false);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _rewardViewModel.promocodeapi(onFailureRes: onFailureRes);
    });
  }

  @override
  Widget build(BuildContext context) {
    final key = new GlobalKey<ScaffoldState>();
    var deviceheight = MediaQuery.of(context).size.height;
    var devicewidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CustomAppBar(height: 60.0, title: 'Promocode', appbarclr: Appcolors.white),
      key: key,
      body: Container(
        height: deviceheight,
        width: devicewidth,
        child: Column(
          children: [
          /*  SizedBox(height: 60),
            LogoTxtAppbar(logotag: "promocode", title: "Promocode", Isportfolio: false, onPressed: () {}),*/
            Expanded(
              child: PromocCodeDsgn(devicewidth: devicewidth),
            ),
          ],
        ),
      ),
    );
  }

  onFailureRes(String p1) {}
}

class PromocCodeDsgn extends StatelessWidget {
  const PromocCodeDsgn({
    super.key,
    required this.devicewidth,
  });

  final double devicewidth;

  @override
  Widget build(BuildContext context) {

    return Consumer<RewardViewModel>(builder: (context, promocode, child) {
      return ListView.builder(
          // itemCount: items.length,
          itemCount: promocode.PromocodeResponseModel?.promocode?.length ?? 0,
          itemBuilder: (context, index) {
            var promocodedata = promocode.PromocodeResponseModel?.promocode;
            return Padding(
              padding: const EdgeInsets.only(top: 28.0, left: 18, right: 18),
              child: Column(
                children: [
                  Container(
                    height: 200,
                    width: devicewidth,
                    child: Row(
                      children: [
                        Expanded(
                            flex: 2,
                            child: Container(
                              decoration: BoxDecoration(
                                 // color: Appcolors.splashbgcolor2,
                                  color: Color( 0xFF00FF7F).withOpacity(0.1),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(23.0),
                                      bottomLeft: Radius.circular(23.0))),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Flat",
                                    style: CustomTextStyle.txt24Rbblack,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    setFlatRate(promocodedata?[index]),
                                    style: CustomTextStyle.txt24Rbblack,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            )),
                        Container(
                          color:  Color( 0xFF00FF7F).withOpacity(0.1),
                          child: SvgPicture.asset(LocalSVGImages.divdir2),
                        ),
                        Expanded(
                            flex: 4,
                            child: Container(
                              decoration: BoxDecoration(
                                  //color: Appcolors.splashbgcolor2,
                                  color:  Color( 0xFF00FF7F).withOpacity(0.1),
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(23.0),
                                    bottomRight: Radius.circular(23.0),
                                  )),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  // mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      promocodedata?[index].title ?? "",
                                      style: CustomTextStyle.txt24Rbblack,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      promocodedata?[index].description ?? "",
                                      style: CustomTextStyle.txt14Rblisttilegrey,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      height: 60,
                                      decoration: BoxDecoration(
                                        color: Appcolors.white,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                          bottomRight: Radius.circular(10),
                                          bottomLeft: Radius.circular(10),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Expanded(
                                              child: Padding(
                                            padding: const EdgeInsets.only(left: 8.0),
                                            child: Text(
                                              promocodedata?[index].promocode ?? "",
                                              style: CustomTextStyle.txt24Rbblack,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          )),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 8.0),
                                            child: GestureDetector(
                                              onTap: () {
                                                promocodedata?[index].statustext == "Expired" ? print('Expired') : Clipboard.setData(new ClipboardData(text: promocodedata?[index].promocode ?? ""));
                                                promocodedata?[index].statustext == "Expired" ? print('') : showToast("Promocode Copied to Clipboard");
                                                // print('copied test ${}');
                                                //showSnackBar(new SnackBar(content: new Text("Copied to Clipboard"),));
                                              },
                                              child: Container(
                                                width: 50,
                                                height: 30,
                                                decoration: BoxDecoration(
                                                  color: Colors.black,
                                                  borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(10),
                                                    topRight: Radius.circular(10),
                                                    bottomRight: Radius.circular(10),
                                                    bottomLeft: Radius.circular(10),
                                                  ),
                                                ),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "Copy",
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: Text(
                                                "${promocodedata?[index].statustext ?? ""}",style: TextStyle(color:promocodedata?[index].statustext =="Active"?Colors.green:Colors.red ),)),
                                        Expanded(
                                            flex: 1,
                                            child: Text(
                                                "valid to:${formatDate(promocodedata?[index].toDate ?? "")}")),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )),
                      ],
                    ),
                  )
                ],
              ),
            );
          });
    });
  }

   setFlatRate(Promocode? flatrate) {

    if(flatrate?.type == "fixed"){
      return  "${Constant.rupeeSymbol}${flatrate?.amount.toString() ?? ""}";
     }else {
      return  "${flatrate?.amount.toString() ?? ""}%";
    }
  }
}
