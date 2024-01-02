

import 'package:base_flutter_provider_project/data/models/TransactionModel/PurchaseRequestModel.dart';

import 'package:base_flutter_provider_project/data/repositories/myTrans_repo.dart';

import '../config/locator.dart';
import '../constants/strings.dart';
import '../utils/common_functions.dart';
import '../utils/generic_exception.dart';
import '../utils/logger.dart';
import 'base_view_model/base_view_model.dart';

class MyTransViewModel extends BaseViewModel {
  //Repository
  final MyTransRepository _mytransRepository = locator<MyTransRepository>();

  //Model
  PurchaseRequestModel? _mytransResponseModel;

  List<Request>? apifilteredItems;
  PurchaseRequestModel? get MyTransResponseModel => _mytransResponseModel;
  List<Request>? get ApiFilterlist => apifilteredItems;

  Future<PurchaseRequestModel?> MyTransapi({

    required Function(String) onFailureRes,
    required Function(PurchaseRequestModel?) onSuccessRes,

  }) async {
    //Loader State
    setState(ViewState.busy);

    try {
      var data = await _mytransRepository.mytransapi();
      if (data != null) {
        _mytransResponseModel = data;
        //Success State

        onSuccessRes(_mytransResponseModel);

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