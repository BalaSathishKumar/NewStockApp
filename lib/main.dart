import 'dart:convert';
import 'dart:io';

import 'package:base_flutter_provider_project/app.dart';
import 'package:base_flutter_provider_project/config/locator.dart';
import 'package:base_flutter_provider_project/constants/constant.dart';
import 'package:base_flutter_provider_project/ui/splash/splash.dart';
import 'package:base_flutter_provider_project/utils/common_functions.dart';
import 'package:base_flutter_provider_project/utils/logger.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart'as flutter_local_notifications;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await Firebase.initializeApp();

  //To setup the singleton initialization
  setupLocator();
  //To remove (#) from the navigation url
  setPathUrlStrategy();

  //Check for onBoarding
  Constant.isBoarding = await checkOnBoarding();
  //Check for onLogin
  Constant.isLoggedIn = await checkLoginPref();
  //Check for permission
  Constant.isPermissionGranted = await validatePermission();

  Logger.appLogs('runApp user login ${Constant.isBoarding}:: ${Constant.isLoggedIn}');

  runApp(const MyApp());
}



