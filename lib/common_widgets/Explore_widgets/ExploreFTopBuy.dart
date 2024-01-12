import 'package:base_flutter_provider_project/data/models/LocationsModel/StateModel.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';
import '../../constants/local_images.dart';
import '../../utils/CustomBorderClipper.dart';
import '../../utils/common_textstyles.dart';
import '../../viewModel/CommonProvider.dart';
import '../../viewModel/base_view_model/base_view_model.dart';
import '../../viewModel/profession_view_model.dart';
import '../Stock_widgets/TrendingStocks.dart';
import '../button_widgets/AnimatedToggle.dart';
import '../dropdown_widgets/CityDropDown.dart';
import '../dropdown_widgets/ProfessionDropDown.dart';
import '../dropdown_widgets/StateDropDown.dart';
import '../dropdown_widgets/common_dropdown.dart';
import '../loading_widgets/loader.dart';

class TopBy extends StatefulWidget {
  const TopBy({
    super.key,
    required this.devicewidth,
    required this.firsttxt,
    required this.secondtxt,
    required this.isToggleneed,
  });

  final double devicewidth;
  final String firsttxt;
  final String secondtxt;
  final bool isToggleneed;

  @override
  State<TopBy> createState() => _TopByState();
}

class _TopByState extends State<TopBy> {
  late ProfessionViewModel _professionViewModel;
  late CommonProvider _commonProvider;

  @override
  void initState() {
    super.initState();
    _professionViewModel = Provider.of<ProfessionViewModel>(context, listen: false);
    _commonProvider = Provider.of<CommonProvider>(context, listen: false);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _commonProvider.setIsToggle(true);
      if( _professionViewModel.UserStateExpFilter?.name == null &&  _professionViewModel.UserStateExpFilter?.name != "Enter State"){
        _professionViewModel.stateapi(onFailureRes: onstateFailureRes,onSuccessRes: OnstateSuccess);
       // _professionViewModel.setUserProfessionExFilter(null);
        // _professionViewModel.setUserStateExFilter(null);
        // _professionViewModel.setUserCityExFilter(null);
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    var deviceheight = MediaQuery.of(context).size.height;
    var devicewidth = MediaQuery.of(context).size.width;
    return Consumer<CommonProvider>(
      builder: (context,toggleVM,child){
      return Container(
        height: 200,
        width: widget.devicewidth,
        color: Appcolors.white,
        child: ClipRect(
          clipper: TopBorderClipper(20.0),
          child: DottedBorder(
            dashPattern: [8, 4],
            strokeWidth: 1,
            color: Appcolors.kyctxtgrey,
            strokeCap: StrokeCap.square,
            borderType: BorderType.RRect,
            radius: Radius.circular(0),
            child: Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Visibility(
                    visible: widget.isToggleneed,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: RichText(
                            textAlign: TextAlign.left,
                            text: TextSpan(
                              style: CustomTextStyle.txt24Rbblack,
                              children: <TextSpan>[
                                TextSpan(text: widget.firsttxt),
                                TextSpan(
                                    text: widget.secondtxt,
                                    style: CustomTextStyle.txt24Rlblk),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: AnimatedToggle(
                            values: ['City', 'Profession'],
                            onToggleCallback: (value) {

                              if(value == 0){
                                _commonProvider.setIsToggle(true);
                              }else{
                                _commonProvider.setIsToggle(false);
                              }
                              print('city/ prof ${_commonProvider.IsToggle}');
                              //  _commonProvider.setIsToggle(value);
                              /*    setState(() {
                            _toggleValue = value;
                          });*/
                            },
                            buttonColor: Appcolors.white,
                            backgroundColor: Colors.grey.shade100,//Appcolors.txtlitegrey3,
                            textColor: Appcolors.black,
                          ),
                        )
                      ],
                    ),
                  ),


                  toggleVM.IsToggle?   Padding(
                    padding: const EdgeInsets.only(right: 18.0),
                    child: Container(
                      //  color: Colors.red,
                      child: Consumer<ProfessionViewModel>(builder: (context, statevm, child) {
                        return
                          StateDropdown(
                            dropdwnicon: LocalSVGImages.dropdwn,
                            underlinecolor: Appcolors.kyctxtgrey,
                            iconcolor: Appcolors.kyctxtgrey,
                            // textdecoration: CustomTextStyle.txt16kyctxtgrey,
                            textdecoration:CustomTextStyle.txt16Rb,
                            devicewidth: devicewidth / 2 + 10,
                            selectedValue: statevm.UserStateExpFilter,
                            options: statevm.StateList,
                            onChanged: (value) {
                              if(value != null){
                                _professionViewModel.setUserStateExFilter(value);
                                _professionViewModel.setUserCityExFilter(null);

                                _professionViewModel.cityapi(onFailureRes: onstateFailureRes,onSuccessRes: onCitySucres, cityid: value.id.toString());
                              }

                            },
                          );
                      }
                      ),
                    ),
                  ):SizedBox.shrink(),

                  SizedBox(height: 16),

                  toggleVM.IsToggle?
                /*  Consumer<TrendingDropOptions2>(
                    builder: (context, trendingoptions2, child) {
                      return CustomDropdown(
                        underlinecolor: Appcolors.txtlitegreen2,
                        iconcolor: Appcolors.txtlitegreen2,
                        textdecoration: CustomTextStyle.txt24Rmtxtblkf,
                        devicewidth: 90,
                        selectedValue: trendingoptions2.trengingdropoptions2,
                        options: ["Madurai", "Coimbatore", "Chennai", "Trichy"],
                        onChanged: (value) {
                          if (value != null) {
                            Provider.of<TrendingDropOptions2>(context,
                                listen: false)
                                .getTrendingDropOPtions2(value);
                          } else {
                            print('value is null');
                          }

                          //  setState(() {
                          //  _selectedOption = value!;
                          // });
                        },
                      );
                    },
                  )*/

                  Padding(
                    padding: const EdgeInsets.only(right: 18.0),
                    child: Container(
                      //   color: Colors.red,
                      child:Consumer<ProfessionViewModel>(builder: (context, cityvm, child) {
                        return
                          cityvm.state == ViewState.busy?Loader():   CityDropdown(
                            dropdwnicon: LocalSVGImages.dropdwn,
                            underlinecolor: Appcolors.kyctxtgrey,
                            iconcolor: Appcolors.kyctxtgrey,
                            // textdecoration: CustomTextStyle.txt16kyctxtgrey,
                            textdecoration: CustomTextStyle.txt16Rb,
                            devicewidth: devicewidth / 2 + 10,
                            selectedValue: cityvm.UserCityExpFilter,
                            options: cityvm.CityList,
                            onChanged: (value) {
                              if(value != null){
                                _professionViewModel.setUserCityExFilter(value);
                              }
                            },
                          );
                      }
                      ),
                    ),
                  ) :
                  Padding(
                    padding: const EdgeInsets.only(right: 18.0),
                    child: Container(
                      //   color: Colors.red,
                      child:  Consumer<ProfessionViewModel>(builder: (context, professionvm, child) {
                        print('consumrrr ${professionvm.UserProfessionExpFilter?.name} ');
                        return
                          ProfessionDropdown(
                            dropdwnicon: LocalSVGImages.dropdwn,
                            underlinecolor: Appcolors.kyctxtgrey,
                            iconcolor: Appcolors.kyctxtgrey,
                            // textdecoration: CustomTextStyle.txt16kyctxtgrey,
                            textdecoration: CustomTextStyle.txt16Rb,
                            devicewidth: widget.devicewidth / 2 + 10,
                            selectedValue: professionvm.UserProfessionExpFilter,
                            // options: ['Male', 'Female', 'Transgender'],
                            options: professionvm.ProfessionList,
                            onChanged: (value) {
                              if(value != null){
                               _professionViewModel.setUserProfessionExFilter(value);
                               print('profession id ${value.id}');
                              }
                              },
                          );
                      }
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
      }
    );
  }

  onstateFailureRes(String p1) {
  }

  OnstateSuccess(StateModel? p1) {
    print(' _professionViewModel.setUserStateExFilter ${ _professionViewModel.UserStateExpFilter?.name}');
    print(' _professionViewModel.UserCityExpFilter ${ _professionViewModel.UserCityExpFilter?.name}');

    if(_professionViewModel.UserStateExpFilter?.name == null){
      _professionViewModel.setUserStateExFilter(_professionViewModel.StateList[0]);
      _professionViewModel.setUserCityExFilter(_professionViewModel.CityList[0]);
      // print('OnstateSuccess ${_professionViewModel.ProfessionList[0].name}');
      _professionViewModel.setUserProfessionExFilter(_professionViewModel.ProfessionList[0]);
    }else{
      _professionViewModel.setUserStateExFilter(_professionViewModel.UserStateExpFilter);
      _professionViewModel.setUserCityExFilter(_professionViewModel.UserCityExpFilter);
    }

  }

  onCitySucres(StateModel? p1) {

  }
}