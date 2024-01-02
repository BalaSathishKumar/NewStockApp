

import '../../constants/end_points_constants.dart';
import '../../services/dio_client.dart';
import '../../utils/logger.dart';
import '../models/OTP_Verify_model/OtpVerifyModel.dart';

class OtpRepository {
  final ApiClient _client = ApiClient();

  Future<OtpResponseModel?> otpapi( Map<String, dynamic> loginparams) async {
    final response = await _client.post(EndPointConstants.otp,body: loginparams);

    Logger.appLogs('otpcallBackResponse:: $response');
    if (response != null) {
      //Success returning data back
      Logger.appLogs('responseRepo:: $response');
      return OtpResponseModel.fromJson(response as Map<String, dynamic>);
    } else {
      //Failed returning null
      Logger.appLogs('otperrorNull:: $response');
      return null;
    }
  }
}