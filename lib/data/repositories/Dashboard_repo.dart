

import 'package:base_flutter_provider_project/data/models/dashboard_model/DashBoardFilterModel.dart';

import '../../constants/end_points_constants.dart';
import '../../services/dio_client.dart';
import '../../utils/logger.dart';
import '../models/dashboard_model/DashboardResponseModel.dart';

class DashboardRepository {
  final ApiClient _client = ApiClient();

  Future<DashboardResponseModel?> dashboardapi() async {
    final response = await _client.get(EndPointConstants.dashboard);

    Logger.appLogs('dashboardcallBackResponse:: $response');
    if (response != null) {
      //Success returning data back
      Logger.appLogs('responseRepo:: $response');
      return DashboardResponseModel.fromJson(response as Map<String, dynamic>);
    } else {
      //Failed returning null
      Logger.appLogs('dashboarderrorNull:: $response');
      return null;
    }
  }

  Future<DashBoardFilterModel?> dashboardfilterapi(Map<String, dynamic> filterparams) async {
    final response = await _client.post(EndPointConstants.dashboardFilter,body: filterparams);

    Logger.appLogs('dashboardfiltercallBackResponse:: $response');
    if (response != null) {
      //Success returning data back
      Logger.appLogs('responseRepo:: $response');
      return DashBoardFilterModel.fromJson(response as Map<String, dynamic>);
    } else {
      //Failed returning null
      Logger.appLogs('dashboardfiltererrorNull:: $response');
      return null;
    }
  }
  Future<DashBoardFilterModel?> dashboardfilterapi2(Map<String, dynamic> filterparams) async {
    final response = await _client.post(EndPointConstants.dashboardFilter,body: filterparams);

    Logger.appLogs('dashboardfilter2callBackResponse:: $response');
    if (response != null) {
      //Success returning data back
      Logger.appLogs('responseRepo:: $response');
      return DashBoardFilterModel.fromJson(response as Map<String, dynamic>);
    } else {
      //Failed returning null
      Logger.appLogs('dashboardfilter2errorNull:: $response');
      return null;
    }
  }
}