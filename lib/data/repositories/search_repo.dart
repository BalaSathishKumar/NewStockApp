
import 'package:base_flutter_provider_project/data/models/SearchModel/SearchModel.dart';

import '../../constants/end_points_constants.dart';
import '../../services/dio_client.dart';
import '../../utils/logger.dart';

class SearchRepository {
  final ApiClient _client = ApiClient();

  Future<SearchModel?> searchapi( String searchparams) async {
    Map<String, String> searchkey = {"keyword": searchparams};
    final response = await _client.post(EndPointConstants.search,body: searchkey);

    Logger.appLogs('searchcallBackResponse:: $response');
    if (response != null) {
      //Success returning data back
      Logger.appLogs('responseRepo:: $response');
      return SearchModel.fromJson(response as Map<String, dynamic>);
    } else {
      //Failed returning null
      Logger.appLogs('searcherrorNull:: $response');
      return null;
    }
  }
}