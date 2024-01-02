import 'package:base_flutter_provider_project/data/models/home_model/FAQmodel.dart';
import 'package:base_flutter_provider_project/data/repositories/faqunlisted_repo.dart';
import '../../config/locator.dart';
import '../../constants/strings.dart';
import '../../utils/common_functions.dart';
import '../../utils/generic_exception.dart';
import '../../utils/logger.dart';
import 'base_view_model.dart';



class FAQunlistedViewModel extends BaseViewModel {
  //Repository
  final FAQunlistedRepository _faqunlistedRepository = locator<FAQunlistedRepository>();

  //Model

  FaQmodel? _faqUnlistedModel;
  FaQmodel? get FaQunlistedModel => _faqUnlistedModel;


  Future<FaQmodel?> FaQunlistedapi({

    required Function(String) onFailureRes,
    required Function(FaQmodel?) onSuccessRes,

  }) async {
    //Loader State
    setState(ViewState.busy);

    try {
      var data = await _faqunlistedRepository.FAQapi();
      if (data != null) {
        _faqUnlistedModel = data;
        onSuccessRes(_faqUnlistedModel);
        //Success State
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