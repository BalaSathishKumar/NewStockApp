

import '../../constants/end_points_constants.dart';
import '../../services/dio_client.dart';
import '../../utils/logger.dart';
import '../models/SocialModel/CheckSocialModel.dart';
import '../models/SocialModel/StatusMessageModel.dart';

class SocialRepository {
  final ApiClient _client = ApiClient();

  Future<StatusMessageModel?> socialapi( Map<String, dynamic> socialparams) async {
    final response = await _client.post(EndPointConstants.sociallink,body: socialparams);

    Logger.appLogs('socialcallBackResponse:: $response');
    if (response != null) {
      //Success returning data back
      Logger.appLogs('responseRepo:: $response');
      return StatusMessageModel.fromJson(response as Map<String, dynamic>);
    } else {
      //Failed returning null
      Logger.appLogs('socialerrorNull:: $response');
      return null;
    }
  }

  Future<CheckSocialModel?> CheckuserSocialapi( Map<String, dynamic> chksocialparams) async {
    final response = await _client.post(EndPointConstants.checksocial,body: chksocialparams);

    Logger.appLogs('checksocialcallBackResponse:: $response');
    if (response != null) {
      //Success returning data back
      Logger.appLogs('responseRepo:: $response');
      return CheckSocialModel.fromJson(response as Map<String, dynamic>);
    } else {
      //Failed returning null
      Logger.appLogs('checksocialerrorNull:: $response');
      return null;
    }
  }
}