import 'dart:io';

import 'package:base_flutter_provider_project/data/models/StatusandMessageModel.dart';
import 'package:base_flutter_provider_project/data/models/dashboard_model/ProfileResponseModel.dart';
import 'package:base_flutter_provider_project/ui/Dealers/select_payment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

import '../../common_widgets/alert_widgets/YesorNo_dialog.dart';
import '../../common_widgets/alert_widgets/permission_prompt.dart';
import '../../common_widgets/appbar_widgets/common_appbar.dart';
import '../../common_widgets/bottomsheet_widgets/IAgreeDsn.dart';
import '../../common_widgets/button_widgets/common_button.dart';
import '../../common_widgets/dropdown_widgets/CommonDottedBorder.dart';
import '../../common_widgets/dropdown_widgets/common_dropdown.dart';
import '../../common_widgets/loading_widgets/loader.dart';
import '../../common_widgets/textfields_widgets/common_textfield_withicon.dart';
import '../../constants/colors.dart';
import '../../constants/constant.dart';
import '../../constants/local_images.dart';
import '../../data/models/register_model/RegisterModel.dart';
import '../../utils/SharedHelper/PreferenceHelper.dart';
import '../../utils/SharedHelper/Preference_Constant.dart';
import '../../utils/common_functions.dart';
import '../../utils/common_textstyles.dart';
import '../../utils/logger.dart';
import '../../viewModel/CommonProvider.dart';
import '../../viewModel/base_view_model/base_view_model.dart';
import '../../viewModel/profession_view_model.dart';
import '../../viewModel/profile_view_model.dart';
import '../../viewModel/register_viewmodel.dart';
import '../Register/RegisterPage.dart';
import '../home/homepage.dart';

class KycDealer extends StatefulWidget {
  final bool IsKycUpdate;
  final bool? IsRegandKy;
  KycDealer({
    required this.IsKycUpdate,
    this.IsRegandKy
});

  @override
  State<KycDealer> createState() => _KycDealerState();
}

class _KycDealerState extends State<KycDealer> {
  bool get isKycEdit => widget.IsKycUpdate;
  String _selectedOption = 'Users';
  String _selectedGender = 'Male';
  String _selectedRes = 'Resident Individual';

  File? _image = null;
  File? _idproof = null;
  File? _aadhar = null;
  File? _cmpyownership = null;
  File? _recognition = null;
  File? _SEBI = null;
  File? _pancard = null;
  File? _cancelledcheque = null;
  File? _dematdetails = null;
  String? Removedresult = "";
  String _imagestring = "";
  String _idproofstring = "";

  late RegisterViewModel _registerViewModel;
  late UserageProvider _userAgeProvider;
  late UserNameProvider _userNameProvider;
  late UserEmailProvider _userEmailProvider;
  late CommonProvider _commonProvider;
  late ProfessionViewModel _professionViewModel;
  late ProfileViewModel _profileViewModel;
  final _formKey = GlobalKey<FormState>();
  Future<void> _pickimage2(bool profile, bool camera, int filecode) async {
    if (profile) {
      if (Constant.isPermissionGranted) {
        //navigateToNextPage();
        print('camera is granted');

        if (camera) {
          final ImagePicker _picker = ImagePicker();
          final XFile? image =
          await _picker.pickImage(source: ImageSource.camera);

          if (image != null) {
            setState(() {
              _image = File(image.path);
              //  fileToString(_image!);
            });
          }
        } else {
          final ImagePicker _picker = ImagePicker();
          final XFile? image =
          await _picker.pickImage(source: ImageSource.gallery);

          if (image != null) {
            setState(() {
              _image = File(image.path);
              //  fileToString(_image!);
            });
          }
        }
      }
      else {
        //Calling API after UI renders
        WidgetsBinding.instance.addPostFrameCallback((_) {
          permissionPrompt2(context);
        });
      }
    }
    else {
      /*   if (Constant.isPermissionGranted) {
        //navigateToNextPage();
        print('camera is granted');

        final ImagePicker _picker = ImagePicker();
        final XFile? image = await _picker.pickImage(
            source: ImageSource.gallery);

        if (image != null) {
          setState(() {
            _idproof = File(image.path);
          });
        }
      }*/

      switch (filecode) {
        case 0:
          ChooseFile(0);
          break;
        case 1:
          ChooseFile(1);
          break;
        case 2:
          ChooseFile(2);
          break;
        case 3:
          ChooseFile(3);
          break;
        case 4:
          ChooseFile(4);
          break;
        case 5:
          ChooseFile(5);
          break;
        case 6:
          ChooseFile(6);
          break;
        case 7:
          ChooseFile(7);
          break;
        case 8:
          ChooseFile(8);
          break;
        default:
          print('Unknown file');
      }
    }
  }

  Future<bool> requestPermission2() async {

    /*  var status = await Permission.manageExternalStorage.request();
    if (status.isGranted) {
      Constant.isPermissionGranted = status.isGranted;
    } else if (status.isPermanentlyDenied) {
      openAppSettings();
    }*/

    Constant.isPermissionGranted = await checkPermission();
    if (Constant.isPermissionGranted) {
      return Constant.isPermissionGranted;
    } else {
      // openAppSettings();
      var status = await Permission.manageExternalStorage.request();
      if (status.isGranted) {
        Constant.isPermissionGranted = status.isGranted;
      } else if (status.isPermanentlyDenied) {
     //   openAppSettings();

        if(Platform.isAndroid){
          openAppSettings();
        }else{
          if (await Permission.camera.request().isGranted && await Permission.camera.request().isGranted) {
            // Either the permission was already granted before or the user just granted it.
            print('Permission.camera.request().isGranteds ${Permission.camera.isGranted}');
            Constant.isPermissionGranted = true;
            return Constant.isPermissionGranted;
          }else{
            // You can request multiple permissions at once.
            Map<Permission, PermissionStatus> statuses = await [
              Permission.camera,
              Permission.storage,
            ].request();
            print('requestdjjjd${statuses[Permission.storage]}');
            Constant.isPermissionGranted = true;
            return Constant.isPermissionGranted;
          }

        }

      }
    }

    //  navigateToNextPage();
    return Constant.isPermissionGranted;
  }

  void permissionPrompt2(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return PermissionPrompt(
            tapYes: () {
              Navigator.pop(context);
              requestPermission2();
            },
            tapCancel: () {
              Navigator.pop(context);
              //navigateToNextPage();
            },
          );
        });
  }

  TextEditingController _userpancontroller = TextEditingController();
  TextEditingController _userCurrentAddcontroller = TextEditingController();
  TextEditingController _userPermAddcontroller = TextEditingController();
  TextEditingController _userExpcontroller = TextEditingController();
  TextEditingController _userIncomePercentcontroller = TextEditingController();
  TextEditingController _userTimeFrame = TextEditingController();
  TextEditingController _dealersplcontroller = TextEditingController();
  TextEditingController _TB1controller = TextEditingController();
  TextEditingController _TB2controller = TextEditingController();
  TextEditingController _TB3controller = TextEditingController();
  TextEditingController _Dep1controller = TextEditingController();
  TextEditingController _Dep2controller = TextEditingController();
  TextEditingController _Dep3controller = TextEditingController();
  TextEditingController _Dep4controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _registerViewModel = Provider.of<RegisterViewModel>(context, listen: false);
    _userAgeProvider = Provider.of<UserageProvider>(context, listen: false);
    _userNameProvider = Provider.of<UserNameProvider>(context, listen: false);
    _userEmailProvider = Provider.of<UserEmailProvider>(context, listen: false);
    _commonProvider = Provider.of<CommonProvider>(context, listen: false);
    _professionViewModel = Provider.of<ProfessionViewModel>(context, listen: false);
    _profileViewModel = Provider.of<ProfileViewModel>(context, listen: false);

    if(widget.IsKycUpdate){
      WidgetsBinding.instance.addPostFrameCallback((_) {
     setDealersKycData(_profileViewModel.profileResponseModel?.user?.userMetaData ?? []);
     setDealerIdproof(_profileViewModel.profileResponseModel?.user?.idProof ?? []);});
    }
    else{
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _userAgeProvider.setUserResidSelect(false);
        _userAgeProvider.setUserProofSelect(false);
      });
      _userpancontroller = TextEditingController(text: _userAgeProvider.UserPan);
      _userCurrentAddcontroller = TextEditingController(text: _userAgeProvider.UserCurrentAddress);
      _userPermAddcontroller = TextEditingController(text: _userAgeProvider.UserPermAddress);
      _dealersplcontroller = TextEditingController(text: _userAgeProvider.DealerSPeciality);
      _TB1controller = TextEditingController(text: _userAgeProvider.TopDeal1);
      _TB2controller = TextEditingController(text: _userAgeProvider.TopDeal2);
      _TB3controller = TextEditingController(text: _userAgeProvider.TopDeal3);
      _Dep1controller = TextEditingController(text: _userAgeProvider.Depository1);
      _Dep2controller = TextEditingController(text: _userAgeProvider.Depository2);
      _Dep3controller = TextEditingController(text: _userAgeProvider.Depository3);
      _Dep4controller = TextEditingController(text: _userAgeProvider.Depository4);
    }


  }

  /* @override
  void dispose() {
    _useragecontroller.clear();
    super.dispose();
  }*/
  DateTime selectedDate = DateTime.now();





  @override
  Widget build(BuildContext context) {
    var deviceheight = MediaQuery.of(context).size.height;
    var devicewidth = MediaQuery.of(context).size.width;

    String _userresidence = "";
    String _userPAN = "";
    String _userCurrentAdd = "";
    String _userPermAdd = "";
    String _userProofType = "";
    final dataModel = context.watch<UserageProvider>();
    final dataModelread = context.read<UserageProvider>();


    return Scaffold(
        backgroundColor: Appcolors.white,
        appBar:  widget.IsRegandKy != null ? null :CustomAppBar(height: 60.0, title: 'Dealer KYC', appbarclr: Appcolors.white,HideMenu: true),
        body: Form(
          key: _formKey,
          child: Container(
            height: deviceheight,
            width: devicewidth,
            child: SingleChildScrollView(
              child: Consumer<UserageProvider>(builder: (context, uservm, child) {
                return Padding(
                  padding: const EdgeInsets.only(right: 16.0, left: 16),
                  child: Column(
                    children: [

                      Container(
                          height: 50,
                          child: Text(
                              "Kindly fill this KYC form in order to conduct business through our platform. You can leave the fields that are not valid as per you.",
                              style: CustomTextStyle.txt14Rrtxtgry)),
                      Stack(
                        children: [
                      Consumer<ProfileViewModel>(
                      builder: (context, profilvm, child) {
                        return Container(
                            height: 180,
                            width: 180,
                            child: Container(
                              padding: EdgeInsets.all(1), // Border width
                              decoration: BoxDecoration(
                                  color: Appcolors.black,
                                  shape: BoxShape.circle),
                              child: ClipOval(
                                child: SizedBox.fromSize(
                                    size: Size.fromRadius(50), // Image radius
                                    child: setImage(_image,profilvm.profileResponseModel?.user?.photoUrl ?? "")

                                  /*_image == null
                                          ? SvgPicture.asset(LocalSVGImages.perplh,
                                        fit: BoxFit.cover,
                                      ) : Image.file(_image!, fit: BoxFit.cover,),*/
                                ),
                              ),
                            ));
                      }
                          ),
                          InkWell(
                            onTap: () {
                              _showCustomDialog(context);
                            },
                            child: Container(
                              height: 180,
                              width: 180,
                              // color: Colors.red,
                              child: Hero(
                                tag: "edit",
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 18.0, right: 10),
                                      child: SvgPicture.asset(
                                          LocalSVGImages.editicon,
                                          height: 25, width: 16),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      Container(
                        height: 50,
                        width: devicewidth,
                        //    color: Colors.red,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                //color: Colors.yellow,
                                child: Hero(
                                  tag: 'residentialsts',
                                  child: Padding(
                                    padding: const EdgeInsets.all(0),
                                    child: SvgPicture.asset(
                                        _userAgeProvider.UserResideceSelect ? LocalSVGImages.citygreen:LocalSVGImages.city,
                                        height: 25,
                                        width: 16),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 8,
                              child: Container(
                                //   color: Colors.red,
                                child: CustomDropdown(
                                  underlinecolor: Appcolors.kyctxtgrey,
                                  iconcolor: Appcolors.kyctxtgrey,
                                  // textdecoration: CustomTextStyle.txt16kyctxtgrey,
                                  textdecoration: CustomTextStyle.txt16Rrblk,
                                  devicewidth: devicewidth / 2 + 10,
                                  selectedValue: uservm.UserResidence,
                                  options: [
                                    'Select Residence',
                                    'Resident Individual',
                                    'Non Resident Indian',
                                    'Foreign Nation',
                                    'Person of Indian Origin'
                                  ],
                                  onChanged: (value) {
                                    _userAgeProvider.setUserResidence(value ?? "");
                                    _userAgeProvider.setUserResidSelect(true);
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(
                        height: 20,
                      ),

                      Container(
                          height: 45,
                          child:
                          CustomTextFieldicon(
                              localsvg: LocalSVGImages.citygreen,
                              labeliconUnselected: LocalSVGImages.city,
                              textInputType: TextInputType.text,
                              txtalign: TextAlign.left,
                              onChanged: (value) {
                                // dataModel.setTextFieldValue(value);
                                _userAgeProvider.setUserPan(value);
                                _userAgeProvider.setUserResidSelect(false);
                              },
                              validator: (value) {
                                if(value == null ||  value.isEmpty){
                                  return 'Please enter pan';
                                }
                                return null;
                              },
                              labelicon: Icons.add_card,
                              hintText: 'PAN Number',
                              controller: _userpancontroller
                          )

                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height:45,

                        child: CustomTextFieldicon(
                            localsvg: LocalSVGImages.stategreen,
                            labeliconUnselected: LocalSVGImages.state,
                            textInputType: TextInputType.name,
                            txtalign: TextAlign.left,
                            onChanged: (value) {
                              // dataModel.setTextFieldValue(value);
                              _userAgeProvider.setUserCurrentAddress(value);
                            },
                            validator: (value) {
                              if(value == null ||  value.isEmpty){
                                return 'Please enter current address';
                              }
                              return null;
                            },
                            labelicon: Icons.home_outlined,
                            hintText: 'Current Address',
                            controller: _userCurrentAddcontroller
                        ),
                      ),
                      Container(
                          height: 40,
                          width: devicewidth,
                          //  color: Colors.red.shade50,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 80,
                                width: 25,
                                //     color: Colors.red,
                                child:   Consumer<CommonProvider>(
                                    builder: (context, commonvm, child) {
                                      return Checkbox(
                                        activeColor: Appcolors.splashbgcolor,
                                        value: commonvm.IsCurrentAdd,
                                        // Initial checkbox state
                                        onChanged: (bool? newValue) {
                                          _commonProvider.setIsCurrentAdd(newValue ?? false);
                                          setAddress(commonvm.IsCurrentAdd);
                                        },
                                      );
                                    }
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Same as above",style: CustomTextStyle.txt16kyctxtgrey,),
                              )
                            ],
                          )
                      ),

                      SizedBox(
                        height: 10,
                      ),
                      Container(
                          height: 45,
                          child:
                          CustomTextFieldicon(
                              localsvg: LocalSVGImages.stategreen,
                              labeliconUnselected: LocalSVGImages.state,
                              textInputType: TextInputType.name,
                              txtalign: TextAlign.left,
                              onChanged: (value) {
                                // dataModel.setTextFieldValue(value);
                                _userAgeProvider.setUserPermAddress(value);
                              },
                              validator: (value) {
                                if(value == null ||  value.isEmpty){
                                  return 'Please enter permanent address';
                                }
                                return null;
                              },
                              labelicon: Icons.home_outlined,
                              hintText: 'Permanent Address',
                              controller: _userPermAddcontroller
                          )

                      ),

                      SizedBox(
                        height: 20,
                      ),

                      Container(
                        height: 50,
                        width: devicewidth,
                        //    color: Colors.red,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                //color: Colors.yellow,
                                child: Hero(
                                  tag: 'prooftype',
                                  child: Padding(
                                      padding: const EdgeInsets.all(0),
                                      child: Icon(Icons.add_card,size: 22,color:_userAgeProvider.UserProofSelect?Appcolors.splashbgcolor: Appcolors.kyctxtgrey,)
                                    /* SvgPicture.asset(
                                        LocalSVGImages.profession,
                                        height: 25,
                                        width: 16),*/
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 8,
                              child: Container(
                                //   color: Colors.red,
                                child: CustomDropdown(
                                  underlinecolor: Appcolors.kyctxtgrey,
                                  iconcolor: Appcolors.kyctxtgrey,
                                  // textdecoration: CustomTextStyle.txt16kyctxtgrey,
                                  textdecoration: CustomTextStyle.txt16Rrblk,
                                  devicewidth: devicewidth / 2 + 10,
                                  selectedValue: uservm.UserProofType,
                                  options: [
                                    'Aadhar',
                                    'Passport',
                                    'Driving License'
                                  ],
                                  onChanged: (value) {
                                    _userAgeProvider.setUserProofType(value ?? "");
                                    _userAgeProvider.setUserProofSelect(true);
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),


                      buildSizedBox(width: 0, height: 25),

                      CommonDottedBorder(
                        storeddata: getStoredImage(_profileViewModel.profileResponseModel?.user?.idProof,0),
                          idproof: _aadhar,
                          tagname: "aadharupload",
                          uploadtxt:
                          'Id proof Upload',
                          onPressed: () {
                          _userAgeProvider.setUserProofSelect(false);
                            _pickimage2(false, false, 0);
                            print('photo upload clicked ${_image}');
                          }),

                      buildSizedBox(width: 0, height: 25),
                      CommonDottedBorder(
                          storeddata: getStoredImage(_profileViewModel.profileResponseModel?.user?.idProof,1),
                          idproof: _cmpyownership,
                          tagname: "ownership",
                          uploadtxt:
                          'Proof of Company ownership (Optional)',
                          onPressed: () {
                            _pickimage2(false, false, 6);
                            print('photo upload clicked ${_cmpyownership}');
                          }),


                      buildSizedBox(width: 0, height: 20),
                      CommonDottedBorder(
                          storeddata: getStoredImage(_profileViewModel.profileResponseModel?.user?.idProof,2),
                          idproof: _pancard,
                          tagname: "PANupload",
                          uploadtxt: 'PAN Upload',
                          onPressed: () {
                            print('ID upload clicked');
                            _pickimage2(false, false, 1);
                          }),

                      buildSizedBox(width: 0, height: 25),
                      CommonDottedBorder(
                          storeddata: getStoredImage(_profileViewModel.profileResponseModel?.user?.idProof,3),
                          idproof: _recognition,
                          tagname: "Recognition",
                          uploadtxt:
                          'Recognition/Accolades as an Advisor (if any) (Optional)',
                          onPressed: () {
                            _pickimage2(false, false, 7);
                            print('photo upload clicked ${_recognition}');
                          }),


                      buildSizedBox(width: 0, height: 20),
                      CommonDottedBorder(
                          storeddata: getStoredImage(_profileViewModel.profileResponseModel?.user?.idProof,4),
                          idproof: _cancelledcheque,
                          tagname: "Chequeupload",
                          uploadtxt: 'Cancelled Cheque (Optional)',
                          onPressed: () {
                            print('ID upload clicked');
                            _pickimage2(false, false, 2);
                          }),

                      buildSizedBox(width: 0, height: 25),
                      CommonDottedBorder(
                          storeddata: getStoredImage(_profileViewModel.profileResponseModel?.user?.idProof,5),
                          idproof: _SEBI,
                          tagname: "SEBI",
                          uploadtxt:
                          'SEBI Registration Certificate (Optional)',
                          onPressed: () {
                            _pickimage2(false, false, 8);
                            print('photo upload clicked ${_SEBI}');
                          }),

                      buildSizedBox(width: 0, height: 20),
                      Container(
                        width: devicewidth,
                        //color: Colors.red.shade50,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text("Months/Years as an Unlisted Stocks/Equities Dealer", style: CustomTextStyle.txt14kyctxtgrey,),
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                       height: 50,
                                        width: 50,
                                        // color: Colors.green,
                                        child: TextFormField(
                                          controller: _userExpcontroller,
                                          maxLength: 2,
                                          validator: (value) {
                                            if(value == null ||  value.isEmpty){
                                              return 'Experience';
                                            }
                                            return null;
                                          },
                                          decoration: InputDecoration(
                                            counter: Offstage(),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 1, color: Appcolors.kyctxtgrey),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 1, color: Appcolors.splashbgcolor),
                                            ),

                                          ),
                                          keyboardType: TextInputType.number,
                                        ),
                                      ),
                                    ),
                                    Container(

                                      width: 100,
                                      // color: Colors.red,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Consumer<UserageProvider>(builder: (context, uservm, child) {
                                          return
                                            CustomDropdown(
                                              underlinecolor: Appcolors.kyctxtgrey,
                                              iconcolor: Appcolors.kyctxtgrey,
                                              // textdecoration: CustomTextStyle.txt16kyctxtgrey,
                                              textdecoration: CustomTextStyle.txt16Rrblk,
                                              devicewidth: 100,
                                              selectedValue: uservm.UserExp,
                                              options: [
                                                'Years',
                                                'Month',
                                              ],
                                              onChanged: (value) {
                                                _userAgeProvider.setUserExp(value ?? "");
                                              },
                                            );
                                        }
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),



                      SizedBox(
                        height: 20,
                      ),

                      Container(
                        height: 110,
                        width: devicewidth,
                       //  color: Colors.red.shade50,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Container(
                              height: 30,
                              child: Text("Specialty or Expertise as an Unlisted Stocks/Equities Dealer",style: CustomTextStyle.txt14kyctxtgrey,),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                                height: 45,
                                child:
                                CustomTextFieldicon(
                                    localsvg: LocalSVGImages.usergreen,
                                    labeliconUnselected: LocalSVGImages.usergrey,
                                    textInputType: TextInputType.name,
                                    txtalign: TextAlign.left,
                                    onChanged: (value) {
                                      // dataModel.setTextFieldValue(value);
                                      _userAgeProvider.setDealerSpeciality(value);
                                    },
                                    validator: (value) {
                                      if(value == null ||  value.isEmpty){
                                        return 'Please enter speciality';
                                      }
                                      return null;
                                    },
                                    labelicon: Icons.folder_special_outlined,
                                    hintText: 'speciality',
                                    controller: _dealersplcontroller
                                )

                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Top 3 Big volume Unlisted deals done (if any)",style: CustomTextStyle.txt14kyctxtgrey),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                                height: 45,
                                child:
                                CustomTextFieldicon(
                                    localsvg: LocalSVGImages.usergreen,
                                    labeliconUnselected: LocalSVGImages.usergrey,
                                    textInputType: TextInputType.name,
                                    txtalign: TextAlign.left,
                                    onChanged: (value) {
                                      // dataModel.setTextFieldValue(value);
                                      _userAgeProvider.setTopDeal1(value);
                                    },
                                    validator: (value) {
                                      if(value == null ||  value.isEmpty){
                                        return 'Please enter Deals done';
                                      }
                                      return null;
                                    },
                                    labelicon: Icons.work_outline,
                                    hintText: '',
                                    controller: _TB1controller
                                )

                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                                height: 45,
                                child:
                                CustomTextFieldicon(
                                    localsvg: LocalSVGImages.usergreen,
                                    labeliconUnselected: LocalSVGImages.usergrey,
                                    textInputType: TextInputType.name,
                                    txtalign: TextAlign.left,
                                    onChanged: (value) {
                                      // dataModel.setTextFieldValue(value);
                                      _userAgeProvider.setTopDeal2(value);
                                    },
                                    validator: (value) {
                                      if(value == null ||  value.isEmpty){
                                        return 'Please enter Deals done';
                                      }
                                      return null;
                                    },
                                    labelicon: Icons.work_outline,
                                    hintText: '',
                                    controller: _TB2controller
                                )

                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                                height: 45,
                                child:
                                CustomTextFieldicon(
                                    localsvg: LocalSVGImages.usergreen,
                                    labeliconUnselected: LocalSVGImages.usergrey,
                                    textInputType: TextInputType.name,
                                    txtalign: TextAlign.left,
                                    onChanged: (value) {
                                      // dataModel.setTextFieldValue(value);
                                      _userAgeProvider.setTopDeal3(value);
                                    },
                                    validator: (value) {
                                      if(value == null ||  value.isEmpty){
                                        return 'Please enter Deals done';
                                      }
                                      return null;
                                    },
                                    labelicon: Icons.work_outline,
                                    hintText: '',
                                    controller: _TB3controller
                                )

                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Client Master/Depository Details",style: CustomTextStyle.txt14kyctxtgrey),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                                height: 45,
                                child:
                                CustomTextFieldicon(

                                    localsvg: LocalSVGImages.usergreen,
                                    labeliconUnselected: LocalSVGImages.usergrey,
                                    textInputType: TextInputType.name,
                                    txtalign: TextAlign.left,
                                    onChanged: (value) {
                                      // dataModel.setTextFieldValue(value);
                                      _userAgeProvider.setDepository1(value);
                                    },
                                    validator: (value) {
                                      if(value == null ||  value.isEmpty){
                                        return 'Please enter Depository Participant';
                                      }
                                      return null;
                                    },
                                    labelicon: Icons.home_outlined,
                                    hintText: 'Name of the Depository Participant',
                                    controller: _Dep1controller
                                )

                            ),

                            SizedBox(
                              height: 10,
                            ),
                            Container(
                                height: 45,
                                child:
                                CustomTextFieldicon(
                                    localsvg: LocalSVGImages.usergreen,
                                    labeliconUnselected: LocalSVGImages.usergrey,
                                    textInputType: TextInputType.name,
                                    txtalign: TextAlign.left,
                                    onChanged: (value) {
                                      // dataModel.setTextFieldValue(value);
                                      _userAgeProvider.setDepository2(value);
                                    },
                                    validator: (value) {
                                      if(value == null ||  value.isEmpty){
                                        return 'DP ID';
                                      }
                                      return null;
                                    },
                                    labelicon: Icons.home_outlined,
                                    hintText: 'Depository Participant DP ID',
                                    controller: _Dep2controller
                                )

                            ),

                            SizedBox(
                              height: 10,
                            ),
                            Container(
                                height: 45,
                                child:
                                CustomTextFieldicon(
                                    localsvg: LocalSVGImages.usergreen,
                                    labeliconUnselected: LocalSVGImages.usergrey,
                                    textInputType: TextInputType.name,
                                    txtalign: TextAlign.left,
                                    onChanged: (value) {
                                      // dataModel.setTextFieldValue(value);
                                      _userAgeProvider.setDepository3(value);
                                    },
                                    validator: (value) {
                                      if(value == null ||  value.isEmpty){
                                        return 'Please enter Depository';
                                      }
                                      return null;
                                    },
                                    labelicon: Icons.home_outlined,
                                    hintText: 'Depository',
                                    controller: _Dep3controller
                                )

                            ),

                            SizedBox(
                              height: 10,
                            ),
                            Container(
                                height: 45,
                                child:
                                CustomTextFieldicon(
                                    localsvg: LocalSVGImages.usergreen,
                                    labeliconUnselected: LocalSVGImages.usergrey,
                                    textInputType: TextInputType.name,
                                    txtalign: TextAlign.left,
                                    onChanged: (value) {
                                      // dataModel.setTextFieldValue(value);
                                      _userAgeProvider.setDepository4(value);
                                    },
                                    validator: (value) {
                                      if(value == null ||  value.isEmpty){
                                        return 'Please enter Client DP ID';
                                      }
                                      return null;
                                    },
                                    labelicon: Icons.home_outlined,
                                    hintText: 'Client DP ID',
                                    controller: _Dep4controller
                                )

                            ),
                            SizedBox(
                              height: 20,
                            ),
                            CommonDottedBorder(
                                storeddata: getStoredImage(_profileViewModel.profileResponseModel?.user?.idProof,6),
                                idproof: _dematdetails,
                                tagname: "Dematupload",
                                uploadtxt: 'Client Master/Demat Details Upload (Optional)',
                                onPressed: () {
                                  print('ID upload clicked');
                                  _pickimage2(false, false, 3);
                                }),
                          ],
                        ),
                      ),

                      Consumer<CommonProvider>(
                          builder: (context, commonvm, child) {
                            return AgreementCheckbox(
                              IsSendEq: false,
                              value: commonvm.IsChecked,
                              label: 'I hereby declare that the information provided in this form is accurate and complete. I confirm that any information is found incorrect and/or incomplete that leads a violation of regulations may initiate legal actions, and I accept that I am the responsible party for any and all charges, penalties and violations.',
                              onChanged: (bool? newValue) {
                                _commonProvider.setIsChecked(newValue ?? false);
                              },
                            );
                          }
                      ),

                      Padding(
                          padding:
                          const EdgeInsets.only(top: 38.0, left: 18, right: 18),
                          child: Consumer<RegisterViewModel>(
                              builder: (context, registerviewmodel, child) {
                                return registerviewmodel.state == ViewState.busy
                                    ? const Loader() :
                                Container(
                                  height: 50,
                                  width: devicewidth,
                                  child: CustomMaterialButton(
                                    text: 'Submit',
                                    onPressed: () {
                                      _userresidence = _userAgeProvider.UserResidence;
                                      _userPAN = _userAgeProvider.UserPan;
                                      _userCurrentAdd = _userAgeProvider.UserCurrentAddress;
                                      _userPermAdd = _userAgeProvider.UserPermAddress;
                                      _userProofType = _userAgeProvider.UserProofType;

                                      /*  residential:Resident Individual
                                      pan_number:12345678
                                      current_address:coimbatore
                                      permanent_address:erode
                                      id_proof_type:Aadhar Card
                                      service_year:30
                                      usual_return:5
                                      timeframe:10 month
                                      risk:high
                                      expertise:ddd
                                      volume_deals_done:ddd
                                      name_depository:ddd
                                      depository_participant_dp_id:dd
                                      depository:dd
                                      depository_client_dp_id:dd*/

                                      Map<String, dynamic> kycparms = {
                                        "residential": _userresidence,
                                        "pan_number": _userPAN,
                                        "current_address": _userCurrentAdd,
                                        "permanent_address": _userPermAdd,
                                        "id_proof_type": _userProofType,
                                        "service_year":"${_userExpcontroller.text} ${_userAgeProvider.UserExp}",
                                        "expertise":"${_userAgeProvider.DealerSPeciality}",
                                        "volume":"${_userAgeProvider.TopDeal1}",
                                        "deals":"${_userAgeProvider.TopDeal2}",
                                        "done":"${_userAgeProvider.TopDeal3}",
                                        "name_depository":"${_userAgeProvider.Depository1}",
                                        "depository_participant_dp_id":"${_userAgeProvider.Depository2}",
                                        "depository":"${_userAgeProvider.Depository3}",
                                        "depository_client_dp_id":"${_userAgeProvider.Depository4}",
                                      };
                                      print('pan-- ${_pancard} '
                                          'idproof-- ${_aadhar} '
                                          'propic -- ${_image} '
                                          'ownership --- ${_cmpyownership} '
                                          'demat --- ${_dematdetails} '
                                          'cancelled chq --- ${_cancelledcheque} '
                                          'sebi ${_SEBI}');



                                      if(_formKey.currentState!.validate()){

                                        if(!widget.IsKycUpdate) {
                                          if (_aadhar != null && _pancard != null) {
                                            _commonProvider.IsChecked
                                                ?
                                            _registerViewModel.KycAdvisorapi(
                                                isKycupdate:false,
                                                onFailureRes: onFailureRes,
                                                onSuccessRes: onSuccessRes,
                                                propic: _image,
                                                idproofpic: _aadhar!,
                                                pancard: _pancard!,
                                                cancelledcheque: _cancelledcheque,
                                                companyownership: _cmpyownership,
                                                recognition: _recognition,
                                                sebi: _SEBI,
                                                dematdetails: _dematdetails,
                                                kycparams: kycparms)
                                                : showToast(
                                                "Please agree with declarations.");
                                          } else {
                                            if (_image == null) {
                                              showToast(
                                                  "upload profile picture");
                                            }
                                            else if (_aadhar == null) {
                                              showToast("upload id proof");
                                            }
                                            else {
                                              showToast("upload PAN");
                                            }
                                          }

                                        }
                                        else{

                                          Map<String, dynamic> kycparms2 = {
                                            "residential": _userresidence,
                                            "pan_number": _userpancontroller.text ,
                                            "current_address": _userCurrentAddcontroller.text,
                                            "permanent_address": _userPermAddcontroller.text ,
                                            "id_proof_type": _userProofType,
                                            "service_year":"${_userExpcontroller.text}",
                                            "expertise":"${_dealersplcontroller.text}",
                                            "volume":"${_TB1controller.text}",
                                            "deals":"${_TB2controller.text}",
                                            "done":"${_TB3controller.text}",
                                            "name_depository":"${_Dep1controller.text}",
                                            "depository_participant_dp_id":"${_Dep2controller.text}",
                                            "depository":"${_Dep3controller.text}",
                                            "depository_client_dp_id":"${_Dep4controller.text}",
                                          };
                                          print('kyc param ${kycparms2}');
                                          _commonProvider.IsChecked ?

                                          _registerViewModel.KycUpdateapi(
                                              isKycupdate:true,
                                              onFailureRes: onFailureRes,
                                              onSuccessRes: onUpdateSuccessRes,
                                              propic: _image,
                                              idproofpic: _aadhar,
                                              pancard: _pancard,
                                              cancelledcheque: _cancelledcheque,
                                              companyownership: _cmpyownership,
                                              recognition: _recognition,
                                              sebi: _SEBI,
                                              dematdetails: _dematdetails,
                                              kycparams: kycparms2)
                                              : showToast("Please agree with declarations.");
                                        }
                                      } else{
                                        showToast("Enter All Fields.");
                                      }
                                      //  print('kyc complete pressed! ${kycparms}');
                                    },
                                  ),
                                );
                              })
                      ),
                      buildSizedBox(height: 20, width: 10),
                      Text("(You can upload all documents later, but you will be verified to use the application only after your documents are uploaded and approved successfully)",
                        style: CustomTextStyle.txt12Rltxtgry,),
                      buildSizedBox(height: 20, width: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Text("finish this later?",
                            style: CustomTextStyle.txt12Rltxtgry,),
                          GestureDetector(
                              onTap: (){
                                Route route = MaterialPageRoute(builder: (context) => SaudaHomePage());
                                Navigator.pushReplacement(context, route);
                              },
                              child: Text(" skip", style: CustomTextStyle.txt14Rrtxtgry2,)),
                        ],
                      ),
                      buildSizedBox(height: 30, width: 10),
                    ],
                  ),
                );
              }
              ),
            ),
          ),
        )

    );
  }

  onFailureRes(String error) {
    Logger.appLogs('onOtpFailureRes:: $error');
    errorAlert(context, error);
  }

  onSuccessRes(RegisterModel? registerResponse) {
    _userNameProvider.setUserNameValue("");
    _userAgeProvider.clearTextFieldValue();

    _userEmailProvider.clearTextFieldValue();


    // Navigator.push(context, MaterialPageRoute(builder: (context)=> SelectPayment()));
    Route route = MaterialPageRoute(builder: (context) => SelectPayment());
    Navigator.pushReplacement(context, route);
  }

  Future<String> fileToString(File file) async {
    try {
      String content = await file.readAsString();
      return content;
    } catch (error) {
      print('Error reading file: $error');
      return '';
    }
  }

  void _showCustomDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomAlertDialog(
            title: 'Upload Image',
            content: 'Select image from',
            firstOptionText: 'Camera',
            secondOptionText: 'Gallery',
            firstOptionCallback: () {
              print('User clicked Camera');
              _pickimage2(true, true, 4);
              // Perform action for Yes option
            },
            secondOptionCallback: () {
              print('User clicked Gallery');
              _pickimage2(true, false, 5);
              // Perform action for No option
            },
          );
        });
  }

  void ChooseFile(int i) async {
    if (Constant.isPermissionGranted) {
      //navigateToNextPage();
      print('camera is granted');

      final ImagePicker _picker = ImagePicker();
      final XFile? image = await _picker.pickImage(
          source: ImageSource.gallery);

      if (image != null) {
        setState(() {
          switch (i) {
            case 0:
              _aadhar = File(image.path);
              print('aadhar ---${_aadhar}');
              break;
            case 1:
              _pancard = File(image.path);
              print('_pancard ---${_pancard}');
              break;
            case 2:
              _cancelledcheque = File(image.path);
              print('_cancelledcheque ---${_cancelledcheque}');
              break;
            case 3:
              _dematdetails = File(image.path);
              print('_dematdetails ---${_dematdetails}');
              break;
            case 6:
              _cmpyownership = File(image.path);
              print('_cmpyownership ---${_cmpyownership}');
              break;
            case 7:
              _recognition = File(image.path);
              print('_recognition ---${_recognition}');
              break;
            case 8:
              _SEBI = File(image.path);
              print('_SEBI ---${_SEBI}');
              break;
          }

        });
      }
    }
  }

  void setAddress(bool isCurrentAdd) {
    if(isCurrentAdd){
      _userAgeProvider.setUserPermAddress(_userAgeProvider.UserCurrentAddress);
      _userPermAddcontroller.text = _userAgeProvider.UserCurrentAddress;
    }else{
      _userPermAddcontroller.text ="";
      _userAgeProvider.setUserPermAddress("");
    }
  }

  void setDealersKycData(List<UserMetaData> usermetadata,) {

   /* _usernamecontroller.text = _profileViewModel.profileResponseModel?.user?.name ?? "";
    _useremailcontroller.text = _profileViewModel.profileResponseModel?.user?.email ?? "";
    _useraboutcontroller.text = _profileViewModel.profileResponseModel?.user?.about ?? "";*/

   // print('userMetaData list ${usermetadata.length}');
    String?  pancard = "pan_number";
    String?  currentaddress = "current_address";
    String?  permaddress = "permanent_address";
    String?  residential = "residential";
    String?  experience = "service_year";
    String?  speciality = "expertise";
    String?  volume = "volume";
    String?  deals = "deals";
    String?  done = "done";
    String?  depo1 = "name_depository";
    String?  depo2 = "depository_participant_dp_id";
    String?  depo3 = "depository";
    String?  depo4 = "depository_client_dp_id";
    String? savedpannumber;
    String? savedcurntaddress;
    String? savedpermaddress;
    String? savedresidential;
    String? savedexperience;
    String? savedspeciality;
    String? savedvolume;
    String? saveddeals;
    String? saveddone;
    String? saveddepo1;
    String? saveddepo2;
    String? saveddepo3;
    String? saveddepo4;

    for (UserMetaData item in usermetadata) {
      if (item.key == pancard) {
        savedpannumber = item.value;
        print('savedpannumber ${savedpannumber}');
        _userpancontroller.text = savedpannumber ?? "";
      }
      else if(item.key == currentaddress){
        savedcurntaddress = item.value;
        print('savedcurntaddress ${savedcurntaddress}');
        _userCurrentAddcontroller.text = savedcurntaddress ?? "";
      }
      else if(item.key == permaddress){
        savedpermaddress = item.value;
        print('savedpermaddress ${savedpermaddress}');
        _userPermAddcontroller.text = savedpermaddress ?? "";
      }
      else if(item.key == experience){
        savedexperience = item.value;
       // savedexperience = "1 Month";
        print('savedexperience ${savedexperience}');
        if(savedexperience?.length == 8){
           Removedresult = savedexperience?.substring(3); //if years/months in double digit
         }else if(savedexperience?.length == 7){
           Removedresult = savedexperience?.substring(2);
         }else if(savedexperience?.length == 1){
          Removedresult = "Years";
        }
         print("removed 3 letter ${Removedresult}");
        _userAgeProvider.setUserExp(Removedresult ?? "");
        if(savedexperience != null && Removedresult != null && Removedresult == "Month"){
          _userExpcontroller.text = savedexperience.replaceAll(' Month', '');
        }else if(savedexperience != null && Removedresult != null && Removedresult == "Years"){
          _userExpcontroller.text = savedexperience.replaceAll(' Years', '') ?? "";
        }else{
          _userExpcontroller.text = savedexperience ?? "";
        }

      }
      else if(item.key == speciality){
        savedspeciality = item.value;
        print('savedexperience ${savedspeciality}');
        _dealersplcontroller.text = savedspeciality ?? "";
      }
      else if(item.key == volume){
        savedvolume = item.value;
        _TB1controller.text = savedvolume ?? "";
      } else if(item.key == deals){
        saveddeals = item.value;
        _TB2controller.text = saveddeals ?? "";
      } else if(item.key == done){
        saveddone = item.value;
        _TB3controller.text = saveddone ?? "";
      }
      else if(item.key == depo1){
        saveddepo1 = item.value;
        print('saveddepo1 ${saveddepo1}');
        _Dep1controller.text = saveddepo1 ?? "";
      }
      else if(item.key == depo2){
        saveddepo2 = item.value;
        print('saveddepo2 ${saveddepo2}');
        _Dep2controller.text = saveddepo2 ?? "";
      }
      else if(item.key == depo3){
        saveddepo3 = item.value;
        print('saveddepo3 ${saveddepo3}');
        _Dep3controller.text = saveddepo3 ?? "";
      }
      else if(item.key == depo4){
        saveddepo4 = item.value;
        print('saveddepo4 ${saveddepo4}');
        _Dep4controller.text = saveddepo4 ?? "";
      }

      else if(item.key == residential) {
        savedresidential = item.value;
        print('savedresidential ${savedresidential}');
        _userAgeProvider.setUserResidence(savedresidential ?? "");

      }
    }



  }

  void setDealerIdproof( List<IdProof> idproof) {
    print('IdProof item ${idproof.length}');
    String?  idproofname1 = "Aadhar";
    String?  idproofname2 = "Passport";
    String?  idproofname3 = "Voter ID";
    String?  idproofname4 = "Driving License";
    String? savedAadhar;
    for (IdProof item in idproof) {
      print('IdProof item ${item}');
      if(item.name == idproofname1){
        savedAadhar =item.name;
        print('savedAadhar ${savedAadhar}');
        _userAgeProvider.setUserProofType(savedAadhar ?? "");
      }else if(item.name == idproofname2){
        savedAadhar =item.name;
        print('savedAadhar ${savedAadhar}');
        _userAgeProvider.setUserProofType(savedAadhar ?? "");
      }else if(item.name == idproofname3){
        savedAadhar =item.name;
        print('savedAadhar ${savedAadhar}');
        _userAgeProvider.setUserProofType(savedAadhar ?? "");
      }else if(item.name == idproofname4){
        savedAadhar =item.name;
        print('savedAadhar ${savedAadhar}');
        _userAgeProvider.setUserProofType(savedAadhar ?? "");
      }
    }
  }

  setImage(File? image, String  registerpropic) {
    if(!widget.IsKycUpdate){
      if (image == null) {
       // return SvgPicture.asset(LocalSVGImages.perplh);
        if (registerpropic == null || registerpropic.isEmpty) {
          return SvgPicture.asset(LocalSVGImages.perplh);
        } else {
          print('pro edit image ${registerpropic}');
          return Image.network(
            registerpropic,
            fit: BoxFit.cover,);
        }
      } else {
       return Image.file(_image!, fit: BoxFit.cover,);
      }

    }else {
      if(image == null) {
        if (_profileViewModel.profileResponseModel?.user?.photoUrl == null ||
            _profileViewModel.profileResponseModel!.user!.photoUrl!.isEmpty) {
          return SvgPicture.asset(LocalSVGImages.perplh);
        } else {
          print('pro edit image ${_profileViewModel.profileResponseModel?.user?.photoUrl}');
          return Image.network(
            _profileViewModel.profileResponseModel!.user!.photoUrl!,
            fit: BoxFit.cover,);
        }
      }
      else{
        return Image.file(_image!, fit: BoxFit.cover,);
      }
    }

  }

  onUpdateSuccessRes(StatusandMessageModel? p1) {
    _profileViewModel.profileapi(onFailureRes: onProfileFailureRes,onSuccessRes: onProfileSuccessRes);
  }

  getStoredImage(List<IdProof>? StoredidProof,int proofcode) {
    print('StoredidProof item ${StoredidProof?.length}');
    String?  idproofname = "Aadhar";
    String?  companyproof = "Company ownership";
    String?  pancard = "Pan Card";
    String?  Recognitions = "Recognitions";
    String?  CancelledCheque = "Cancelled Cheque";
    String?  SEBIreg = "SEBI Registration Certificate";
    String?  ClientMaster = "Client Master";
    String? savedaadharimage;
    String? savedcmpnyproofimage;
    String? savedpanimage;
    String? savedrecogimage;
    String? savedcancldcqeimage;
    String? savedsebiimage;
    String? savedclientmastrimage;
   if(isKycEdit){
    if(StoredidProof != null && StoredidProof.isNotEmpty){
      switch(proofcode){
        case 0:
          return AddProof(StoredidProof,savedaadharimage,idproofname,_aadhar);
      //    print('fun check--- ${ AddProof(StoredidProof,savedaadharimage,idproofname)}');
                   /*for (IdProof item in StoredidProof) {
            print('StoredidProof item ${item}');
            if(item.name == idproofname){
              savedaadharimage =item.proofUrl;
              print('savedaadharimage ${savedaadharimage}');
              return savedaadharimage;
            }
          }*/
          break;
        case 1:
       return   AddProof(StoredidProof,savedcmpnyproofimage,companyproof,_cmpyownership);
         /* for (IdProof item in StoredidProof) {
            print('StoredidProof item ${item}');
            if(item.name == companyproof){
              savedcmpnyproofimage =item.proofUrl;
              print('savedcmpnyproofimage ${savedcmpnyproofimage}');
              return savedcmpnyproofimage;
            }
          }*/
        case 2:
          return   AddProof(StoredidProof,savedpanimage,pancard,_pancard);
        case 3:
            return AddProof(StoredidProof, savedrecogimage, Recognitions,_recognition);
        case 4:
          return AddProof(StoredidProof, savedcancldcqeimage, CancelledCheque,_cancelledcheque);
        case 5:
          return AddProof(StoredidProof, savedsebiimage, SEBIreg,_SEBI);
        case 6:
            return AddProof(StoredidProof, savedclientmastrimage, ClientMaster,_dematdetails);
        }

    }else{
      return "";
    }
}
else{
  return "";
}


  }

  String? AddProof(List<IdProof> storedidProof, String? savedvariable, String checkproof, File? newselectedfile) {
if(newselectedfile != null){
  return "";
}else {
  for (IdProof item in storedidProof) {
    print('StoredidProof itemmmm ${item}');
    if (item.name == checkproof) {
      savedvariable = item.proofUrl;
      print('savedvariablennnnn ${savedvariable}');
      return savedvariable ?? "";
    }
  }
}
   }

  onProfileFailureRes(String p1) {
  }

  onProfileSuccessRes(ProfileResponseModel? p1) {
    Navigator.pop(context);
  }
}



