

import 'package:base_flutter_provider_project/data/models/Portfolio_model/InvestedStock.dart';
import 'package:base_flutter_provider_project/data/models/StatusandMessageModel.dart';
import '../config/locator.dart';
import '../constants/strings.dart';
import '../data/repositories/portfolio_repo.dart';
import '../utils/common_functions.dart';
import '../utils/generic_exception.dart';
import '../utils/logger.dart';
import 'base_view_model/base_view_model.dart';

class MyPortfolioViewModel extends BaseViewModel {
  //Repository
  final PortfolioRepository _myportfolioRepository = locator<PortfolioRepository>();

  //Model
  InvestedStocks? _myportfolioResponseModel;
  StatusandMessageModel? _addportfolioResponseModel;
  StatusandMessageModel? _contactUsResponseModel;


  InvestedStocks? get MyPortfolioResponseModel => _myportfolioResponseModel;
  StatusandMessageModel? get AddPortfolioResponseModel => _addportfolioResponseModel;
  StatusandMessageModel? get ContactUsResponseModel => _contactUsResponseModel;


  Future<InvestedStocks?> MyPortfolioapi({

    required Function(String) onFailureRes,
    required Function(InvestedStocks?) onSuccessRes,

  }) async {
    //Loader State
    setState(ViewState.busy);

    try {
      var data = await _myportfolioRepository.myportfolioapi();
      if (data != null) {
        _myportfolioResponseModel = data;
        //Success State
       // print('data in portfolio ${data.data?.invested?[0].stock?.category?.categoryName ?? "aaafaf"}');
        onSuccessRes(_myportfolioResponseModel);

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


  Future<StatusandMessageModel?> AddPortfolioapi({

    required Function(String) onFailureRes,
    required Function(StatusandMessageModel?) onSuccessRes,
    required Map<String, dynamic> addfolioparam
  }) async {
    //Loader State
    setState(ViewState.busy);

    try {
      var data = await _myportfolioRepository.addportfolioapi(addfolioparam);
      if (data != null) {
        _addportfolioResponseModel = data;
        //Success State

        onSuccessRes(_addportfolioResponseModel);

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

  Future<StatusandMessageModel?> ContactUsapi({

    required Function(String) onFailureRes,
    required Function(StatusandMessageModel?) onSuccessRes,
    required Map<String, dynamic> contactusparam
  }) async {
    //Loader State
    setState(ViewState.busy);

    try {
      var data = await _myportfolioRepository.contactusapi(contactusparam);
      if (data != null) {
        _contactUsResponseModel = data;
        //Success State

        onSuccessRes(_contactUsResponseModel);

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