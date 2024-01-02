import 'dart:io';
import 'dart:math';
import 'package:base_flutter_provider_project/data/models/dashboard_model/RewardResponseModel.dart';
import 'package:base_flutter_provider_project/utils/common_functions.dart';
import 'package:base_flutter_provider_project/viewModel/Reward_view_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:provider/provider.dart';
import 'package:path_provider/path_provider.dart';
import '../../common_widgets/Listtile_widgets/RedeemRewardListTile.dart';
import '../../common_widgets/appbar_widgets/common_appbar.dart';
import '../../constants/colors.dart';
import '../../data/models/dashboard_model/RedeemRewardModel.dart';
import '../home/homepage.dart';
import 'package:http/http.dart' as http;

class RedeemRewardPage extends StatefulWidget {
  const RedeemRewardPage({Key? key}) : super(key: key);

  @override
  State<RedeemRewardPage> createState() => _RedeemRewardPageState();
}

class _RedeemRewardPageState extends State<RedeemRewardPage> {

  final imgUrl = "https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf";
 // static const imgUrl = 'https://dosomthings.com/wp-content/uploads/2023/07/How-to-download-and-save-image-to-file-in-FlutterDosomthings.com_-1024x576.png';
  var random = Random();
  var dio = Dio();
  String temp_Path = "";
  String appPath = "";
  Future download2(Dio dio, String url, String savePath) async {
    try {
      Response response = await dio.get(url,
        onReceiveProgress: showDownloadProgress,
        //Received data with List<int>
        options: Options(
            responseType: ResponseType.bytes,
            followRedirects: false,
            validateStatus: (status) {
              //if(status!= null)
              return status! < 500;
            }),
      );
      print(response.headers);
      File file = File(savePath);
      var raf = file.openSync(mode: FileMode.write);
      // response.data is List<int> type
      raf.writeFromSync(response.data);
      await raf.close();
    } catch (e) {
      print(e);
    }
  }

  void showDownloadProgress(received, total) {
    if (total != -1) {
      print((received / total * 100).toStringAsFixed(0) + "%");
    }
  }
  late RewardViewModel _rewardViewModel;
  @override
  void initState() {
    super.initState();
    _rewardViewModel = Provider.of<RewardViewModel>(context, listen: false);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _rewardViewModel.redeemrewardapi(onFailureRes: onFailureRes);
    });

  }


  @override
  Widget build(BuildContext context) {
    var deviceheight = MediaQuery.of(context).size.height;
    var devicewidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(height: 60.0, title: 'Redeem Rewards', appbarclr: Appcolors.white),
      body: Consumer<RewardViewModel>(
        builder:(context,reddemvm,child){
          print('reddemdata ${reddemvm.redeemrewardResponseModel?.data?.redeemRewards?.length}');
          var reddemdata = reddemvm.redeemrewardResponseModel?.data?.redeemRewards;
        return reddemdata != null && reddemdata.isEmpty ? Center(child: Text("No Rewards found"),):Container(
            height: deviceheight,
            width: devicewidth,
            child: ListView.builder(
                itemCount: reddemvm.redeemrewardResponseModel?.data?.redeemRewards?.length ?? 0,
                itemBuilder: (context, index) {
                  var reddemdata = reddemvm.redeemrewardResponseModel?.data?.redeemRewards;

                  return RedeemRewardListtile(
                     redeemStatus:  reddemdata?[index].redeemStatus ?? false,
                    onYesPressed: (){
                      Map<String, dynamic> redeemparam = {
                        "points": reddemdata?[index].points.toString() ?? "",
                        "reward_id": reddemdata?[index].id.toString() ?? ""
                      };
                      Navigator.pop(context);
                      _rewardViewModel.RedeemNowApi(onFailureRes: onFailureRes, redeemparam: redeemparam,onSuccess: onRedeemSuccessRes);
                    },
                    onPressed: (){
                      showToast("downloading..");
                      _saveImage(context,reddemvm.redeemrewardResponseModel?.data?.redeemRewards?[index].fileUrl ?? "",reddemvm.redeemrewardResponseModel?.data?.redeemRewards?[index].fileType ?? "");
                      },
                    title: reddemdata?[index].points.toString() ?? "",
                    subtitle: reddemdata?[index].title ?? "",
                    trailingImage: reddemdata?[index].fileUrl ?? "",
                    imgtag: "",
                  );
                }));}
      ),
    );
  }



  Future<void> _saveImage(BuildContext context, String imgUrl, String fileType) async {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
     String? message = "";
    var filename;
    try {
      // Download image
      final http.Response response = await http.get(
          Uri.parse(imgUrl));

      // Get temporary directory
      final dir = await getTemporaryDirectory();

      // Create an image name

      if(fileType == "jpg"){
        filename = '${dir.path}/SaveImage${random.nextInt(100)}.jpg';
      }else if(fileType == "jpeg") {
        filename = '${dir.path}/SaveImage${random.nextInt(100)}.jpeg';
      }else if(fileType == "png"){
        filename = '${dir.path}/SaveImage${random.nextInt(100)}.png';
      }else{
        filename = '${dir.path}/SaveImage${random.nextInt(100)}.pdf';
      }

      // Save to filesystem
      final file = File(filename);
      await file.writeAsBytes(response.bodyBytes);

      // Ask the user to save it
      final params = SaveFileDialogParams(sourceFilePath: file.path);
      final finalPath = await FlutterFileDialog.saveFile(params: params);

      if (finalPath != null) {
        message = 'saved to disk';
      }




 /*     Response response = await dio.get(imgUrl,
        onReceiveProgress: showDownloadProgress,
        //Received data with List<int>
        options: Options(
            responseType: ResponseType.bytes,
            followRedirects: false,
            validateStatus: (status) {
              //if(status!= null)
              return status! < 500;
            }),
      );
      print(response.headers);

      final dir = await getTemporaryDirectory();
      var filename = '${dir.path}/SaveImage${random.nextInt(100)}.png';


      final file = File(filename);
      await file.writeAsBytes(response.data);

      // Ask the user to save it
      final params = SaveFileDialogParams(sourceFilePath: file.path);
      final finalPath = await FlutterFileDialog.saveFile(params: params);

      if (finalPath != null) {
        message = 'Image saved to disk';
      }*/

    /*  var raf = file.openSync(mode: FileMode.write);
      // response.data is List<int> type
      raf.writeFromSync(response.data);
      await raf.close();*/


    } catch (e) {
      message = e.toString();
      scaffoldMessenger.showSnackBar(SnackBar(
        content: Text(
          message,
          style:  TextStyle(
            fontSize: 12,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Appcolors.splashbgcolor2,
      ));
    }

    if (message != null) {

      scaffoldMessenger.showSnackBar(SnackBar(
        content: Text(
          message,
          style:  TextStyle(
            fontSize: 12,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Appcolors.splashbgcolor2,
      ));

    }
  }



  onFailureRes(String p1) {
  }

  onRedeemSuccessRes(String message) {

    if(message != "Insufficients credits"){
      _rewardViewModel.redeemrewardapi(onFailureRes: onFailureRes);
      _rewardViewModel.rewardapi(onFailureRes: onFailureRes, onSuccessRes: onSuccessRes);
    }else{
      showToast("Insufficients credits");
    }

  }

  onSuccessRes(RewardResponseModel? p1) {
  }
}
