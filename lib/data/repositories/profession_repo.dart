
import 'package:base_flutter_provider_project/data/models/LocationsModel/CityModel.dart';
import 'package:base_flutter_provider_project/data/models/LocationsModel/ProfessionModel.dart';
import 'package:base_flutter_provider_project/data/models/LocationsModel/StateModel.dart';

import '../../constants/end_points_constants.dart';
import '../../services/dio_client.dart';
import '../../utils/logger.dart';

class ProfessionRepository {
  final ApiClient _client = ApiClient();

  Future<ProfessionModel?> professionapi() async {

    final response = await _client.get(EndPointConstants.profession);

    Logger.appLogs('professioncallBackResponse:: $response');
    if (response != null) {
      //Success returning data back
      Logger.appLogs('responseRepo:: $response');
      return ProfessionModel.fromJson(response as Map<String, dynamic>);
    } else {
      //Failed returning null
      Logger.appLogs('professionerrorNull:: $response');
      return null;
    }
  }


  Future<StateModel?> stateapi() async {

    final response = await _client.get(EndPointConstants.state);

    Logger.appLogs('statecallBackResponse:: $response');
    if (response != null) {
      //Success returning data back
      Logger.appLogs('responseRepo:: $response');
      return StateModel.fromJson(response as Map<String, dynamic>);
    } else {
      //Failed returning null
      Logger.appLogs('stateerrorNull:: $response');
      return null;
    }
  }

  Future<CityModel?> cityapi(String cityid) async {

    final response = await _client.get(EndPointConstants.city+cityid);

    Logger.appLogs('citycallBackResponse:: $response');
    if (response != null) {
      //Success returning data back
      Logger.appLogs('responseRepo:: $response');
      return CityModel.fromJson(response as Map<String, dynamic>);
    } else {
      //Failed returning null
      Logger.appLogs('cityerrorNull:: $response');
      return null;
    }
  }


}
