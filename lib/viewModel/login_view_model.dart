

import 'package:base_flutter_provider_project/data/models/LoginModel/LoginModel.dart';

import '../config/locator.dart';
import '../constants/strings.dart';
import '../data/repositories/login_repo.dart';
import '../utils/common_functions.dart';
import '../utils/generic_exception.dart';
import '../utils/logger.dart';
import 'base_view_model/base_view_model.dart';

class LoginViewModel extends BaseViewModel {
  //Repository
  final LoginRepository _loginRepository = locator<LoginRepository>();

  //Model
  LoginResponseModel? _loginResponseModel;

  LoginResponseModel? get loginResponseModel => _loginResponseModel;

  Future<LoginResponseModel?> loginapi({

    required Function(String) onFailureRes,
    required Function(LoginResponseModel?) onSuccessRes,
    required Map<String, dynamic> loginparams
     }) async {
    //Loader State
    setState(ViewState.busy);

    try {
      var data = await _loginRepository.loginapi(loginparams);
      if (data != null) {
        _loginResponseModel = data;
        //Success State
        onSuccessRes(_loginResponseModel);
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