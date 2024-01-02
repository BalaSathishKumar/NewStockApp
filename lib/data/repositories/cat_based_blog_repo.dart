


import '../../constants/end_points_constants.dart';
import '../../services/dio_client.dart';
import '../../utils/logger.dart';
import '../models/Insights_model/CatBasedBlogsModel.dart';

class CatBasedBlogsRepository {
  final ApiClient _client = ApiClient();

  Future<CatBasedBlogsModel?> catbasedblogapi(int blogCatId) async {
    final response = await _client.get("${EndPointConstants.catbasedblogs}${blogCatId}");

    Logger.appLogs('catbasedblogscallBackResponse:: $response');
    if (response != null) {
      //Success returning data back
      Logger.appLogs('responseRepo:: $response');
      return CatBasedBlogsModel.fromJson(response as Map<String, dynamic>);
    } else {
      //Failed returning null
      Logger.appLogs('catbasedblogserrorNull:: $response');
      return null;
    }
  }
}