

import 'package:base_flutter_provider_project/data/models/AdvisorModels/ConsultationListModel.dart';
import 'package:base_flutter_provider_project/data/models/Portfolio_model/InvestedStock.dart';
import 'package:base_flutter_provider_project/data/models/StatusandMessageModel.dart';
import '../../constants/end_points_constants.dart';
import '../../services/dio_client.dart';
import '../../utils/logger.dart';

class ConsultationRepository {
  final ApiClient _client = ApiClient();



  Future<StatusandMessageModel?> ConsultRequest( Map<String, dynamic> crparam ) async {
    final response = await _client.post(EndPointConstants.consultrequest,body: crparam);

    Logger.appLogs('consultrequestResponse:: $response');
    if (response != null) {
      //Success returning data back
      Logger.appLogs('responseRepo:: $response');
      return StatusandMessageModel.fromJson(response as Map<String, dynamic>);
    } else {
      //Failed returning null
      Logger.appLogs('consultrequesterrorNull:: $response');
      return null;
    }
  }


  Future<ConsultationListModel?> consultlistapi() async {
    final response = await _client.get("${EndPointConstants.consultlist}");

    Logger.appLogs('consultlistcallBackResponse:: $response');
    if (response != null) {
      //Success returning data back
      Logger.appLogs('responseRepo:: $response');
      return ConsultationListModel.fromJson(response as Map<String, dynamic>);
    } else {
      //Failed returning null
      Logger.appLogs('consultlisterrorNull:: $response');
      return null;
    }
  }

}