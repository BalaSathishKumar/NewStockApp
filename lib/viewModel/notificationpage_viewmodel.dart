
import 'package:base_flutter_provider_project/data/models/LoginModel/OnBoardScreenModel.dart';
import 'package:base_flutter_provider_project/data/models/home_model/notificationpagemodel.dart';
import 'package:base_flutter_provider_project/data/repositories/PaymentPlan_repo.dart';
import 'package:base_flutter_provider_project/data/repositories/onboard_repo.dart';
import '../config/locator.dart';
import '../constants/strings.dart';
import '../data/models/DealerModels/PayementPlanModel.dart';
import '../data/repositories/notificationpage_repo.dart';
import '../utils/common_functions.dart';
import '../utils/generic_exception.dart';
import '../utils/logger.dart';
import 'base_view_model/base_view_model.dart';

class NotificationPageViewModel extends BaseViewModel {
  //Repository
  final NotificationPageRepository _notificationpageRepository = locator<NotificationPageRepository>();

  //Model
  Notificationpagemodel? _notifypageResponseModel;

  Notificationpagemodel? get NotifyPageResponseModel => _notifypageResponseModel;


  Future<Notificationpagemodel?> notificationpageapi({

    required Function(String) onFailureRes,
    required Function(Notificationpagemodel?) onSuccessRes,

  }) async {
    //Loader State
    setState(ViewState.busy);

    try {
      var data = await _notificationpageRepository.notificationpageapi();
      if (data != null) {
        _notifypageResponseModel = data;
        onSuccessRes(_notifypageResponseModel);
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