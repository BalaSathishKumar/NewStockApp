
import '../config/locator.dart';
import '../constants/strings.dart';
import '../data/models/dashboard_model/ProfileResponseModel.dart';
import '../data/repositories/profile_repo.dart';
import '../utils/SharedHelper/PreferenceHelper.dart';
import '../utils/SharedHelper/Preference_Constant.dart';
import '../utils/common_functions.dart';
import '../utils/generic_exception.dart';
import '../utils/logger.dart';
import 'base_view_model/base_view_model.dart';

class ProfileViewModel extends BaseViewModel {
  //Repository
  final ProfileRepository _profileRepository = locator<ProfileRepository>();

  //Model
  ProfileResponseModel? _profileResponseModel;

  ProfileResponseModel? get profileResponseModel => _profileResponseModel;

  Future<ProfileResponseModel?> profileapi({

    required Function(String) onFailureRes,
    required Function(ProfileResponseModel?) onSuccessRes,

  }) async {
    //Loader State
    setState(ViewState.busy);

    try {
      var data = await _profileRepository.profileapi();
      if (data != null) {
        _profileResponseModel = data;
        print('id proof in viewmodel ${_profileResponseModel?.user?.idProof?.length}');
        print('id proof in viewmodel data  ${data.user?.idProof?.length}');
        PreferenceHelper.setString( PrefConstant.appUserId,_profileResponseModel?.user?.id.toString()?? "");
        PreferenceHelper.setString(PrefConstant.rollname,_profileResponseModel?.user?.roleName ?? "");
        String profileID = "";
        getvalue(profileID,PrefConstant.appUserId);
        onSuccessRes(_profileResponseModel);

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

  void clearData() {
    _profileResponseModel = null;
    notifyListeners();
  }


  void getvalue(String profileID, String appUserId) async{
    String stringValue = await getPrefValues(profileID,PrefConstant.appUserId);
    print('ProfileID ${stringValue}');
  }
}