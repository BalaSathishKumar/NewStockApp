import 'dart:async';
import 'dart:io';

import 'package:base_flutter_provider_project/common_widgets/alert_widgets/permission_prompt.dart';
import 'package:base_flutter_provider_project/common_widgets/brand_logo.dart';
import 'package:base_flutter_provider_project/constants/constant.dart';
import 'package:base_flutter_provider_project/constants/theme_color.dart';
import 'package:base_flutter_provider_project/data/models/LoginModel/OnBoardScreenModel.dart';
import 'package:base_flutter_provider_project/utils/common_functions.dart';
import 'package:base_flutter_provider_project/utils/logger.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart'as flutter_local_notifications;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';

import '../../connectivity/check_internet.dart';
import '../../constants/colors.dart';
import '../../viewModel/ChatRoom_view_model.dart';
import '../../viewModel/CommonProvider.dart';
import '../../viewModel/onboard_viewmodel.dart';
import '../Dealers/select_payment.dart';
import '../home/homepage.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  late OnboardViewModel _onboardViewModel;
  Timer? _timer;
  String? fcmToken = '';
  PushNotification? _notificationInfo;
  late CommonProvider _commonProvider;
  late ChatRoomViewModel _chatRoomViewModel;
   AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
     importance: Importance.max,
  );
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();


  @override
  void initState() {
    super.initState();
    Constant.isBoarding = true;
    _getFCMToken();
    registerNotification();
    navigateToNextPage();
    _onboardViewModel =  Provider.of<OnboardViewModel>(context, listen: false);
    _commonProvider = Provider.of<CommonProvider>(context, listen: false);
    _chatRoomViewModel = Provider.of<ChatRoomViewModel>(context, listen: false);

     WidgetsBinding.instance.addPostFrameCallback((_) {
       _onboardViewModel.onboardapi(onFailureRes: onFailureRes, onSuccessRes: onSuccessRes);
     });
    //firebaseCloudMessagingListeners();
  //  upload();
/*    if (Constant.isPermissionGranted) {
      navigateToNextPage();
    } else {
      //Calling API after UI renders
      WidgetsBinding.instance.addPostFrameCallback((_) {
        //permissionPrompt(context);

      });
    }*/
  }

  @override
  Widget build(BuildContext context) {
    /*Logger.appLogs("Splash: Splash screen");
    AutoRouter.of(context);*/

    return WillPopScope(
      onWillPop: ()async{
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        backgroundColor: Appcolors.splashbgcolor2,
        body: brandLogo(context)

      ),
    );
  }

  navigateToNextPage() {
    Logger.appLogs('isBoarding:: ${Constant.isBoarding}');
    Logger.appLogs('isLoggedIn:: ${Constant.isLoggedIn}' );
    Logger.appLogs('isGranted:: ${Constant.isPermissionGranted}');

    /****************Validating Login Session and onBoard Session**************/
     if (Constant.isBoarding) {
      _timer = Timer(const Duration(seconds: 0), () {

     /*   Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => CheckInternet()),
          (route) => false, // This predicate removes all routes.
        );*/

        Navigator.push(context, MaterialPageRoute(builder: (context) => CheckInternet()));

       /* if (Constant.isLoggedIn == "true") {    // without checking internet flow
          // context.router.replace(const OnBoarding());
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => SaudaHomePage()),
                (route) => false, // This predicate removes all routes.
          );
        //  Navigator.push(context, MaterialPageRoute(builder: (context)=> SaudaHomePage()));
        }
        else {
          // context.router.replace(const HomeRoute());
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => OnBoarding()),
         //   MaterialPageRoute(builder: (context) => SelectPayment()),
                (route) => false, // This predicate removes all routes.
          );
        //  Navigator.push(context, MaterialPageRoute(builder: (context)=> OnBoarding()));
        }*/
      });
    } else {
      /* _timer = Timer(const Duration(seconds: 3), () {
        // context.router.replace(const HomeRoute());
         Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));
       });*/
    }
    /********************************END***************************************/

  }

  //To request permission
  Future<bool> requestPermission() async {
    Constant.isPermissionGranted = await checkPermission();
    navigateToNextPage();
    return Constant.isPermissionGranted;
  }

  void permissionPrompt(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return PermissionPrompt(
            tapYes: () {
              Navigator.pop(context);
              requestPermission();
            },
            tapCancel: () {
              Navigator.pop(context);
              navigateToNextPage();
            },
          );
        });
  }

  Future upload() async{
  await Firebase.initializeApp();

//upload document to firestore
  final refUser= FirebaseFirestore.instance.collection('user').doc();
  await refUser.set({'username' : 'sathish'});

//upload file ti firebase storage

 final response = await http.get(Uri.parse("https://cdn.educba.com/academy/wp-content/uploads/2022/01/Joint-Stock-Company.jpg"));
  final imagebytes = response.bodyBytes;
    Reference ref = FirebaseStorage.instance
        .ref()
        .child('flutter-tests/some-image.jpg');

 ref.putData(imagebytes);
  }

  Future<void> _getFCMToken() async {
    fcmToken = await FirebaseMessaging.instance.getToken();
    print('FCMToken....${fcmToken}');
    _commonProvider.setFCM(fcmToken ?? "");

  }

  void registerNotification() async {
    await Firebase.initializeApp();
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    var _messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
      // For handling the received notifications
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        print('chk image in notification .. ${message.data["image"]}');
        // Parse the message received
        PushNotification notification = PushNotification(
          title: message.notification?.title,
          body: message.notification?.body,
         // type: message.data["type"] == "chat" ? "chat" : "nochat"
          type: message.data["type"]
        );

        _commonProvider.setNotificationInfo(notification);
      /*  setState(() {
          _notificationInfo = notification;
        });*/
        _notificationInfo = _commonProvider.NotificationInfo;
        if (_notificationInfo != null) {
          triggerChat(_notificationInfo);
          // For displaying the notification as an overlay
          showSimpleNotification(
            Text(_notificationInfo?.title ?? "",
              style: TextStyle(color: Colors.black),
            ),
            subtitle: Text(_notificationInfo?.body ?? "",
                style: TextStyle(color: Colors.black)),
            background: Colors.white,
            duration: Duration(seconds: 2),
          );
        }
      });

      //  FirebaseMessaging.onBackgroundMessage(_backgroundNotificationHandler);
    } else {
      print('User declined or has not accepted permission');
    }
  }

  Future<void>  _handleBackgroundMessage(RemoteMessage message) async {
    // Handle the FCM background message here
    print("Background Message Data: ${message.data}");


    // Show overlay notification
/*    showOverlayNotification(
          (context) {
        return MessageNotification(
          title: title,
          message: body,
        );
      },
      duration: Duration(seconds: 5), // Duration for which the overlay will be visible
    );*/
  }







  Future<void> _backgroundNotificationHandler2(RemoteMessage message) async {
    if(message != null ){
  /*    PushNotification notification = PushNotification(
        title: message.notification?.title,
        body: message.notification?.body,
      );*/

   /*   showSimpleNotification(
        Text(message.notification?.title ?? ""),
        subtitle: Text(message.notification?.body??""),
        background: Colors.yellow,
        duration: Duration(seconds: 2),
      );*/
    }
    else{
      print("bg is null");
    }
  }

  Future<void> _backgroundNotificationHandler(RemoteMessage message) async {
    // Handle the background notification here
    print("_backgroundNotificationHandler ${message.notification?.body}");
    const String appName = "Sauda";

    if(message != null ){
      await FlutterLocalNotificationsPlugin().show(
        generateRandomNumber(message) ?? 3,
        //appName,
        message.notification?.title ?? "",
        Platform.isIOS
            ? "${message.notification?.body ?? ""}"
            : "${message.notification?.body ?? ""}",
        flutter_local_notifications.NotificationDetails(
            android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                channelDescription:  '${appName}NotificationChannel',
                importance: Importance.max,
                priority: Priority.max,
                playSound: true,
                ongoing: false,
                autoCancel: true,
                styleInformation: BigTextStyleInformation('')
            ),
            iOS: DarwinNotificationDetails(
              presentAlert: true,
              presentBadge: true,
            )
        ),
        payload: message.notification?.body ?? "",
      );
      print("message :: ${message.notification}");
    }
    else{
      print("msh is null");
    }
  }

  void triggerChat(PushNotification? notificationInfo) {
    print('notificationInfo ${notificationInfo?.type}');

    if(notificationInfo?.type == "chat"){
      print('Hit chat api');
      _chatRoomViewModel.setIsTriggerChat(true);
    }else if(notificationInfo?.type == "status"){
      print('Hit profile api');
      _commonProvider.setIsTriggerProfile(true);
    }
  }

  Future<bool> _exitApp(BuildContext context) async {
    var exit =  Navigator.of(context).pop(true);
    return true;
  }




  onFailureRes(String p1) {
  }

  onSuccessRes(List<NewSlider>? p1) {
  }
}

class MessageNotification extends StatelessWidget {
  final String title;
  final String message;

  MessageNotification({required this.title, required this.message});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      child: SafeArea(
        child: ListTile(
          leading: Icon(Icons.info),
          title: Text(title),
          subtitle: Text(message),
        ),
      ),
    );
  }
}

class PushNotification {
  PushNotification({
    this.type,
    this.title,
    this.body,
  });
  String? type;
  String? title;
  String? body;
}




