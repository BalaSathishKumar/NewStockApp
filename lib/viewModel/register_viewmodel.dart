
import 'dart:io';


import '../config/locator.dart';
import '../constants/strings.dart';
import '../data/models/OTP_Verify_model/OtpVerifyModel.dart';
import '../data/models/StatusandMessageModel.dart';
import '../data/models/register_model/RegisterModel.dart';
import '../data/repositories/otp_repo.dart';
import '../data/repositories/register_repo.dart';
import '../utils/common_functions.dart';
import '../utils/generic_exception.dart';
import '../utils/logger.dart';
import 'base_view_model/base_view_model.dart';

class RegisterViewModel extends BaseViewModel {
  //Repository
  final RegisterRepository _registerRepository = locator<RegisterRepository>();

  //Model
  RegisterModel? _registerResponseModel;
  StatusandMessageModel? _updateprofileResponseModel;

  RegisterModel? get registerResponseModel => _registerResponseModel;
  StatusandMessageModel? get updateprofileResponseModel => _updateprofileResponseModel;

  Future<RegisterModel?> registerapi({

    required Function(String) onFailureRes,
    required Function(RegisterModel?) onSuccessRes,
    required String name,
    required String email,
    required String role,
    required String age,
    required String profession,
    required String city,
    required String state,
    required String about,
    required File propic,

    required String referralcode,
    required String fathername,
    required String dob,
    required String gender
  }) async {
    //Loader State
    setState(ViewState.busy);

    try {
      var data = await _registerRepository.registerapi(name,email,role,age,profession,city,state,about,propic,referralcode,fathername,dob,gender);
      if (data != null) {
        _registerResponseModel = data;
        //Success State
        onSuccessRes(_registerResponseModel);
        setState(ViewState.success);
      }else{
        //Failed
        onFailureRes(Strings.somethingWentWrong);
        //Failure State
        setState(ViewState.idle);
      }
    } on AppException catch (appException) {
      Logger.appLogs('errorType:: ${appException.type}');
      Logger.appLogs('onFailure:: $appException');
      //Common Error Handler
      errorMsg = errorHandler(appException);
      //Failed
      onFailureRes(errorMsg);
      //Idle / Failure State
      setState(ViewState.idle);
    }
    return null;
  }


  Future<StatusandMessageModel?> ProfileUpdateapi({

    required Function(String) onFailureRes,
    required Function(StatusandMessageModel?) onSuccessRes,
    required String name,
    required String email,

    required String age,
    required String profession,
    required String city,
    required String state,
    required String about,
    required File? propic,

    required String fathername,
    required String dob,
    required String gender
  }) async {
    //Loader State
    setState(ViewState.busy);

    try {
      var data = await _registerRepository.profileupdateapi(name,email,age,profession,city,state,about,propic,fathername,dob,gender);
      if (data != null) {
        _updateprofileResponseModel = data;
        //Success State
        onSuccessRes(_updateprofileResponseModel);
        setState(ViewState.success);
      }else{
        //Failed
        onFailureRes(Strings.somethingWentWrong);
        //Failure State
        setState(ViewState.idle);
      }
    } on AppException catch (appException) {
      Logger.appLogs('errorType:: ${appException.type}');
      Logger.appLogs('onFailure:: $appException');
      //Common Error Handler
      errorMsg = errorHandler(appException);
      //Failed
      onFailureRes(errorMsg);
      //Idle / Failure State
      setState(ViewState.idle);
    }
    return null;
  }






  Future<RegisterModel?> Kycapi({

    required Function(String) onFailureRes,
    required Function(RegisterModel?) onSuccessRes,
    required File? propic,
    required Map<String,dynamic> kycparams,
    required File idproofpic,
    required File pancard,
     File? cancelledcheque,
     File? dematdetails,

  }) async {
    //Loader State
    setState(ViewState.busy);

    try {
      var data = await _registerRepository.KYCapi(propic,kycparams,idproofpic,pancard,cancelledcheque,dematdetails);
      if (data != null) {
        _registerResponseModel = data;
        //Success State
        onSuccessRes(_registerResponseModel);
        setState(ViewState.success);
      }else{
        //Failed
        onFailureRes(Strings.somethingWentWrong);
        //Failure State
        setState(ViewState.idle);
      }
    } on AppException catch (appException) {
      Logger.appLogs('errorType:: ${appException.type}');
      Logger.appLogs('onFailure:: $appException');
      //Common Error Handler
      errorMsg = errorHandler(appException);
      //Failed
      onFailureRes(errorMsg);
      //Idle / Failure State
      setState(ViewState.idle);
    }
    return null;
  }



  Future<RegisterModel?> KycAdvisorapi({

    required Function(String) onFailureRes,
    required Function(RegisterModel?) onSuccessRes,
    required File? propic,
    required Map<String,dynamic> kycparams,
    required File? idproofpic,
    required File? pancard,
    required bool isKycupdate,
     File? cancelledcheque,
    File? companyownership,
    File? recognition,
    File? sebi,
    File? dematdetails,

  }) async {
    //Loader State
    setState(ViewState.busy);

    try {
      var data = await _registerRepository.KYCAdvisorapi(propic,kycparams,idproofpic,pancard,cancelledcheque,recognition,sebi,companyownership,dematdetails,isKycupdate,);
      if (data != null) {
        _registerResponseModel = data;
        //Success State
        onSuccessRes(_registerResponseModel);
        setState(ViewState.success);
      }
      else{
        //Failed
        onFailureRes(Strings.somethingWentWrong);
        //Failure State
        setState(ViewState.idle);
      }
    } on AppException catch (appException) {
      Logger.appLogs('errorType:: ${appException.type}');
      Logger.appLogs('onFailure:: $appException');
      //Common Error Handler
      errorMsg = errorHandler(appException);
      //Failed
      onFailureRes(errorMsg);
      //Idle / Failure State
      setState(ViewState.idle);
    }
    return null;
  }

  Future<StatusandMessageModel?> KycUpdateapi({

    required Function(String) onFailureRes,
    required Function(StatusandMessageModel?) onSuccessRes,
    required File? propic,
    required Map<String,dynamic> kycparams,
    required File? idproofpic,
    required File? pancard,
    required bool isKycupdate,
     File? cancelledcheque,
    File? companyownership,
    File? recognition,
    File? sebi,
    File? dematdetails,

  }) async {
    //Loader State
    setState(ViewState.busy);

    try {
      var data = await _registerRepository.KYCUpdateapi(propic,kycparams,idproofpic,pancard,cancelledcheque,recognition,sebi,companyownership,dematdetails,isKycupdate,);
      if (data != null) {
        _updateprofileResponseModel = data;
        //Success State
        onSuccessRes(_updateprofileResponseModel);
        setState(ViewState.success);
      }
      else{
        //Failed
        onFailureRes(Strings.somethingWentWrong);
        //Failure State
        setState(ViewState.idle);
      }
    } on AppException catch (appException) {
      Logger.appLogs('errorType:: ${appException.type}');
      Logger.appLogs('onFailure:: $appException');
      //Common Error Handler
      errorMsg = errorHandler(appException);
      //Failed
      onFailureRes(errorMsg);
      //Idle / Failure State
      setState(ViewState.idle);
    }
    return null;
  }

}