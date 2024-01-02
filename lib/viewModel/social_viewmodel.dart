
import '../config/locator.dart';
import '../constants/strings.dart';
import '../data/models/SocialModel/CheckSocialModel.dart';
import '../data/models/SocialModel/StatusMessageModel.dart';
import '../data/repositories/social_repo.dart';
import '../utils/common_functions.dart';
import '../utils/generic_exception.dart';
import '../utils/logger.dart';
import 'base_view_model/base_view_model.dart';

class SocialViewModel extends BaseViewModel {
  //Repository
  final SocialRepository _socialRepository = locator<SocialRepository>();

  //Model
  StatusMessageModel? _statusmessageModel;
  CheckSocialModel? _checkSocialModel;

  StatusMessageModel? get statusmessageModel => _statusmessageModel;
  CheckSocialModel? get Checksocialmodel => _checkSocialModel;

  Future<StatusMessageModel?> socialapi({

    required Function(String) onFailureRes,
    required Function(StatusMessageModel?) onSuccessRes,
    required Map<String, dynamic> socialparams
  }) async {
    //Loader State
    setState(ViewState.busy);

    try {
      var data = await _socialRepository.socialapi(socialparams);
      if (data != null) {
        _statusmessageModel = data;
        //Success State
        onSuccessRes(_statusmessageModel);
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


  Future<CheckSocialModel?> CheckSocialapi({

    required Function(String) onFailureRes,
    required Function(CheckSocialModel?) onSuccessRes,
    required Map<String, dynamic> socialparams
  }) async {
    //Loader State
    setState(ViewState.busy);

    try {
      var data = await _socialRepository.CheckuserSocialapi(socialparams);
      if (data != null) {
        _checkSocialModel = data;
        //Success State
        onSuccessRes(_checkSocialModel);
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