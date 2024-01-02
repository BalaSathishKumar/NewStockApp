

import 'package:base_flutter_provider_project/data/models/Insights_model/LatestTipsModel.dart';

import '../../constants/end_points_constants.dart';
import '../../services/dio_client.dart';
import '../../utils/logger.dart';

class LatestTipsRepository {
  final ApiClient _client = ApiClient();

  Future<LatestTipsModel?> latesttipsapi() async {
    final response = await _client.get("${EndPointConstants.insights}");

    Logger.appLogs('latesttipscallBackResponse:: $response');
    if (response != null) {
      //Success returning data back
      Logger.appLogs('responseRepo:: $response');
      return LatestTipsModel.fromJson(response as Map<String, dynamic>);
    } else {
      //Failed returning null
      Logger.appLogs('latesttipserrorNull:: $response');
      return null;
    }
  }
}