
import 'package:base_flutter_provider_project/data/models/DealerModels/PayementPlanModel.dart';
import '../../constants/end_points_constants.dart';
import '../../services/dio_client.dart';
import '../../utils/logger.dart';
import '../models/home_model/notificationpagemodel.dart';

class NotificationPageRepository {
  final ApiClient _client = ApiClient();

  Future<Notificationpagemodel?> notificationpageapi() async {
    final response = await _client.get("${EndPointConstants.notification}");

    Logger.appLogs('pnotificationcallBackResponse:: $response');
    if (response != null) {
      //Success returning data back
      Logger.appLogs('responseRepo:: $response');
      return Notificationpagemodel.fromJson(response as Map<String, dynamic>);
    } else {
      //Failed returning null
      Logger.appLogs('notificationerrorNull:: $response');
      return null;
    }
  }
}