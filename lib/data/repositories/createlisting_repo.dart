

import 'dart:io';
import 'package:base_flutter_provider_project/data/models/DealerModels/MyListingModel.dart';
import 'package:base_flutter_provider_project/data/repositories/register_repo.dart';
import 'package:dio/dio.dart';
import '../../constants/end_points_constants.dart';
import '../../services/dio_client.dart';
import '../../utils/logger.dart';
import '../models/StatusandMessageModel.dart';


class CreateListRepository {
  final ApiClient _client = ApiClient();



  Future<StatusandMessageModel?> createlistapi(Map<String, dynamic> createlistparams, File? stockimg,File? panimg,File? aadharimg,File? clientmasterimg,File? cancldchqimg,File? dematimg,) async {

    Map<String, dynamic> formData = createlistparams;
    File? StockPic = stockimg;


    int targetSizeInBytes = 2 * 1024 * 1024; // 2 MB

    if(StockPic != null){
      File compressedProfilePic = await compressImage(StockPic, targetSizeInBytes);

      formData['logo'] = await MultipartFile.fromFile(compressedProfilePic.path, filename: 'logo.jpg');
    }
    if(panimg != null){
      File compressedProfilePic4 = await compressImage(panimg, targetSizeInBytes);
      formData['pan_card'] = await MultipartFile.fromFile(compressedProfilePic4.path, filename: 'pan_card.jpg');
    }
    if(aadharimg != null){
      File compressedProfilePic5 = await compressImage(aadharimg, targetSizeInBytes);
      formData['adhar_card'] = await MultipartFile.fromFile(compressedProfilePic5.path, filename: 'adhar_card.jpg');
    }

    if(clientmasterimg != null){
      File compressedProfilePic4 = await compressImage(clientmasterimg, targetSizeInBytes);
      formData['client_master_list'] = await MultipartFile.fromFile(compressedProfilePic4.path, filename: 'client_master_list.jpg');
    }
    if(cancldchqimg != null){
      File compressedProfilePic5 = await compressImage(cancldchqimg, targetSizeInBytes);
      formData['cancelled_cheque'] = await MultipartFile.fromFile(compressedProfilePic5.path, filename: 'cancelled_cheque.jpg');
    }
    if(dematimg != null){
      File compressedProfilePic5 = await compressImage(dematimg, targetSizeInBytes);
      formData['demat_statement'] = await MultipartFile.fromFile(compressedProfilePic5.path, filename: 'demat_statement.jpg');
    }


    FormData multipartFormData = FormData.fromMap(formData);
    final response = await _client.post(EndPointConstants.creatlisting,body: multipartFormData);

    Logger.appLogs('creatlistingResponse:: $response');
    if (response != null) {
      //Success returning data back
      Logger.appLogs('creatlistingRepo:: $response');
      return StatusandMessageModel.fromJson(response as Map<String, dynamic>);
    } else {
      //Failed returning null
      Logger.appLogs('creatlistingerrorNull:: $response');
      return null;
    }


  }

  Future<MyListingModel?> MyListingapi() async {
    final response = await _client.get("${EndPointConstants.mylistings}");

    Logger.appLogs('mylistingscallBackResponse:: $response');
    if (response != null) {
      //Success returning data back
      Logger.appLogs('responseRepo:: $response');
      return MyListingModel.fromJson(response as Map<String, dynamic>);
    } else {
      //Failed returning null
      Logger.appLogs('mylistingserrorNull:: $response');
      return null;
    }
  }

}