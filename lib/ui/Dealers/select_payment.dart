import 'dart:convert';

import 'package:android_intent_plus/android_intent.dart';
import 'package:base_flutter_provider_project/data/models/DealerModels/PayementPlanModel.dart';
import 'package:base_flutter_provider_project/data/models/DealerModels/SunscriptionModel.dart';
import 'package:base_flutter_provider_project/ui/Dealers/DealerVerifyPending.dart';
import 'package:base_flutter_provider_project/ui/Dealers/phonePayPayment.dart';
import 'package:base_flutter_provider_project/utils/common_functions.dart';
import 'package:base_flutter_provider_project/utils/common_textstyles.dart';
import 'package:base_flutter_provider_project/viewModel/paymentPlan_viewmodel.dart';
import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:phonepe_payment_sdk/phonepe_payment_sdk.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../common_widgets/appbar_widgets/common_appbar.dart';
import '../../common_widgets/button_widgets/common_button.dart';
import '../../constants/colors.dart';
import '../../constants/constant.dart';
import '../../constants/end_points_constants.dart';
import '../../constants/local_images.dart';
import '../../data/models/DealerModels/PhonepeSubmitAuth.dart';
import '../../data/models/StatusandMessageModel.dart';
import '../../services/dio_client.dart';
import '../../utils/generic_exception.dart';
import '../../utils/logger.dart';
import '../../viewModel/CommonProvider.dart';
import '../Subscriptions/CheckoutPage.dart';
import '../Subscriptions/PaymentPlanDetails.dart';
import '../home/homepage.dart';
import 'DonePage.dart';

class SelectPayment extends StatefulWidget{
  const SelectPayment({super.key});

  @override
  State<SelectPayment> createState() => _SelectPaymentState();
}

class _SelectPaymentState extends State<SelectPayment> {
  final GlobalKey<ExpansionTileCardState> cardA = GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardB = GlobalKey();

  final List<ListItem> items = [
    ListItem(
        lotsize: "1",
        stattxt: "per week",
        statres: "E-Mobility",
        statres2: "100k",
        toprated: "499",
        text: 'Weekly Plan',
        statyears: "5+ years",
        rate: '132',
        shname: 'YLW',
        colors: 0xFF3366FF,
        imageUrl: LocalPNGImages.story1),

    ListItem(
        lotsize: "1",
        stattxt: "per month",
        statres: "E-Mobility",
        statres2: "100k",
        toprated: "1800",
        text: 'Monthly Plan',
        statyears: "5+ years",
        rate: '132',
        shname: 'YLW',
        colors: 0xFF3366FF,
        imageUrl: LocalPNGImages.story1),

    ListItem(
        lotsize: "1",
        stattxt: "every 3 month",
        statres: "E-Mobility",
        statres2: "100k",
        toprated: "4100",
        text: 'Quarterly Plan',
        statyears: "5+ years",
        rate: '132',
        shname: 'YLW',
        colors: 0xFF3366FF,
        imageUrl: LocalPNGImages.story1),

    ListItem(
        lotsize: "1",
        stattxt: "per year",
        statres: "E-Mobility",
        statres2: "100k",
        toprated: "9999",
        text: 'Annual Plan',
        statyears: "5+ years",
        rate: '132',
        shname: 'YLW',
        colors: 0xFF3366FF,
        imageUrl: LocalPNGImages.story1),

    ListItem(
        lotsize: "1",
        stattxt: "per week",
        statres: "E-Mobility",
        statres2: "100k",
        toprated: "499",
        text: 'Weekly Plan',
        statyears: "5+ years",
        rate: '132',
        shname: 'YLW',
        colors: 0xFF3366FF,
        imageUrl: LocalPNGImages.story1),

    ListItem(
        lotsize: "1",
        stattxt: "per month",
        statres: "E-Mobility",
        statres2: "100k",
        toprated: "1800",
        text: 'Monthly Plan',
        statyears: "5+ years",
        rate: '132',
        shname: 'YLW',
        colors: 0xFF3366FF,
        imageUrl: LocalPNGImages.story1),

    ListItem(
        lotsize: "1",
        stattxt: "every 3 month",
        statres: "E-Mobility",
        statres2: "100k",
        toprated: "4100",
        text: 'Quarterly Plan',
        statyears: "5+ years",
        rate: '132',
        shname: 'YLW',
        colors: 0xFF3366FF,
        imageUrl: LocalPNGImages.story1),

    ListItem(
        lotsize: "1",
        stattxt: "per year",
        statres: "E-Mobility",
        statres2: "100k",
        toprated: "9999",
        text: 'Annual Plan',
        statyears: "5+ years",
        rate: '132',
        shname: 'YLW',
        colors: 0xFF3366FF,
        imageUrl: LocalPNGImages.story1),

  ];
  late PaymentPlanViewModel _paymentplanViewModel;
  //String callback = "flutterDemoApp";
  // String checksum = sha256(base64Body + apiEndPoint + salt) + ### + saltIndex;
  Map<String, String> headers = {};
  List<String> apiList = <String>['Container', 'PG'];
  List<String> environmentList = <String>['UAT', 'UAT_SIM', 'PRODUCTION'];
  // String apiEndPoint = "/pg/v1/pay";
  String dropdownValue = 'PG';
  String environmentValue = 'UAT_SIM';
  String appId = "";
  String merchantId = "PGTESTPAYUAT";
  bool enableLogs = true;
  String checksum = "";
  Map<String, String> pgHeaders1 = {"Content-Type": "application/json"};
  String saltIndex = "1";
  String saltKey = "099eb0cd-02cf-4e2a-8aca-3e6c6aff0399";
  String callback ="";
  String body = "";
  Object? result;
  Dio? _dio;
  // String apiEndPoint = "https://api-preprod.phonepe.com/apis/pg-sandbox";  not
  String apiEndPoint = "/pg/v1/pay";
 // String apiEndPoint = "/v3/recurring/auth/init";
  String packageName = "com.phonepe.simulator";
// "targetApp": "com.phonepe.app"
  /*"deviceContext": {
  "deviceOS": "ANDROID"
  }*/
  getCheckSum(Map<String, Object?> requestData1){

    String base64Body = base64.encode(utf8.encode(json.encode(requestData1)));
    checksum ='${sha256.convert(utf8.encode(base64Body+apiEndPoint+saltKey))}###$saltIndex';
    return base64Body;
  }
  void phonepeInit() {

    PhonePePaymentSdk.init(environmentValue, appId, merchantId, enableLogs)
        .then((isInitialized) => {
      setState(() {
        result = 'PhonePe SDK Initialized - $isInitialized';
        print('result:  $result');
              })
    })
        .catchError((error) {
      handleError(error);
      return <dynamic>{};
    });

  }


  void startPGTransaction(String transID, String merUserId, String? amount) async {

    try {
      PhonePePaymentSdk.startPGTransaction(body, callback, checksum, {}, apiEndPoint, "")
          .then((response) => {
        setState(() {
          if (response != null) {
            String status = response['status'].toString();
            String error = response['error'].toString();
            if (status == 'SUCCESS') {
              result = "Flow Completed - Status: Success!";
              print('result::::: ${result}');

              Map<String, dynamic> verifyparam = {
                "merchantTransactionId": transID,
                "merchantUserId": merUserId,
                "amount":amount
              };
              _paymentplanViewModel.VerifyPaymentApi(onFailureRes: onFailureRes, onSuccessRes: onVerfySuccessRes,verifyparam: verifyparam);
                    }
            else {
              result = "Flow Completed - Status: $status and Error: $error";
            }
          } else {
            result = "Flow Incomplete";
          }
        })
      })
          .catchError((error) {
        handleError(error);
        return <dynamic>{};
      });
    } catch (error) {
      handleError(error);
    }
  }


  void handleError(error) {

    setState(() {
      result ={"error" : error};
    });

  }

  @override
  void initState() {
    super.initState();
    _paymentplanViewModel =  Provider.of<PaymentPlanViewModel>(context, listen: false);
    phonepeInit();


    WidgetsBinding.instance.addPostFrameCallback((_) {
      _paymentplanViewModel.paymentplanapi(onFailureRes: onFailureRes, onSuccessRes: onSuccessRes);

    });
  }

  @override
  Widget build(BuildContext context) {
    var deviceheight = MediaQuery.of(context).size.height;
    var devicewidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Appcolors.white,
        appBar: CustomAppBar(height: 60.0, title: 'Select Payment Plan', appbarclr: Appcolors.white),
        body: Stack(
          children: [
            Container(
              height: deviceheight,
              width: devicewidth,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
                      height: 60,
                      child: Column(
                        children: [
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text("A subscription is required for dealers & advisors to continue using this application. You will NOT be able to use the app to the fullest or make a sale or purchase unless you are on a subscription plan.",
                              style: CustomTextStyle.txt12Rrtxtgry,)),

                        ],
                      ),
                    ),
                  ),

                  Consumer<PaymentPlanViewModel>(
                       builder: (context,couponVM,child){
                    return Expanded(
                      child: Container(
                        height: deviceheight,
                        width: devicewidth,
                        child: PaymentPlanDetails( devicewidth: devicewidth,deviceheight: deviceheight,items: items,onPressed: (selectedPlans){
                          Navigator.push(context,MaterialPageRoute(builder: (context) => CheckOutPage(selectedPlans: selectedPlans,
                            onPressed: (){
                            var chkCouponStatus =couponVM.CheckoutresponseModel?.status;

                            if(chkCouponStatus != null && chkCouponStatus){
                              Map<String, dynamic> subsparam = {
                                "plan_id": couponVM.CheckoutresponseModel?.data?.planId ?? "",
                                "total":couponVM.CheckoutresponseModel?.data?.total ?? "",
                                "coupon_code":couponVM.CheckoutresponseModel?.data?.couponCode ?? "",
                                "discount_amount":couponVM.CheckoutresponseModel?.data?.discountAmount ?? ""
                              };
                              _paymentplanViewModel.Subscriptionapi(onFailureRes: onFailureRes, onSuccessRes: onSubsSuccessRes,subsparam: subsparam);
                            }else {
                                 print('selected plan ID: ${selectedPlans?.id}');
                          Map<String, dynamic> subsparam = {
                          "plan_id": "${selectedPlans?.id.toString()}",
                            "total":"${selectedPlans?.amount}",
                            "coupon_code":"",
                            "discount_amount":"0"
                          };
                          _paymentplanViewModel.Subscriptionapi(onFailureRes: onFailureRes, onSuccessRes: onSubsSuccessRes,subsparam: subsparam);
                            }

                          },)));

                        }) ,
                      ),
                    );}
                  )

                ],
              ),
            ),
            GestureDetector(
              onTap: (){
                Route route = MaterialPageRoute(builder: (context) => SaudaHomePage());
                Navigator.pushReplacement(context, route);
              },
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 18.0),
                    child: Text("SKIP"),
                  )),
            ),
          ],
        ),
      );
  }



  onFailureRes(String p1) {
  }

  onSuccessRes(PayementPlanModel? p1) {
  }

  onSubsSuccessRes(SubscriptionModel? subsResponse) async {
var subStatus= subsResponse?.status;
    if(subsResponse != null && subStatus != null && subStatus ){

    /*  final requestData = {                          // Request payload
        "merchantId": subsResponse.subscription?.merchantId ?? "",
        "merchantUserId": subsResponse.subscription?.merchantUserId ??"",
        "subscriptionId": subsResponse.subscription?.subscriptionId ?? "",
        "authRequestId":subsResponse.subscription?.authRequestId ?? "",
        "amount": subsResponse.subscription?.amount,
        "paymentInstrument": {
          "type": "UPI_INTENT",
          //"type": "PAY_PAGE",
          "targetApp": "com.phonepe.app"
        }
      };*/

   /*   final requestData = {
        "merchantId": merchantId,
        "merchantTransactionId": "transaction_123",
        "merchantUserId": "90223250",
        "amount": 1000,
        "mobileNumber": "9999999999",
        "callbackUrl": callback,
        "paymentInstrument": {
          "type": "PAY_PAGE",
        },
      };*/

      callback = subsResponse.subscription?.callbackUrl ?? "";
      final requestData =  {
        "merchantId": subsResponse.subscription?.merchantId ?? "",
        "merchantTransactionId": subsResponse.subscription?.merchantTransactionId ??"",   //transaction id
        "merchantUserId":  subsResponse.subscription?.merchantUserId ??"",
        "amount":  subsResponse.subscription?.amount, //1000,
        "callbackUrl": callback,
        "mobileNumber": subsResponse.subscription?.mobileNum,   //mobile no
        "paymentInstrument": {
          "type": "PAY_PAGE"
        }
      };


      //"targetApp": "com.phonepe.app"
      print('Phonepe Request Payload ::: $requestData');
      body= getCheckSum(requestData).toString();
      startPGTransaction(subsResponse.subscription?.merchantTransactionId ??"",subsResponse.subscription?.merchantUserId ??"",subsResponse.subscription?.amount.toString());
      //  String base64Body = base64.encode(utf8.encode(json.encode(requestData)));
    //  _paymentplanViewModel.PhonepeAuthapi(onFailureRes: onFailureRes, onSuccessRes: onAuthSuccessRes, callback: callback, checksum: checksum, base64Body: base64Body);

    }else{
      showToast(subsResponse?.message ?? "");
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


  onAuthSuccessRes(PhonepeAuthModel? authSuccessData) async {

    print('Auth Success ${authSuccessData?.code}');
    //_launchPhonePe(authSuccessData);
    //if (platform.isAndroid) {
      AndroidIntent intent = AndroidIntent(
        action: 'action_view',
          data: Uri.encodeFull( authSuccessData?.data?.redirectUrl ?? "",),
        //  data: Uri.encodeFull( "upi://mandate?pn=SUBSCRIBEMID&pa=MID12345@ybl&tid=YBL6663638d0312408a8f54f7df8f1bd6b9&tr=P1812191027266848105909&am=399.00&mam=399.00&cu=INR&url=https://phonepe.com&mc=7299&tn=Payment%20for%20TXN123456789&utm_source=TXN123456789&utm_medium=MID12345&utm_campaign=SUBSCRIBE_AUTH"),
        //  data: Uri.encodeFull( "upi://mandate?pa=PGTESTPAYUAT@ybl&pn=SUBSCRIBEMID&am=1000&mam=1000&tr=STX597459186&utm_campaign=SUBSCRIBE_AUTH&utm_medium=PGTESTPAYUAT&utm_source=STX597459186"),
          package: 'com.phonepe.simulator');
      await intent.launch();
   // }

  }



  onVerfySuccessRes(StatusandMessageModel? p1) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => DonePage(purchaseType: "payment",isPaymentPage: true,)));
  }
}


