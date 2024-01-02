


import '../../constants/end_points_constants.dart';
import '../../services/dio_client.dart';
import '../../utils/logger.dart';
import '../models/dashboard_model/ProfileResponseModel.dart';

class ProfileRepository {
  final ApiClient _client = ApiClient();

  Future<ProfileResponseModel?> profileapi() async {
    final response = await _client.get("${EndPointConstants.profile}");

    Logger.appLogs('profilecallBackResponse:: $response');
    if (response != null) {
      //Success returning data back
      Logger.appLogs('responseRepo:: $response');
      return ProfileResponseModel.fromJson(response as Map<String, dynamic>);
    } else {
      //Failed returning null
      Logger.appLogs('profileerrorNull:: $response');
      return null;
    }
  }
}