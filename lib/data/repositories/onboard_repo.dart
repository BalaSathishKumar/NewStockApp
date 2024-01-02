
import 'package:base_flutter_provider_project/data/models/LoginModel/OnBoardScreenModel.dart';

import '../../constants/end_points_constants.dart';
import '../../services/dio_client.dart';
import '../../utils/logger.dart';
import '../models/dashboard_model/ProfileResponseModel.dart';

class OnBoardRepository {
  final ApiClient _client = ApiClient();

  Future<OnBoardScreenModel?> onboardapi() async {
    final response = await _client.get("${EndPointConstants.onboardslider}");

    Logger.appLogs('OnBoardcallBackResponse:: $response');
    if (response != null) {
      //Success returning data back
      Logger.appLogs('responseRepo:: $response');
      return OnBoardScreenModel.fromJson(response as Map<String, dynamic>);
    } else {
      //Failed returning null
      Logger.appLogs('OnBoarderrorNull:: $response');
      return null;
    }
  }
}