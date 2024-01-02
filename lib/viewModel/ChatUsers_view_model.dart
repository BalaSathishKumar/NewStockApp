
import '../config/locator.dart';
import '../constants/strings.dart';
import '../data/models/Chat_models/ChatRoom2Model.dart';
import '../data/models/Chat_models/ChatRoomModel.dart';
import '../data/models/StatusandMessageModel.dart';
import '../data/models/User_Directory_model/ChatUsersList.dart';
import '../data/repositories/chatroom_repo.dart';
import '../data/repositories/chatusers_repo.dart';
import '../utils/common_functions.dart';
import '../utils/generic_exception.dart';
import '../utils/logger.dart';
import 'base_view_model/base_view_model.dart';

class ChatUsersViewModel extends BaseViewModel {
  //Repository
  final ChatUsersRepository _chatusersRepository = locator<ChatUsersRepository>();

  //Model
  ChatUsersList? _getchatusersResponseModel;
  List<Users> AllMembersNew = [];

  ChatUsersList? get getchatusersResponseModel => _getchatusersResponseModel;
  List<Users> get AllMem => AllMembersNew;


  void setAllMenber(List<Users> value) {
    AllMembersNew = value;
    notifyListeners();
  }


  Future<ChatUsersList?> getchatusersapi({

    required Function(String) onFailureRes,
    required Function(ChatUsersList?) onSuccessRes,

  }) async {
    //Loader State
    setState(ViewState.busy);

    try {
      var data = await _chatusersRepository.getchatusersapi();
      if (data != null) {
        _getchatusersResponseModel = data;

        //Success State
        onSuccessRes(_getchatusersResponseModel);
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