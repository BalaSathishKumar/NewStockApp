
import 'package:base_flutter_provider_project/data/models/Explore_model/PerformDetailModel.dart';

import '../config/locator.dart';
import '../constants/strings.dart';
import '../data/models/Explore_model/ExploreModel.dart';
import '../data/models/Explore_model/ExplorePerformModel.dart';
import '../data/repositories/explore_repo.dart';

import '../utils/common_functions.dart';
import '../utils/generic_exception.dart';
import '../utils/logger.dart';
import 'base_view_model/base_view_model.dart';

class PerformViewModel extends BaseViewModel {
  //Repository
  final ExploreRepository _exploreRepository = locator<ExploreRepository>();

  //Model
  PerformDetailModel? _PFDexploreModel;
  ExplorePerformModel? _explorePerformModel;

  PerformDetailModel? get PFDexploreModel => _PFDexploreModel;
  ExplorePerformModel? get explorePerformModel => _explorePerformModel;



  Future<ExplorePerformModel?> explorePerformapi({

    required Function(String) onFailureRes,
    required Function(ExplorePerformModel?) onSuccessRes,

  }) async {
    //Loader State
    setState(ViewState.busy);

    try {
      var data = await _exploreRepository.explporPerformeapi();
      if (data != null) {
        _explorePerformModel = data;
        //Success State
        onSuccessRes(_explorePerformModel);
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


  Future<PerformDetailModel?> performdetailapi({

    required Function(String) onFailureRes,
    required Function(PerformDetailModel?) onSuccessRes,
    required String BrowseID
  }) async {
    //Loader State
    setState(ViewState.busy);

    try {
      var data = await _exploreRepository.performdetaileapi(BrowseID);
      if (data != null) {
        _PFDexploreModel = data;

        //Success State
        onSuccessRes(_PFDexploreModel);
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