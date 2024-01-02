

import 'package:base_flutter_provider_project/data/models/LoginModel/LoginModel.dart';
import 'package:base_flutter_provider_project/data/models/dashboard_model/DashBoardFilterModel.dart';
import 'package:base_flutter_provider_project/data/models/dashboard_model/DashboardResponseModel.dart';
import 'package:base_flutter_provider_project/data/repositories/Dashboard_repo.dart';

import '../config/locator.dart';
import '../constants/strings.dart';
import '../data/models/AdvisorModels/ConsultationListModel.dart';
import '../data/repositories/login_repo.dart';
import '../utils/common_functions.dart';
import '../utils/generic_exception.dart';
import '../utils/logger.dart';
import 'base_view_model/base_view_model.dart';

class DashboardViewModel extends BaseViewModel {
  //Repository
  final DashboardRepository _dashboardRepository = locator<DashboardRepository>();

  //Model
  DashboardResponseModel? _dashboardResponseModel;
  DashBoardFilterModel? _dashboardFilterResponseModel;
  DashBoardFilterModel? _dashboardFilterResponseModel2;

  DashboardResponseModel? get dashboardResponseModel => _dashboardResponseModel;
  DashBoardFilterModel? get dashboardFilterResponseModel => _dashboardFilterResponseModel;
  DashBoardFilterModel? get dashboardFilterResponseModel2 => _dashboardFilterResponseModel2;

  final  List<Category> catList = [];
  final  List<String> catListName = [];
 final List<String?> serviceyears = [];
  Future<DashboardResponseModel?> dashboardapi({

    required Function(String) onFailureRes,
    required Function(DashboardResponseModel?) onSuccessRes,

  }) async {
    //Loader State
    setState(ViewState.busy);

    try {
      var data = await _dashboardRepository.dashboardapi();
      if (data != null) {
        _dashboardResponseModel = data;
        //Success State
      //  print('_dashboardViewModel Top Broker ${dashboardResponseModel?.data?.featuredBrokers?[0].user?.userMetaData?.length}');
        serviceyears.clear();
       // print('load service year1 ${_dashboardResponseModel?.data?.featuredBrokers?.length}');

        for(FeaturedBroker item in _dashboardResponseModel?.data?.featuredBrokers ?? []) {
          for(UserMetaData usermeta in item.user?.userMetaData ?? []){

            if(usermeta.key == "service_year"){

              serviceyears.add(usermeta.value);
              //print('load service year2 ${serviceyears.length}');
            }

          }
        }

        onSuccessRes(_dashboardResponseModel);
        addCaatList(_dashboardResponseModel);
        setState(ViewState.success);
      }else{
        //Failed
        onFailureRes(Strings.somethingWentWrong);
        //Failure State
        setState(ViewState.idle);
      }
    } on AppException catch (appException) {
      Logger.appLogs('errorType:: ${appException.type}');
      Logger.appLogs('onFailure:: $appException');
      //Common Error Handler
      errorMsg = errorHandler(appException);
      //Failed
      onFailureRes(errorMsg);
      //Idle / Failure State
      setState(ViewState.idle);
    }
    return null;
  }


  Future<DashBoardFilterModel?> dashboardfilterapi({

    required Function(String) onFailureRes,
    required Function(DashBoardFilterModel?) onSuccessRes,
    required Map<String, dynamic> filterparams

  }) async {
    //Loader State
    setState(ViewState.busy);

    try {
      var data = await _dashboardRepository.dashboardfilterapi(filterparams);
      if (data != null) {
        _dashboardFilterResponseModel = data;
        //Success State
       // print(' _dashboardViewModel Top Broker ${dashboardResponseModel?.data?.featuredBrokers}');
        onSuccessRes(_dashboardFilterResponseModel);
        setState(ViewState.success);
      }else{
        //Failed
        onFailureRes(Strings.somethingWentWrong);
        //Failure State
        setState(ViewState.idle);
      }
    } on AppException catch (appException) {
      Logger.appLogs('errorType:: ${appException.type}');
      Logger.appLogs('onFailure:: $appException');
      //Common Error Handler
      errorMsg = errorHandler(appException);
      //Failed
      onFailureRes(errorMsg);
      //Idle / Failure State
      setState(ViewState.idle);
    }
    return null;
  }


  Future<DashBoardFilterModel?> dashboardfilterapi2({

    required Function(String) onFailureRes,
    required Function(DashBoardFilterModel?) onSuccessRes,
    required Map<String, dynamic> filterparams

  }) async {
    //Loader State
    setState(ViewState.busy);

    try {
      var data = await _dashboardRepository.dashboardfilterapi2(filterparams);
      print('trend filter vm ${data?.data?.length}');
      if (data != null) {
        _dashboardFilterResponseModel2 = data;
        //Success State
         print('_dashboardViewModel trend filter vm ${_dashboardFilterResponseModel2?.data?.length}');
         print('trend filter vm ${data.data?.length}');
        onSuccessRes(_dashboardFilterResponseModel2);
        setState(ViewState.success);
      }else{
        //Failed
        onFailureRes(Strings.somethingWentWrong);
        //Failure State
        setState(ViewState.idle);
      }
    } on AppException catch (appException) {
      Logger.appLogs('errorType:: ${appException.type}');
      Logger.appLogs('onFailure:: $appException');
      //Common Error Handler
      errorMsg = errorHandler(appException);
      //Failed
      onFailureRes(errorMsg);
      //Idle / Failure State
      setState(ViewState.idle);
    }
    return null;
  }


  void addCaatList(DashboardResponseModel? dashboardResponseModel) {
    catList.clear();
    catListName.clear();
    if(dashboardResponseModel?.data?.category != null){
      catList.addAll(dashboardResponseModel?.data?.category ?? []);

      for(var i=0; i<catList.length; i++){
        catListName.add(catList[i].categoryName ?? "");
      }

    }
  }
}