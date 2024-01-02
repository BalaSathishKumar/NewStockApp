import 'dart:io';

import 'package:base_flutter_provider_project/constants/colors.dart';
import 'package:base_flutter_provider_project/data/models/StatusandMessageModel.dart';
import 'package:base_flutter_provider_project/utils/common_textstyles.dart';
import 'package:base_flutter_provider_project/viewModel/CreateList_ViewModel.dart';
import 'package:base_flutter_provider_project/viewModel/base_view_model/base_view_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

import '../../common_widgets/Explore_widgets/QuickStats.dart';

import '../../common_widgets/Stock_widgets/StockSections.dart';
import '../../common_widgets/alert_widgets/permission_prompt.dart';
import '../../common_widgets/appbar_widgets/logotxtappbar.dart';
import '../../common_widgets/button_widgets/common_button.dart';
import '../../common_widgets/dropdown_widgets/CategoryDropDown.dart';
import '../../common_widgets/dropdown_widgets/CommonDottedBorder.dart';
import '../../common_widgets/loading_widgets/loader.dart';
import '../../common_widgets/textfields_widgets/common_textfield_withicon.dart';
import '../../constants/constant.dart';
import '../../constants/local_images.dart';
import '../../utils/common_functions.dart';
import '../../viewModel/CommonProvider.dart';
import '../../viewModel/dashboard_view_model.dart';
import '../../viewModel/profile_view_model.dart';
import '../Dealers/DonePage.dart';

class CreateListing extends StatefulWidget {
  const CreateListing({super.key});

  @override
  State<CreateListing> createState() => _CreateListingState();
}

class _CreateListingState extends State<CreateListing> {

  late CreateListViewModel _createListViewModel;
  late CommonProvider _commonProvider;
  String catid = "";
  File? _image = null;
  File? _pancard = null;
  File? _aadhar = null;
  File? _clientmaster = null;
  File? _cancelldchq = null;
  File? _demat = null;
  TextEditingController _clNamecontroller = TextEditingController();
  TextEditingController _clSharescontroller = TextEditingController();
  TextEditingController _clSellingCostcontroller = TextEditingController();
  TextEditingController _clNegopcecontroller = TextEditingController();
  TextEditingController _clNegoqtycontroller = TextEditingController();
  TextEditingController _clQtyhndCostcontroller = TextEditingController();
  TextEditingController _clHighcontroller = TextEditingController();
  TextEditingController _clLowcontroller = TextEditingController();
  TextEditingController _clRatingcontroller = TextEditingController();
  TextEditingController _clRemarkcontroller = TextEditingController();
  TextEditingController _clSpacontroller = TextEditingController();
  TextEditingController _clAddinfocontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    _createListViewModel= Provider.of<CreateListViewModel>(context, listen: false);
    _commonProvider = Provider.of<CommonProvider>(context, listen: false);
    _clNamecontroller = TextEditingController(text: _commonProvider.CLname);
    _clSharescontroller = TextEditingController(text: _commonProvider.CLshares);
    _clSellingCostcontroller = TextEditingController(text: _commonProvider.CLsellingcost);
  }


  @override
  Widget build(BuildContext context) {
    var deviceheight = MediaQuery.of(context).size.height;
    var devicewidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Appcolors.white,
      body: Form(
        key: _formKey,
        child: Container(
          height: deviceheight,
          width: devicewidth,
          child: Consumer<ProfileViewModel>(
          builder: (context, profilevm, child) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: Container(
                      height: 100,
                      //  color: Colors.yellow,
                      child:  Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          LogoTxtAppbar(logotag: "createlist",
                              title: "Create a Listing  ",
                              Isportfolio: false,
                              onPressed: () {}),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                     // height: 50,
                      width: devicewidth,
                      //color: Colors.red,
                      child: Column(
                        children: [
                          Text(
                            "As a dealer, you can list shares for sale. Please complete the form below & your shares will be shown to all users after Sauda Team review. ",
                            textAlign: TextAlign.center,
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                            style: CustomTextStyle.txt12Rrtxtgry,),

                        ],
                      ),
                    ),
                  ),

                  GestureDetector(
                    onTap: (){
                      _pickimage2(false,0);
                    },
                    child: Container(
                        height: 110,
                        width: 110,
                        // color: Appcolors.black,
                        child: Container(
                          padding: EdgeInsets.all(1), // Border width
                          decoration: BoxDecoration(
                              color: Appcolors.black, shape: BoxShape.circle),
                          child: ClipOval(
                            child: SizedBox.fromSize(
                              size: Size.fromRadius(50), // Image radius
                            child: _image != null ?Image.file(_image!,fit: BoxFit.cover,):Image.asset(
                              LocalPNGImages.placeholder,
                              fit: BoxFit.cover,
                            ),

                            //  child: Image.network(profilevm.profileResponseModel?.user?.photoUrl ?? "")

                            /*  Image.asset(
                                LocalPNGImages.samplepropic,
                                fit: BoxFit.cover,
                              ),*/
                            ),
                          ),
                        )),
                  ),



                  Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        children: [

                          Consumer<DropOptions>(builder: (context, dropoptions, child) {
                            return Container(
                              //   color: Colors.blue,
                              height: 50,

                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Consumer<DashboardViewModel>(
                                      builder: (context, dashfildata, child) {
                                        return CategoryDropdown(
                                          underlinecolor: Appcolors.txtpurple,
                                          iconcolor: Appcolors.txtpurple,
                                          textdecoration: CustomTextStyle.txt18Rmtxtblk,
                                          devicewidth: 130,
                                          selectedValue: dropoptions.dropoptions,
                                          //_selectedOption,
                                          options: dashfildata.catList,
                                          onChanged: (value) {
                                            if (value != null) {
                                              Provider.of<DropOptions>(context, listen: false).getDropOPtions(value);
                                              print('cat id in create list${value.id}');
                                              catid = value.id.toString();
                                            } else {
                                              print('value is null');
                                            }

                                            //  setState(() {
                                            //  _selectedOption = value!;
                                            // });
                                          },
                                        );
                                      }
                                  ),
                                ],
                              ),
                            );
                          },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                              height: 45,
                              child: CustomTextFieldicon(
                                localsvg: LocalSVGImages.usergreen,
                                labeliconUnselected: LocalSVGImages.usergrey,
                                textInputType: TextInputType.name,
                                txtalign: TextAlign.center,
                                onChanged: (value) {
                                  _commonProvider.setCLname(value);
                                },
                                validator: (value) {
                                  if(value == null ||  value.isEmpty){
                                    return 'Please enter name';
                                  }
                                  return null;
                                },
                                labelicon: Icons.search,
                                hintText: 'Enter Name',
                                controller: _clNamecontroller,

                              )
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 45,
                            child: CustomTextFieldicon(
                              localsvg: LocalSVGImages.nosharesgreen,
                              labeliconUnselected:LocalSVGImages.noshares ,
                              textInputType: TextInputType.number,
                              txtalign: TextAlign.center,
                              onChanged: (value) {
                                _commonProvider.setCLshares(value);
                              },
                              validator: (value) {
                                if(value == null ||  value.isEmpty){
                                  return 'Please enter shares';
                                }
                                return null;
                              },
                              labelicon: Icons.email_outlined,
                              hintText: 'Number of Shares',
                              controller: _clSharescontroller,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                              height: 45,
                              child:
                              CustomTextFieldicon(
                                  localsvg: LocalSVGImages.sellingcostgreen,
                                  labeliconUnselected: LocalSVGImages.sellingcost,
                                  textInputType: TextInputType.number,
                                  txtalign: TextAlign.center,
                                  onChanged: (value) {
                                    _commonProvider.setCLsellingcost(value);
                                  },
                                  validator: (value) {
                                    if(value == null ||  value.isEmpty){
                                      return 'Please enter selling cost';
                                    }
                                    return null;
                                  },
                                  labelicon: Icons.person_2_outlined,
                                  hintText: 'Selling Cost',
                                  controller: _clSellingCostcontroller
                              )
                          ),

                          SizedBox(
                            height: 20,
                          ),
                          Container(
                              height: 45,
                              child:
                              CustomTextFieldicon(
                                  localsvg: LocalSVGImages.sellingcostgreen,
                                  labeliconUnselected: LocalSVGImages.sellingcost,
                                  textInputType: TextInputType.number,
                                  txtalign: TextAlign.center,
                                  onChanged: (value) {
                                    _commonProvider.setCLNegoPce(value);
                                  },
                                  validator: (value) {
                                    if(value == null ||  value.isEmpty){
                                      return 'Please enter Negotiable Price';
                                    }
                                    return null;
                                  },
                                  labelicon: Icons.person_2_outlined,
                                  hintText: 'Negotiable Price Range as per Quantity',
                                  controller: _clNegopcecontroller
                              )
                          ),

                          SizedBox(
                            height: 20,
                          ),
                          Container(
                              height: 45,
                              child:
                              CustomTextFieldicon(
                                  localsvg: LocalSVGImages.sellingcostgreen,
                                  labeliconUnselected: LocalSVGImages.sellingcost,
                                  textInputType: TextInputType.number,
                                  txtalign: TextAlign.center,
                                  onChanged: (value) {
                                    _commonProvider.setCLQtyHnd(value);
                                  },
                                  validator: (value) {
                                    if(value == null ||  value.isEmpty){
                                      return 'Please enter Quantity in Hand';
                                    }
                                    return null;
                                  },
                                  labelicon: Icons.person_2_outlined,
                                  hintText: 'Quantity in Hand',
                                  controller: _clQtyhndCostcontroller
                              )
                          ),

                          SizedBox(
                            height: 20,
                          ),
                          Container(
                              height: 45,
                              child:
                              CustomTextFieldicon(
                                  localsvg: LocalSVGImages.sellingcostgreen,
                                  labeliconUnselected: LocalSVGImages.sellingcost,
                                  textInputType: TextInputType.number,
                                  txtalign: TextAlign.center,
                                  onChanged: (value) {
                                    _commonProvider.setCLNegoQty(value);
                                  },
                                  validator: (value) {
                                    if(value == null ||  value.isEmpty){
                                      return 'Please enter Negotiable Quantity';
                                    }
                                    return null;
                                  },
                                  labelicon: Icons.person_2_outlined,
                                  hintText: 'Negotiable Quantity Range as Per Demand',
                                  controller: _clNegoqtycontroller
                              )
                          ),

                          SizedBox(
                            height: 20,
                          ),
                          Container(
                              height: 45,
                              child:
                              CustomTextFieldicon(
                                  localsvg: LocalSVGImages.sellingcostgreen,
                                  labeliconUnselected: LocalSVGImages.sellingcost,
                                  textInputType: TextInputType.number,
                                  txtalign: TextAlign.center,
                                  onChanged: (value) {
                                    _commonProvider.setCLHigh(value);
                                  },
                                  validator: (value) {
                                    if(value == null ||  value.isEmpty){
                                      return 'Please enter high';
                                    }
                                    return null;
                                  },
                                  labelicon: Icons.person_2_outlined,
                                  hintText: 'high',
                                  controller: _clHighcontroller
                              )
                          ),

                          SizedBox(
                            height: 20,
                          ),
                          Container(
                              height: 45,
                              child:
                              CustomTextFieldicon(
                                  localsvg: LocalSVGImages.sellingcostgreen,
                                  labeliconUnselected: LocalSVGImages.sellingcost,
                                  textInputType: TextInputType.number,
                                  txtalign: TextAlign.center,
                                  onChanged: (value) {
                                    _commonProvider.setCLLow(value);
                                  },
                                  validator: (value) {
                                    if(value == null ||  value.isEmpty){
                                      return 'Please enter low';
                                    }
                                    return null;
                                  },
                                  labelicon: Icons.person_2_outlined,
                                  hintText: 'Low',
                                  controller: _clLowcontroller
                              )
                          ),

                          SizedBox(
                            height: 20,
                          ),
                          Container(
                              height: 45,
                              child:
                              CustomTextFieldicon(
                                  localsvg: LocalSVGImages.sellingcostgreen,
                                  labeliconUnselected: LocalSVGImages.sellingcost,
                                  textInputType: TextInputType.number,
                                  txtalign: TextAlign.center,
                                  onChanged: (value) {
                                    _commonProvider.setCLRating(value);
                                  },
                                  validator: (value) {
                                    if(value == null ||  value.isEmpty){
                                      return 'Please enter rating';
                                    }
                                    return null;
                                  },
                                  labelicon: Icons.person_2_outlined,
                                  hintText: 'Rating',
                                  controller: _clRatingcontroller
                              )
                          ),

                          SizedBox(
                            height: 20,
                          ),
                          Container(
                              height: 45,
                              child:
                              CustomTextFieldicon(
                                  localsvg: LocalSVGImages.sellingcostgreen,
                                  labeliconUnselected: LocalSVGImages.sellingcost,
                                  textInputType: TextInputType.name,
                                  txtalign: TextAlign.center,
                                  onChanged: (value) {
                                    _commonProvider.setCLRemarks(value);
                                  },
                                  validator: (value) {
                                    if(value == null ||  value.isEmpty){
                                      return 'Please enter remarks';
                                    }
                                    return null;
                                  },
                                  labelicon: Icons.person_2_outlined,
                                  hintText: 'Remarks (if any)',
                                  controller: _clRemarkcontroller
                              )
                          ),

                          SizedBox(
                            height: 20,
                          ),
                          Container(
                              height: 45,
                              child:
                              CustomTextFieldicon(
                                  localsvg: LocalSVGImages.sellingcostgreen,
                                  labeliconUnselected: LocalSVGImages.sellingcost,
                                  textInputType: TextInputType.name,
                                  txtalign: TextAlign.center,
                                  onChanged: (value) {
                                    _commonProvider.setCLSPA(value);
                                  },
                                  validator: (value) {
                                    if(value == null ||  value.isEmpty){
                                      return 'Please enter SPA';
                                    }
                                    return null;
                                  },
                                  labelicon: Icons.person_2_outlined,
                                  hintText: 'SPA (Sale-Purchase Agreement) Provision',
                                  controller: _clSpacontroller
                              )
                          ),

                          SizedBox(
                            height: 20,
                          ),
                          Container(
                              height: 45,
                              child:
                              CustomTextFieldicon(
                                  localsvg: LocalSVGImages.sellingcostgreen,
                                  labeliconUnselected: LocalSVGImages.sellingcost,
                                  textInputType: TextInputType.name,
                                  txtalign: TextAlign.center,
                                  onChanged: (value) {
                                    _commonProvider.setCLAddInfo(value);
                                  },
                                  validator: (value) {
                                    if(value == null ||  value.isEmpty){
                                      return 'Please enter additional info';
                                    }
                                    return null;
                                  },
                                  labelicon: Icons.person_2_outlined,
                                  hintText: 'Any Additional Information',
                                  controller: _clAddinfocontroller
                              )
                          ),

                          buildSizedBox(width: 0, height: 25),
                          CommonDottedBorder(
                              idproof: _pancard,
                              tagname: "clpancard",
                              uploadtxt:
                              'Pan Card (Upload) (optional)',
                              onPressed: () {
                                _pickimage2(false,1 );
                                print('photo upload clicked ${_pancard}');
                              }),

                          buildSizedBox(width: 0, height: 25),
                          CommonDottedBorder(
                              idproof: _aadhar,
                              tagname: "claadharupload",
                              uploadtxt:
                              'Adhar Card (Upload) (optional)',
                              onPressed: () {
                                _pickimage2(false,2);
                                print('photo upload clicked ${_aadhar}');
                              }),

                          buildSizedBox(width: 0, height: 25),
                          CommonDottedBorder(
                              idproof: _clientmaster,
                              tagname: "clclientmaster",
                              uploadtxt:
                              'Client Master List (Upload) (optional)',
                              onPressed: () {
                                _pickimage2(false,3);
                                print('photo upload clicked ${_clientmaster}');
                              }),
                          buildSizedBox(width: 0, height: 25),
                          CommonDottedBorder(
                              idproof: _cancelldchq,
                              tagname: "clcancldchq",
                              uploadtxt:
                              'Cancelled Cheque (Upload) (optional)',
                              onPressed: () {
                                _pickimage2(false,4);
                                print('photo upload clicked ${_cancelldchq}');
                              }),
                          buildSizedBox(width: 0, height: 25),
                          CommonDottedBorder(
                              idproof: _demat,
                              tagname: "cldemat",
                              uploadtxt:
                              'Demat Statement with Shares (Upload) (optional)',
                              onPressed: () {
                                _pickimage2(false,5);
                                print('photo upload clicked ${_demat}');
                              }),
                        ],
                      ),
                    ),
                  ),

                  Container(
                    width: devicewidth,
                    // color: Colors.red,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 18.0, top: 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Your details", style: CustomTextStyle.txt16Rb,),
                          buildQuickStat(devicewidth, "Dealer Name", profilevm.profileResponseModel?.user?.name ?? "",
                              "Seller Contact", profilevm.profileResponseModel?.user?.mobile ?? ""),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 80,
                              width: devicewidth,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Flexible(child: Text(
                                    "Email Address for Further Communication",
                                    style: CustomTextStyle
                                        .txt14gpquickstatsgrey,)),
                                  SizedBox(height: 10,),
                                  Flexible(child: Text(profilevm.profileResponseModel?.user?.email ?? "",
                                      style: CustomTextStyle.txt14Rbtxtblk)),
                                ],
                              ),
                            ),
                          ),
                          // buildQuickStat(devicewidth,"Email Address for Further Communication","hello@craftpixels.in","",""),
                        ],
                      ),
                    ),
                  ),
              Consumer<CreateListViewModel>(
                  builder: (context, createlistvm, child) {
                    return createlistvm.state == ViewState.busy ? Loader(): Padding(
                      padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 20),
                      child: Container(
                        height: 50,
                        width: devicewidth,
                        child: CustomMaterialButton(
                          text: 'List for Sale',
                          onPressed: () {

                      /*
                           name:Purple Falme
                            no_of_share:200
                            cost:20000
                            category_id:1
                            contact:9750042290
                            email:boopathit9811@gmail.com

                            negotiable_price_range:1
                            quantity:1
                            negotiable_quantity_range:1
                            high:1
                            low:1
                            rating:3
                            remarks:test
                            spa_provision:Yes
                            additional_info:test*/



                            Map<String, dynamic> createlistparams = {
                              "name": _commonProvider.CLname,
                              "no_of_share": _commonProvider.CLshares,
                              "cost": _commonProvider.CLsellingcost,
                              "category_id": catid,
                              "contact": profilevm.profileResponseModel?.user?.mobile ?? "",
                              "email": profilevm.profileResponseModel?.user?.email ?? "",

                              "negotiable_price_range": _commonProvider.CLNegoPrice,
                              "quantity": _commonProvider.CLQtyHnd,
                              "negotiable_quantity_range": _commonProvider.CLNegoQty,
                              "high": _commonProvider.CLhigh,
                              "low": _commonProvider.CLlow,
                              "rating": _commonProvider.CLRating,
                              "remarks": _commonProvider.CLRemarks,
                              "spa_provision": _commonProvider.CLSPA,
                              "additional_info": _commonProvider.CLaddInfo,
                            };

                            print('createlistparams... ${createlistparams}');

                          if (_formKey.currentState!.validate()) {
                                     if (_image != null) {
                              _createListViewModel.createlistapi(
                                  onFailureRes: onFailureRes,
                                  onSuccessRes: onSuccessRes,
                                  createlistparams: createlistparams,
                                  stockimg: _image,
                                  aadharimg: _aadhar,
                                  panimg: _pancard,
                                  clientmasterimg: _clientmaster,
                                  cancldchqimg: _cancelldchq,
                                  dematimg: _demat
                              );
                            } else {
                              showToast("Upload Company Image");
                            }
                          }
                          print('Button pressed!');
                          },
                        ),
                      ),
                    );
                  }
                  ),
                ],
              ),
            );
          }
          ),

        ),
      ),
    );
  }

  onFailureRes(String p1) {
  }

  onSuccessRes(StatusandMessageModel? p1) {
    _commonProvider.setCLname("");
    _commonProvider.setCLshares("");
    _commonProvider.setCLsellingcost("");
    _commonProvider.setCLNegoPce("");
    _commonProvider.setCLNegoQty("");
    _commonProvider.setCLQtyHnd("");
    _commonProvider.setCLHigh("");
    _commonProvider.setCLLow("");
    _commonProvider.setCLRating("");
    _commonProvider.setCLRemarks("");
    _commonProvider.setCLSPA("");
    _commonProvider.setCLAddInfo("");

    Navigator.push(context, MaterialPageRoute(builder: (context) => DonePage(purchaseType: "createlist",isCrreateList: true,)));
  }

  void _pickimage2(bool camera,int filecode) async{
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
      } 
      else {
    /*    final ImagePicker _picker = ImagePicker();
        final XFile? image =
            await _picker.pickImage(source: ImageSource.gallery);

        if (image != null) {
          setState(() {
            _image = File(image.path);
            //  fileToString(_image!);
          });
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
    else {
      //Calling API after UI renders
      WidgetsBinding.instance.addPostFrameCallback((_) {
        permissionPrompt2(context);
      });
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
    }else{
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
              _image = File(image.path);
              print('_image ---${_image}');
              break;
            case 1:
              _pancard = File(image.path);
              print('_pancard ---${_pancard}');
              break;
            case 2:
              _aadhar = File(image.path);
              print('_aadhar ---${_aadhar}');
              break;
            case 3:
              _clientmaster = File(image.path);
              print('_clientmaster ---${_clientmaster}');
              break;
            case 4:
              _cancelldchq = File(image.path);
              print('_cancelldchq ---${_cancelldchq}');
              break;
            case 5:
              _demat = File(image.path);
              print('_demat ---${_demat}');
              break;
          }

        });
      }
    }
  }
}
