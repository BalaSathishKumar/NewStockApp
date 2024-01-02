
import 'dart:io';


import 'package:base_flutter_provider_project/data/repositories/createlisting_repo.dart';

import '../config/locator.dart';
import '../constants/strings.dart';
import '../data/models/DealerModels/MyListingModel.dart';
import '../data/models/OTP_Verify_model/OtpVerifyModel.dart';
import '../data/models/StatusandMessageModel.dart';
import '../data/models/register_model/RegisterModel.dart';
import '../data/repositories/otp_repo.dart';
import '../data/repositories/register_repo.dart';
import '../utils/common_functions.dart';
import '../utils/generic_exception.dart';
import '../utils/logger.dart';
import 'base_view_model/base_view_model.dart';

class CreateListViewModel extends BaseViewModel {
  //Repository
  final CreateListRepository _createlistRepository = locator<CreateListRepository>();

  //Model
  StatusandMessageModel? _createlistResponseModel;
  MyListingModel? _mylistResponseModel;

  StatusandMessageModel? get createLResponseModel => _createlistResponseModel;
  MyListingModel? get MyListResponseModel => _mylistResponseModel;

  Future<StatusandMessageModel?> createlistapi({

    required Function(String) onFailureRes,
    required Function(StatusandMessageModel?) onSuccessRes,
    required Map<String,dynamic> createlistparams,
    required File? stockimg,
    required File? panimg,
    required File? aadharimg,
    required File? clientmasterimg,
    required File? cancldchqimg,
    required File? dematimg,
  }) async {
    //Loader State
    setState(ViewState.busy);

    try {
      var data = await _createlistRepository.createlistapi(createlistparams,stockimg, panimg, aadharimg, clientmasterimg,cancldchqimg,dematimg);
      if (data != null) {
        _createlistResponseModel = data;
        //Success State
        onSuccessRes(_createlistResponseModel);
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


  Future<MyListingModel?> mylistingapi({

    required Function(String) onFailureRes,
    required Function(MyListingModel?) onSuccessRes,

  }) async {
    //Loader State
    setState(ViewState.busy);

    try {
      var data = await _createlistRepository.MyListingapi();
      if (data != null) {
        _mylistResponseModel = data;
        onSuccessRes(_mylistResponseModel);
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

}