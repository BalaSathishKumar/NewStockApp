import 'dart:io';

import 'package:permission_handler/permission_handler.dart';

import '../common_widgets/AppDrawer/FullScreenDrawer.dart';
import 'local_images.dart';

enum ErrorType {
  dioError,
  firebaseError,
  appError,
}

class Constant {
  static bool isBoarding = false;
  static String isLoggedIn = "";
  static bool isPermissionGranted = false;

  static String BaseUrl = 'https://sauda.wipspace.in/';
  static String Phonepeurl = 'https://api-preprod.phonepe.com/apis/pg-sandbox/';



  // static UserProfile? userProfile;
  static String userRoll = "";
  static const List<String> reasons = [
    'Shopping',
    'Early loan re-payment',
    'Medical Expense',
    'Credit Card Bill',
    'Others'
  ];
  static List<DrawerItem> drawerItems2 = [
    DrawerItem(iconAsset: LocalSVGImages.menu1, title: 'Profile'),
  //  DrawerItem(iconAsset: LocalSVGImages.menu1, title: 'KYC Update'),
   // DrawerItem(iconAsset: LocalSVGImages.menu1, title: 'Profile'),
    DrawerItem(iconAsset: LocalSVGImages.menu5, title: 'Transaction History'),
    DrawerItem(iconAsset: LocalSVGImages.menu4, title: 'User Directory'),
    DrawerItem(iconAsset: LocalSVGImages.menu7, title: 'My Portfolio'),
    DrawerItem(iconAsset: LocalSVGImages.menu8, title: 'Chat With Sauda Team'),
    DrawerItem(iconAsset: LocalSVGImages.menu8, title: 'Consultations'),
    DrawerItem(iconAsset: LocalSVGImages.menu3, title: 'Rewards & Referrals'),
    DrawerItem(iconAsset: LocalSVGImages.menu3, title: 'Promocode'),
  ];
  static const termsOfUseUrl = 'https://jifytestbucket.s3.ap-south-1.amazonaws.com/Legal/TermsOfUser.pdf';
  static const kmTermsUrl = 'https://jifytestbucket.s3.ap-south-1.amazonaws.com/Legal/KMTermsOfUse.pdf';
  static const privacyPolicy = 'https://jifytestbucket.s3.ap-south-1.amazonaws.com/Legal/PrivacyPolicy.pdf';
  static String rupeeSymbol = String.fromCharCode(0x20B9);
  static String tartanWebUser = 'TARTAN_WEB_USER';
  static String tartanNativeUser = 'TARTAN_NATIVE_USER';
  static String firstTimeUser = 'FIRST_TIME_USER';
  static String userDoesNotExist = 'USER_DOES_NOT_EXIST';
  static String validUserExit = 'VALID_USER_EXIT';
  static String kycDoneStatus = 'DONE';
  static String kycPendingStatus = 'PENDING';
  static String kycNotStartedStatus = 'NOTSTARTED';
  static String digiLocker = 'digilocker';
  static String noDigiLocker = 'no_digilocker';
  static String helpEmail = 'preeti@jify.co';
  static List<Permission> permissions = [
    Permission.location,
    Permission.camera,
    Permission.storage,
    Permission.microphone,
    if (Platform.isAndroid) Permission.bluetooth,
  ];
  static String enterValidAmount = 'Enter valid amount';
  static String errMaxAmount = 'You entered more than maximum amount';
}
