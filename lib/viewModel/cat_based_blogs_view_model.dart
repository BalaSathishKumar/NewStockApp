import '../config/locator.dart';
import '../constants/strings.dart';
import '../data/models/Insights_model/CatBasedBlogsModel.dart';
import '../data/repositories/cat_based_blog_repo.dart';
import '../utils/common_functions.dart';
import '../utils/generic_exception.dart';
import '../utils/logger.dart';
import 'base_view_model/base_view_model.dart';

class CatBasedBlogsViewModel extends BaseViewModel {
  //Repository
  final CatBasedBlogsRepository _catbasedblogsRepository = locator<CatBasedBlogsRepository>();

  //Model
  CatBasedBlogsModel? _catbasedblogsResponseModel;


  CatBasedBlogsModel? get ctbasedblogsResponseModel => _catbasedblogsResponseModel;

  Future<CatBasedBlogsModel?> catbasedblogsapi({

    required Function(String) onFailureRes,
    required Function(CatBasedBlogsModel?) onSuccessRes,
    required int BlogCatId,

  }) async {
    //Loader State
    setState(ViewState.busy);

    try {
      var data = await _catbasedblogsRepository.catbasedblogapi(BlogCatId);
      if (data != null) {
        _catbasedblogsResponseModel = data;

        //Success State
        onSuccessRes(_catbasedblogsResponseModel);
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