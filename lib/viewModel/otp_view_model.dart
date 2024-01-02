



import '../config/locator.dart';
import '../constants/strings.dart';
import '../data/models/OTP_Verify_model/OtpVerifyModel.dart';
import '../data/repositories/otp_repo.dart';
import '../utils/common_functions.dart';
import '../utils/generic_exception.dart';
import '../utils/logger.dart';
import 'base_view_model/base_view_model.dart';

class OtpViewModel extends BaseViewModel {
  //Repository
  final OtpRepository _otpRepository = locator<OtpRepository>();

  //Model
  OtpResponseModel? _otpResponseModel;

  OtpResponseModel? get otpResponseModel => _otpResponseModel;

  Future<OtpResponseModel?> otpapi({

    required Function(String) onFailureRes,
    required Function(OtpResponseModel?) onSuccessRes,
    required Map<String, dynamic> otpparams
  }) async {
    //Loader State
    setState(ViewState.busy);

    try {
      var data = await _otpRepository.otpapi(otpparams);
      if (data != null) {
        _otpResponseModel = data;
        //Success State
        onSuccessRes(_otpResponseModel);
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