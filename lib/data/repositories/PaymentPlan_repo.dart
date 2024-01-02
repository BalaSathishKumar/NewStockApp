
import 'package:base_flutter_provider_project/data/models/DealerModels/PayementPlanModel.dart';
import 'package:base_flutter_provider_project/data/models/StatusandMessageModel.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../../constants/constant.dart';
import '../../constants/end_points_constants.dart';
import '../../services/dio_client.dart';
import '../../utils/generic_exception.dart';
import '../../utils/logger.dart';
import '../models/DealerModels/CheckoutResModel.dart';
import '../models/DealerModels/PhonepeSubmitAuth.dart';
import '../models/DealerModels/SubscriptionDetailModel.dart';
import '../models/DealerModels/SunscriptionModel.dart';

class PaymentPlanRepository {
  final ApiClient _client = ApiClient();
  Dio? _dio;
  Future<PayementPlanModel?> paymentplanapi() async {
    final response = await _client.get("${EndPointConstants.paymentplan}");

    Logger.appLogs('paymentplancallBackResponse:: $response');
    if (response != null) {
      //Success returning data back
      Logger.appLogs('responseRepo:: $response');
      return PayementPlanModel.fromJson(response as Map<String, dynamic>);
    } else {
      //Failed returning null
      Logger.appLogs('paymentplanerrorNull:: $response');
      return null;
    }
  }

  Future<SubscriptionModel?> subscriptionapi( Map<String,dynamic> subsparam) async {
    final response = await _client.post("${EndPointConstants.subscription}",body: subsparam);

    Logger.appLogs('subscriptioncallBackResponse:: $response');
    if (response != null) {
      //Success returning data back
      Logger.appLogs('responseRepo:: $response');

      return SubscriptionModel.fromJson(response as Map<String, dynamic>);
    } else {
      //Failed returning null
      Logger.appLogs('subscriptionerrorNull:: $response');
      return null;
    }
  }

  Future<SubscriptionDetailModel?> subscriptionDetailApi() async {
    final response = await _client.get("${EndPointConstants.subscriptiondtail}");

    Logger.appLogs('subscriptiondtailcallBackResponse:: $response');
    if (response != null) {
      //Success returning data back
      Logger.appLogs('responseRepo:: $response');
      return SubscriptionDetailModel.fromJson(response as Map<String, dynamic>);
    } else {
      //Failed returning null
      Logger.appLogs('subscriptiondtailerrorNull:: $response');
      return null;
    }
  }


  Future<StatusandMessageModel?> verifyPaymentapi( Map<String,dynamic> verifyparam) async {
    final response = await _client.post("${EndPointConstants.verifyPayment}",body: verifyparam);

    Logger.appLogs('verifyPaymentcallBackResponse:: $response');
    if (response != null) {
      //Success returning data back
      Logger.appLogs('responseRepo:: $response');

      return StatusandMessageModel.fromJson(response as Map<String, dynamic>);
    } else {
      //Failed returning null
      Logger.appLogs('verifyPaymenterrorNull:: $response');
      return null;
    }
  }

  Future<CheckoutResponseModel?> ApplyCouponapi( Map<String,dynamic> couponparam) async {
    final response = await _client.post("${EndPointConstants.applycoupon}",body: couponparam);

    Logger.appLogs('applycouponcallBackResponse:: $response');
    if (response != null) {
      //Success returning data back
      Logger.appLogs('responseRepo:: $response');

      return CheckoutResponseModel.fromJson(response as Map<String, dynamic>);
    } else {
      //Failed returning null
      Logger.appLogs('applycouponerrorNull:: $response');
      return null;
    }
  }


  Future<PhonepeAuthModel?> ReqAuthapi(String callback,String checksum,String base64Body) async {
    Duration millisec = const Duration(milliseconds: 10000);
    _dio = Dio(BaseOptions(connectTimeout: millisec));
    _dio!.options.baseUrl = Constant.Phonepeurl;
    _dio!.options.headers['X-CALLBACK-URL'] = callback;
    _dio!.options.headers['X-Verify'] = checksum;
    _dio!.interceptors.addAll([
      // TokenOnHeaderInterceptor(),
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        error: true,
        request: true,
        logPrint: (object) {
          Logger.appLogs("response on dio logger:: $object");
        },
      )
    ]);
    final response = await post(EndPointConstants.Testsubscription,body: {"request" : base64Body});

    Logger.appLogs('TestsubscriptionResponse:: $response');
    if (response != null) {
      //Success returning data back
      Logger.appLogs('responseRepo:: $response');
      return PhonepeAuthModel.fromJson(response as Map<String, dynamic>);
    } else {
      //Failed returning null
      Logger.appLogs('TestsubscriptionerrorNull:: $response');
      return null;
    }
  }

  Future<dynamic> post(String url, {body}) async {
    try {
      Response response;

      response = await _dio!.post(
        url,
        data: body,
      );
      final data = response.data;
      return data;
    } on DioError catch (error) {
      if (error.response != null) {
        Logger.appLogs('errorDio:: $error');
        throw AppException(error: error, type: ErrorType.dioError, statusCode: error.response!.statusCode);
      }
    } catch (error, stacktrace) {
      Logger.appLogs('errorPostStacktrace:: $stacktrace');
      throw AppException(
        error: error,
        type: ErrorType.appError,
      );
    }
  }





}