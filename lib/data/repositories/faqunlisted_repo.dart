
import 'package:base_flutter_provider_project/data/models/home_model/FAQmodel.dart';

import '../../constants/end_points_constants.dart';
import '../../services/dio_client.dart';
import '../../utils/logger.dart';


class FAQunlistedRepository {
  final ApiClient _client = ApiClient();

  Future<FaQmodel?> FAQapi() async {
    final response = await _client.get("${EndPointConstants.faq}");

    Logger.appLogs('faqcallBackResponse:: $response');
    if (response != null) {
      //Success returning data back
      Logger.appLogs('responseRepo:: $response');

      return FaQmodel.fromJson(response as Map<String, dynamic>);
    } else {
      //Failed returning null
      Logger.appLogs('faqerrorNull:: $response');
      return null;
    }
  }
}