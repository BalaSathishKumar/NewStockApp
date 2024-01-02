
import 'package:base_flutter_provider_project/data/models/StatusandMessageModel.dart';
import 'package:base_flutter_provider_project/data/models/dashboard_model/PromocodeModel.dart';
import 'package:base_flutter_provider_project/data/models/dashboard_model/RewardResponseModel.dart';
import 'package:base_flutter_provider_project/data/repositories/reward_repo.dart';

import '../config/locator.dart';
import '../constants/strings.dart';
import '../data/models/dashboard_model/ProfileResponseModel.dart';
import '../data/models/dashboard_model/RedeemRewardModel.dart';
import '../data/repositories/profile_repo.dart';
import '../utils/SharedHelper/PreferenceHelper.dart';
import '../utils/SharedHelper/Preference_Constant.dart';
import '../utils/common_functions.dart';
import '../utils/generic_exception.dart';
import '../utils/logger.dart';
import 'base_view_model/base_view_model.dart';

class RewardViewModel extends BaseViewModel {
  //Repository
  final RewardRepository _rewardRepository = locator<RewardRepository>();

  //Model
  RewardResponseModel? _rewardResponseModel;
  RedeemRewardModel? _redeemrewardResponseModel;
  PromocodeModel? _promocodeResponseModel;
  StatusandMessageModel? _redeemnowResponseModel;

  RewardResponseModel? get rewardResponseModel => _rewardResponseModel;
  RedeemRewardModel? get redeemrewardResponseModel => _redeemrewardResponseModel;
  PromocodeModel? get PromocodeResponseModel => _promocodeResponseModel;
  StatusandMessageModel? get RedeemNowResponseModel => _redeemnowResponseModel;

  Future<RewardResponseModel?> rewardapi({

    required Function(String) onFailureRes,
    required Function(RewardResponseModel?) onSuccessRes,

  }) async {
    //Loader State
    setState(ViewState.busy);

    try {
      var data = await _rewardRepository.rewardapi();
      if (data != null) {
        _rewardResponseModel = data;

        onSuccessRes(_rewardResponseModel);

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

  Future<RedeemRewardModel?> redeemrewardapi({

    required Function(String) onFailureRes,


  }) async {
    //Loader State
    setState(ViewState.busy);

    try {
      var data = await _rewardRepository.redeemrewardapi();
      if (data != null) {
        _redeemrewardResponseModel = data;



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

  Future<PromocodeModel?> promocodeapi({

    required Function(String) onFailureRes,


  }) async {
    //Loader State
    setState(ViewState.busy);

    try {
      var data = await _rewardRepository.promocodeapi();
      if (data != null) {
        _promocodeResponseModel = data;
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

  Future<StatusandMessageModel?> RedeemNowApi(
      {
        required Function(String) onFailureRes,
        required Function(String) onSuccess,
      required Map<String, dynamic> redeemparam}) async {
    //Loader State
    setState(ViewState.busy);

    try {
      var data = await _rewardRepository.RedeemNowapi(redeemparam);
      if (data != null) {
        _redeemnowResponseModel = data;
        onSuccess(_redeemnowResponseModel?.message ?? "");
        setState(ViewState.success);
      } else {
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