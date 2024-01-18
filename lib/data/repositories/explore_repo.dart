

import '../../constants/end_points_constants.dart';
import '../../services/dio_client.dart';
import '../../utils/logger.dart';
import '../models/Explore_model/ExploreModel.dart';
import '../models/Explore_model/ExplorePerformModel.dart';
import '../models/Explore_model/PerformDetailModel.dart';
import '../models/Explore_model/viewAllModel.dart';

class ExploreRepository {
  final ApiClient _client = ApiClient();

  Future<ExploreModel?> explporeapi( String catID,String PageNo, String? keyword, String pricemin,  String? pricemax,String? sortbyprice, String? sortbyuserrating, String? sortbysaudarating, String? type, String? top,bool IsFilter, bool IsExploreSearch) async {
    print('explporeapi ::: ${setEndPoint( catID, PageNo,  keyword,  pricemin,   pricemax, sortbyprice,  sortbyuserrating,  sortbysaudarating,  type,  top, IsFilter,  IsExploreSearch)}');

    final response =  await _client.get(setEndPoint( catID, PageNo,  keyword,  pricemin,   pricemax, sortbyprice,  sortbyuserrating,  sortbysaudarating,  type,  top, IsFilter,  IsExploreSearch));

    Logger.appLogs('explorecallBackResponse:: $response');
    if (response != null) {
      //Success returning data back
      Logger.appLogs('responseRepo:: $response');
      return ExploreModel.fromJson(response as Map<String, dynamic>);
    } else {
      //Failed returning null
      Logger.appLogs('exploreerrorNull:: $response');
      return null;
    }
  }
  Future<ExplorePerformModel?> explporPerformeapi( ) async {
    final response = await _client.get("${EndPointConstants.exploreperforming}");

   // Logger.appLogs('exploreperformingcallBackResponse:: $response');
    if (response != null) {
      //Success returning data back
     // Logger.appLogs('responseRepo:: $response');
      return ExplorePerformModel.fromJson(response as Map<String, dynamic>);
    } else {
      //Failed returning null
     // Logger.appLogs('exploreperformingerrorNull:: $response');
      return null;
    }
  }

  Future<PerformDetailModel?> performdetaileapi( String browseID) async {
    final response = await _client.get("${EndPointConstants.performdetail}${browseID}");

    Logger.appLogs('performdetailcallBackResponse:: $response');
    if (response != null) {
      //Success returning data back
      Logger.appLogs('responseRepo:: $response');
      return PerformDetailModel.fromJson(response as Map<String, dynamic>);
    } else {
      //Failed returning null
      Logger.appLogs('performdetailerrorNull:: $response');
      return null;
    }
  }


  Future<viewAllModel?> viewAllapi( String title,String pageNo) async {
    final response = await _client.get("${EndPointConstants.viewallapi}${title}?page=$pageNo");

    Logger.appLogs('viewallapicallBackResponse:: $response');
    if (response != null) {
      //Success returning data back
      Logger.appLogs('responseRepo:: $response');
      return viewAllModel.fromJson(response as Map<String, dynamic>);
    } else {
      //Failed returning null
      Logger.appLogs('viewallapierrorNull:: $response');
      return null;
    }
  }

   setEndPoint(String catID,String PageNo, String? keyword, String pricemin,  String? pricemax,String? sortbyprice, String? sortbyuserrating, String? sortbysaudarating, String? type, String? top,bool IsFilter, bool IsExploreSearch) {
if(IsFilter){
  return "${EndPointConstants.explore}${catID}?page=$PageNo&keywords=$keyword&price_min=$pricemin&price_max=$pricemax&sortby_price=$sortbyprice&sortby_user_rating=$sortbyuserrating&sortby_sauda_rating=$sortbysaudarating&type=$type&top=$top";
}else if(IsExploreSearch){
 return "${EndPointConstants.explore}${catID}?page=$PageNo&keywords=$keyword";
}else{
  return  "${EndPointConstants.explore}${catID}?page=$PageNo";
}

  }


}