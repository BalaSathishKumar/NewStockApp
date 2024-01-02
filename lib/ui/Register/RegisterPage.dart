
import 'package:base_flutter_provider_project/data/models/LocationsModel/CityModel.dart';
import 'package:base_flutter_provider_project/data/models/LocationsModel/ProfessionModel.dart';
import 'package:base_flutter_provider_project/data/models/LocationsModel/StateModel.dart';
import 'package:base_flutter_provider_project/data/models/StatusandMessageModel.dart';
import 'package:base_flutter_provider_project/data/models/register_model/RegisterModel.dart';
import 'package:base_flutter_provider_project/ui/home/homepage.dart';
import 'package:base_flutter_provider_project/ui/Dealers/select_payment.dart';
import 'package:base_flutter_provider_project/ui/welcome/welcome.dart';
import 'package:base_flutter_provider_project/viewModel/profession_view_model.dart';
import 'package:base_flutter_provider_project/viewModel/profile_view_model.dart';
import 'package:base_flutter_provider_project/viewModel/register_viewmodel.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

import '../../common_widgets/alert_widgets/YesorNo_dialog.dart';
import '../../common_widgets/alert_widgets/permission_prompt.dart';
import '../../common_widgets/appbar_widgets/common_appbar.dart';
import '../../common_widgets/button_widgets/common_button.dart';
import '../../common_widgets/dropdown_widgets/CityDropDown.dart';
import '../../common_widgets/dropdown_widgets/ProfessionDropDown.dart';
import '../../common_widgets/dropdown_widgets/StateDropDown.dart';
import '../../common_widgets/dropdown_widgets/CommonDottedBorder.dart';
import '../../common_widgets/dropdown_widgets/common_dropdown.dart';
import '../../common_widgets/loading_widgets/loader.dart';
import '../../common_widgets/textfields_widgets/TextFieldwithProvider.dart';
import '../../common_widgets/textfields_widgets/common_textfield_withicon.dart';
import '../../constants/colors.dart';
import '../../constants/constant.dart';
import '../../constants/local_images.dart';
import '../../data/models/dashboard_model/ProfileResponseModel.dart';
import '../../utils/SharedHelper/PreferenceHelper.dart';
import '../../utils/SharedHelper/Preference_Constant.dart';
import '../../utils/common_functions.dart';
import '../../utils/common_textstyles.dart';
import '../../utils/logger.dart';
import '../../viewModel/base_view_model/base_view_model.dart';
import '../kyc/KYC_Advisor.dart';
import '../kyc/KYC_Dealer.dart';
import '../kyc/NewKycUser.dart';

class RegisterPage extends StatefulWidget {
  final bool IsProfileEdit;
  final bool? IsRegandKy;
  const RegisterPage({Key? key,required this.IsProfileEdit,this.IsRegandKy}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String _selectedOption = 'Select Roll';

  File? _image = null;
  File? _idproof = null;

  String _imagestring = "";
  String _idproofstring = "";

  late RegisterViewModel _registerViewModel;
  late ProfileViewModel _profileViewModel;
  late UserageProvider _userAgeProvider;
  late UserNameProvider _userNameProvider;
  late UserEmailProvider _userEmailProvider;
  late ProfessionViewModel _professionViewModel;
  bool get isProEdit => widget.IsProfileEdit;
  String? _setTime, _setDate;

  String? _hour, _minute, _time;

  String? dateTime;
  DateTime selectedDate = DateTime.now();

  TimeOfDay selectedTime = TimeOfDay(hour: 00, minute: 00);

  TextEditingController _dateController = TextEditingController();
  TextEditingController _timeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(1950),
        lastDate: DateTime(2101),
       builder: (BuildContext context, Widget? child) {
         return Theme(
           data: ThemeData.dark().copyWith(
             colorScheme: ColorScheme.dark(
               primary: Appcolors.splashbgcolor,
               onPrimary: Colors.white,
               surface: Appcolors.splashbgcolor,
               onSurface: Appcolors.black,
             ),
             dialogBackgroundColor: Appcolors.white,
           ),
           child: child!,
         );
       }
    );


    if (picked != null)
      setState(() {
        selectedDate = picked;
        _dateController.text = DateFormat.yMd().format(selectedDate);
        _userAgeProvider.setUserDOBselect(true);
      });
  }


  void _showCustomDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomAlertDialog(
            title: 'Upload Image',
            content: '',
            firstOptionText: 'Camera',
            secondOptionText: 'Gallery',
            firstOptionCallback: () {
              print('User clicked Camera');
                 _pickimage2(true,true);
              // Perform action for Yes option
            },
            secondOptionCallback: () {
              print('User clicked Gallery');
                 _pickimage2(true,false);
              // Perform action for No option
            },
          );
        });}


  Future<void> _pickimage2(bool profile,bool camera) async {

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
          permissionPrompt2(context,profile,camera);
        });
      }


    }else {
      if (Constant.isPermissionGranted) {
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
      }

    }
  }

  Future<bool> requestPermission2(bool profile, bool camera) async {

  /*  var status = await Permission.manageExternalStorage.request();
    if (status.isGranted) {
      Constant.isPermissionGranted = status.isGranted;
    } else if (status.isPermanentlyDenied) {
      openAppSettings();
    }*/

    Constant.isPermissionGranted = await checkPermission();
    if (Constant.isPermissionGranted) {
      _pickimage2(profile,camera);
      return Constant.isPermissionGranted;
    }else{
     // openAppSettings();
      var status = await Permission.manageExternalStorage.request();
      if (status.isGranted) {
        Constant.isPermissionGranted = status.isGranted;
      } else if (status.isPermanentlyDenied) {
        openAppSettings();
  /*      Permission.camera.status.listen((status) {
          // Handle status changes here
        });*/
        // print('check status ${Constant.isPermissionGranted}');
        // Permission.camera.status.then((status) {
        //
        // });
      }
    }

  //  navigateToNextPage();
    return Constant.isPermissionGranted;
  }

  void permissionPrompt2(BuildContext context, bool profile, bool camera) {
    showDialog(
        context: context,
        builder: (context) {
          return PermissionPrompt(
            tapYes: () {
              Navigator.pop(context);
              requestPermission2(profile,camera);
            },
            tapCancel: () {
              Navigator.pop(context);
              //navigateToNextPage();
            },
          );
        });
  }
   TextEditingController _usernamecontroller = TextEditingController();
   TextEditingController _useremailcontroller = TextEditingController();
   TextEditingController _userreferralcontroller = TextEditingController();
   TextEditingController _useragecontroller = TextEditingController();
   TextEditingController _userfathernamecontroller = TextEditingController();
   TextEditingController _userdobcontroller = TextEditingController();
   TextEditingController _useraboutcontroller = TextEditingController();
@override
  void initState() {
    super.initState();
    _registerViewModel = Provider.of<RegisterViewModel>(context, listen: false);
    _profileViewModel = Provider.of<ProfileViewModel>(context, listen: false);

    _userAgeProvider = Provider.of<UserageProvider>(context, listen: false);
    _userNameProvider = Provider.of<UserNameProvider>(context, listen: false);
    _userEmailProvider = Provider.of<UserEmailProvider>(context, listen: false);
    _professionViewModel = Provider.of<ProfessionViewModel>(context, listen: false);

    if(isProEdit){
      print('proedit ${_profileViewModel.profileResponseModel?.user?.name}');
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _professionViewModel.ProfessionList.clear();
        _professionViewModel.StateList.clear();
        _professionViewModel.CityList.clear();
        _professionViewModel.professionapi(onFailureRes: onProfFailureRes, onSuccessRes: onProfSuccessRes);
        setUserDetails(_profileViewModel.profileResponseModel?.user?.userMetaData ?? []);
      });

    }else{
      _useragecontroller = TextEditingController(text: _userAgeProvider._userageValue);
      _usernamecontroller = TextEditingController(text: _userNameProvider._usernameValue);
      _useremailcontroller = TextEditingController(text: _userEmailProvider._useremailValue);
      _userfathernamecontroller = TextEditingController(text: _userAgeProvider._userfathername);
      _userdobcontroller = TextEditingController(text: _userAgeProvider._userfathername);
      _useraboutcontroller = TextEditingController(text: _userAgeProvider._userabout);


      WidgetsBinding.instance.addPostFrameCallback((_) {
        _professionViewModel.ProfessionList.clear();
        _professionViewModel.StateList.clear();
        _professionViewModel.CityList.clear();

       _professionViewModel.setUserProfession(null);
        _professionViewModel.setUserCity(null);
        _professionViewModel.setUserState(null);

        _userAgeProvider.setUserRollSelect(false);
        _userAgeProvider.setUserGenderSelect(false);
        _userAgeProvider.setUserProfessionSelect(false);
        _userAgeProvider.setUserStateSelect(false);
        _userAgeProvider.setUserCitySelect(false);
        _userAgeProvider.setUserDOBselect(false);


        _professionViewModel.professionapi(onFailureRes: onProfFailureRes, onSuccessRes: onProfSuccessRes);
      });

      // _dateController.text = DateFormat.yMd().format(DateTime.now());
   //   _dateController.text = "Enter your DOB";
    }
  }

  @override
  void dispose() {
    _useragecontroller.clear();
    _userfathernamecontroller.clear();
    _useraboutcontroller.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    var deviceheight = MediaQuery.of(context).size.height;
    var devicewidth = MediaQuery.of(context).size.width;

    String _username = "";
    String _useremail = "";
    String _userage = "";
    String _useroll = "";
    String _userfathername = "";
    String _userdob = "";
    String _userprofession = "";
    String _userstate = "";
    String _usercity = "";
    String _userabout = "";
    String _usergender = "";
    final dataModel = context.watch<UserageProvider>();
    final dataModelread = context.read<UserageProvider>();

    final FocusNode _focusNode = FocusNode();


    return Scaffold(
      backgroundColor: Appcolors.white,
      appBar: widget.IsRegandKy != null ? null : CustomAppBar(height: 60.0, title: widget.IsProfileEdit?'Update Profile':'Register', appbarclr: Appcolors.white,HideMenu: true),
      body: Form(
        key: _formKey,
        child: Container(
          height: deviceheight,
          width: devicewidth,
          child: SingleChildScrollView(
            child: Consumer<UserageProvider>(builder: (context, uservm, child) {
              return
                Padding(
                  padding: const EdgeInsets.only(right: 20.0, left: 20),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                          height: 50,
                          child: Text(
                              "We strongly recommend that you fill in your register forms to enjoy a faster buy & sell experience. ",
                              style: CustomTextStyle.txt14Rrtxtgry)),
                      Stack(
                        children: [
                          Container(
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
                                    child: setImage(_image)
                                    ),
                                ),
                              )),
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
                          height: 45,
                          child: CustomTextFieldicon(
                            localsvg: LocalSVGImages.usergreen,
                            textInputType: TextInputType.name,
                            txtalign: TextAlign.left,
                            onChanged: (value) {
                              _userNameProvider.setUserNameValue(value);
                            },
                            validator: (value) {
                              if(value == null ||  value.isEmpty){
                                return 'Please enter name';
                              }
                              return null;
                            },
                            labelicon: Icons.person_2_outlined,
                            labeliconUnselected: LocalSVGImages.usergrey,

                            hintText: 'Enter Name',
                            controller: _usernamecontroller,

                          )
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 45,
                        child: CustomTextFieldicon(
                          localsvg: LocalSVGImages.emailgreen,
                          labeliconUnselected: LocalSVGImages.emailgrey,
                          textInputType: TextInputType.emailAddress,
                          txtalign: TextAlign.left,
                          onChanged: (value) {
                            _userEmailProvider.setUserMailValue(value);
                          },
                          validator: (value) {
                            if(value == null ||  value.isEmpty){
                              return 'Please enter email';
                            }
                            return null;
                          },
                          labelicon: Icons.email_outlined,

                          hintText: 'Email ID',
                          controller: _useremailcontroller,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                          height: 45,
                          child:
                          CustomTextFieldicon(
                              localsvg: LocalSVGImages.usergreen,
                              labeliconUnselected: LocalSVGImages.usergrey,
                              textInputType: TextInputType.number,
                              txtalign: TextAlign.left,
                              onChanged: (value) {
                                // dataModel.setTextFieldValue(value);
                                _userAgeProvider.setUserAgeValue(value);
                              },
                              validator: (value) {
                                if(value == null ||  value.isEmpty){
                                  return 'Please enter age';
                                }
                                return null;
                              },
                              labelicon: Icons.person_2_outlined,
                              hintText: 'Enter your age',
                              controller: _useragecontroller
                          )
                      ),

                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 50,
                        width: devicewidth,
                      //     color: Colors.red,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                height: 50,
                             //   color: Colors.yellow,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 10.0,bottom: 10,right: 10),
                                  child: Hero(
                                    tag: 'gender',
                                    child: SvgPicture.asset(
                                      _userAgeProvider._usergenderselect?LocalSVGImages.gendergreen:LocalSVGImages.gender,
                                      ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 7,
                              child: Container(
                              //    color: Colors.red.shade50,
                                child: CustomDropdown(
                                  dropdwnicon: LocalSVGImages.dropdwn,
                                  underlinecolor: Appcolors.kyctxtgrey,
                                  iconcolor: Appcolors.kyctxtgrey,
                                  // textdecoration: CustomTextStyle.txt16kyctxtgrey,
                                  textdecoration: CustomTextStyle.txt16Rb,
                                  devicewidth: devicewidth / 2 + 10,
                                  selectedValue: uservm._usergender,
                                  options: ['Select gender','male', 'female', 'transgender'],
                                  onChanged: (value) {
                                    _userAgeProvider.setUserGender(value ?? "");
                                    _userAgeProvider.setUserGenderSelect(true);
                                    _userAgeProvider.setUserRollSelect(false);
                                    _userAgeProvider.setUserProfessionSelect(false);
                                    _userAgeProvider.setUserDOBselect(false);

                                    print('sss');
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                     SizedBox(
                        height:  isProEdit?0:20,
                      ),
                      isProEdit?  Container():Container(
                        height: 50,
                        width: devicewidth,
                           // color: Colors.red,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                height: 50,
                             //   color: Colors.yellow,
                                child: Hero(
                                  tag: 'accounttytpeicon',
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 10.0,bottom: 10,right: 10),
                                    child: SvgPicture.asset(
                                        _userAgeProvider._userRollselect?LocalSVGImages.accounttytpeicongreen:LocalSVGImages.accounttytpeicon,
                                     ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 7,
                              child: Container(
                                //   color: Colors.red,
                                child: CustomDropdown(
                                  dropdwnicon: LocalSVGImages.dropdwn,
                                  underlinecolor: Appcolors.kyctxtgrey,
                                  iconcolor: Appcolors.kyctxtgrey,
                                  // textdecoration: CustomTextStyle.txt16kyctxtgrey,
                                  textdecoration: CustomTextStyle.txt16Rb,
                                  devicewidth:devicewidth/2+10,
                                  selectedValue: _selectedOption,
                                  options: ['Select Roll','Users', 'Brokers', 'Advisors'],
                                  onChanged: (value) {
                                    _userAgeProvider.setUserRoll(value ?? "");
                                    _selectedOption = _userAgeProvider._userroll;
                                    _userAgeProvider.setUserRollSelect(true);
                                    _userAgeProvider.setUserGenderSelect(false);
                                    _userAgeProvider.setUserProfessionSelect(false);
                                    _userAgeProvider.setUserDOBselect(false);
                                /*    setState(() {
                                      _selectedOption = value!;
                                      print('selected roll ${_selectedOption}');
                                      _useroll = _selectedOption;
                                    });*/
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
                              localsvg: LocalSVGImages.usergreen,
                              labeliconUnselected: LocalSVGImages.usergrey,
                              textInputType: TextInputType.name,
                              txtalign: TextAlign.left,
                              onChanged: (value) {
                                // dataModel.setTextFieldValue(value);
                                _userAgeProvider.setUserRollSelect(false);
                                _userAgeProvider.setUserGenderSelect(false);
                                _userAgeProvider.setUserFathername(value);
                              },
                              validator: (value) {
                                if(value == null ||  value.isEmpty){
                                  return 'Please enter Father/ Spouse Name';
                                }
                                return null;
                              },
                              labelicon: Icons.person_2_outlined,
                              hintText: 'Father/ Spouse Name',
                              controller: _userfathernamecontroller
                          )

                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Stack(
                        children: [
                          GestureDetector(
                            onTap: (){
                              _selectDate(context);
                            },
                            child: Container(
                                height: 45,
                                child:
                                CustomTextFieldicon(
                                  localsvg: LocalSVGImages.usergreen,
                                  labeliconUnselected:    _userAgeProvider._userdobselect?LocalSVGImages.usergreen:LocalSVGImages.usergrey,
                                    textInputType: TextInputType.name,
                                    txtalign: TextAlign.left,
                                    onChanged: (value) {
                                      // dataModel.setTextFieldValue(value);
                                      print('DOBBB::: ${value}');
                                      },
                                    labelicon: Icons.person_2_outlined,
                                    hintText: 'Enter DOB',
                                    controller: _dateController,
                                  enabled: false,
                                )
                            ),
                          ),

                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 50,
                        width: devicewidth,
                         //   color: Colors.green,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                height: 50,
                               // color: Colors.yellow,
                                child: Hero(
                                  tag: 'profession',
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 10.0,bottom: 10,right: 10),
                                    child:
                                    SvgPicture.asset(
                                        _userAgeProvider._userprofession? LocalSVGImages.professiongreen:LocalSVGImages.profession,
                                        height: 25,
                                        width: 16),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 7,
                              child: Container(
                                //   color: Colors.red,
                                child:  Consumer<ProfessionViewModel>(builder: (context, professionvm, child) {
                                  print('consumrrr ${professionvm.UserProfession?.name} ');
                                  return
                                    ProfessionDropdown(
                                      dropdwnicon: LocalSVGImages.dropdwn,
                                      underlinecolor: Appcolors.kyctxtgrey,
                                      iconcolor: Appcolors.kyctxtgrey,
                                      // textdecoration: CustomTextStyle.txt16kyctxtgrey,
                                      textdecoration: CustomTextStyle.txt16Rb,
                                      devicewidth: devicewidth / 2 + 10,
                                      selectedValue: professionvm.UserProfession,
                                      // options: ['Male', 'Female', 'Transgender'],
                                      options: professionvm.ProfessionList,
                                      onChanged: (value) {
                                        if(value != null){
                                        _professionViewModel.setUserProfession(value);
                                         _userAgeProvider.setUserRollSelect(false);
                                          _userAgeProvider.setUserGenderSelect(false);
                                          _userAgeProvider.setUserProfessionSelect(true);
                                          _userAgeProvider.setUserDOBselect(false);
                                          _userAgeProvider.setUserCitySelect(false);
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

                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 50,
                        width: devicewidth,
                        //   color: Colors.red,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                height: 50,
                                //color: Colors.yellow,
                                child: Hero(
                                  tag: 'state',
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 10.0,bottom: 10,right: 10),

                                    child:
                                    SvgPicture.asset(
                                      _userAgeProvider._userstateselect?LocalSVGImages.stategreen: LocalSVGImages.state,
                                       ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 7,
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
                                    selectedValue: statevm.UserState,
                                    options: statevm.StateList,
                                    onChanged: (value) {
                                      if(value != null){
                                        _professionViewModel.setUserState(value);
                                        _professionViewModel.setUserCity(null);
                                        _userAgeProvider.setUserRollSelect(false);
                                        _userAgeProvider.setUserGenderSelect(false);
                                        _userAgeProvider.setUserProfessionSelect(false);
                                        _userAgeProvider.setUserDOBselect(false);
                                        _userAgeProvider.setUserCitySelect(false);
                                        _userAgeProvider.setUserStateSelect(true);
                                        print('selected State ${value.id}');
                                        print('statevm.CityList ${statevm.CityList.length}');
                                        statevm.CityList.clear();
                                        print('on click city dropdown ${_professionViewModel.CityList.length}');
                                        print('on click city dropdown22 ${_professionViewModel.UserCity?.name}');


                                        _professionViewModel.setNewCityId(value.id.toString());
                                        statevm.NewCityId != ""? _professionViewModel.cityapi(onFailureRes: onstateFailureRes,onSuccessRes: onCitySucres, cityid:   statevm.NewCityId ?? ""):Fun();
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
                                height: 50,
                                //color: Colors.yellow,
                                child: Hero(
                                  tag: 'city',
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 10.0,bottom: 10,right: 10),

                                    child:
                                    SvgPicture.asset(
                                        _userAgeProvider._usercityselect?LocalSVGImages.citygreen:LocalSVGImages.city,
                                        height: 25,
                                        width: 16),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 7,
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
                                    selectedValue: cityvm.UserCity,
                                    options: cityvm.CityList,
                                    onChanged: (value) {
                                      if(value != null){
                                        _userAgeProvider.setUserRollSelect(false);
                                        _userAgeProvider.setUserGenderSelect(false);
                                        _userAgeProvider.setUserProfessionSelect(false);
                                        _userAgeProvider.setUserStateSelect(false);
                                        _userAgeProvider.setUserDOBselect(false);
                                        _userAgeProvider.setUserCitySelect(true);
                                        cityvm.setUserCity(value);
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

                      SizedBox(
                        height:  isProEdit?  0: 20,
                      ),
                      isProEdit?  Container():   Container(
                        height: 45,
                        child: CustomTextFieldicon(
                          localsvg: LocalSVGImages.emailgreen,
                          labeliconUnselected: LocalSVGImages.emailgrey,
                          textInputType: TextInputType.emailAddress,
                          txtalign: TextAlign.left,
                          onChanged: (value) {

                            _userAgeProvider.setUserRollSelect(false);
                            _userAgeProvider.setUserGenderSelect(false);
                            _userAgeProvider.setUserProfessionSelect(false);
                            _userAgeProvider.setUserStateSelect(false);
                            _userAgeProvider.setUserCitySelect(false);

                          },

                          labelicon: Icons.email_outlined,
                          hintText: 'Referral code',
                          controller: _userreferralcontroller,
                        ),
                      ),



                      SizedBox(
                        height: 20,
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
                                _userAgeProvider.setUserAbout(value);
                                _userAgeProvider.setUserRollSelect(false);
                                _userAgeProvider.setUserGenderSelect(false);
                                _userAgeProvider.setUserProfessionSelect(false);
                                _userAgeProvider.setUserStateSelect(false);
                                _userAgeProvider.setUserCitySelect(false);
                              },
                              validator: (value) {
                                if(value == null ||  value.isEmpty){
                                  return 'Please enter about';
                                }
                                return null;
                              },
                              labelicon: Icons.person_2_outlined,
                              hintText: 'Enter about',
                              controller: _useraboutcontroller
                          )

                      ),



                      buildSizedBox(width: 0, height: 25),
                      Visibility(
                        visible: false,
                        child: CommonDottedBorder(
                            idproof: _image,
                            tagname: "upload1",
                            uploadtxt:
                            'Click here to attach your passport size picture.',
                            onPressed: () {
                              print('photo upload clicked ${_image}');
                            }),
                      ),
                      buildSizedBox(width: 0, height: 20),
                      Visibility(
                        visible: false,
                        child: CommonDottedBorder(
                            idproof: _idproof,
                            tagname: "upload2",
                            uploadtxt: 'Click here to attach an Id proof.',
                            onPressed: () {
                              print('ID upload clicked');
                              _pickimage2(false, false);
                            }),
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
                                    text: widget.IsProfileEdit?'Update':'Complete',
                                    onPressed: () {

                                      if (_formKey.currentState!.validate()) {

                                        _username = _userNameProvider._usernameValue;
                                        _useremail = _userEmailProvider._useremailValue;
                                        _userage = _userAgeProvider._userageValue;
                                        _useroll = _userAgeProvider._userroll;
                                        _userfathername = _userAgeProvider._userfathername;
                                        _userdob = _dateController.text;
                                        _userabout = _userAgeProvider._userabout;
                                        _userprofession = _professionViewModel.UserProfession?.id.toString() ?? "";
                                        _usercity = _professionViewModel.UserCity?.name ?? "";
                                        _userstate = _professionViewModel.UserState?.name ?? "";
                                        _usergender = _userAgeProvider.UserGender;


                                          if(!widget.IsProfileEdit) {
                                          if (_image != null) {
                                            chkRegFields(_userprofession,_usercity,_userstate,_usergender) ?  showToast("Enter all fields."):
                                            _registerViewModel.registerapi(
                                                onFailureRes: onFailureRes,
                                                onSuccessRes: onSuccessRes,
                                                name: _username,
                                                email: _useremail,
                                                role: _useroll,
                                                age: _userage,
                                                gender: _usergender,
                                                profession: _userprofession,
                                                city: _usercity,
                                                state: _userstate,
                                                about: _userabout,
                                                propic: _image!,
                                                referralcode: _userreferralcontroller
                                                    .text ?? "",
                                                fathername: _userfathername,
                                                dob: _userdob);
                                          }
                                          else {
                                            showToast("upload profile picture");
                                          }
                                          print('registeration complete pressed!');
                                        }else {
                                          print('update complete pressed!');
                                          print(
                                                   'Dob : ${_userdob},'
                                                  'username : ${_usernamecontroller.text},'
                                                  ' useremail : ${_useremailcontroller.text}, '
                                                  'userage : ${_useragecontroller.text}, '
                                                  'userroll : ${_useroll}, '
                                                  'image : ${_image},'
                                                  'profession : ${_userprofession},'
                                                  'state : ${_userstate},'
                                                  'city : ${_usercity},'
                                                  'gender : ${_usergender},'

                                          );


                                               _registerViewModel.ProfileUpdateapi(

                                                onFailureRes: onFailureRes,
                                                onSuccessRes: onproupdateSuccessRes,
                                                name: _usernamecontroller.text,
                                                email: _useremailcontroller.text,
                                                age: _useragecontroller.text,
                                                gender: _usergender,
                                                profession: _userprofession,
                                                city: _usercity,
                                                state: _userstate,
                                                about: _useraboutcontroller.text,
                                                propic: _image,
                                                fathername: _userfathernamecontroller.text,
                                                dob: _userdob);


                                        }
                                      }
                                    },
                                  ),
                                );
                              })
                      ),
                /*      buildSizedBox(height: 30, width: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("finish this later?",
                            style: CustomTextStyle.txt12Rltxtgry,),
                          Text(" skip", style: CustomTextStyle.txt14Rrtxtgry2,),
                        ],
                      ),*/
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
    _profileViewModel.profileapi(onFailureRes: onProfileFailureRes,onSuccessRes: onProfileRegSuccessRes);
    PreferenceHelper.setString(PrefConstant.rollname,registerResponse?.data?.userData?.roleName ?? "");
    showToast("Registered Successfully!");
    PreferenceHelper.setString(PrefConstant.isLoggedIn,"true");

 //Navigator.push(context, MaterialPageRoute(builder: (contex) => NewKycUser()));

    if(registerResponse?.data?.userData?.roleName == "Users"){
      Route route = MaterialPageRoute(builder: (context) => NewKycUser(IsKycUpdate: false));
      Navigator.pushReplacement(context, route);
    }else if(registerResponse?.data?.userData?.roleName == "Brokers"){
      Route route = MaterialPageRoute(builder: (context) => KycDealer(IsKycUpdate: false));
      Navigator.pushReplacement(context, route);
    }else if(registerResponse?.data?.userData?.roleName == "Advisors"){
      Route route = MaterialPageRoute(builder: (context) => KycAdvisor(IsKycUpdate: false));
      Navigator.pushReplacement(context, route);
    }else {

    }

   // Navigator.push(context, MaterialPageRoute(builder: (context)=> SaudaHomePage()));
    /*Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (_) => WelcomePage()), (route) => false);*/
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

  onProfFailureRes(String p1) {
  }

  onProfSuccessRes(ProfessionModel? p1) {
    print('prof on succ ${p1?.professions?.length}');
    print('Profession list ${_professionViewModel.ProfessionList.length}');
 //   print('Profession list ${_professionViewModel.ProfessionList[0].name}');
    _professionViewModel.setUserProfession(_professionViewModel.ProfessionList[0]);
    _professionViewModel.stateapi(onFailureRes: onstateFailureRes,onSuccessRes: OnstateSuccess);


    if(_profileViewModel.profileResponseModel?.user?.userProfession?[0].profession != null){
      print('Profession list ${_professionViewModel.ProfessionList.length}');
      Professions?  selectedOption = _profileViewModel.profileResponseModel?.user?.userProfession?[0].profession;
      Professions? selectedItem;
      for (Professions item in _professionViewModel.ProfessionList) {
        if (item.name == selectedOption?.name) {
          selectedItem = item;
          print('match ${selectedItem.name}');
          _professionViewModel.setUserProfession(selectedItem);
          break;
        }
      }
      if(_professionViewModel.FilterProfessionList != null || _professionViewModel.FilterProfessionList.isNotEmpty){
        print('_professionViewModel.ProfessionList2 ${_professionViewModel.ProfessionList.length}');
        _professionViewModel.setUserProfessionTS(_professionViewModel.ProfessionList[1]);

      }
      if(_professionViewModel.AgeGroupList != null && _professionViewModel.AgeGroupList.isNotEmpty){
        _professionViewModel.setUserAgeGroup(_professionViewModel.AgeGroupList[1]);
      }
      if(_professionViewModel.filterCity != null && _professionViewModel.filterCity.isNotEmpty){
        print('pv filtercity in regis page ${_professionViewModel.filterCity.length}');
        _professionViewModel.setFilterCity(_professionViewModel.filterCity[1]);
      }

    }



  }

  onstateFailureRes(String p1) {
  }



  onCitySucres(StateModel? p1) {
   // _professionViewModel.CityList.clear();
    print('city list in state res ${_professionViewModel.CityList.length}');

    _professionViewModel.setUserCity(_professionViewModel.CityList[0]);
    if(_profileViewModel.profileResponseModel?.user?.city != null){
      print('City list ${_professionViewModel.CityList.length}');
      String?  selectedOption = _profileViewModel.profileResponseModel?.user?.city;
      Cities? selectedItem;
      for (Cities item in _professionViewModel.CityList) {
        if (item.name == selectedOption) {
          selectedItem = item;
          print('match ${selectedItem.name}');
          _professionViewModel.setUserCity(selectedItem);
          break;
        }
      }
    }

  }

  Fun() {}



  OnstateSuccess(StateModel? p1) {

    print('State list ${_professionViewModel.StateList.length}');
    //print('State list ${_professionViewModel.StateList[0]}');
    _professionViewModel.setUserState(_professionViewModel.StateList[0]);
    print('city list in state res ${_professionViewModel.CityList.length}');
    _professionViewModel.setUserCity(_professionViewModel.CityList[0]);
    if(_profileViewModel.profileResponseModel?.user?.state != null){

      String?  selectedOption = _profileViewModel.profileResponseModel?.user?.state;
      Statee? selectedItem;
      for (Statee item in _professionViewModel.StateList) {
        if (item.name == selectedOption) {
          selectedItem = item;
          print('match ${selectedItem.name}');
          _professionViewModel.setUserState(selectedItem);
          _professionViewModel.cityapi(onFailureRes: onstateFailureRes,onSuccessRes: onCitySucres, cityid: selectedItem.id.toString());
          break;
        }
      }
    }
  }

  setImage(File? image) {
 if(!isProEdit){
   print('inside false');
      if (image == null) {
     return SvgPicture.asset(LocalSVGImages.perplh);
   } else {

   return  Image.file(_image!, fit: BoxFit.cover,);
   }

 }else {
   if(image == null) {
     if (_profileViewModel.profileResponseModel?.user?.photoUrl == null ||
         _profileViewModel.profileResponseModel!.user!.photoUrl!.isEmpty) {
       return SvgPicture.asset(LocalSVGImages.perplh);
     } else {
       print('pro edit image ${_profileViewModel.profileResponseModel?.user
           ?.photoUrl}');
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

  onproupdateSuccessRes(StatusandMessageModel? p1) {
    _profileViewModel.profileapi(onFailureRes: onProfileFailureRes,onSuccessRes: onProfileSuccessRes);

  }
  onProfileSuccessRes(ProfileResponseModel? profileRes) {
    Navigator.pop(context);
 }

  onProfileFailureRes(String p1) {
  }

  void setUserDetails(List<UserMetaData> userMetaData) {

    _usernamecontroller.text = _profileViewModel.profileResponseModel?.user?.name ?? "";
    _useremailcontroller.text = _profileViewModel.profileResponseModel?.user?.email ?? "";
    _useraboutcontroller.text = _profileViewModel.profileResponseModel?.user?.about ?? "";

   // print('userMetaData list ${userMetaData.length}');
    String?  fathername = "father_name";
    String?  dob = "date_of_birth";
    String?  gender = "gender";
    String?  age = "age";
    String? savedfathername;
    String? saveddob;
    String? savedgender;
    String? savedage;
    for (UserMetaData item in userMetaData) {
      if (item.key == fathername) {
        savedfathername = item.value;
        print('savedfathername ${savedfathername}');
        _userfathernamecontroller.text = savedfathername ?? "";

      }else if(item.key == dob){
        saveddob = item.value;
        print('saveddob ${saveddob}');
        _dateController.text = saveddob ?? "";

      }else if(item.key == gender){
        savedgender = item.value;
        print('savedgender ${savedgender}');
     _userAgeProvider.setUserGender(savedgender ?? "");

      }else if(item.key == age) {
        savedage = item.value;
        print('savedage ${savedage}');
        _useragecontroller.text = savedage ?? "";

      }
    }

  }

  bool chkRegFields(String userprofession, String usercity, String userstate, String usergender) {
   // print('chkRegFieldsddf $userprofession ... $usercity ... $userstate .... $usergender');
    //user prof 0   user city Enter City    userstate Enter State     usergender Select gender

    if(userprofession == 0 || usercity == "Enter City" || userstate == "Enter State" || usergender == "Select gender"){
      return true;
    }else{
      return false;
    }

  }

  onProfileRegSuccessRes(ProfileResponseModel? p1) {
  }
}




class UserageProvider extends ChangeNotifier {
  String _userageValue = '';
  String _userroll = 'Users';
  bool _userRollselect =false;
  String _userresidence = 'Select Residence';
  bool _userresidenceselect = false;
  bool _userproofselect = false;
  String _userprooftype = 'Aadhar';
  String _userExpertIn = 'Fixed Income advisory';
  String _userfathername = '';
  bool _userdobselect = false;
  String _usernumber = '';
  String _usergender = 'Select gender';
  bool _usergenderselect = false;
  bool _userprofession = false;
  bool _userstateselect = false;
  bool _usercityselect = false;
  String _userExp = 'Years';
  String _userReturns = 'Years';
  String _userRisks = 'low';
  String _userpan = '';
  String _usercurrentaddress = '';
  String _userpermaddress = '';
  String _dealerspeciality = '';
  String _topdeal1 = '';
  String _topdeal2 = '';
  String _topdeal3 = '';
  String depository1 = '';
  String depository2 = '';
  String depository3 = '';
  String depository4 = '';
  String _userabout = '';

  String get UserageValue => _userageValue;
  bool get UserResideceSelect => _userresidenceselect;
  bool get UserProofSelect => _userproofselect;
  bool get UserGenderSelect => _usergenderselect;
  bool get UserRollSelect => _userRollselect;
  bool get UserDOBSelect => _userdobselect;
  bool get UserProfessionSelect => _userprofession;
  bool get UserStateSelect => _userstateselect;
  bool get UserCitySelect => _usercityselect;


  String get Userroll => _userroll;
  String get UserFathername => _userfathername;

  String get UserNum => _usernumber;
  String get UserGender => _usergender;
  String get UserExp => _userExp;
  String get UserReturns => _userReturns;
  String get UserRisks => _userRisks;
  String get UserResidence => _userresidence;
  String get UserProofType => _userprooftype;
  String get UserExpertIn => _userExpertIn;
  String get UserPan => _userpan;
  String get UserCurrentAddress => _usercurrentaddress;
  String get UserPermAddress => _userpermaddress;
  String get DealerSPeciality => _dealerspeciality;
  String get TopDeal1 => _topdeal1;
  String get TopDeal2 => _topdeal2;
  String get TopDeal3 => _topdeal3;
  String get Depository1 => depository1;
  String get Depository2 => depository2;
  String get Depository3 => depository3;
  String get Depository4 => depository4;
  String get UserAbout => _userabout;

  void setUserAgeValue(String value) {
    _userageValue = value;
    notifyListeners();
  }
  void setUserRoll(String value) {
    _userroll = value;
    notifyListeners();
  }
  void setUserFathername(String value) {
    _userfathername = value;
    notifyListeners();
  }
  void setUserDOBselect(bool value) {
    _userdobselect = value;
    notifyListeners();
  }
  void setUserAbout(String value) {
    _userabout = value;
    notifyListeners();
  }
  void setUserGender(String value) {
    _usergender = value;
    notifyListeners();
  }
  void setUserResidSelect(bool value) {
    _userresidenceselect = value;
    notifyListeners();
  }
  void setUserProofSelect(bool value) {
    _userproofselect = value;
    notifyListeners();
  }
  void setUserGenderSelect(bool value) {
    _usergenderselect = value;
    notifyListeners();
  }
  void setUserProfessionSelect(bool value) {
    _userprofession = value;
    notifyListeners();
  }
  void setUserStateSelect(bool value) {
    _userstateselect = value;
    notifyListeners();
  }
  void setUserCitySelect(bool value) {
    _usercityselect = value;
    notifyListeners();
  }
  void setUserRollSelect(bool value) {
    _userRollselect = value;
    notifyListeners();
  }
  void setUserExp(String value) {
    _userExp = value;
    notifyListeners();
  }
  void setUserReturns(String value) {
    _userReturns = value;
    notifyListeners();
  }
  void setUserRisks(String value) {
    _userRisks = value;
    notifyListeners();
  }
  void setUserResidence(String value) {
    _userresidence = value;
    notifyListeners();
  }
  void setUserProofType(String value) {
    _userprooftype = value;
    notifyListeners();
  }
  void setUserExpertIn(String value) {
    _userExpertIn = value;
    notifyListeners();
  }
  void setUserPan(String value) {
    _userpan = value;
    notifyListeners();
  }
  void setUserCurrentAddress(String value) {
    _usercurrentaddress = value;
    notifyListeners();
  }
  void setUserPermAddress(String value) {
    _userpermaddress = value;
    notifyListeners();
  }
  void setDealerSpeciality(String value) {
    _dealerspeciality = value;
    notifyListeners();
  }

  void setTopDeal1(String value) {
    _topdeal1 = value;
    notifyListeners();
  }
  void setTopDeal2(String value) {
    _topdeal2 = value;
    notifyListeners();
  }
  void setTopDeal3(String value) {
    _topdeal3 = value;
    notifyListeners();
  }

  void setDepository1(String value) {
    depository1 = value;
    notifyListeners();
  }
  void setDepository2(String value) {
    depository2 = value;
    notifyListeners();
  }
  void setDepository3(String value) {
    depository3 = value;
    notifyListeners();
  }
  void setDepository4(String value) {
    depository4 = value;
    notifyListeners();
  }
  void setUserNum(String value) {
    _usernumber = value;
    notifyListeners();
  }

  void clearTextFieldValue() {
    _userageValue = '';
    notifyListeners();
  }
}

class UserNameProvider extends ChangeNotifier {
  String _usernameValue = '';

  String get UserValue => _usernameValue;

  void setUserNameValue(String value) {
    _usernameValue = value;
    notifyListeners();
  }

  void clearTextFieldValue() {
    _usernameValue = '';
    notifyListeners();
  }
}
class UserEmailProvider extends ChangeNotifier {
  String _useremailValue = '';

  String get UseremailValue => _useremailValue;

  void setUserMailValue(String value) {
    _useremailValue = value;
    notifyListeners();
  }

  void clearTextFieldValue() {
    _useremailValue = '';
    notifyListeners();
  }
}
