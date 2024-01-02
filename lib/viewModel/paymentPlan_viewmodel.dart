
import 'package:base_flutter_provider_project/data/repositories/PaymentPlan_repo.dart';
import '../config/locator.dart';
import '../constants/strings.dart';

import '../data/models/DealerModels/CheckoutResModel.dart';
import '../data/models/DealerModels/PayementPlanModel.dart';
import '../data/models/DealerModels/PhonepeSubmitAuth.dart';
import '../data/models/DealerModels/SubscriptionDetailModel.dart';
import '../data/models/DealerModels/SunscriptionModel.dart';
import '../data/models/StatusandMessageModel.dart';
import '../utils/common_functions.dart';
import '../utils/generic_exception.dart';
import '../utils/logger.dart';
import 'base_view_model/base_view_model.dart';

class PaymentPlanViewModel extends BaseViewModel {
  //Repository
  final PaymentPlanRepository _paymentplanRepository = locator<PaymentPlanRepository>();

  //Model
  PayementPlanModel? _paymentplanResponseModel;
  SubscriptionModel? _subscriptionResponseModel;
  SubscriptionDetailModel? _subscriptionDetailResponseModel;
  PhonepeAuthModel? _phonepeAuthModel;
  StatusandMessageModel? _verifyPaymentModel;

  CheckoutResponseModel? _checkoutResponseModel;

  PayementPlanModel? get PaymentPlanResponseModel => _paymentplanResponseModel;
  SubscriptionModel? get subscriptionResponseModel => _subscriptionResponseModel;
  CheckoutResponseModel? get CheckoutresponseModel => _checkoutResponseModel;
  SubscriptionDetailModel? get subscriptionDetailResponseModel => _subscriptionDetailResponseModel;
  PhonepeAuthModel? get phonepeAuthModel => _phonepeAuthModel;
  StatusandMessageModel? get verifyPaymentModel => _verifyPaymentModel;


  Future<PayementPlanModel?> paymentplanapi({

    required Function(String) onFailureRes,
    required Function(PayementPlanModel?) onSuccessRes,

  }) async {
    //Loader State
    setState(ViewState.busy);

    try {
      var data = await _paymentplanRepository.paymentplanapi();
      if (data != null) {
        _paymentplanResponseModel = data;
        onSuccessRes(_paymentplanResponseModel);
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


  Future<PayementPlanModel?> payment({

    required Function(String) onFailureRes,
    required Function(PayementPlanModel?) onSuccessRes,

  }) async {
    //Loader State
    setState(ViewState.busy);

    try {
      var data = await _paymentplanRepository.paymentplanapi();
      if (data != null) {
        _paymentplanResponseModel = data;
        onSuccessRes(_paymentplanResponseModel);
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

  Future<SubscriptionModel?> Subscriptionapi({

    required Function(String) onFailureRes,
    required Function(SubscriptionModel?) onSuccessRes,
    required Map<String,dynamic> subsparam
  }) async {
    //Loader State
    setState(ViewState.busy);

    try {
      var data = await _paymentplanRepository.subscriptionapi(subsparam);
      if (data != null) {
        _subscriptionResponseModel = data;
        onSuccessRes(_subscriptionResponseModel);
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

  Future<SubscriptionDetailModel?> SubscriptionDetailapi({

    required Function(String) onFailureRes,
    required Function(SubscriptionDetailModel?) onSuccessRes,
  }) async {
    //Loader State
    setState(ViewState.busy);

    try {
      var data = await _paymentplanRepository.subscriptionDetailApi();
      if (data != null) {
        _subscriptionDetailResponseModel = data;
        onSuccessRes(_subscriptionDetailResponseModel);
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




  Future<StatusandMessageModel?> VerifyPaymentApi({

    required Function(String) onFailureRes,
    required Function(StatusandMessageModel?) onSuccessRes,
    required Map<String,dynamic> verifyparam
  }) async {
    //Loader State
    setState(ViewState.busy);

    try {
      var data = await _paymentplanRepository.verifyPaymentapi(verifyparam);
      if (data != null) {
        _verifyPaymentModel = data;
        onSuccessRes(_verifyPaymentModel);
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


  Future<PhonepeAuthModel?> PhonepeAuthapi({

    required Function(String) onFailureRes,
    required Function(PhonepeAuthModel?) onSuccessRes,
    required String callback,
    required String checksum,
    required String base64Body
  }) async {
    //Loader State
    setState(ViewState.busy);

    try {
      var data = await _paymentplanRepository.ReqAuthapi(callback,checksum,base64Body);
      if (data != null) {
        _phonepeAuthModel = data;
        print('Phonepe Auth Response $_phonepeAuthModel');
        onSuccessRes(_phonepeAuthModel);
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


  Future<CheckoutResponseModel?> ApplyCouponApi({

    required Function(String) onFailureRes,
    required Function(CheckoutResponseModel?) onSuccessRes,
    required Map<String,dynamic> verifyparam
  }) async {
    //Loader State
    setState(ViewState.busy);

    try {
      var data = await _paymentplanRepository.ApplyCouponapi(verifyparam);
      if (data != null) {
        _checkoutResponseModel = data;
        onSuccessRes(_checkoutResponseModel);
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