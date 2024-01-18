


import 'package:base_flutter_provider_project/data/models/Insights_model/BlogsResponseModel.dart';
import 'package:base_flutter_provider_project/data/models/Insights_model/HouseOfInvestingModel.dart';
import 'package:base_flutter_provider_project/data/repositories/Blog_repo.dart';

import '../config/locator.dart';
import '../constants/strings.dart';
import '../utils/common_functions.dart';
import '../utils/generic_exception.dart';
import '../utils/logger.dart';
import 'base_view_model/base_view_model.dart';

class BlogsViewModel extends BaseViewModel {
  //Repository
  final BlogsRepository _blogsRepository = locator<BlogsRepository>();

  //Model
  BlogsResponseModel? _blogsResponseModel;
  HouseOfInvestingModel? _hoiResponseModel;
  int _catlength = 0;
  int? get catlength => _catlength;

  BlogsResponseModel? get blogsResponseModel => _blogsResponseModel;
  HouseOfInvestingModel? get HoiResponseModel => _hoiResponseModel;

  Future<BlogsResponseModel?> blogsapi({

    required Function(String) onFailureRes,
    required Function(BlogsResponseModel?) onSuccessRes,

  }) async {
    //Loader State
    setState(ViewState.busy);

    try {
      var data = await _blogsRepository.blogapi();
      if (data != null) {
        _blogsResponseModel = data;
        _catlength = data.category?.length ??0;
        //Success State
        onSuccessRes(_blogsResponseModel);
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

  Future<HouseOfInvestingModel?> Hoiapi({

    required Function(String) onFailureRes,
    required Function(HouseOfInvestingModel?) onSuccessRes,

  }) async {
    //Loader State
    setState(ViewState.busy);

    try {
      var data = await _blogsRepository.HOIapi();
      if (data != null) {
        _hoiResponseModel = data;

        //Success State
        onSuccessRes(_hoiResponseModel);
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