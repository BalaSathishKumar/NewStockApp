

import '../config/locator.dart';
import '../constants/strings.dart';
import '../data/models/Insights_model/LatestTipsModel.dart';
import '../data/repositories/latesttips_repo.dart';
import '../utils/common_functions.dart';
import '../utils/generic_exception.dart';
import '../utils/logger.dart';
import 'base_view_model/base_view_model.dart';

class LatestTipsViewModel extends BaseViewModel {
  //Repository
  final LatestTipsRepository _latestTipsRepository = locator<LatestTipsRepository>();

  //Model
  LatestTipsModel? _latestTipsModel;

  LatestTipsModel? get latesttipsModel => _latestTipsModel;

  Future<LatestTipsModel?> latesttipsapi({

    required Function(String) onFailureRes,


  }) async {
    //Loader State
    setState(ViewState.busy);

    try {
      var data = await _latestTipsRepository.latesttipsapi();
      if (data != null) {
        _latestTipsModel = data;
        //Success State

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