import 'dart:async';
import 'dart:convert';


import 'package:base_flutter_provider_project/constants/colors.dart';
import 'package:base_flutter_provider_project/data/models/SocialModel/CheckSocialModel.dart';
import 'package:base_flutter_provider_project/ui/otp_verification/otpverification.dart';
import 'package:base_flutter_provider_project/utils/common_textstyles.dart';
import 'package:base_flutter_provider_project/viewModel/CommonProvider.dart';
import 'package:base_flutter_provider_project/viewModel/social_viewmodel.dart';
import 'package:country_picker/country_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_platform_interface/firebase_auth_platform_interface.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';

import '../../common_widgets/alert_widgets/dialog_textfield.dart';
import '../../common_widgets/dropdown_widgets/common_dropdown.dart';
import '../../common_widgets/loading_widgets/loader.dart';
import '../../constants/constant.dart';
import '../../constants/local_images.dart';
import '../../common_widgets/bottomsheet_widgets/common_bottomsheet.dart';
import '../../common_widgets/button_widgets/common_button.dart';
import '../../common_widgets/textfields_widgets/common_textfield.dart';
import '../../data/models/LoginModel/LoginModel.dart';
import 'package:http/http.dart' as http;

import '../../data/models/SocialModel/StatusMessageModel.dart';
import '../../utils/SharedHelper/PreferenceHelper.dart';
import '../../utils/SharedHelper/Preference_Constant.dart';
import '../../utils/common_functions.dart';
import '../../utils/logger.dart';
import '../../viewModel/base_view_model/base_view_model.dart';
import '../../viewModel/login_view_model.dart';
import '../../viewModel/profile_view_model.dart';
import '../home/homepage.dart';
import '../Register/RegisterPage.dart';
import '../kyc/KYC_Advisor.dart';
import '../kyc/NewKycUser.dart';
import '../Dealers/select_payment.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  String _selectedOption = 'Users';
  late LoginViewModel _loginViewModel;
  late SocialViewModel _socialViewModel;
  late GoogleSignInProvider _googlesignProvider;
  late UserageProvider _userAgeProvider;
  late CommonProvider _commonProvider;
  late ProfileViewModel _profileViewModel;
  String _useroll = "";
  GoogleSignInAccount? _currentUser;
  bool _isAuthorized = false; // has granted permissions?
  String _contactText = '';
  final fb = FacebookLogin();

  late GoogleSignIn _googleSignIn; //= GoogleSignIn(scopes: ['email']);
   TextEditingController _mobilenumbercontroller = TextEditingController();
  @override
  void initState() {
    super.initState();
    _googlesignProvider =Provider.of<GoogleSignInProvider>(context,listen: false) ;
    _loginViewModel = Provider.of<LoginViewModel>(context, listen: false);
    _socialViewModel = Provider.of<SocialViewModel>(context, listen: false);
    _userAgeProvider = Provider.of<UserageProvider>(context, listen: false);
    _commonProvider = Provider.of<CommonProvider>(context, listen: false);
    _profileViewModel = Provider.of<ProfileViewModel>(context, listen: false);

    _mobilenumbercontroller = TextEditingController(text: _commonProvider.UserNum);

       //UI render callback
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _commonProvider.setUserMobile(false);
    });
    _googleSignIn = GoogleSignIn(
        scopes: [
          'email',
          'https://www.googleapis.com/auth/userinfo.profile',
        ],
    );
  }
  void showGuestBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16.0),
        ),
      ),
      builder: (BuildContext context) {
        return CustomBottomSheet(
          headtxt: "Use guest mode?",
          headtxt2: "Creating an account or singing in is required for  unrestricted access to all of Sauda’s features.",
          butntxt1: "Cancel",
          butntxt2: "Continue",
          onCancelButtonPressed: () {
            Navigator.pop(context); // Close the bottom sheet
          },
          onContinueButtonPressed: (){
            PreferenceHelper.setString(PrefConstant.authtoken,"guestloggedin");
            _profileViewModel.clearData();
            Constant.userRoll = "Guest";
            Route route = MaterialPageRoute(builder: (context) => SaudaHomePage());
            Navigator.pushReplacement(context, route);
          },
        );
      },
    );
  }

  onFailureRes(String error) {
    Logger.appLogs('onLoginFailureRes:: $error');
    errorAlert(context, error);
  }
  onSuccessRes(LoginResponseModel? data){
    print('success data ${data}');
    showToast('Your OTP ${data?.data.otp}');
    PreferenceHelper.setString(PrefConstant.authcode,data?.data.authCode ?? "");
    print('auth code ${data?.data.authCode.toString()}');
    navfun(data?.message);
  }

  @override
  Widget build(BuildContext context) {
    var deviceheight = MediaQuery.of(context).size.height;
    var devicewidth = MediaQuery.of(context).size.width;


   return Consumer<CommonProvider>(
       builder: (context,resendVM,child) {


       return Scaffold(
         backgroundColor: Appcolors.white,
         body: Container(
           width: devicewidth,
           height: deviceheight,
           child: SingleChildScrollView(
             child: Column(
               children: [
                 Container(
                   height: deviceheight / 2.5,
                   child: Stack(
                     children: [
                       Hero(
                         tag: 'headrgtwave',
                         child: Image.asset(
                           LocalPNGImages.headrightwave,
                           fit: BoxFit.fill,
                         ),
                       ),
                       Positioned(
                         child: Container(
                           height: deviceheight / 2,
                           width: devicewidth,
                           child: Padding(
                             padding: const EdgeInsets.only(
                                 top: 66.0, left: 18, right: 18),
                             child: Column(
                               mainAxisAlignment: MainAxisAlignment.center,
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Hero(
                                   tag: 'brandLogo1',
                                   child: SvgPicture.asset(
                                       LocalSVGImages.ic_brand_logo,
                                       height: 30,
                                       width: 30),

                                 ),
                                 Text(
                                   "Welcome",
                                   style: CustomTextStyle.txt36gp,
                                 ),
                                 Text(
                                   "Let’s get you started",
                                   style: CustomTextStyle.txt24Rblitegreen,
                                 )
                               ],
                             ),
                           ),
                         ),
                       ),
                     ],
                   ),
                 ),
                 Container(
                   height: deviceheight / 2 + 50,
                   child: Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Container(
                             child: Consumer<CommonProvider>(
                                 builder: (context, commonvm, child) {
                                   return Row(
                                     children: [
                                       Padding(
                                         padding: const EdgeInsets.only(
                                             left: 18.0),
                                         child: Hero(
                                             tag: 'mobile',
                                             child: SvgPicture.asset(
                                               commonvm.IsMobile
                                                   ? LocalSVGImages.mobilegreen
                                                   : LocalSVGImages.mobileblack,
                                             )

                                           /* Image.asset(
                                          LocalPNGImages.mobile,
                                          height: 24,
                                          width: 30,
                                          fit: BoxFit.fill,
                                        ),*/
                                         ),

                                       ),
                                       TextButton(
                                         onPressed: () {
                                           showCountryPicker(
                                             context: context,
                                             showPhoneCode: true,
                                             // optional. Shows phone code before the country name.
                                             onSelect: (Country country) {
                                               print(
                                                   'Select country: ${country
                                                       .phoneCode}');
                                               Provider.of<Counterr>(context,
                                                   listen: false)
                                                   .increment(
                                                   country.phoneCode);
                                             },
                                           );
                                         },
                                         child: Consumer<Counterr>(
                                           builder: (context, counter, child) {
                                             return Text(
                                               '(+${counter.phonecode})',
                                               style: CustomTextStyle
                                                   .txt18Rrblk,
                                             );
                                           },
                                         ),
                                       ),
                                       Container(
                                         width: devicewidth / 2 + 50,
                                         height: 45,
                                         //   color: Colors.red,
                                         child: CustomTextField(
                                           hintText: 'phone number',
                                           controller: _mobilenumbercontroller,
                                           onChanged: (value) {
                                             _commonProvider.setUserNum(value);
                                             _commonProvider.setUserMobile(
                                                 true);
                                           },
                                         ),
                                       ),
                                     ],
                                   );
                                 }
                             ),
                           ),
                           ClickContinue(devicewidth, _mobilenumbercontroller),
                           TermsandCond(),
                           SocialLogin(context)
                         ],
                       )),
                 )
               ],
             ),
           ),
         ),
       );
     }
   );
  }

  Expanded SocialLogin(BuildContext context) {
    return Expanded(
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      width:100,
                                      child: Divider(
                                        color: Appcolors.txtlitegrey3,
                                      ),
                                    ),
                                    Container(
                                      child: Text("or with",style: CustomTextStyle.txt12Rrtxtgry3)
                                    ),
                                    Container(
                                      width:100,
                                      child: Divider(
                                        color: Appcolors.txtlitegrey3,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Consumer<SocialViewModel>(
                                  builder: (context,chkgoogleVM,child){
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      SizedBox(),
                                      chkgoogleVM.state == ViewState.busy? Loader():Padding(
                                        padding: const EdgeInsets.only(left: 45.0),
                                        child: GestureDetector(
                                          onTap: (){
                                            _googlesignProvider.googleLogin(onSuccessRes: ongoogleloginsuccess);
                                            },
                                          child: ClipOval(
                                              child: Container(
                                                height: 50,
                                                width: 50,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  shape: BoxShape.circle,
                                                  border: Border.all(color: Appcolors.gsignin),
                                                ),
                                                child:   Hero(
                                                  tag: 'google',
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: SvgPicture.asset(LocalSVGImages.googlesignin,
                                                        height: 10,
                                                        width: 10),
                                                  ),
                                                ),
                                              )),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: (){
                                         // Navigator.push(context, MaterialPageRoute(builder: (context)=> SelectPayment()));

                                          fbSignIn();
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.only(right: 45.0),
                                          child: ClipOval(
                                              child: Container(
                                                height: 50,
                                                width: 50,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  shape: BoxShape.circle,
                                                  border: Border.all(color: Appcolors.gsignin),
                                                ),
                                                child:   Hero(
                                                  tag: 'fb',
                                                  child: SvgPicture.asset(LocalSVGImages.fbsignin2,
                                                    ),
                                                ),
                                              )),
                                        ),
                                      ),
                                      SizedBox(),

                                    ],
                                  );}
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 18.0,left: 15),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                          "Don’t feel like signing in? ",
                                          style: CustomTextStyle.txt12Rrtxtgry),
                                      InkWell(
                                          onTap: (){
                                            showGuestBottomSheet(context);
                                          },
                                          child: Text( "Continue as Guest",style: CustomTextStyle.txt14Rrtxtgry2)),
                                    ],
                                  )
                                ),
                              ],
                            ),
                          ),
                        );
  }

  Padding TermsandCond() {
    return Padding(
                          padding: const EdgeInsets.only(top: 18.0,left: 15),
                          child: RichText(
                            textAlign: TextAlign.center,
                            text:  TextSpan(
                              style: CustomTextStyle.txt12Rrtxtgry2,
                              children: <TextSpan>[
                                TextSpan(
                                    text: "By clicking, you accept our ",
                                    style: CustomTextStyle.txt12Rrtxtgry),
                                TextSpan(text: "Terms of service"),
                                TextSpan(text: " & ", style: CustomTextStyle.txt12Rrtxtgry),
                                TextSpan(text: "Privacy policy"),
                              ],
                            ),
                          ),
                        );
  }

  Padding ClickContinue(double devicewidth, TextEditingController _mobilenumbercontroller) {
    return Padding(padding: const EdgeInsets.only(top: 38.0,left: 18,right: 18),
                          child: Consumer<CommonProvider>(
                              builder: (context,resendVM,child) {
                                return Consumer<LoginViewModel>(
                                    builder: (context, login, child) {
                                      return login.state == ViewState.busy
                                          ? const Loader() : Container(
                                        height: 50,
                                        width: devicewidth,
                                        child: CustomMaterialButton(
                                          text: 'Continue',
                                          onPressed: () {
                                            _commonProvider.setUserMobile(false);
                                            //      Navigator.push(context, MaterialPageRoute(builder: (contex) => NewKycUser()));
                                            //     Navigator.push(context, MaterialPageRoute(builder: (contex) => KycAdvisor()));

                                            OptApi();

                                          },
                                        ),
                                      );
                                    });
                              }
                          ),
                        );
  }


  void navfun(String? login) {
    if( login == "Successfully OTP Send"){
      // context.router.push(Otpverification());
      Route route = MaterialPageRoute(builder: (context) => OTPVerification());
      Navigator.pushReplacement(context, route);

    // Navigator.push(context, MaterialPageRoute(builder: (context)=> OTPVerification()));
    }else {

    }
  }


  onSocialFailureRes(String p1) {
  }

  onSocialSuccessRes(StatusMessageModel? socialSuccess) {


    if(socialSuccess?.data?.newUser != "no"){
      // context.router.push(Kycpage());
      PreferenceHelper.setString(PrefConstant.authtoken,socialSuccess?.data?.userData?.authToken ?? "");
      Navigator.push(context, MaterialPageRoute(builder: (context)=> RegisterPage(IsProfileEdit: false,)));
    }else{
      print('old user');
      // context.router.push(Saudahomepage());
      PreferenceHelper.setString(PrefConstant.authtoken,socialSuccess?.data?.userData?.authToken ?? "");
      Navigator.push(context, MaterialPageRoute(builder: (context)=> SaudaHomePage()));

    }

  }

  ongoogleloginsuccess(String p1) {
    if(_googlesignProvider.user == null){
      print('google user null');
    }else{
      print('google user social_id: ${_googlesignProvider.user?.id}');

      if(_googlesignProvider.user?.id != null){
        Map<String, dynamic> chksocialparams = {
          "social_id": _googlesignProvider.user?.id,
          "social_provider_type": "google",
          "name": _googlesignProvider.user?.displayName,
          "email": _googlesignProvider.user?.email,

        };
        _socialViewModel.CheckSocialapi(onFailureRes: onSocialFailureRes, onSuccessRes: onChkSocialSuccessRes, socialparams: chksocialparams);

      }






    }
  }

  bool _exitApp(BuildContext context) {
    return true;
    Navigator.of(context).pop(true);
  }


  OptApi() {
    if (_mobilenumbercontroller.text == "") {
      showToast('Enter your mobile number');
    } else {

      if(_mobilenumbercontroller.text.length != 10){
        showToast('Enter valid mobile number');
      }else {
        _commonProvider.setLoginNum(_mobilenumbercontroller.text);
        Map<String, dynamic> loginparams = {
          "mobile": _mobilenumbercontroller.text,
          "user_type": "Users",
          "referral_code": "",
          "token": _commonProvider.FCMtoken,
        };
        _loginViewModel.loginapi(
            onFailureRes: onFailureRes,
            loginparams: loginparams,
            onSuccessRes: onSuccessRes);
      }


    }
  }



  onChkSocialSuccessRes(CheckSocialModel? chkSocialdata) {

    if(chkSocialdata?.data?.newUser == "yes"){

      Navigator.push(context, MaterialPageRoute(builder: (context) => CommonDialog(
        controller: TextEditingController(),
        initialText: 'Initial Value',
        onSubmitted: (value) {
          print('Submitted text: $value');
          if(value != null || value.isNotEmpty){
            Map<String, dynamic> socialparams = {
              "social_id": _googlesignProvider.user?.id,
              "social_provider_type": "google",
              "name": _googlesignProvider.user?.displayName,
              "email": _googlesignProvider.user?.email,
              "mobile": value
            };
            _socialViewModel.socialapi(onFailureRes: onSocialFailureRes, onSuccessRes: onSocialSuccessRes, socialparams: socialparams);
          }else{
            showToast("Enter Mobile Number");
          }
        },
      ),));
    }else{
      PreferenceHelper.setString(PrefConstant.isLoggedIn,"true");
      PreferenceHelper.setString(PrefConstant.authtoken,chkSocialdata?.data?.userData?.authToken ?? "");
      Route route = MaterialPageRoute(builder: (context) =>  SaudaHomePage());
      Navigator.pushReplacement(context, route);
    }
  }

  Future<void> fbSignIn() async {

    final res1 = await fb.logOut();
    /*logIn(permissions: [
      FacebookPermission.publicProfile,
      FacebookPermission.email,
    ]);*/
    // Log in
    final res = await fb.logIn(permissions: [
      FacebookPermission.publicProfile,
      FacebookPermission.email,
    ]);
    switch (res.status) {
      case FacebookLoginStatus.success:
      // Logged in

      // Send access token to server for validation and auth
        final FacebookAccessToken? accessToken = res.accessToken;
        print('Access token: ${accessToken?.token}');

        // Get profile data
        final profile = await fb.getUserProfile();
        print('Hello, ${profile?.name}! You ID: ${profile?.userId}');

        // Get user profile image url
        final imageUrl = await fb.getProfileImageUrl(width: 100);
        print('Your profile image: $imageUrl');

        // Get email (since we request email permission)
        final email = await fb.getUserEmail();
        // But user can decline permission
        if (email != null)
          print('And your email is $email');

        break;
      case FacebookLoginStatus.cancel:
      // User cancel log in
        break;
      case FacebookLoginStatus.error:
      // Log in failed
        print('Error while log in: ${res.error}');
        break;
    }

  }
}



class Counterr with ChangeNotifier {
  String phonecode = "91";

  String get Phonecode => phonecode;

  void increment(String pcd) {
    phonecode = pcd;
    notifyListeners();
  }
}

class GoogleSignInProvider extends ChangeNotifier {

  GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
  GoogleSignInAccount? _user;
  GoogleSignInAccount? get user => _user;

  Future googleLogin( {required Function(String) onSuccessRes}) async {
    try {

      GoogleSignInAccount? googleuser;
     googleuser = await googleSignIn.signOut();
     googleuser = await googleSignIn.signIn();
    //Navigator.push(context, MaterialPageRoute(builder: (context)=> OTPVerification()));
    if (googleuser == null) {
      showToast("Signin failed");
    } else {
      _user = googleuser;
      final googleAuth = await googleuser.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
      notifyListeners();
      print('GoogleSignIn datas : Email: ${user?.email}, ID: ${user?.id}, NAME: ${user?.displayName}');
      onSuccessRes("success");
    }
  } catch (e){
      showToast(e.toString());
    }
  }

}