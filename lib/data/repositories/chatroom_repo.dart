


import 'package:base_flutter_provider_project/data/models/Chat_models/ClearChatModel.dart';

import '../../constants/end_points_constants.dart';
import '../../services/dio_client.dart';
import '../../utils/logger.dart';
import '../models/Chat_models/ChatHistoryModel.dart';
import '../models/Chat_models/ChatRoom2Model.dart';
import '../models/Chat_models/ChatRoomModel.dart';
import '../models/Chat_models/GetAdminMessageModel.dart';
import '../models/StatusandMessageModel.dart';

class ChatRoomRepository {
  final ApiClient _client = ApiClient();

  Future<ChatRoom2Model?> getchatapi(String ChatuserID) async {
    final response = await _client.get("${EndPointConstants.getchat}${ChatuserID}");

    Logger.appLogs('getchatcallBackResponse:: $response');
    if (response != null) {
      //Success returning data back
      Logger.appLogs('responseRepo:: $response');
      return ChatRoom2Model.fromJson(response as Map<String, dynamic>);
    } else {
      //Failed returning null
      Logger.appLogs('getchaterrorNull:: $response');
      return null;
    }
  }

  Future<GetAdminMessageModel?> getAdminchatapi() async {
    final response = await _client.get("${EndPointConstants.getadminchat}");

    Logger.appLogs('getadminchatcallBackResponse:: $response');
    if (response != null) {
      //Success returning data back
      Logger.appLogs('responseRepo:: $response');
      return GetAdminMessageModel.fromJson(response as Map<String, dynamic>);
    } else {
      //Failed returning null
      Logger.appLogs('getadminchaterrorNull:: $response');
      return null;
    }
  }


  Future<StatusandMessageModel?> sendMessageapi( Map<String, dynamic> message, String userid) async {
    final response = await _client.post("${EndPointConstants.sendmessage}${userid}",body: message);

    Logger.appLogs('sendmsgcallBackResponse:: $response');
    if (response != null) {
      //Success returning data back
      Logger.appLogs('responseRepo:: $response');
      return StatusandMessageModel.fromJson(response as Map<String, dynamic>);
    } else {
      //Failed returning null
      Logger.appLogs('sendmsgchaterrorNull:: $response');
      return null;
    }
  }


  Future<StatusandMessageModel?> sendAdminMessageapi( Map<String, dynamic> message) async {
    final response = await _client.post("${EndPointConstants.sendadminmessage}",body: message);

    Logger.appLogs('sendadminmessagecallBackResponse:: $response');
    if (response != null) {
      //Success returning data back
      Logger.appLogs('responseRepo:: $response');
      return StatusandMessageModel.fromJson(response as Map<String, dynamic>);
    } else {
      //Failed returning null
      Logger.appLogs('sendadminmessagechaterrorNull:: $response');
      return null;
    }
  }



  Future<ClearChatModel?> clearchatapi(String ChatuserID) async {
    final response = await _client.get("${EndPointConstants.clearchat}${ChatuserID}");

    Logger.appLogs('clearchatcallBackResponse:: $response');
    if (response != null) {
      //Success returning data back
      Logger.appLogs('responseRepo:: $response');
      return ClearChatModel.fromJson(response as Map<String, dynamic>);
    } else {
      //Failed returning null
      Logger.appLogs('clearchaterrorNull:: $response');
      return null;
    }
  }


  Future<StatusandMessageModel?> blockuserapi( String userid) async {
    final response = await _client.post("${EndPointConstants.blockuser}${userid}");

    Logger.appLogs('blockusercallBackResponse:: $response');
    if (response != null) {
      //Success returning data back
      Logger.appLogs('responseRepo:: $response');
      return StatusandMessageModel.fromJson(response as Map<String, dynamic>);
    } else {
      //Failed returning null
      Logger.appLogs('blockuserchaterrorNull:: $response');
      return null;
    }
  }


  Future<ChatHistoryModel?> getchathistoryapi() async {
    final response = await _client.get("${EndPointConstants.getchathistory}");

    Logger.appLogs('getchathistorycallBackResponse:: $response');
    if (response != null) {
      //Success returning data back
      Logger.appLogs('responseRepo:: $response');
      return ChatHistoryModel.fromJson(response as Map<String, dynamic>);
    } else {
      //Failed returning null
      Logger.appLogs('getchathistoryerrorNull:: $response');
      return null;
    }
  }

  Future<StatusandMessageModel?> deletechathistoryapi(String userid) async {
    final response = await _client.get("${EndPointConstants.deletechathistory}${userid}");

    Logger.appLogs('deletechathistorycallBackResponse:: $response');
    if (response != null) {
      //Success returning data back
      Logger.appLogs('responseRepo:: $response');
      return StatusandMessageModel.fromJson(response as Map<String, dynamic>);
    } else {
      //Failed returning null
      Logger.appLogs('deletechathistorychaterrorNull:: $response');
      return null;
    }
  }


}