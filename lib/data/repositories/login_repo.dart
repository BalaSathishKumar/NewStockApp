

import 'package:base_flutter_provider_project/data/models/LoginModel/LoginModel.dart';

import '../../constants/end_points_constants.dart';
import '../../services/dio_client.dart';
import '../../utils/logger.dart';

class LoginRepository {
  final ApiClient _client = ApiClient();

  Future<LoginResponseModel?> loginapi( Map<String, dynamic> loginparams) async {
    final response = await _client.post(EndPointConstants.login,body: loginparams);

    Logger.appLogs('logincallBackResponse:: $response');
    if (response != null) {
      //Success returning data back
      Logger.appLogs('responseRepo:: $response');
      return LoginResponseModel.fromJson(response as Map<String, dynamic>);
    } else {
      //Failed returning null
      Logger.appLogs('loginerrorNull:: $response');
      return null;
    }
  }
}