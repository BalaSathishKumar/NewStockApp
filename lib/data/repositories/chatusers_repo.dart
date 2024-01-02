


import '../../constants/end_points_constants.dart';
import '../../services/dio_client.dart';
import '../../utils/logger.dart';
import '../models/Chat_models/ChatRoom2Model.dart';
import '../models/Chat_models/ChatRoomModel.dart';
import '../models/StatusandMessageModel.dart';
import '../models/User_Directory_model/ChatUsersList.dart';

class ChatUsersRepository {
  final ApiClient _client = ApiClient();

  Future<ChatUsersList?> getchatusersapi() async {
    final response = await _client.get("${EndPointConstants.chatusers}");

    Logger.appLogs('getchatuserscallBackResponse:: $response');
    if (response != null) {
      //Success returning data back
      Logger.appLogs('responseRepo:: $response');
      return ChatUsersList.fromJson(response as Map<String, dynamic>);
    } else {
      //Failed returning null
      Logger.appLogs('getchatuserserrorNull:: $response');
      return null;
    }
  }

}