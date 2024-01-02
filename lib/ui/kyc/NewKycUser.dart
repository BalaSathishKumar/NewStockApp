import 'dart:io';

import 'package:base_flutter_provider_project/data/models/StatusandMessageModel.dart';
import 'package:base_flutter_provider_project/data/models/dashboard_model/ProfileResponseModel.dart';
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
import '../../viewModel/profile_view_model.dart';
import '../../viewModel/register_viewmodel.dart';
import '../Register/RegisterPage.dart';
import '../home/homepage.dart';

class NewKycUser extends StatefulWidget {
  final bool IsKycUpdate;
  final bool? IsRegandKy;
  NewKycUser({
    required this.IsKycUpdate,
    this.IsRegandKy
  });

  @override
  State<NewKycUser> createState() => _NewKycUserState();
}

class _NewKycUserState extends State<NewKycUser> {
  String _selectedOption = 'Users';
  String _selectedGender = 'Male';
  String _selectedRes = 'Resident Individual';
  final _formKey = GlobalKey<FormState>();

  File? _image = null;
  File? _idproof = null;
  File? _aadhar = null;
  File? _pancard = null;
  File? _cancelledcheque = null;
  File? _dematdetails = null;

  String _imagestring = "";
  String _idproofstring = "";

  late RegisterViewModel _registerViewModel;
  late UserageProvider _userAgeProvider;
  late UserNameProvider _userNameProvider;
  late UserEmailProvider _userEmailProvider;
  late CommonProvider _commonProvider;
  late ProfileViewModel _profileViewModel;
  bool get isKycUpdate => widget.IsKycUpdate;
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
      } else {
        //Calling API after UI renders
        WidgetsBinding.instance.addPostFrameCallback((_) {
          permissionPrompt2(context);
        });
      }
    } else {
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
        openAppSettings();
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

  @override
  void initState() {
    super.initState();
    _registerViewModel = Provider.of<RegisterViewModel>(context, listen: false);
    _userAgeProvider = Provider.of<UserageProvider>(context, listen: false);
    _userNameProvider = Provider.of<UserNameProvider>(context, listen: false);
    _userEmailProvider = Provider.of<UserEmailProvider>(context, listen: false);
    _commonProvider = Provider.of<CommonProvider>(context, listen: false);
    _profileViewModel = Provider.of<ProfileViewModel>(context, listen: false);

    if(isKycUpdate){
      WidgetsBinding.instance.addPostFrameCallback((_) {
        setUsersKycData(_profileViewModel.profileResponseModel?.user?.userMetaData ?? []);
        setUserIdproof(_profileViewModel.profileResponseModel?.user?.idProof ?? []);});
    }
    else {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _userAgeProvider.setUserProofSelect(false);
        _userAgeProvider.setUserResidSelect(false);
      });

      _userpancontroller = TextEditingController(text: _userAgeProvider.UserPan);
      _userCurrentAddcontroller = TextEditingController(text: _userAgeProvider.UserCurrentAddress);
      _userPermAddcontroller = TextEditingController(text: _userAgeProvider.UserPermAddress);
    }
  }

  /* @override
  void dispose() {
    _useragecontroller.clear();
    super.dispose();
  }*/

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
        appBar:  widget.IsRegandKy != null ? null :CustomAppBar(height: 80.0, title: 'KYC', appbarclr: Appcolors.white,HideMenu: true),
        body: Form(
          key: _formKey,
          child: Container(
            height: deviceheight,
            width: devicewidth,
            child: SingleChildScrollView(
              child:
                  Consumer<UserageProvider>(builder: (context, uservm, child) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    children: [

                      Container(
                          height: 50,
                          child: Text(
                              "We strongly recommend that you fill in your register forms to enjoy a faster buy & sell experience. ",
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
                                    size: Size.fromRadius(50),
                                    // Image radius
                                    child: setImage(_image,profilvm.profileResponseModel?.user?.photoUrl ?? "")

                                  /*_image == null
                                          ? SvgPicture.asset(
                                              LocalSVGImages.perplh,
                                              fit: BoxFit.cover,
                                            )
                                          : Image.file(
                                              _image!,
                                              fit: BoxFit.cover,
                                            ),*/
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
                                          height: 25,
                                          width: 16),
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
                                        _userAgeProvider.UserResideceSelect
                                            ? LocalSVGImages.citygreen
                                            : LocalSVGImages.city,
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
                                    _userAgeProvider
                                        .setUserResidence(value ?? "");
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
                          child: CustomTextFieldicon(
                              localsvg: LocalSVGImages.citygreen,
                              labeliconUnselected: LocalSVGImages.city,
                              textInputType: TextInputType.name,
                              txtalign: TextAlign.left,
                              onChanged: (value) {
                                // dataModel.setTextFieldValue(value);
                                _userAgeProvider.setUserPan(value);
                                _userAgeProvider.setUserResidSelect(false);
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter pan';
                                }
                                return null;
                              },
                              labelicon: Icons.add_card,
                              hintText: 'PAN Number',
                              controller: _userpancontroller)),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 45,
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
                              if (value == null || value.isEmpty) {
                                return 'Please enter current address';
                              }
                              return null;
                            },
                            labelicon: Icons.home_outlined,
                            hintText: 'Current Address',
                            controller: _userCurrentAddcontroller),
                      ),
                      Container(
                          height: 40,
                          width: devicewidth,
                          //  color: Colors.red.shade50,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 35,
                                width: 35,
                                     color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Consumer<CommonProvider>(
                                      builder: (context, commonvm, child) {
                                    return Transform.scale(
                                      scale: 0.7, // Adjust the scale factor as needed
                                      child: Checkbox(
                                        activeColor: Appcolors.splashbgcolor,
                                        value: commonvm.IsCurrentAdd,
                                        // Initial checkbox state
                                        onChanged: (bool? newValue) {
                                          print('same as above $newValue');
                                          _commonProvider.setIsCurrentAdd(newValue ?? false);
                                          setAddress(commonvm.IsCurrentAdd);
                                        },
                                      /*  visualDensity: VisualDensity(
                                          horizontal: -5, // Adjust this value to make the checkbox smaller
                                          vertical: -5,   // Adjust this value to make the checkbox smaller
                                        ),*/
                                      ),
                                    );
                                  }),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Same as above",
                                  style: CustomTextStyle.txt16kyctxtgrey,
                                ),
                              )
                            ],
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                          height: 45,
                          child: CustomTextFieldicon(
                              localsvg: LocalSVGImages.stategreen,
                              labeliconUnselected: LocalSVGImages.state,
                              textInputType: TextInputType.name,
                              txtalign: TextAlign.left,
                              onChanged: (value) {
                                // dataModel.setTextFieldValue(value);
                                _userAgeProvider.setUserPermAddress(value);
                                _userAgeProvider.setUserProofSelect(false);
                                if(value.isEmpty){
                                  _commonProvider.setIsCurrentAdd(false);
                                }
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter permanent address';
                                }
                                return null;
                              },
                              labelicon: Icons.home_outlined,
                              hintText: 'Permanent Address',
                              controller: _userPermAddcontroller)),
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
                                      child: Icon(
                                        Icons.add_card,
                                        size: 22,
                                        color: _userAgeProvider.UserProofSelect
                                            ? Appcolors.splashbgcolor
                                            : Appcolors.kyctxtgrey,
                                      )
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
                                    'Voter ID',
                                    'Passport',
                                  ],
                                  onChanged: (value) {
                                    _userAgeProvider
                                        .setUserProofType(value ?? "");
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
                          uploadtxt: 'Id proof Upload',
                          onPressed: () {
                            _pickimage2(false, false, 0);
                            print('photo upload clicked ${_image}');
                          }),
                      buildSizedBox(width: 0, height: 20),
                      CommonDottedBorder(
                          storeddata: getStoredImage(_profileViewModel.profileResponseModel?.user?.idProof,1),
                          idproof: _pancard,
                          tagname: "PANupload",
                          uploadtxt: 'PAN Upload',
                          onPressed: () {
                            print('ID upload clicked');
                            _pickimage2(false, false, 1);
                          }),
                      buildSizedBox(width: 0, height: 20),
                      CommonDottedBorder(
                          storeddata: getStoredImage(_profileViewModel.profileResponseModel?.user?.idProof,2),
                          idproof: _cancelledcheque,
                          tagname: "Chequeupload",
                          uploadtxt: 'Cancelled Cheque',
                          onPressed: () {
                            print('ID upload clicked');
                            _pickimage2(false, false, 2);
                          }),
                      buildSizedBox(width: 0, height: 20),
                      CommonDottedBorder(  storeddata: getStoredImage(_profileViewModel.profileResponseModel?.user?.idProof,3),

                          idproof: _dematdetails,
                          tagname: "Dematupload",
                          uploadtxt: 'Client Master/Demat Details Upload',
                          onPressed: () {
                            print('ID upload clicked');
                            _pickimage2(false, false, 3);
                          }),
                      Consumer<CommonProvider>(
                          builder: (context, commonvm, child) {
                        return AgreementCheckbox(
                          IsSendEq: false,
                          value: commonvm.IsChecked,
                          label:
                              'I hereby declare that the information provided in this form is accurate and complete. I confirm that any information is found incorrect and/or incomplete that leads a violation of regulations may initiate legal actions, and I accept that I am the responsible party for any and all charges, penalties and violations.',
                          onChanged: (bool? newValue) {
                            _commonProvider.setIsChecked(newValue ?? false);
                          },
                        );
                      }),
                      Padding(
                          padding: const EdgeInsets.only(
                              top: 38.0, left: 18, right: 18),
                          child: Consumer<RegisterViewModel>(
                              builder: (context, registerviewmodel, child) {
                            return registerviewmodel.state == ViewState.busy
                                ? const Loader()
                                : Container(
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

                                        print('pan-- ${_pancard} '
                                            'idproof-- ${_aadhar} '
                                            'propic -- ${_image} '
                                            'demat --- ${_dematdetails} '
                                            'cancelled chq --- ${_cancelledcheque} ');
                                        if (_formKey.currentState!.validate()) {
                                          Map<String, dynamic> kycparms = {
                                            "residential": _userresidence,
                                            "pan_number": _userPAN,
                                            "current_address": _userCurrentAdd,
                                            "permanent_address": _userPermAdd,
                                            "id_proof_type": _userProofType,
                                          };
                                          if(!isKycUpdate) {
                                            if (_image != null &&
                                                _aadhar != null &&
                                                _pancard != null) {
                                              //     checkFields();
                                              //  if(_userresidence != "" && _userPAN != "" && _userCurrentAdd != "" && _userPermAdd != "" && _userProofType != ""){
                                              _commonProvider.IsChecked
                                                  ? _registerViewModel.Kycapi(
                                                  onFailureRes: onFailureRes,
                                                  onSuccessRes: onSuccessRes,
                                                  propic: _image!,
                                                  idproofpic: _aadhar!,
                                                  pancard: _pancard!,
                                                  cancelledcheque:
                                                  _cancelledcheque,
                                                  dematdetails: _dematdetails,
                                                  kycparams: kycparms)
                                                  : showToast(
                                                  "Please agree with declarations.");
                                              //  }else{
                                              //     showToast("Enter all fields..");
                                              //  }
                                            } else {
                                              if (_image == null) {
                                                showToast(
                                                    "upload profile picture");
                                              }
                                              else if (_aadhar == null) {
                                                showToast("upload id proof");
                                              }
                                              else {
                                                showToast("upload id pan card");
                                              }
                                            }
                                          } else{
                                            Map<String, dynamic> kycparms2 = {
                                              "residential": _userresidence,
                                              "pan_number": _userpancontroller.text ,
                                              "current_address": _userCurrentAddcontroller.text,
                                              "permanent_address": _userPermAddcontroller.text ,
                                              "id_proof_type": _userProofType,
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
                                                dematdetails: _dematdetails,
                                                kycparams: kycparms2)
                                                : showToast("Please agree with declarations.");

                                          }
                                          print('kyc complete pressed! ${kycparms}');
                                        }
                                      },
                                    ),
                                  );
                          })),
                      buildSizedBox(height: 20, width: 10),
                      Text(
                        "(You can upload all documents later, but you will be verified to use the application only after your documents are uploaded and approved successfully)",
                        style: CustomTextStyle.txt12Rltxtgry,
                      ),
                      buildSizedBox(height: 20, width: 10),
                      GestureDetector(
                        onTap: (){
                          Route route = MaterialPageRoute(builder: (context) => SaudaHomePage());
                          Navigator.pushReplacement(context, route);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "finish this later?",
                              style: CustomTextStyle.txt12Rltxtgry,
                            ),
                            Text(
                              " skip",
                              style: CustomTextStyle.txt14Rrtxtgry2,
                            ),
                          ],
                        ),
                      ),
                      buildSizedBox(height: 30, width: 10),
                    ],
                  ),
                );
              }),
            ),
          ),
        ));
  }

  onFailureRes(String error) {
    Logger.appLogs('onOtpFailureRes:: $error');
    errorAlert(context, error);
  }

  onSuccessRes(RegisterModel? registerResponse) {
    _userNameProvider.setUserNameValue("");
    _userAgeProvider.clearTextFieldValue();

    _userEmailProvider.clearTextFieldValue();



    Route route = MaterialPageRoute(builder: (context) => SaudaHomePage());
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
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

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
          }
        });
      }
    }else{
      permissionPrompt2(context);
    }
  }

  void checkFields() {
    /* "residential": _userresidence,
    "pan_number": _userPAN,
    "current_address": _userCurrentAdd,
    "permanent_address": _userPermAdd,
    "id_proof_type": _userProofType,*/
  }

  void setAddress(bool isCurrentAdd) {
    if (isCurrentAdd) {
      _userAgeProvider.setUserPermAddress(_userAgeProvider.UserCurrentAddress);
      _userPermAddcontroller.text = _userAgeProvider.UserCurrentAddress;
    } else {
      _userPermAddcontroller.text = "";
      _userAgeProvider.setUserPermAddress("");
    }
  }

  setImage(File? image, String registerpropic) {
    if(!isKycUpdate){
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

    }
    else {
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

  void setUsersKycData(List<UserMetaData> usermetadata) {
   // print('userMetaData list ${usermetadata.length}');
    String?  residential = "residential";
    String?  pancard = "pan_number";
    String?  currentaddress = "current_address";
    String?  permaddress = "permanent_address";
    String? savedresidential;
    String? savedpannumber;
    String? savedcurntaddress;
    String? savedpermaddress;
    for (UserMetaData item in usermetadata) {

      if(item.key == residential) {
        savedresidential = item.value;
        print('savedresidential ${savedresidential}');
        _userAgeProvider.setUserResidence(savedresidential ?? "");
      }else if (item.key == pancard) {
        savedpannumber = item.value;
        print('savedpannumber ${savedpannumber}');
        _userpancontroller.text = savedpannumber ?? "";
      }else if(item.key == currentaddress){
        savedcurntaddress = item.value;
        print('savedcurntaddress ${savedcurntaddress}');
        _userCurrentAddcontroller.text = savedcurntaddress ?? "";
        _userAgeProvider.setUserCurrentAddress(savedcurntaddress ?? "");

      }else if(item.key == permaddress){
        savedpermaddress = item.value;
        print('savedpermaddress ${savedpermaddress}');
        _userPermAddcontroller.text = savedpermaddress ?? "";
        _userAgeProvider.setUserPermAddress(savedpermaddress ?? "");
      }
    }

  }

  void setUserIdproof(List<IdProof> idproof) {
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

  getStoredImage(List<IdProof>? StoredidProof,int proofcode) {
    print('StoredidProof item ${StoredidProof?.length}');
    String?  idproofname = "Aadhar";
    String?  pancard = "Pan Card";
    String?  CancelledCheque = "Cancelled Cheque";
    String?  ClientMaster = "Client Master";
    String? savedaadharimage;
    String? savedpanimage;
    String? savedcancldcqeimage;
    String? savedclientmastrimage;
    if(isKycUpdate){
      if(StoredidProof != null && StoredidProof.isNotEmpty){
        switch(proofcode){
          case 0:
            return AddProof(StoredidProof, savedaadharimage, idproofname, _aadhar);
          case 1:
            return AddProof(StoredidProof, savedpanimage, pancard, _pancard);

          case 2:
            return AddProof(StoredidProof, savedcancldcqeimage, CancelledCheque, _cancelledcheque);

          case 3:
            return AddProof(StoredidProof, savedclientmastrimage, ClientMaster, _dematdetails);
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


  onUpdateSuccessRes(StatusandMessageModel? p1) {
    _profileViewModel.profileapi(onFailureRes: onProfileFailureRes,onSuccessRes: onProfileSuccessRes);
  }

  onProfileFailureRes(String p1) {
  }

  onProfileSuccessRes(ProfileResponseModel? p1) {
    Navigator.pop(context);
  }
}
