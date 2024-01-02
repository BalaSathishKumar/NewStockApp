
import 'package:base_flutter_provider_project/data/models/TransactionModel/PurchaseRequestModel.dart';
import '../../constants/end_points_constants.dart';
import '../../services/dio_client.dart';
import '../../utils/logger.dart';

class MyTransRepository {
  final ApiClient _client = ApiClient();

  Future<PurchaseRequestModel?> mytransapi() async {
    final response = await _client.get(EndPointConstants.mytransapi);

    Logger.appLogs('purchaserequestResponse:: $response');
    if (response != null) {
      //Success returning data back
      Logger.appLogs('responseRepo:: $response');
      return PurchaseRequestModel.fromJson(response as Map<String, dynamic>);
    } else {
      //Failed returning null
      Logger.appLogs('purchaserequesterrorNull:: $response');
      return null;
    }
  }


}