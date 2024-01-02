
import 'package:base_flutter_provider_project/data/models/LoginModel/OnBoardScreenModel.dart';
import 'package:base_flutter_provider_project/data/repositories/onboard_repo.dart';
import '../config/locator.dart';
import '../constants/strings.dart';
import '../utils/common_functions.dart';
import '../utils/generic_exception.dart';
import '../utils/logger.dart';
import 'base_view_model/base_view_model.dart';

class OnboardViewModel extends BaseViewModel {
  //Repository
  final OnBoardRepository _onboardRepository = locator<OnBoardRepository>();

  //Model
  OnBoardScreenModel? _onboardResponseModel;

  OnBoardScreenModel? get OnboardResponseModel => _onboardResponseModel;

  int _currentPageIndex = 0;

  int get currentindex => _currentPageIndex;


  void setCurrentIndex(int value) {
    _currentPageIndex = value;
    notifyListeners();
  }
  Future<OnBoardScreenModel?> onboardapi({

    required Function(String) onFailureRes,
    required Function(List<NewSlider>?) onSuccessRes,

  }) async {
    //Loader State
    setState(ViewState.busy);

    try {
      var data = await _onboardRepository.onboardapi();
      if (data != null) {
        _onboardResponseModel = data;
        onSuccessRes(_onboardResponseModel?.slider);
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