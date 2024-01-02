

import 'package:base_flutter_provider_project/data/models/AdvisorModels/ConsultationListModel.dart';
import 'package:base_flutter_provider_project/data/models/Portfolio_model/InvestedStock.dart';
import 'package:base_flutter_provider_project/data/models/StatusandMessageModel.dart';
import 'package:base_flutter_provider_project/data/repositories/Consultation_repo.dart';
import '../config/locator.dart';
import '../constants/strings.dart';
import '../data/repositories/portfolio_repo.dart';
import '../utils/common_functions.dart';
import '../utils/generic_exception.dart';
import '../utils/logger.dart';
import 'base_view_model/base_view_model.dart';

class ConsultationViewModel extends BaseViewModel {
  //Repository
  final ConsultationRepository _consultationRepository = locator<ConsultationRepository>();

  //Model

  StatusandMessageModel? _consultReqResponseModel;

  StatusandMessageModel? get ConsultRequestResponseModel => _consultReqResponseModel;
  ConsultationListModel? _consultationListModel;

  ConsultationListModel? get ConsultationListResponseModel => _consultationListModel;


  Future<StatusandMessageModel?> ConsultRequestapi({

    required Function(String) onFailureRes,
    required Function(StatusandMessageModel?) onSuccessRes,
    required Map<String, dynamic> addCRparam
  }) async {
    //Loader State
    setState(ViewState.busy);

    try {
      var data = await _consultationRepository.ConsultRequest(addCRparam);
      if (data != null) {
        _consultReqResponseModel = data;
        //Success State

        onSuccessRes(_consultReqResponseModel);

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



  Future<ConsultationListModel?> consultlistapi({

    required Function(String) onFailureRes,
    required Function(ConsultationListModel?) onSuccessRes,

  }) async {
    //Loader State
    setState(ViewState.busy);

    try {
      var data = await _consultationRepository.consultlistapi();
      if (data != null) {
        _consultationListModel = data;
        onSuccessRes(_consultationListModel);
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