import 'package:base_flutter_provider_project/data/models/LoginModel/LoginModel.dart';
import 'package:base_flutter_provider_project/data/models/StatusandMessageModel.dart';

import '../../constants/end_points_constants.dart';
import '../../services/dio_client.dart';
import '../../utils/logger.dart';

class BuySellRepository {
  final ApiClient _client = ApiClient();

  Future<StatusandMessageModel?> buysellapi( Map<String, dynamic> buysellparam) async {
    final response = await _client.post(EndPointConstants.buysell,body: buysellparam);

    Logger.appLogs('buysellBackResponse:: $response');
    if (response != null) {
      //Success returning data back
      Logger.appLogs('responseRepo:: $response');
      return StatusandMessageModel.fromJson(response as Map<String, dynamic>);
    } else {
      //Failed returning null
      Logger.appLogs('buysellerrorNull:: $response');
      return null;
    }
  }
}