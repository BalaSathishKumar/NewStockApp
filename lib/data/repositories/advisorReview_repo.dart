

import 'package:base_flutter_provider_project/data/models/StatusandMessageModel.dart';

import '../../constants/end_points_constants.dart';
import '../../services/dio_client.dart';
import '../../utils/logger.dart';
import '../models/AdvisorModels/AdvisorReviewModel.dart';


class AdvisorReviewRepository {
  final ApiClient _client = ApiClient();

  Future<StatusandMessageModel?> advisorreviewapi( Map<String,dynamic> advisorreviewparam) async {
    final response = await _client.post("${EndPointConstants.advisorreview}",body: advisorreviewparam);

    Logger.appLogs('advisorreviewcallBackResponse:: $response');
    if (response != null) {
      //Success returning data back
      Logger.appLogs('responseRepo:: $response');

      return StatusandMessageModel.fromJson(response as Map<String, dynamic>);
    } else {
      //Failed returning null
      Logger.appLogs('advisorreviewerrorNull:: $response');
      return null;
    }
  }


  Future<AdvisorReviewListModel?> getAdvisorReview() async {
    final response = await _client.get(EndPointConstants.advisorreviewlist);

    Logger.appLogs('advisorreviewlistcallBackResponse:: $response');
    if (response != null) {
      //Success returning data back
      Logger.appLogs('responseRepo:: $response');
      return AdvisorReviewListModel.fromJson(response as Map<String, dynamic>);
    } else {
      //Failed returning null
      Logger.appLogs('advisorreviewlisterrorNull:: $response');
      return null;
    }
  }




}