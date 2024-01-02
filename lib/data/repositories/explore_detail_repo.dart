

import 'package:base_flutter_provider_project/data/models/StatusandMessageModel.dart';

import '../../constants/end_points_constants.dart';
import '../../services/dio_client.dart';
import '../../utils/logger.dart';
import '../models/Explore_model/ExploreDetailModel.dart';
import '../models/Explore_model/ExploreModel.dart';
import '../models/Explore_model/GetFavouriteModel.dart';

class ExploreDetailRepository {
  final ApiClient _client = ApiClient();

  Future<ExploreDetailModel?> explporedetailapi( String slugID) async {
    final response = await _client.get("${EndPointConstants.exploredetail}${slugID}");

    Logger.appLogs('exploredetailcallBackResponse:: $response');
    if (response != null) {
      //Success returning data back
      Logger.appLogs('responseRepo:: $response');

      return ExploreDetailModel.fromJson(response as Map<String, dynamic>);
    } else {
      //Failed returning null
      Logger.appLogs('exploredetailerrorNull:: $response');
      return null;
    }
  }
  Future<StatusandMessageModel?> addfavapi( Map<String, dynamic> stockid) async {
    final response = await _client.post(EndPointConstants.addfav,body: stockid);

    Logger.appLogs('addfavResponse:: $response');
    if (response != null) {
      //Success returning data back
      Logger.appLogs('responseRepo:: $response');
      return StatusandMessageModel.fromJson(response as Map<String, dynamic>);
    } else {
      //Failed returning null
      Logger.appLogs('addfaverrorNull:: $response');
      return null;
    }
  }

  Future<GetFavouriteModel?> getFavapi() async {
    final response = await _client.get(EndPointConstants.getfav);

    Logger.appLogs('getfavResponse:: $response');
    if (response != null) {
      //Success returning data back
      Logger.appLogs('responseRepo:: $response');
      return GetFavouriteModel.fromJson(response as Map<String, dynamic>);
    } else {
      //Failed returning null
      Logger.appLogs('getfaverrorNull:: $response');
      return null;
    }
  }


}