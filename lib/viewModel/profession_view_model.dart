

import 'package:base_flutter_provider_project/data/models/LocationsModel/CityModel.dart';
import 'package:base_flutter_provider_project/data/models/LocationsModel/ProfessionModel.dart';
import 'package:base_flutter_provider_project/data/models/LocationsModel/StateModel.dart';
import 'package:base_flutter_provider_project/data/repositories/profession_repo.dart';

import '../config/locator.dart';
import '../constants/strings.dart';
import '../utils/common_functions.dart';
import '../utils/generic_exception.dart';
import '../utils/logger.dart';
import 'base_view_model/base_view_model.dart';

class ProfessionViewModel extends BaseViewModel {
  //Repository
  final ProfessionRepository _professionRepository = locator<ProfessionRepository>();

  //Model
  ProfessionModel? _professionResponseModel;
 String? newCityId = "";
  StateModel? _stateResponseModel;
  CityModel? _cityResponseModel;

  ProfessionModel? get professionResponseModel => _professionResponseModel;
  StateModel? get stateResponseModel => _stateResponseModel;
  CityModel? get cityResponseModel => _cityResponseModel;
  String? get NewCityId => newCityId;
   List<Professions> ProfessionList = [];
   List<Professions> FilterProfessionList = [];
   List<Agegroup> AgeGroupList = [];
   List<String> filterCity = [];
   List<Statee> StateList = [];
  List<Cities> CityList = [];

  Professions? _userprofession;
  Professions? _userprofessionExFilter;
  Statee? _userStateExFilter;
  Cities? _userCityExFilter;
  String? _userMinPriceExFilter;
  String? _userMaxPriceExFilter;
  String? _userRatingExFilter;
  String? _saudaRatingExFilter;
  String? _sortbypriceExFilter;
  Professions? _userprofessionTS;
  Agegroup? _userAgegroup;
  String? _filtercity;
  Cities? _usercity ;
   Statee? _userState ;
  Professions? get UserProfession => _userprofession;
  Professions? get UserProfessionExpFilter => _userprofessionExFilter;
  Statee? get UserStateExpFilter => _userStateExFilter;
  Cities? get UserCityExpFilter => _userCityExFilter;
  String? get UserMinPriceExpFilter => _userMinPriceExFilter;
  String? get UserMaxPriceExpFilter => _userMaxPriceExFilter;
  String? get UserRatingExpFilter => _userRatingExFilter;
  String? get SaudaRatingExpFilter => _saudaRatingExFilter;
  String? get SortByPriceExpFilter => _sortbypriceExFilter;
  Professions? get UserProfessionTS => _userprofessionTS;
  Agegroup? get UserAgeGroup => _userAgegroup;
  String? get FilterCity => _filtercity;
  Cities? get UserCity => _usercity;
  Statee? get UserState => _userState;

  void setUserProfession(Professions? value) {
    _userprofession = value;
    notifyListeners();
  }
  void setUserProfessionExFilter(Professions? value) {
    _userprofessionExFilter = value;
    notifyListeners();
  }
  void setUserStateExFilter(Statee? value) {
    _userStateExFilter = value;
    notifyListeners();
  }
  void setUserCityExFilter(Cities? value) {
    _userCityExFilter = value;
    notifyListeners();
  }
  void setUserMinPriceExFilter(String? value) {
    _userMinPriceExFilter = value;
    notifyListeners();
  }
  void setUserMaxPriceExFilter(String? value) {
    _userMaxPriceExFilter = value;
    notifyListeners();
  }
  void setUserRatingExFilter(String? value) {
    _userRatingExFilter = value;
    notifyListeners();
  }
  void setSaudaRatingExFilter(String? value) {
    _saudaRatingExFilter = value;
    notifyListeners();
  }
  void setSortByPriceExFilter(String? value) {
    _sortbypriceExFilter = value;
    notifyListeners();
  }
  void setUserProfessionTS(Professions? value) {
    _userprofessionTS = value;
    notifyListeners();
  }
  void setUserAgeGroup(Agegroup? value) {
    _userAgegroup = value;
    notifyListeners();
  }
  void setFilterCity(String? value) {
    _filtercity = value;
    notifyListeners();
  }
  void setUserCity(Cities? value) {
    _usercity = value;
    notifyListeners();
  }
  void setNewCityId(String value) {
    newCityId = value;
    notifyListeners();
  }
  void setUserState(Statee? value) {
    _userState = value;
    notifyListeners();
  }

  Future<ProfessionModel?> professionapi({

    required Function(String) onFailureRes,
    required Function(ProfessionModel?) onSuccessRes,

  }) async {
    //Loader State
    setState(ViewState.busy);

    try {
      var data = await _professionRepository.professionapi();
      if (data != null) {
        _professionResponseModel = data;
        //Success State
        ProfessionList.clear();
        AgeGroupList.clear();
        filterCity.clear();
        FilterProfessionList.clear();
        print('city length ${_professionResponseModel?.city?.length}');
        if(_professionResponseModel?.agegroup != null && _professionResponseModel?.city !=null){

          for (Agegroup agelist in _professionResponseModel?.agegroup ?? []) {
            AgeGroupList.add(agelist);
          }
          for (String filtercitylist in _professionResponseModel?.city ?? []) {
            filterCity.add(filtercitylist);
          }
          filterCity.insert(0, "");
        }

        if(_professionResponseModel?.professions != null){
          for (Professions proflist in _professionResponseModel?.professions ?? []) {
            ProfessionList.add(proflist);
            FilterProfessionList.add(proflist);

          }
          ProfessionList.insert(0, Professions(
            updatedAt: "",
            id: 0,
            name: "Enter Profession"
          ));
          print('prof vm ${ProfessionList.length}');
        }

    //    print('Professional list ${ProfessionList.length} and ${ProfessionList[0]}');
        onSuccessRes(_professionResponseModel);
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


  Future<StateModel?> stateapi({

    required Function(String) onFailureRes,
    required Function(StateModel?) onSuccessRes,

  }) async {
    //Loader State
    setState(ViewState.busy);

    try {
      var data = await _professionRepository.stateapi();
      if (data != null) {
        _stateResponseModel = data;
        StateList.clear();
        //Success State
        if(_stateResponseModel?.state != null){
          for (Statee statelist in _stateResponseModel?.state ?? []) {
            StateList.add(statelist);
        }
          StateList.insert(0, Statee(
              updatedAt: "",
              id: 0,
              name: "Enter State"
          ));
          CityList.clear();
          CityList.insert(0, Cities(
              updatedAt: "",
              id: 0,
              name: "Enter City"
          ));
        }
      //  print('State list ${StateList.length} and ${StateList[0]}');
        onSuccessRes(_stateResponseModel);
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


  Future<CityModel?> cityapi({

    required Function(String) onFailureRes,
     required Function(StateModel?) onSuccessRes,
    required String cityid
  }) async {
    //Loader State
    setState(ViewState.busy);

    try {
      var data = await _professionRepository.cityapi(cityid);
      if (data != null) {
        _cityResponseModel = data;
        CityList.clear();
        //Success State
        if(_cityResponseModel?.cities != null){
          for (Cities citylist in _cityResponseModel?.cities ?? []) {
            CityList.add(citylist);
          }

          CityList.insert(0, Cities(
              updatedAt: "",
              id: 0,
              name: "Enter City"
          ));
        }
          print('City listkkk ${CityList.length} and ${CityList[0].name}');
           onSuccessRes(_stateResponseModel);
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