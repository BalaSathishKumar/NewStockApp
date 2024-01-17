

import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image/image.dart' as img;
import '../../constants/end_points_constants.dart';
import '../../services/dio_client.dart';
import '../../utils/logger.dart';

import '../models/StatusandMessageModel.dart';
import '../models/register_model/RegisterModel.dart';

class RegisterRepository {
  final ApiClient _client = ApiClient();

  Future<RegisterModel?> registerapi(String name,String email,String role,String age,String profession,String city,String state,String about ,File propic, String referralcode, String fathername, String dob, String gender) async {

   // FormData formData = FormData();

    Map<String, dynamic> formData = {
      "name":name,
      "email":email,
      "role":role,
      "age":age,
      "profession":profession,
      "city":city,
      "state":state,
      "about":about,
      "referral_code":referralcode,
      "father_name":fathername,
      "date_of_birth":dob,
      "gender":gender,
    };

    File profilePicFile = propic; // Replace with your file path
   // File idProofFile = idproof; //

    int targetSizeInBytes = 2 * 1024 * 1024; // 2 MB
    File compressedProfilePic = await compressImage(profilePicFile, targetSizeInBytes);
   // File compressedIdProof = await compressImage(idProofFile, targetSizeInBytes);


     formData['photo'] = await MultipartFile.fromFile(compressedProfilePic.path, filename: 'photo.jpg');
  //   formData['id_proof'] =  await MultipartFile.fromFile(compressedIdProof.path, filename: 'id_proof.jpg');

    FormData multipartFormData = FormData.fromMap(formData);


    final response = await _client.post(EndPointConstants.register,body: multipartFormData);

    Logger.appLogs('registercallBackResponse:: $response');
    if (response != null) {
      //Success returning data back
      Logger.appLogs('registerresponseRepo:: $response');
      return RegisterModel.fromJson(response as Map<String, dynamic>);
    } else {
      //Failed returning null
      Logger.appLogs('regiatererrorNull:: $response');
      return null;
    }
  }



  Future<StatusandMessageModel?> profileupdateapi(String name,String email,String age,String profession,String city,String state,String about ,File? propic,  String fathername, String dob, String gender) async {

    Map<String, dynamic> formData = {
      "name":name,
      "email":email,
      "age":age,
      "profession":profession,
      "city":city,
      "state":state,
      "about":about,
      "father_name":fathername,
      "date_of_birth":dob,
      "gender":gender,
    };

    File? profilePicFile = propic; // Replace with your file path
    // File idProofFile = idproof; //


    if( profilePicFile != null){

      int targetSizeInBytes = 2 * 1024 * 1024; // 2 MB
      File compressedProfilePic = await compressImage(profilePicFile, targetSizeInBytes);
      // File compressedIdProof = await compressImage(idProofFile, targetSizeInBytes);


      formData['photo'] = await MultipartFile.fromFile(compressedProfilePic.path, filename: 'photo.jpg');
      //   formData['id_proof'] =  await MultipartFile.fromFile(compressedIdProof.path, filename: 'id_proof.jpg');

      FormData multipartFormData = FormData.fromMap(formData);


      final response = await _client.post(EndPointConstants.profileupdate,body: multipartFormData);

      Logger.appLogs('updatecallBackResponse:: $response');
      if (response != null) {
        //Success returning data back
        Logger.appLogs('updateresponseRepo:: $response');
        return StatusandMessageModel.fromJson(response as Map<String, dynamic>);
      } else {
        //Failed returning null
        Logger.appLogs('updateerrorNull:: $response');
        return null;
      }
    }else {


      final response = await _client.post(EndPointConstants.profileupdate,body: formData);

      Logger.appLogs('updatecallBackResponse:: $response');
      if (response != null) {
        //Success returning data back
        Logger.appLogs('updateresponseRepo:: $response');
        return StatusandMessageModel.fromJson(response as Map<String, dynamic>);
      } else {
        //Failed returning null
        Logger.appLogs('updateerrorNull:: $response');
        return null;
      }
    }


  }


  Future<RegisterModel?> KYCapi(File? propic,Map<String, dynamic> kycparams,File idproofpic,File pancard,File? cancelledcheque,File? dematdetails,) async {

    Map<String, dynamic> formData = kycparams;

    File? profilePicFile = propic;
    File idProofFile = idproofpic;
    File PanCard = pancard;
    File? CancelledChq = cancelledcheque;
    File? DematDetils = dematdetails;

    int targetSizeInBytes = 2 * 1024 * 1024; // 2 MB

    File compressedProfilePic2 = await compressImage(idProofFile, targetSizeInBytes);
    File compressedProfilePic3 = await compressImage(PanCard, targetSizeInBytes);

    formData['id_proof'] = await MultipartFile.fromFile(compressedProfilePic2.path, filename: 'id_proof.jpg');
    formData['pan_card'] = await MultipartFile.fromFile(compressedProfilePic3.path, filename: 'pan_card.jpg');

    if(profilePicFile != null){
      File compressedProfilePic = await compressImage(profilePicFile, targetSizeInBytes);
      formData['photo'] = await MultipartFile.fromFile(compressedProfilePic.path, filename: 'photo.jpg');
    }
    if(CancelledChq != null){
      File compressedProfilePic4 = await compressImage(CancelledChq, targetSizeInBytes);
      formData['cancelled_cheque'] = await MultipartFile.fromFile(compressedProfilePic4.path, filename: 'cancelled_cheque.jpg');
    }
    if(DematDetils != null){
      File compressedProfilePic5 = await compressImage(DematDetils, targetSizeInBytes);
      formData['client_master'] = await MultipartFile.fromFile(compressedProfilePic5.path, filename: 'client_master.jpg');
    }

   // File compressedIdProof = await compressImage(PanCard, targetSizeInBytes);
    //   formData['id_proof'] =  await MultipartFile.fromFile(compressedIdProof.path, filename: 'id_proof.jpg');

    FormData multipartFormData = FormData.fromMap(formData);


    final response = await _client.post(EndPointConstants.kyc,body: multipartFormData);

    Logger.appLogs('kyccallBackResponse:: $response');
    if (response != null) {
      //Success returning data back
      Logger.appLogs('kycresponseRepo:: $response');
      return RegisterModel.fromJson(response as Map<String, dynamic>);
    } else {
      //Failed returning null
      Logger.appLogs('kycerrorNull:: $response');
      return null;
    }
  }


  Future<RegisterModel?> KYCAdvisorapi(File? propic,Map<String, dynamic> kycparams,File? idproofpic,File? pancard,File? cancelledcheque,File? recognition, File? sebi, File? companyownership, File? dematdetails, bool isKycupdate,) async {

    Map<String, dynamic> formData = kycparams;

    File? profilePicFile = propic;
    File? idProofFile = idproofpic;
    File? PanCard = pancard;
    File? CancelledChq = cancelledcheque;
    File? Recognization = recognition;
    File? Sebi = sebi;
    File? Ownership = companyownership;
    File? DematDetails = dematdetails;

    int targetSizeInBytes = 2 * 1024 * 1024; // 2 MB


    if(profilePicFile != null){
      File compressedProfilePic = await compressImage(profilePicFile, targetSizeInBytes);
      formData['photo'] = await MultipartFile.fromFile(compressedProfilePic.path, filename: 'photo.jpg');
    }
    if(idProofFile != null){
   File compressedProfilePic2 = await compressImage(idProofFile, targetSizeInBytes);
   formData['id_proof'] = await MultipartFile.fromFile(compressedProfilePic2.path, filename: 'id_proof.jpg');
    }
    if(PanCard != null){
   File compressedProfilePic3 = await compressImage(PanCard, targetSizeInBytes);
   formData['pan_card'] = await MultipartFile.fromFile(compressedProfilePic3.path, filename: 'pan_card.jpg');
    }
    if(CancelledChq != null){
      File compressedProfilePic4 = await compressImage(CancelledChq, targetSizeInBytes);
      formData['cancelled_cheque'] = await MultipartFile.fromFile(compressedProfilePic4.path, filename: 'cancelled_cheque.jpg');
    }
    if(Recognization != null){
      File compressedProfilePic5 = await compressImage(Recognization, targetSizeInBytes);
      formData['recognitions_photo'] = await MultipartFile.fromFile(compressedProfilePic5.path, filename: 'recognitions_photo.jpg');
    }
    if(Sebi != null){
      File compressedProfilePic6 = await compressImage(Sebi, targetSizeInBytes);
      formData['sebi_registration_certificate'] = await MultipartFile.fromFile(compressedProfilePic6.path, filename: 'sebi_registration_certificate.jpg');
    }
    if(Ownership != null){
      File compressedProfilePic7 = await compressImage(Ownership, targetSizeInBytes);
      formData['company_proof'] = await MultipartFile.fromFile(compressedProfilePic7.path, filename: 'company_proof.jpg');
    }
    if(DematDetails != null){
      File compressedProfilePic8 = await compressImage(DematDetails, targetSizeInBytes);
      formData['client_master'] = await MultipartFile.fromFile(compressedProfilePic8.path, filename: 'company_proof.jpg');
    }

    // File compressedIdProof = await compressImage(PanCard, targetSizeInBytes);
    //   formData['id_proof'] =  await MultipartFile.fromFile(compressedIdProof.path, filename: 'id_proof.jpg');

    FormData multipartFormData = FormData.fromMap(formData);


    final response = await _client.post(EndPointConstants.kyc,body: multipartFormData);

    Logger.appLogs('kycAdvisorcallBackResponse:: $response');
    if (response != null) {
      //Success returning data back
      Logger.appLogs('kycAdvisorresponseRepo:: $response');
      return RegisterModel.fromJson(response as Map<String, dynamic>);
    } else {
      //Failed returning null
      Logger.appLogs('kycAdvisorerrorNull:: $response');
      return null;
    }
  }

  Future<StatusandMessageModel?> KYCUpdateapi(File? propic,Map<String, dynamic> kycparams,File? idproofpic,File? pancard,File? cancelledcheque,File? recognition, File? sebi, File? companyownership, File? dematdetails, bool isKycupdate,) async {

    Map<String, dynamic> formData = kycparams;

    File? profilePicFile = propic;
    File? idProofFile = idproofpic;
    File? PanCard = pancard;
    File? CancelledChq = cancelledcheque;
    File? Recognization = recognition;
    File? Sebi = sebi;
    File? Ownership = companyownership;
    File? DematDetails = dematdetails;

    int targetSizeInBytes = 2 * 1024 * 1024; // 2 MB


    if(profilePicFile != null){
      File compressedProfilePic = await compressImage(profilePicFile, targetSizeInBytes);
      formData['photo'] = await MultipartFile.fromFile(compressedProfilePic.path, filename: 'photo.jpg');
    }
    if(idProofFile != null){
   File compressedProfilePic2 = await compressImage(idProofFile, targetSizeInBytes);
   formData['id_proof'] = await MultipartFile.fromFile(compressedProfilePic2.path, filename: 'id_proof.jpg');
    }
    if(PanCard != null){
   File compressedProfilePic3 = await compressImage(PanCard, targetSizeInBytes);
   formData['pan_card'] = await MultipartFile.fromFile(compressedProfilePic3.path, filename: 'pan_card.jpg');
    }
    if(CancelledChq != null){
      File compressedProfilePic4 = await compressImage(CancelledChq, targetSizeInBytes);
      formData['cancelled_cheque'] = await MultipartFile.fromFile(compressedProfilePic4.path, filename: 'cancelled_cheque.jpg');
    }
    if(Recognization != null){
      File compressedProfilePic5 = await compressImage(Recognization, targetSizeInBytes);
      formData['recognitions_photo'] = await MultipartFile.fromFile(compressedProfilePic5.path, filename: 'recognitions_photo.jpg');
    }
    if(Sebi != null){
      File compressedProfilePic6 = await compressImage(Sebi, targetSizeInBytes);
      formData['sebi_registration_certificate'] = await MultipartFile.fromFile(compressedProfilePic6.path, filename: 'sebi_registration_certificate.jpg');
    }
    if(Ownership != null){
      File compressedProfilePic7 = await compressImage(Ownership, targetSizeInBytes);
      formData['company_proof'] = await MultipartFile.fromFile(compressedProfilePic7.path, filename: 'company_proof.jpg');
    }
    if(DematDetails != null){
      File compressedProfilePic8 = await compressImage(DematDetails, targetSizeInBytes);
      formData['client_master'] = await MultipartFile.fromFile(compressedProfilePic8.path, filename: 'company_proof.jpg');
    }

    // File compressedIdProof = await compressImage(PanCard, targetSizeInBytes);
    //   formData['id_proof'] =  await MultipartFile.fromFile(compressedIdProof.path, filename: 'id_proof.jpg');

    FormData multipartFormData = FormData.fromMap(formData);


    final response = await _client.post(EndPointConstants.kycupdate,body: multipartFormData);

    Logger.appLogs('kycAdvisorcallBackResponse:: $response');
    if (response != null) {
      //Success returning data back
      Logger.appLogs('kycAdvisorresponseRepo:: $response');
      return StatusandMessageModel.fromJson(response as Map<String, dynamic>);
    } else {
      //Failed returning null
      Logger.appLogs('kycAdvisorerrorNull:: $response');
      return null;
    }
  }



}
Future<File> compressImage(File imageFile, int targetSizeInBytes) async {
  final int quality = 90; // Adjust compression quality as needed (0-100)
  final int maxIterations = 10; // Maximum iterations to achieve target size

  File compressedFile = imageFile;
  int iteration = 0;

  while (compressedFile.lengthSync() > targetSizeInBytes && iteration < maxIterations) {
    final List<int> compressed = await FlutterImageCompress.compressWithList(
      imageFile.readAsBytesSync(),
      minHeight: 1920, // Adjust minHeight and minWidth as needed
      minWidth: 1080,
      quality: quality,
    );

    compressedFile = File(imageFile.path)
      ..writeAsBytesSync(compressed, flush: true);

    iteration++;
  }

  return compressedFile;
}