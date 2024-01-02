import 'dart:async';
import 'package:base_flutter_provider_project/common_widgets/button_widgets/bottom_button.dart';
import 'package:base_flutter_provider_project/connectivity/no_internet.dart';
import 'package:base_flutter_provider_project/constants/colors.dart';
import 'package:base_flutter_provider_project/utils/common_functions.dart';
import 'package:base_flutter_provider_project/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import '../common_widgets/brand_logo.dart';
import '../constants/constant.dart';
import '../ui/home/homepage.dart';
import '../ui/onboarding/onboarding.dart';

class CheckInternet extends StatefulWidget {
  const CheckInternet({Key? key}) : super(key: key);

  @override
  CheckInternetState createState() => CheckInternetState();
}

class CheckInternetState extends State<CheckInternet> {
  ConnectivityResult _connectionStatus = ConnectivityResult.none;
  final Connectivity _connectivity = Connectivity();
  Timer? _timer;
  @override
  void initState() {
    super.initState();
    initConnectivity();
    navigateToNextPage();
  }

  Future<void> initConnectivity() async {
    late ConnectivityResult result;
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      Logger.appLogs('Couldn\'t check connectivity status error: $e',);
      return;
    }

    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    setState(() {
      _connectionStatus = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    Logger.appLogs(_connectionStatus == ConnectivityResult.none);
    return _connectionStatus == ConnectivityResult.none
        ? const NoInternet()
        : Scaffold(
      backgroundColor: Appcolors.splashbgcolor2,
      body: brandLogo(context)

    );
  }

  navigateToNextPage() {
    _timer = Timer(const Duration(seconds: 3), () {
      if (Constant.isLoggedIn == "true") {
       // showToast("constant islogged in ${Constant.isLoggedIn}");
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => SaudaHomePage()), (route) => false, // This predicate removes all routes.
        );

      } else {
      //  showToast("constant islogged in ${Constant.isLoggedIn}");
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => OnBoarding()), (route) => false, // This predicate removes all routes.
        );
      }
    }
    );
  }
}
