

import 'package:base_flutter_provider_project/data/models/Portfolio_model/InvestedStock.dart';
import 'package:base_flutter_provider_project/data/models/StatusandMessageModel.dart';
import '../../constants/end_points_constants.dart';
import '../../services/dio_client.dart';
import '../../utils/logger.dart';

class PortfolioRepository {
  final ApiClient _client = ApiClient();

  Future<InvestedStocks?> myportfolioapi() async {
    final response = await _client.get(EndPointConstants.myportfolio);

    Logger.appLogs('myportfolioResponse:: $response');
    if (response != null) {
      //Success returning data back
      Logger.appLogs('responseRepo:: $response');
      return InvestedStocks.fromJson(response as Map<String, dynamic>);
    } else {
      //Failed returning null
      Logger.appLogs('myportfolioerrorNull:: $response');
      return null;
    }
  }

  Future<StatusandMessageModel?> addportfolioapi( Map<String, dynamic> addfolioparam ) async {
    final response = await _client.post(EndPointConstants.addportfolio,body: addfolioparam);

    Logger.appLogs('addportfolioResponse:: $response');
    if (response != null) {
      //Success returning data back
      Logger.appLogs('responseRepo:: $response');
      return StatusandMessageModel.fromJson(response as Map<String, dynamic>);
    } else {
      //Failed returning null
      Logger.appLogs('addportfolioerrorNull:: $response');
      return null;
    }
  }
  Future<StatusandMessageModel?> contactusapi( Map<String, dynamic> contactusparam ) async {
    final response = await _client.post(EndPointConstants.contactus,body: contactusparam);

    Logger.appLogs('contactusResponse:: $response');
    if (response != null) {
      //Success returning data back
      Logger.appLogs('responseRepo:: $response');
      return StatusandMessageModel.fromJson(response as Map<String, dynamic>);
    } else {
      //Failed returning null
      Logger.appLogs('contactuserrorNull:: $response');
      return null;
    }
  }

}