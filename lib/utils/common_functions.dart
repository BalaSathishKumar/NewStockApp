import 'dart:collection';
import 'dart:io';
import 'dart:math';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:base_flutter_provider_project/common_widgets/alert_widgets/error_dialog.dart';
import 'package:base_flutter_provider_project/common_widgets/alert_widgets/permission_prompt.dart';
import 'package:base_flutter_provider_project/config/locator.dart';
import 'package:base_flutter_provider_project/constants/constant.dart';
import 'package:base_flutter_provider_project/constants/secure_storage_constants.dart';
import 'package:base_flutter_provider_project/services/exceptions/data_exceptions.dart';
import 'package:base_flutter_provider_project/utils/generic_exception.dart';
import 'package:base_flutter_provider_project/utils/logger.dart';
import 'package:base_flutter_provider_project/utils/secure_storage.dart';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/colors.dart';
import '../constants/local_images.dart';
import 'SharedHelper/PreferenceHelper.dart';
import 'SharedHelper/Preference_Constant.dart';
import 'permission_handler.dart';

//reuseable functions
Future<bool> willPopCallback() async => false;

//To request permission
Future<bool> requestPermission() async {
  Constant.isPermissionGranted = await checkPermission();
  return Constant.isPermissionGranted;
}

RichText buildRichText(TextSpan span1,TextSpan span2,TextStyle defaultstyle) {
  return RichText(
    textAlign: TextAlign.left,
    text: TextSpan(
      style: defaultstyle,
      children: <TextSpan>[
        span1,
        span2,
      ],
    ),
  );
}RichText buildRichText2(List<TextSpan> spans,TextStyle defaultstyle) {
  return RichText(
    textAlign: TextAlign.center,
    text: TextSpan(
      style: defaultstyle,
      children: spans
    ),
  );
}

String formatDate(String inputDate) {
  final dateTime = DateTime.parse(inputDate);
  final formattedDate = DateFormat.yMd().format(dateTime);
  return formattedDate;
}
String formatDatewithTime(String inputDate) {
  final dateTime = DateTime.parse(inputDate);
  final formattedDate = DateFormat('dd-MM-yyyy hh:mm a').format(dateTime);
  return formattedDate;
}

Future<void> saveImageOrFile(BuildContext context, String imgUrl, String fileType) async {
  final scaffoldMessenger = ScaffoldMessenger.of(context);
  String? message = "";
  var random = Random();
  var filename;
  try {
    // Download image
    final http.Response response = await http.get(
        Uri.parse(imgUrl));

    // Get temporary directory
    final dir = await getTemporaryDirectory();

    // Create an image name

    if(fileType == "jpg"){
      filename = '${dir.path}/SaveImage${random.nextInt(100)}.jpg';
    }else if(fileType == "jpeg") {
      filename = '${dir.path}/SaveImage${random.nextInt(100)}.jpeg';
    }else if(fileType == "png"){
      filename = '${dir.path}/SaveImage${random.nextInt(100)}.png';
    }else{
      filename = '${dir.path}/SavePdf${random.nextInt(100)}.pdf';
    }

    // Save to filesystem
    final file = File(filename);
    await file.writeAsBytes(response.bodyBytes);

    // Ask the user to save it
    final params = SaveFileDialogParams(sourceFilePath: file.path);
    final finalPath = await FlutterFileDialog.saveFile(params: params);

    if (finalPath != null) {
      message = 'saved to disk';
    }




    /*     Response response = await dio.get(imgUrl,
        onReceiveProgress: showDownloadProgress,
        //Received data with List<int>
        options: Options(
            responseType: ResponseType.bytes,
            followRedirects: false,
            validateStatus: (status) {
              //if(status!= null)
              return status! < 500;
            }),
      );
      print(response.headers);

      final dir = await getTemporaryDirectory();
      var filename = '${dir.path}/SaveImage${random.nextInt(100)}.png';


      final file = File(filename);
      await file.writeAsBytes(response.data);

      // Ask the user to save it
      final params = SaveFileDialogParams(sourceFilePath: file.path);
      final finalPath = await FlutterFileDialog.saveFile(params: params);

      if (finalPath != null) {
        message = 'Image saved to disk';
      }*/

    /*  var raf = file.openSync(mode: FileMode.write);
      // response.data is List<int> type
      raf.writeFromSync(response.data);
      await raf.close();*/


  } catch (e) {
    message = e.toString();
    scaffoldMessenger.showSnackBar(SnackBar(
      content: Text(
        message,
        style:  TextStyle(
          fontSize: 12,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Appcolors.splashbgcolor2,
    ));
  }

  if (message != null) {

    scaffoldMessenger.showSnackBar(SnackBar(
      content: Text(
        message,
        style:  TextStyle(
          fontSize: 12,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Appcolors.splashbgcolor2,
    ));

  }
}


String formatDate2(String inputDate) {
  final dateTime = DateTime.parse(inputDate);
  //print('yearrr ${dateTime.year}');
  final formattedDate = DateFormat.MMMd().format(dateTime);
  return formattedDate;
}
int formatYear(String inputDate) {
  final dateTime = DateTime.parse(inputDate);
 // print('yearrr ${dateTime.year}');

  return dateTime.year;
}

Future<String> getPrefValues(String setvariable, String prefconstant) async{
  setvariable = await PreferenceHelper.getString(prefconstant);
  print('stored value in pref ${setvariable}');

  return setvariable;
}

PlaceholderImage() {
  //return AssetImage( LocalPNGImages.samplepropic);
  return Image.network( "http://sauda.wipspace.in/assets/images/placeholder.png");
}
PlaceholderImageProvider() {
  //return AssetImage( LocalPNGImages.samplepropic);
  return NetworkImage( "http://sauda.wipspace.in/assets/images/placeholder.png");
}

bool permissionPrompt(BuildContext buildCtxt) {
  bool isNavigate = false;
  showDialog(
      context: buildCtxt,
      builder: (context) {
        return PermissionPrompt(
          tapYes: () async {
            Navigator.pop(context);
            isNavigate = await requestPermission();
          },
          tapCancel: () {
            Navigator.pop(context);
            isNavigate = true;
          },
        );
      });
  return isNavigate;
}

SizedBox buildSizedBox({ double? height,  double? width}) {
  return SizedBox(
    height: height,
    width: width,
  );
}

Future<String> checkLoginPref() async{
  Constant.isLoggedIn = await PreferenceHelper.getString(PrefConstant.isLoggedIn);

  print('Is logged main dart ${ Constant.isLoggedIn}');

  return  Constant.isLoggedIn;
}


Future<bool> checkOnBoarding() async {
  final SecureStorage _storage = locator<SecureStorage>();
  String onBoarding = await _storage.readSecureData(SecureStorageConstant.onBoarding) ?? "";
  Logger.appLogs('onBoardingMain $onBoarding');
  return onBoarding == 'done';
}
void showToast(String message) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.black54,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

Future<bool> checkIsLoggedIn() async {
  final SecureStorage _storage = locator<SecureStorage>();
  String onBoarding = await _storage.readSecureData(SecureStorageConstant.isLoggedIn) ?? "";
  Logger.appLogs('onLoginMain $onBoarding');
  return onBoarding == 'true';
}

Future<bool> checkPermission() async {
  final PermissionHandler _permHandler = locator<PermissionHandler>();
  var isGranted = await _permHandler.checkPermissions();
  Logger.appLogs('permGranted: $isGranted');
  return isGranted;
}

Future<bool> validatePermission() async {
  final PermissionHandler _permHandler = locator<PermissionHandler>();
  var isGranted = await _permHandler.validateAllPermissions();
  Logger.appLogs('permGranted: $isGranted');
  return isGranted;
}

num removeRupeeSymbol(String text) {
  var newText = '';
  if (text.isEmpty) {
    return 0;
  } else if (text.contains('₹')) {
    newText = text.replaceAll('₹', '');
    newText = newText.replaceAll(',', '');
    var num = newText.contains('.') ? double.parse(newText) : int.parse(newText);
    return num;
  } else {
    newText = text.replaceAll(',', '');
    var num = newText.contains('.') ? double.parse(newText) : int.parse(newText);
    return num;
  }
}

int? generateRandomNumber(RemoteMessage /*Map<String, dynamic>?*/ message) {
  if (Platform.isIOS) {
    if (message != null) {
      if /*(message["notification_type"] == "conversation-invite")*/ (message.messageType != null) {
        return 0;
      } else {
        var rng = new Random();
        return rng.nextInt(100);
      }
    }
    else {
      var rng = new Random();
      return rng.nextInt(100);
    }
  }
  else {
    if (message != null) {
      if /*(message["notification"]["notification_type"] == "conversation-invite")*/ (message.messageType != null) {
        return 0;
      } else {
        var rng = new Random();
        return rng.nextInt(100);
      }
    } else {
      var rng = new Random();
      return rng.nextInt(100);
    }
  }
}

bool isStringNotNull(String? str) {
  if (str != null) {
    str = str.trim();
    if (str.isNotEmpty) {
      return true;
    }
  }
  return false;
}

bool isValidList(List? list) {
  if (list != null && list.isNotEmpty) {
    return true;
  } else {
    return false;
  }
}

String errorHandler(AppException appException) {
  var errorMsg = '';
  if (appException.error is String) {
    //Something went wrong error
    errorMsg = appException.error as String;
  } else if (appException.type == ErrorType.dioError) {
    //Dio code error
    var dioError = appException.error as DioError;
    errorMsg = DataException.errorResponseHandler(dioError);
  } else {
    //Status code error
    errorMsg = DataException.handleError(appException.statusCode!);
  }
  Logger.appLogs('errorMsg:: $errorMsg');
  return errorMsg;
}

String getReplacedAmount(String streamValue) {
  if (streamValue.isEmpty) {
    return '0';
  }
  var amount = streamValue.replaceAll(',', '');
  return amount = amount.replaceAll('₹', '');
}

String checkFormat(dynamic value) {
  final formatCurrency = NumberFormat.simpleCurrency(
    locale: 'HI',
    decimalDigits: 0,
  );
  num amount = 0;
  if (value is String) {
    amount = removeRupeeSymbol(value);
  }
  return formatCurrency.format(amount);
}

String getFormatCurrency(dynamic streamAmount) {
  try {
    final formatCurrency = NumberFormat.simpleCurrency(
      locale: 'HI',
      decimalDigits: 0,
    );
    num amount = 0;
    if (streamAmount is String) {
      amount = int.tryParse(streamAmount)!;
    } else {
      amount = streamAmount;
    }

    var value = formatCurrency.format(amount);
    Logger.appLogs('formattedCurrency:: $value');
    return value;
  } catch (e) {
    Logger.appLogs('numberFormatError:: $e');
    return '';
  }
}

void errorAlert(BuildContext context, String errMsg, {Function()? onBackPress}) {
  showDialog(
      context: context,
      builder: (context) {
        return ErrorDialog(errorMsg: errMsg, onBackPress: onBackPress);
      });
}

/*Future<void> launchUrl(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}*/

String getWorkPhone(String workPhone) {
  if (workPhone.startsWith('+91')) {
    print('workphone : ${workPhone.substring(0, 3)}-${workPhone.substring(3, 13)}');
    return '${workPhone.substring(0, 3)} - ${workPhone.substring(3, 13)}';
  } else {
    return '+91-$workPhone';
  }
}

Future<void> makePhoneCall(String phoneNumber) async {
  final Uri launchUri = Uri(
    scheme: 'tel',
    path: phoneNumber,
  );
  await launch(launchUri.toString());
}

void sendEmail(String email) {
  launch("mailto:$email");
}

String convertStreamToNumber(String val) {
  if (!val.contains('₹')) {
    return val;
  }
  return int.tryParse(
    val.substring(1).replaceAll(',', ''),
  ).toString();
}

num checkingValidNumber(String streamValue) {
  num amount = 0.0;
  if (streamValue.contains('.')) {
    amount = double.parse(streamValue);
    Logger.appLogs('doubleParse:: $amount');
    return amount;
  } else {
    amount = int.parse(streamValue);
    Logger.appLogs('intParse:: $amount');
    return amount;
  }
}


Color getTxnTypeColor(String? txnType) {
  if (txnType == 'REFUND' || txnType == 'TOPUP') {
    return Colors.green;
  } else if (txnType == 'REGULAR') {
    return Colors.grey;
  } else if (txnType == 'FAILED') {
    return Colors.red;
  } else {
    return Colors.grey;
  }
}

checkEmailAddress(String email){
  final bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
  return emailValid;
}

