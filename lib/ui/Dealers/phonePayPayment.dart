import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:phonepe_payment_sdk/phonepe_payment_sdk.dart';

class PhonePayPayment extends StatefulWidget {
  const PhonePayPayment({super.key});

  @override
  State<PhonePayPayment> createState() => _PhonePayPaymentState();
}

class _PhonePayPaymentState extends State<PhonePayPayment> {


  //String callback = "flutterDemoApp";

  // String checksum = sha256(base64Body + apiEndPoint + salt) + ### + saltIndex;
  Map<String, String> headers = {};
  Map<String, String> pgHeaders = {"Content-Type": "application/json"};
  List<String> apiList = <String>['Container', 'PG'];
  List<String> environmentList = <String>['UAT', 'UAT_SIM', 'PRODUCTION'];
  // String apiEndPoint = "/pg/v1/pay";



  String dropdownValue = 'PG';

  String environmentValue = 'UAT_SIM';
  String appId = "";
  String merchantId = "PGTESTPAYUAT";
  bool enableLogs = true;
  String checksum = "";
  String saltIndex = "1";
  String saltKey = "099eb0cd-02cf-4e2a-8aca-3e6c6aff0399";
  String callback ="https://webhook.site/99e89a12-0dbf-40eb-9e16-f717a9424174";
  String body = "";
  Object? result;
 // String apiEndPoint = "https://api-preprod.phonepe.com/apis/pg-sandbox";
  String apiEndPoint = "/pg/v1/pay";

  String packageName = "com.phonepe.simulator";
// "targetApp": "com.phonepe.app"
  /*"deviceContext": {
  "deviceOS": "ANDROID"
  }*/
  getCheckSum(){
    final requestData = {
      "merchantId": merchantId,
      "merchantTransactionId": "transaction_123",
      "merchantUserId": "90223250",
      "amount": 1000,
      "mobileNumber": "9999999999",
      "callbackUrl": callback,
      "paymentInstrument": {
        "type": "PAY_PAGE",
      },
    };

    String base64Body = base64.encode(utf8.encode(json.encode(requestData)));
    checksum ='${sha256.convert(utf8.encode(base64Body+apiEndPoint+saltKey))}###$saltIndex';

    return base64Body;

  }

  @override
  void initState() {
    super.initState();
    phonepeInit();

   body= getCheckSum().toString();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: Scaffold(
        appBar: AppBar(),
        body: Container(
          child: Column(
            children: [
              ElevatedButton(onPressed: (){
                startPGTransaction();
              }, child: Text("Start Transaction")),
              Text("Result $result")
            ],
          ),
        ),
      ),
    );
  }

  void phonepeInit() {

    PhonePePaymentSdk.init(environmentValue, appId, merchantId, enableLogs)
        .then((isInitialized) => {
      setState(() {
        result = 'PhonePe SDK Initialized - $isInitialized';
      })
    })
        .catchError((error) {
      handleError(error);
      return <dynamic>{};
    });

  }


  void startPGTransaction() async {
    try {
      PhonePePaymentSdk.startPGTransaction(
          body, callback, checksum, {}, apiEndPoint, "")
          .then((response) => {
        setState(() {
          if (response != null) {
            String status = response['status'].toString();
            String error = response['error'].toString();
            if (status == 'SUCCESS') {
              result = "Flow Completed - Status: Success!";
            } else {
              result =
              "Flow Completed - Status: $status and Error: $error";
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


}
