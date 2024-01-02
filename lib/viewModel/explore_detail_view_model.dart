

import 'package:base_flutter_provider_project/data/models/Explore_model/GetFavouriteModel.dart';
import 'package:base_flutter_provider_project/data/models/LoginModel/LoginModel.dart';
import 'package:base_flutter_provider_project/data/models/StatusandMessageModel.dart';

import '../config/locator.dart';
import '../constants/strings.dart';
import '../data/models/Explore_model/ExploreDetailModel.dart';
import '../data/models/Explore_model/ExploreModel.dart';
import '../data/repositories/explore_detail_repo.dart';
import '../data/repositories/explore_repo.dart';
import '../data/repositories/login_repo.dart';
import '../utils/common_functions.dart';
import '../utils/generic_exception.dart';
import '../utils/logger.dart';
import 'base_view_model/base_view_model.dart';

class ExploreDetailViewModel extends BaseViewModel {
  //Repository
  final ExploreDetailRepository _exploredetailRepository = locator<ExploreDetailRepository>();

  //Model
  ExploreDetailModel? _exploredetailModel;
  StatusandMessageModel? _addfavModel;
  GetFavouriteModel? _getfavModel;

  ExploreDetailModel? get exploredetailModel => _exploredetailModel;
  StatusandMessageModel? get addFavModel => _addfavModel;
  GetFavouriteModel? get getFavModel => _getfavModel;

  Future<ExploreDetailModel?> exploredetailapi({
    required Function(ExploreDetailModel?) onSuccessRes,
    required Function(String) onFailureRes,
    required String slugID
  }) async {
    //Loader State
    setState(ViewState.busy);

    try {
      var data = await _exploredetailRepository.explporedetailapi(slugID);
      if (data != null) {
        _exploredetailModel = data;
       // print('stock view: ${_exploredetailModel?.stocks?.metaData?[15].type} ' );
        //Success State
        onSuccessRes(_exploredetailModel);
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

  Future<StatusandMessageModel?> addfavapi({

    required Function(String) onFailureRes,
    required Function(StatusandMessageModel?) onSuccessRes,
    required Map<String, dynamic> stockid
  }) async {
    //Loader State
    //setState(ViewState.busy);

    try {
      var data = await _exploredetailRepository.addfavapi(stockid);
      if (data != null) {
        _addfavModel = data;
        //Success State
        onSuccessRes(_addfavModel);
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

  Future<GetFavouriteModel?> getFavapi({

    required Function(String) onFailureRes,
    required Function(GetFavouriteModel?) onSuccessRes,

  }) async {
    //Loader State
    setState(ViewState.busy);

    try {
      var data = await _exploredetailRepository.getFavapi();
      if (data != null) {
        _getfavModel = data;
        //Success State
        onSuccessRes(_getfavModel);
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