
import 'package:base_flutter_provider_project/data/models/Chat_models/ClearChatModel.dart';

import '../config/locator.dart';
import '../constants/strings.dart';
import '../data/models/Chat_models/ChatHistoryModel.dart';
import '../data/models/Chat_models/ChatRoom2Model.dart';
import '../data/models/Chat_models/ChatRoomModel.dart';
import '../data/models/Chat_models/GetAdminMessageModel.dart';
import '../data/models/StatusandMessageModel.dart';
import '../data/repositories/chatroom_repo.dart';
import '../utils/common_functions.dart';
import '../utils/generic_exception.dart';
import '../utils/logger.dart';
import 'base_view_model/base_view_model.dart';

class ChatRoomViewModel extends BaseViewModel {
  //Repository
  final ChatRoomRepository _chatroomRepository = locator<ChatRoomRepository>();

  //Model
  ChatRoom2Model? _getmessageResponseModel;
  GetAdminMessageModel? _getadminmessageResponseModel;
  ChatHistoryModel? _getchathistoryResponseModel;
  StatusandMessageModel? _statusandmessageResponseModel;
  ClearChatModel? _clearchatResponseModel;
  bool _isTriggerChat = false;


  ChatRoom2Model? get getmessageResponseModel => _getmessageResponseModel;
  GetAdminMessageModel? get getAdminmessageResponseModel => _getadminmessageResponseModel;
  ClearChatModel? get clearchatResponseModel => _clearchatResponseModel;
  ChatHistoryModel? get ChatHistoryResponseModel => _getchathistoryResponseModel;
  StatusandMessageModel? get statusandmessageResponseModel => _statusandmessageResponseModel;
  bool get IsTriggerChat => _isTriggerChat;



  void setIsTriggerChat(bool value) {
    _isTriggerChat = value;
    notifyListeners();
  }


  Future<ChatRoom2Model?> getmessageapi({

    required Function(String) onFailureRes,
    required Function(ChatRoom2Model?) onSuccessRes,
    required String ChatuserID

  }) async {
    //Loader State
    setState(ViewState.busy);

    try {
      var data = await _chatroomRepository.getchatapi(ChatuserID);
      if (data != null) {
        _getmessageResponseModel = data;

        //Success State
        onSuccessRes(_getmessageResponseModel);
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


  Future<GetAdminMessageModel?> getAdminmessageapi({

    required Function(String) onFailureRes,
    required Function(GetAdminMessageModel?) onSuccessRes,


  }) async {
    //Loader State
    setState(ViewState.busy);

    try {
      var data = await _chatroomRepository.getAdminchatapi();
      if (data != null) {
        _getadminmessageResponseModel = data;

        //Success State
        onSuccessRes(_getadminmessageResponseModel);
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




  Future<GetMessagesModel?> sendmessageapi({

    required Function(String) onFailureRes,
    required Function(StatusandMessageModel?) onSuccessRes,
    required  Map<String, dynamic> message,
    required String userid

  }) async {
    //Loader State
    setState(ViewState.busy);

    try {
      var data = await _chatroomRepository.sendMessageapi(message,userid);
      if (data != null) {
        _statusandmessageResponseModel = data;

        //Success State
        onSuccessRes(_statusandmessageResponseModel);
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



  Future<StatusandMessageModel?> sendAdminmessageapi({

    required Function(String) onFailureRes,
    required Function(StatusandMessageModel?) onSuccessRes,
    required  Map<String, dynamic> message,
  }) async {
    //Loader State
    setState(ViewState.busy);

    try {
      var data = await _chatroomRepository.sendAdminMessageapi(message);
      if (data != null) {
        _statusandmessageResponseModel = data;

        //Success State
        onSuccessRes(_statusandmessageResponseModel);
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




  Future<ChatRoom2Model?> clearchatapi({

    required Function(String) onFailureRes,
    required Function(ClearChatModel?) onSuccessRes,
    required String ChatuserID

  }) async {
    //Loader State
    setState(ViewState.busy);

    try {
      var data = await _chatroomRepository.clearchatapi(ChatuserID);
      if (data != null) {
        _clearchatResponseModel = data;

        //Success State
        onSuccessRes(_clearchatResponseModel);
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


  Future<GetMessagesModel?> blockuserapi({

    required Function(String) onFailureRes,
    required Function(StatusandMessageModel?) onSuccessRes,
    required String userid

  }) async {
    //Loader State
    setState(ViewState.busy);

    try {
      var data = await _chatroomRepository.blockuserapi(userid);
      if (data != null) {
        _statusandmessageResponseModel = data;
        print('bloc rs in vm ${data.message}');
        //Success State
        onSuccessRes(_statusandmessageResponseModel);
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


  Future<ChatHistoryModel?> getchathistoryapi({

    required Function(String) onFailureRes,
    required Function(ChatHistoryModel?) onSuccessRes,


  }) async {
    //Loader State
    setState(ViewState.busy);

    try {
      var data = await _chatroomRepository.getchathistoryapi();
      if (data != null) {
        _getchathistoryResponseModel = data;
        print('chat history in vm ${_getchathistoryResponseModel?.chat?.length}');
        //Success State
        onSuccessRes(_getchathistoryResponseModel);
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

  Future<GetMessagesModel?> deletechathistoryapi({

    required Function(String) onFailureRes,
    required Function(StatusandMessageModel?) onSuccessRes,
    required String userid

  }) async {
    //Loader State
    setState(ViewState.busy);

    try {
      var data = await _chatroomRepository.deletechathistoryapi(userid);
      if (data != null) {
        _statusandmessageResponseModel = data;
        print('dlt rs in vm ${data.message}');
        //Success State
        onSuccessRes(_statusandmessageResponseModel);
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