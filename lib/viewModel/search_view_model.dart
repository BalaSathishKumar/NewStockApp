

import '../config/locator.dart';
import '../constants/strings.dart';
import '../data/models/Explore_model/ExploreModel.dart';
import '../data/models/SearchModel/SearchModel.dart';

import '../data/repositories/search_repo.dart';

import '../utils/common_functions.dart';
import '../utils/generic_exception.dart';
import '../utils/logger.dart';
import 'base_view_model/base_view_model.dart';

class SearchViewModel extends BaseViewModel {
  //Repository
  final SearchRepository _searchRepository = locator<SearchRepository>();

  //Model
  SearchModel? _SearchModel;
  List<Stocks> VMfilteredItems = [];
  SearchModel? get searchModel => _SearchModel;

  Future<SearchModel?> searchapi({

    required Function(String) onFailureRes,
    required Function(List<Stocks>?) onSuccessRes,
    required String searchparams
  }) async {
    //Loader State
    setState(ViewState.busy);

    try {
      var data = await _searchRepository.searchapi(searchparams);
      if (data != null) {
        _SearchModel = data;

        onSuccessRes(_SearchModel?.stocks);
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
}