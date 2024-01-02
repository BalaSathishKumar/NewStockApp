

import 'package:base_flutter_provider_project/data/models/LoginModel/LoginModel.dart';
import 'package:base_flutter_provider_project/ui/Register/RegisterPage.dart';
import 'package:base_flutter_provider_project/utils/common_textstyles.dart';
import 'package:base_flutter_provider_project/viewModel/otp_view_model.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:provider/provider.dart';

import '../../common_widgets/appbar_widgets/common_appbar.dart';
import '../../common_widgets/button_widgets/common_button.dart';
import '../../common_widgets/loading_widgets/loader.dart';

import '../../constants/colors.dart';
import '../../data/models/OTP_Verify_model/OtpVerifyModel.dart';
import '../../utils/SharedHelper/PreferenceHelper.dart';
import '../../utils/SharedHelper/Preference_Constant.dart';
import '../../utils/common_functions.dart';
import '../../utils/logger.dart';
import '../../viewModel/CommonProvider.dart';
import '../../viewModel/base_view_model/base_view_model.dart';
import '../../viewModel/login_view_model.dart';
import '../home/homepage.dart';

class OTPVerification extends StatefulWidget {
  const OTPVerification({Key? key}) : super(key: key);

  @override
  State<OTPVerification> createState() => _OTPVerificationState();
}

class _OTPVerificationState extends State<OTPVerification> {

  late OtpViewModel _otpViewModel;
  late LoginViewModel _loginViewModel;
  String OTP = "";
  String submitbtn= 'Verify & Continue';
  String  authcode  = "";
  String  authtoken  = "";
  OtpFieldController otpController = OtpFieldController();
  late CommonProvider _commonProvider;
  @override
  void initState() {
    super.initState();
    authToken();
    _commonProvider = Provider.of<CommonProvider>(context, listen: false);
    _otpViewModel = Provider.of<OtpViewModel>(context, listen: false);
    _loginViewModel = Provider.of<LoginViewModel>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    var deviceheight = MediaQuery.of(context).size.height;
    var devicewidth = MediaQuery.of(context).size.width;


    return Consumer<CommonProvider>(
      builder: (context,resendVM,child) {
        return Scaffold(
          backgroundColor: Appcolors.white,
          appBar: CustomAppBar(height: 60.0,
              title: 'OTP Verification',
              appbarclr: Appcolors.white,
              HideMenu: true),
          body: Container(
            height: deviceheight,
            width: devicewidth,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Text("Please enter the OTP we sent to your mobile",
                      style: CustomTextStyle.txt16Rb),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(_commonProvider.UserNum,
                        style: CustomTextStyle.txt16Rb),
                  ),
                  Container(
                    height: deviceheight / 2,
                    width: devicewidth,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 12.0, right: 12.0),
                            child: OTPTextField(
                                controller: otpController,
                                length: 4,
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width,
                                textFieldAlignment: MainAxisAlignment
                                    .spaceAround,
                                fieldWidth: 45,
                                fieldStyle: FieldStyle.underline,
                                otpFieldStyle: OtpFieldStyle(

                                    enabledBorderColor: Appcolors.black,
                                    focusBorderColor: Appcolors.splashbgcolor,
                                    disabledBorderColor: Appcolors
                                        .splashbgcolor),
                                outlineBorderRadius: 15,
                                style: TextStyle(fontSize: 17),
                                onChanged: (pin) {
                                  print("Changed: " + pin);
                                },
                                onCompleted: (pin) {
                                  print("Completed: " + pin);
                                  OTP = pin;
                                  submitbtn = "Proceed";
                                }),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 12.0, right: 12.0),
                          child: GestureDetector(
                            onTap: () {
                              print('ISresend1 ');
                              ResendOtpApi(resendVM.LoginNum);
                              },
                            child: Container(
                              width: devicewidth,
                              height: 40,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 25.0, right: 12.0),
                                child: Row(
                                  children: [
                                    Text("Didn’t receive OTP?",
                                      style: CustomTextStyle.txt12Rltxtlitegrey2,),
                                    Text(" Try again",
                                        style: CustomTextStyle.txt12Rrtxtgry2),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 38.0, left: 18, right: 18),
                          child: Consumer<OtpViewModel>(
                              builder: (context, otpviewmodel, child) {
                                return otpviewmodel.state == ViewState.busy
                                    ? const Loader() :

                                Container(
                                  height: 50,
                                  width: devicewidth,
                                  child: CustomMaterialButton(
                                    text: submitbtn,
                                    onPressed: () {
                                      if (OTP == "") {
                                        showToast('Enter your OTP');
                                      } else {
                                        Map<String, dynamic> otpparams = {
                                          "otp": OTP,
                                          "auth_code": authcode,
                                          "user_type": "users"
                                        };
                                        _otpViewModel.otpapi(
                                            onFailureRes: onFailureRes,
                                            onSuccessRes: onSuccessRes,
                                            otpparams: otpparams);
                                      }
                                    },
                                  ),
                                );
                              }
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    );



  }
  onFailureRes(String error) {
    Logger.appLogs('onOtpFailureRes:: $error');
    errorAlert(context, error);
  }
  onSuccessRes(OtpResponseModel? Otpdata){
    print('success data ${Otpdata}');
    PreferenceHelper.setString(PrefConstant.authtoken,Otpdata?.data.userData.authToken ?? "");
    _commonProvider.setLoginNum("");
    otpController.clear();
    if(Otpdata?.data.newUser != "no"){
      // context.router.push(Kycpage());
      Route route = MaterialPageRoute(builder: (context) => RegisterPage(IsProfileEdit: false,));
    Navigator.pushReplacement(context, route);
     // Navigator.push(context, MaterialPageRoute(builder: (context)=> KYCpage()));
    }else{
      print('old user');
     // context.router.push(Saudahomepage());
      PreferenceHelper.setString(PrefConstant.isLoggedIn,"true");
      Route route = MaterialPageRoute(builder: (context) =>  SaudaHomePage());
      Navigator.pushReplacement(context, route);
     // Navigator.push(context, MaterialPageRoute(builder: (context)=> SaudaHomePage()));

    }


   print('Otp Verified ');

  }

  Future<String> authToken() async{
     authcode = await PreferenceHelper.getString(PrefConstant.authcode);
     authtoken = await PreferenceHelper.getString(PrefConstant.authtoken);
    print('authtoken in otp verify page ${authtoken}');
    print('authtoken in otp verify page ${authcode}');

    return authcode;
  }
   ResendOtpApi(String loginNum) {
     print('ISresend2 $loginNum');
    if (loginNum != "") {
     // showToast('Enter your mobile number');
      Map<String, dynamic> loginparams = {
        "mobile": loginNum,
        "user_type": "Users",
        "referral_code": "",
        "token": _commonProvider.FCMtoken,
      };
      _loginViewModel.loginapi(
          onFailureRes: onFailureRes,
          loginparams: loginparams,
          onSuccessRes: onloginSuccessRes);
    } else {

    }
  }




  onloginSuccessRes(LoginResponseModel? data) {
    PreferenceHelper.setString(PrefConstant.authcode,data?.data.authCode ?? "");
    authToken();
    print('auth code ${data?.data.authCode.toString()}');
    showToast('Your OTP ${data?.data.otp}');
  }
}
