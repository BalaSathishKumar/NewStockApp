


import 'package:base_flutter_provider_project/data/models/Insights_model/BlogsResponseModel.dart';
import 'package:base_flutter_provider_project/data/models/Insights_model/HouseOfInvestingModel.dart';

import '../../constants/end_points_constants.dart';
import '../../services/dio_client.dart';
import '../../utils/logger.dart';

class BlogsRepository {
  final ApiClient _client = ApiClient();

  Future<BlogsResponseModel?> blogapi() async {
    final response = await _client.get("${EndPointConstants.blogs}");

    Logger.appLogs('blogscallBackResponse:: $response');
    if (response != null) {
      //Success returning data back
      Logger.appLogs('responseRepo:: $response');
      return BlogsResponseModel.fromJson(response as Map<String, dynamic>);
    } else {
      //Failed returning null
      Logger.appLogs('blogserrorNull:: $response');
      return null;
    }
  }
  Future<HouseOfInvestingModel?> HOIapi() async {
    final response = await _client.get("${EndPointConstants.hoi}");

    Logger.appLogs('hoicallBackResponse:: $response');
    if (response != null) {
      //Success returning data back
      Logger.appLogs('responseRepo:: $response');
      return HouseOfInvestingModel.fromJson(response as Map<String, dynamic>);
    } else {
      //Failed returning null
      Logger.appLogs('hoierrorNull:: $response');
      return null;
    }
  }
}