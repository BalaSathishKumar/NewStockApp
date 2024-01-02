
import 'package:base_flutter_provider_project/data/models/StatusandMessageModel.dart';
import 'package:base_flutter_provider_project/data/repositories/advisorReview_repo.dart';

import '../config/locator.dart';
import '../constants/strings.dart';

import '../data/models/AdvisorModels/AdvisorReviewModel.dart';
import '../data/models/Explore_model/ExploreDetailModel.dart';

import '../utils/common_functions.dart';
import '../utils/generic_exception.dart';
import '../utils/logger.dart';
import 'base_view_model/base_view_model.dart';

class AdvisorReviewViewModel extends BaseViewModel {
  //Repository
  final AdvisorReviewRepository _advisorReviewRepository = locator<AdvisorReviewRepository>();

  //Model

  StatusandMessageModel? _addvisorreviewModel;
  AdvisorReviewListModel? _getadvisorReviewList;
  StatusandMessageModel? get AdvisorReviewModel => _addvisorreviewModel;
  AdvisorReviewListModel? get AdvisorReviewList => _getadvisorReviewList;


  Future<ExploreDetailModel?> advisorreviewapi({

    required Function(String) onFailureRes,
    required Function(StatusandMessageModel?) onSuccessRes,
  required  Map<String,dynamic>  advisorrevwparams
  }) async {
    //Loader State
    setState(ViewState.busy);

    try {
      var data = await _advisorReviewRepository.advisorreviewapi(advisorrevwparams);
      if (data != null) {
        _addvisorreviewModel = data;
        onSuccessRes(_addvisorreviewModel);
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



  Future<AdvisorReviewListModel?> advisorReviewListapi({

    required Function(String) onFailureRes,
    required Function(AdvisorReviewListModel?) onSuccessRes,
  }) async {
    //Loader State
    setState(ViewState.busy);

    try {
      var data = await _advisorReviewRepository.getAdvisorReview();
      if (data != null) {
        _getadvisorReviewList = data;
        onSuccessRes(_getadvisorReviewList);
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