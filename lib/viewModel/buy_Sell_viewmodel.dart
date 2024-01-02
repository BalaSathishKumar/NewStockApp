

import 'package:base_flutter_provider_project/data/models/StatusandMessageModel.dart';
import 'package:base_flutter_provider_project/data/repositories/StockBuySell_repo.dart';
import '../config/locator.dart';
import '../constants/strings.dart';
import '../utils/common_functions.dart';
import '../utils/generic_exception.dart';
import '../utils/logger.dart';
import 'base_view_model/base_view_model.dart';

class BuySellViewModel extends BaseViewModel {
  //Repository
  final BuySellRepository _buysellRepository = locator<BuySellRepository>();

  //Model
  StatusandMessageModel? _buysellResponseModel;

  StatusandMessageModel? get buysellResponseModel => _buysellResponseModel;

  Future<StatusandMessageModel?> buysellapi({

    required Function(String) onFailureRes,
    required Function(StatusandMessageModel?) onSuccessRes,
    required Map<String, dynamic> buysellparams
  }) async {
    //Loader State
    setState(ViewState.busy);

    try {
      var data = await _buysellRepository.buysellapi(buysellparams);
      if (data != null) {
        _buysellResponseModel = data;
        //Success State
        onSuccessRes(_buysellResponseModel);
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