
import 'package:base_flutter_provider_project/data/models/dashboard_model/PromocodeModel.dart';
import 'package:base_flutter_provider_project/data/models/dashboard_model/RewardResponseModel.dart';

import '../../constants/end_points_constants.dart';
import '../../services/dio_client.dart';
import '../../utils/logger.dart';
import '../models/StatusandMessageModel.dart';
import '../models/dashboard_model/ProfileResponseModel.dart';
import '../models/dashboard_model/RedeemRewardModel.dart';

class RewardRepository {
  final ApiClient _client = ApiClient();

  Future<RewardResponseModel?> rewardapi() async {
    final response = await _client.get("${EndPointConstants.rewards}");

    Logger.appLogs('rewardscallBackResponse:: $response');
    if (response != null) {
      //Success returning data back
      Logger.appLogs('responseRepo:: $response');
      return RewardResponseModel.fromJson(response as Map<String, dynamic>);
    } else {
      //Failed returning null
      Logger.appLogs('rewardserrorNull:: $response');
      return null;
    }
  }
  Future<RedeemRewardModel?> redeemrewardapi() async {
    final response = await _client.get("${EndPointConstants.redeemrewards}");

    Logger.appLogs('redeemrewardscallBackResponse:: $response');
    if (response != null) {
      //Success returning data back
      Logger.appLogs('responseRepo:: $response');
      return RedeemRewardModel.fromJson(response as Map<String, dynamic>);
    } else {
      //Failed returning null
      Logger.appLogs('redeemrewardserrorNull:: $response');
      return null;
    }
  }

  Future<PromocodeModel?> promocodeapi() async {
    final response = await _client.get("${EndPointConstants.promocode}");

    Logger.appLogs('promocodecallBackResponse:: $response');
    if (response != null) {
      //Success returning data back
      Logger.appLogs('responseRepo:: $response');
      return PromocodeModel.fromJson(response as Map<String, dynamic>);
    } else {
      //Failed returning null
      Logger.appLogs('promocodeerrorNull:: $response');
      return null;
    }
  }

  Future<StatusandMessageModel?> RedeemNowapi( Map<String, dynamic> redeemparam ) async {
    final response = await _client.post(EndPointConstants.redeemNow,body: redeemparam);

    Logger.appLogs('redeemNowResponse:: $response');
    if (response != null) {
      //Success returning data back
      Logger.appLogs('responseRepo:: $response');
      return StatusandMessageModel.fromJson(response as Map<String, dynamic>);
    } else {
      //Failed returning null
      Logger.appLogs('redeemNowerrorNull:: $response');
      return null;
    }
  }


}