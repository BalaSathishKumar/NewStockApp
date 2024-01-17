
import 'package:base_flutter_provider_project/data/models/Explore_model/PerformDetailModel.dart';

import '../config/locator.dart';
import '../constants/strings.dart';
import '../data/models/Explore_model/ExploreModel.dart';
import '../data/models/Explore_model/ExplorePerformModel.dart';

import '../data/models/Explore_model/viewAllModel.dart';
import '../data/repositories/explore_repo.dart';

import '../utils/common_functions.dart';
import '../utils/generic_exception.dart';
import '../utils/logger.dart';
import 'base_view_model/base_view_model.dart';

class ExploreViewModel extends BaseViewModel {
  //Repository
  final ExploreRepository _exploreRepository = locator<ExploreRepository>();

  //Model
  ExploreModel? _exploreModel;
  viewAllModel? _viewallModel;
  PerformDetailModel? _PFDexploreModel;
  ExplorePerformModel? _explorePerformModel;
 // Set<String> uniqueItems = Set<String>();
   List<Stocks> ExploreStocksVM = [];
   List<Stocks>? ViewallStock = [];
  var set = Set<Stocks>();
  ExploreModel? get exploreModel => _exploreModel;
  viewAllModel? get ViewAllModel => _viewallModel;
  PerformDetailModel? get PFDexploreModel => _PFDexploreModel;
  ExplorePerformModel? get explorePerformModel => _explorePerformModel;

  Future<ExploreModel?> exploreapi({

    required Function(String) onFailureRes,
    required Function(ExploreModel?) onSuccessRes,
    required String catID,
    required String PageNo,
    String? keyword,
    bool? isExploreSearch,
    String? pricemin,
    String? pricemax,
    String? sortbyprice,
    String? sortbyuserrating,
    String? sortbysaudarating,
    String? type,
    String? top,
    bool? isFilter,
    bool? iSsearchclick,
  }) async {
    //Loader State
    print('page no::: ${PageNo}');
    if(PageNo == "1")setState(ViewState.busy);

    try {
      var data = await _exploreRepository.explporeapi(catID,PageNo,keyword ?? "",pricemin ?? "",pricemax ?? "",sortbyprice ?? "",sortbyuserrating ?? "",sortbysaudarating ?? "",type??"",top ?? "",isFilter ?? false,iSsearchclick ?? false);
      if (data != null) {
        _exploreModel = data;
        print('current page:: ${_exploreModel?.data?.pageing?.currentPage} and last page :: ${_exploreModel?.data?.pageing?.lastPage}');
        //Success State


        if(ExploreStocksVM != null && ExploreStocksVM!.isNotEmpty){
          var expdata =  _exploreModel?.data?.stocks;
          if( expdata != null && expdata.isNotEmpty){
            if(ExploreStocksVM?[0].categoryId ==  _exploreModel?.data?.stocks?[0].categoryId){

              if(isExploreSearch != null && isExploreSearch || isFilter !=null && isFilter){
                ExploreStocksVM?.clear();
                for(Stocks explorestocks in _exploreModel?.data?.stocks ?? []) {
                  if(explorestocks != null){
                    ExploreStocksVM?.add(explorestocks);
                  }
                }
              }else {
                for (Stocks explorestocks in _exploreModel?.data?.stocks ?? []) {
                  if (explorestocks != null) {
                  //  print('explorestocks in vm ${explorestocks.name}');
                    // Check if the ExploreStocksVM already contains an item with the same id
                    bool? isDuplicate = ExploreStocksVM?.any((item) => item.id == explorestocks.id) ?? false;
                    if (!isDuplicate) {
                      // If it's not a duplicate, add it to ExploreStocksVM
                      ExploreStocksVM?.add(explorestocks);
                    }
                  }
                }
              }

            }
            else{
              ExploreStocksVM?.clear();
              for(Stocks explorestocks in _exploreModel?.data?.stocks ?? []) {
                if(explorestocks != null){
                  ExploreStocksVM?.add(explorestocks);
                }
              }
            }
          }else {

            ExploreStocksVM?.clear();
            for(Stocks explorestocks in _exploreModel?.data?.stocks ?? []) {
              if(explorestocks != null){
                ExploreStocksVM?.add(explorestocks);
              }
            }
          }


        }else{
           ExploreStocksVM?.clear();
          for(Stocks explorestocks in _exploreModel?.data?.stocks ?? []) {
            if(explorestocks != null){
              ExploreStocksVM?.add(explorestocks);
            }
          }

        }

   /*     for(Stocks explorestocks in _exploreModel?.data?.stocks ?? []) {
          if(explorestocks != null){
            ExploreStocksVM?.add(explorestocks);
          }
        }*/


        print('_exploreModel in vm ${_exploreModel?.data?.stocks?.length}');
        print('_exploreModel in vm2 ${data.data?.stocks?.length}');
        onSuccessRes(_exploreModel);
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

  Future<ExploreModel?> viewallapi({

    required Function(String) onFailureRes,
    required Function(viewAllModel?) onSuccessRes,
    required String title,
    required String pageNo
  }) async {
    //Loader State
    setState(ViewState.busy);

    try {
      var data = await _exploreRepository.viewAllapi(title,pageNo);
      if (data != null) {
        _viewallModel = data;
      //  ViewallStock?.clear();
        for (VAStocks viewallstocks in _viewallModel?.data?.stocks ?? []) {
          var viewallStock = viewallstocks.stock;
          if( viewallStock != null){
            ViewallStock?.add(viewallStock);
          }
          print('ViewallStock.length ${ViewallStock?.length}');
        }

        //Success State
        onSuccessRes(_viewallModel);
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



/*

  Future<ExplorePerformModel?> explorePerformapi({

    required Function(String) onFailureRes,
    required Function(ExplorePerformModel?) onSuccessRes,

  }) async {
    //Loader State
    setState(ViewState.busy);

    try {
      var data = await _exploreRepository.explporPerformeapi();
      if (data != null) {
        _explorePerformModel = data;
        //Success State
        onSuccessRes(_explorePerformModel);
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


  Future<PerformDetailModel?> performdetailapi({

    required Function(String) onFailureRes,
    required Function(PerformDetailModel?) onSuccessRes,
    required String BrowseID
  }) async {
    //Loader State
    setState(ViewState.busy);

    try {
      var data = await _exploreRepository.performdetaileapi(BrowseID);
      if (data != null) {
        _PFDexploreModel = data;

        //Success State
        onSuccessRes(_PFDexploreModel);
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
*/



}