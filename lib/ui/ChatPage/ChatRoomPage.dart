import 'dart:async';

import 'package:base_flutter_provider_project/data/models/Chat_models/ClearChatModel.dart';
import 'package:base_flutter_provider_project/data/models/Chat_models/GetAdminMessageModel.dart';
import 'package:base_flutter_provider_project/data/models/StatusandMessageModel.dart';
import 'package:base_flutter_provider_project/viewModel/base_view_model/base_view_model.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart' as foundation;
import '../../common_widgets/appbar_widgets/green_appbar.dart';
import '../../common_widgets/bottomsheet_widgets/ClearChatbottmSheet.dart';
import '../../common_widgets/loading_widgets/loader.dart';
import '../../constants/colors.dart';
import '../../constants/local_images.dart';
import '../../data/models/Chat_models/ChatRoom2Model.dart';
import '../../utils/SharedHelper/Preference_Constant.dart';
import '../../utils/common_functions.dart';
import '../../utils/common_textstyles.dart';
import '../../viewModel/ChatRoom_view_model.dart';
import '../../viewModel/CommonProvider.dart';

class ChatRoomPage extends StatefulWidget {
  final int chatuserID;
  final bool IsAdminChat;
  final String? username;
  const ChatRoomPage({Key? key,required this.chatuserID,required this.IsAdminChat,this.username}) : super(key: key);

  @override
  State<ChatRoomPage> createState() => _ChatRoomPageState();
}

class _ChatRoomPageState extends State<ChatRoomPage> {
  Timer? _timer;
  TextEditingController _messageController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool emojiShowing = false;
  final ScrollController _scrollController = ScrollController();
  final List<Message> _messages = [];
  final List<String> _getmessages = [];
  final List<String> _getuserpics = [];
  final List<String> _getuserType = [];
  final List<bool> isUser = [];
  late ChatRoomViewModel _chatRoomViewModel;
  late CommonProvider _commonProvider;
  String profileID = "";
  String UserId ="";
  String ClearChatID ="";


  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  _onBackspacePressed() {
    _messageController
      ..text = _messageController.text.characters.toString()
      ..selection = TextSelection.fromPosition(
          TextPosition(offset: _messageController.text.length));
  }


  @override
  void initState() {
    super.initState();
    getvalue(profileID,PrefConstant.appUserId);
    _chatRoomViewModel =  Provider.of<ChatRoomViewModel>(context, listen: false);
    _commonProvider =  Provider.of<CommonProvider>(context, listen: false);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getmessages.clear();
      isUser.clear();
      if(widget.IsAdminChat){
        _chatRoomViewModel.getAdminmessageapi(onFailureRes: onFailureRes, onSuccessRes: onAdminSuccessRes);
      }else{
        _chatRoomViewModel.getmessageapi(onFailureRes: onFailureRes, onSuccessRes: onSuccessRes, ChatuserID: widget.chatuserID.toString());
      }

      // Scroll to the last message when a new message is added

      //_startTimer();
    });
  ScrollFun();

  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Scaffold(
        backgroundColor: Appcolors.white,
        appBar: GreenAppBar(
            icn1: LocalSVGImages.search,
            icn1tag: "searchA&B",
            icn2: LocalSVGImages.filter,
            icn2tag: "send",
            isDealerChat: false,
            onPressBack: () {
              Navigator.pop(context);
            },
            onPressStar: () {
              showCustomBottomSheet(context);
            },
            onPressSend: () {},
            height: 80.0,
            isfrom: widget.IsAdminChat?'Chat with Admin': 'Chat with a Pro',
            title:
            //widget.IsAdminChat?'Chat with Admin': 'Chat with a Pro',
           SetUsername(widget.username) ,
            hidemore: widget.IsAdminChat?false:true,
            appbarclr: Appcolors.splashbgcolor2),
        body: Column(
          children: [
            Expanded(
              child:
              Consumer<ChatRoomViewModel>(
                 builder: (context, chatroomvm, child) {
                   TriggerChatapi(chatroomvm);
               return GroupedListView<Message,DateTime>(
                 controller: _scrollController,
                  elements: _messages,
                  groupBy: (_messages) => DateTime(
                    _messages.date.year,
                    _messages.date.month,
                    _messages.date.day,
                  ),
                  //  groupComparator: (value1, value2) => value2.compareTo(value1),
                  /* itemComparator: (item1, item2) =>
                      item1['name'].compareTo(item2['name']),*/
                  // order: GroupedListOrder.,
                  useStickyGroupSeparators: true,

                  /*   groupSeparatorBuilder: (String value) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      value,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),*/
                 groupHeaderBuilder: (Message message) => Container(
                   color: Appcolors.white,
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Divider(
                            color: Appcolors.splashbgcolor2,
                            height: 0,
                            thickness: 1,
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 8),
                            child: Text(
                              (message.date.day == DateTime.now().day)
                                  ? 'Today'
                                  : DateFormat.yMMMd().format(message.date),
                              style: TextStyle(
                                color:Appcolors.splashbgcolor2,),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Divider(
                            color: Appcolors.splashbgcolor2,
                            height: 0,
                            thickness: 1,
                          ),
                        ),
                      ],
                    ),
                  ),

                  itemBuilder: (c, Message element) {
                    final messageWidget = Container(
                      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        // color: element["group"] == "Team A" ? Appcolors.txtpurple.withOpacity(0.4) : Appcolors.splashbgcolor2.withOpacity(0.4),
                        color: element.isSendByMe  ? Appcolors.txtpurple.withOpacity(0.4) : Appcolors.splashbgcolor2.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Text(
                          // element['name'],
                          element.text,
                          style: CustomTextStyle.txt14Rrtxtblk,
                        ),
                      ),
                    );

                    final messageWidget2 = Flexible(
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: element.isSendByMe  ? Appcolors.splashbgcolor2.withOpacity(0.4) : Appcolors.splashbgcolor2.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Text(
                            element.text,
                            style: CustomTextStyle.txt14Rrtxtblk,
                          ),
                        ),
                      ),
                    );

                    if (element.isSendByMe) {
                      return Align(
                        alignment: Alignment.centerRight,
                        child: messageWidget,
                      );
                    } else {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(width: 8),
                          !element.isSendByMe
                          ? CircleAvatar(
                              radius: 20,
                              backgroundImage:
                              NetworkImage(
                                element.propic,
                                // items[index].imageUrl,
                              )
                            )
                          : CircleAvatar(
                              radius: 20,
                              backgroundImage:
                                  AssetImage("assets/png_icons/image7.jpg"),
                            ),
                      messageWidget2,
                        ],
                      );
                    }


                   /* return  Align(
                      //alignment: element["group"] == "Team A" ? Alignment.centerRight : Alignment.centerLeft,
                      alignment: element.isSendByMe ? Alignment.centerRight : Alignment.centerLeft,
                      child: messageWidget,
                    );*/
                  },
                );
                }
              ),
            ),
              Consumer<ChatRoomViewModel>(
    builder: (context, chatroomvm, child) {
      print('chatroomvm.statusandmessageResponseModel?.message${chatroomvm.statusandmessageResponseModel?.message}');
              return chatroomvm.statusandmessageResponseModel?.message == "Successfully blocked User"?Container():_buildMessageComposer(); })
          ],
        ),
      ),
    );



  }

  Widget _buildMessageComposer() {
    return Container(
      //height: 280,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0, 2), // Adjust the shadow position as needed
            blurRadius: 4, // Adjust the shadow blur radius as needed
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Consumer<CommonProvider>(
        builder: (context,isemoji,child) {
          return Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(

                        child: TextFormField(
                          focusNode: _focusNode,
                          onTap: () {
                            print('on text fld tapped');
                            /*    setState(() {
                            emojiShowing = false;
                          });*/
                            _commonProvider.setEmoji(false);
                          },
                          controller: _messageController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Appcolors.splashbgcolor2.withOpacity(
                                0.3),
                            // Background color
                            contentPadding: EdgeInsets.all(16.0),
                            // border: InputBorder.none,// Padding
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(12.0),
                              // Rounded border radius
                            ),
                            hintText: 'Type your message here...',
                            helperStyle: CustomTextStyle.txt14Rrtxtchatgrey
                          ),
                        ),
                      ),
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      if (_messageController.text.isNotEmpty) {
                        _sendMessage(_messageController.text);
                      }
                    },
                    child: SvgPicture.asset(LocalSVGImages.sendgreen,
                      width: 20,
                      height: 20,
                      fit: BoxFit.fill,),
                  ),
                  SizedBox(width: 18),

                  GestureDetector(
                    onTap: () {
                      /*   setState(() {
                      _focusNode.unfocus();
                      emojiShowing = !emojiShowing;
                    });*/
                      _focusNode.unfocus();
                      _commonProvider.setEmoji(!isemoji.IsEmoji);
                    },
                    child: SvgPicture.asset(LocalSVGImages.smiley,
                      width: 20,
                      height: 20,
                      fit: BoxFit.fill,),
                  )
                ],
              ),
              Offstage(
              //  offstage: !emojiShowing,
                offstage: !isemoji.IsEmoji,
                child: SizedBox(
                    height: 250,
                    child: EmojiPicker(
                      textEditingController: _messageController,
                      onBackspacePressed: _onBackspacePressed,
                      config: Config(
                        columns: 7,
                        // Issue: https://github.com/flutter/flutter/issues/28894
                        emojiSizeMax: 32 *
                            (foundation.defaultTargetPlatform ==
                                TargetPlatform.iOS
                                ? 1.30
                                : 1.0),
                        verticalSpacing: 0,
                        horizontalSpacing: 0,
                        gridPadding: EdgeInsets.zero,
                        initCategory: Category.RECENT,
                        bgColor: const Color(0xFFF2F2F2),
                        indicatorColor: Appcolors.splashbgcolor,
                        iconColor: Colors.grey,
                        iconColorSelected: Appcolors.splashbgcolor,
                        backspaceColor: Appcolors.splashbgcolor,
                        skinToneDialogBgColor: Colors.white,
                        skinToneIndicatorColor: Colors.grey,
                        enableSkinTones: true,
                        recentTabBehavior: RecentTabBehavior.RECENT,
                        recentsLimit: 28,
                        replaceEmojiOnLimitExceed: false,
                        noRecents: const Text(
                          'No Recents',
                          style: TextStyle(fontSize: 20, color: Colors.black26),
                          textAlign: TextAlign.center,
                        ),
                        loadingIndicator: const SizedBox.shrink(),
                        tabIndicatorAnimDuration: kTabScrollDuration,
                        categoryIcons: const CategoryIcons(),
                        buttonMode: ButtonMode.MATERIAL,
                        checkPlatformCompatibility: true,
                      ),
                    )),
              ),
            ],
          );
        }
      ),
    );
  }

  void _sendMessage(String message) {
    Map<String, dynamic> sendmsgparams = {
      "message": message,
    };
if(widget.IsAdminChat){
_chatRoomViewModel.sendAdminmessageapi(onFailureRes: onSendMsgFailureRes,onSuccessRes:onSendAdMsgSuccessRes,message: sendmsgparams);
_messageController.clear();
}else{
  print('chat send user id ${widget.chatuserID.toString()}');
  _chatRoomViewModel.sendmessageapi(onFailureRes: onSendMsgFailureRes, onSuccessRes: onSendMsgSuccessRes, message: sendmsgparams, userid : widget.chatuserID.toString());
  _messageController.clear();
}

  }
  void LoadChats(List<String> message, List<bool> isUser, List<String> getuserpics, List<String> getuserType) {
    setState(() {
      _messages.clear();
      for(int i = 0; i < message.length; i++) {
        _messages.add(
          Message(
              text: message[i],
            //  date: DateTime.now().subtract(const Duration(days: 10, minutes: 10)),
              date: DateTime.now(),
              isSendByMe:isUser[i],
          propic:getuserpics[i] ,
          usertype: getuserType[i]),
        );
        print('received usertype ${_getuserType[i]}');
      }
      // Scroll to the last message when a new message is added
   /*   _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );*/
ScrollFun();
    });
  }

  onFailureRes(String p1) {
  }

  onSuccessRes(ChatRoom2Model? getMessgaeRes) {
    _chatRoomViewModel.setIsTriggerChat(false);
    if(getMessgaeRes?.messages != null || getMessgaeRes!.messages!.isNotEmpty) {
      _getmessages.clear();
      _getuserType.clear();
      isUser.clear();
      _getuserpics.clear();

      for(int i = 0; i < getMessgaeRes!.messages!.length; i++) {
        _getmessages.add(getMessgaeRes.messages?[i].message ??"");
        _getuserType.add(getMessgaeRes.messages?[i].userType ??"");
        _getuserpics.add(getMessgaeRes.messages?[i].user?.photoUrl ?? "");
        print('User pro pics in chat ${_getuserpics[i]}');
        if(UserId == getMessgaeRes.messages?[i].userId.toString()){
          isUser.add(true);
        }else{
          print('insideelse ${getMessgaeRes.messages?[i].userId}  userID: ${UserId}');
          isUser.add(false);
        }
        ClearChatID = getMessgaeRes.messages?[i].crId.toString() ?? "";
        print('ClearChatID ${ClearChatID}');
        //print('received message ${_getmessages[i]}');
      //  print('received message ${isUser[i]}');
      }
      LoadChats(_getmessages,isUser,_getuserpics,_getuserType);

    }
  }

  onSendMsgFailureRes(String p1) {
  }

  onSendMsgSuccessRes(StatusandMessageModel? p1) {
    _chatRoomViewModel.getmessageapi(onFailureRes: onFailureRes, onSuccessRes: onSuccessRes, ChatuserID: widget.chatuserID.toString());

    /*Route route = MaterialPageRoute(builder: (context) => ChatRoomPage(chatuserID: widget.chatuserID,));
    Navigator.pushReplacement(context, route);
*/
  }

  void getvalue(String profileID, String appUserId) async{
    UserId = await getPrefValues(profileID,PrefConstant.appUserId);
    print('UserId in chat room ${UserId}');

  }



  void ScrollFun() async {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 1),
          curve: Curves.fastOutSlowIn);
    });

  }


  void showCustomBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30.0),
        ),
      ),
      builder: (BuildContext context) {
        return ChatClearBtSheet(
          OnCancelPressed: (){
            Navigator.pop(context);
          },
          OnBlockPressed: (){
            print('ClearChatID:::block ${ClearChatID}');
            _chatRoomViewModel.blockuserapi(onFailureRes: onFailureRes, onSuccessRes: onBlockSuccess,  userid: widget.chatuserID.toString());
          },
          onClearPressed: (){
            _chatRoomViewModel.clearchatapi(onFailureRes: onClearFailureRes, onSuccessRes: onClearSuccessRes, ChatuserID: ClearChatID);
          },
        );
      },
    );
  }

  onClearFailureRes(String p1) {
  }

  onClearSuccessRes(ClearChatModel? p1) {
    _getmessages.clear();
    isUser.clear();
    _chatRoomViewModel.getmessageapi(onFailureRes: onFailureRes, onSuccessRes: onSuccessRes, ChatuserID: widget.chatuserID.toString());
  }

   TriggerChatapi(ChatRoomViewModel chatroomvm) {

    if(chatroomvm.IsTriggerChat){
      print('chatapi triggered');
      _chatRoomViewModel.getmessageapi(onFailureRes: onFailureRes, onSuccessRes: onSuccessRes, ChatuserID: widget.chatuserID.toString());
    }
   }



  onBlockSuccess(StatusandMessageModel? p1) {
    print('blocked res ${p1?.message}');
    Navigator.pop(context);
  }

  onAdminSuccessRes(GetAdminMessageModel? getMessgaeRes) {
    _chatRoomViewModel.setIsTriggerChat(false);
    if(getMessgaeRes?.messages != null || getMessgaeRes!.messages!.isNotEmpty) {
      _getmessages.clear();
      _getuserType.clear();
      isUser.clear();
      _getuserpics.clear();

      for(int i = 0; i < getMessgaeRes!.messages!.length; i++) {
        _getmessages.add(getMessgaeRes.messages?[i].message ??"");
        _getuserType.add(getMessgaeRes.messages?[i].userType ??"");
        _getuserpics.add(getMessgaeRes.messages?[i].room?.admin?.photoUrl ?? "");

        print('User pro pics in chat ${_getuserpics[i]}');
      //  if(UserId == getMessgaeRes.messages?[i].userId.toString()){
        if(getMessgaeRes.messages?[i].userType != "admin"){
          isUser.add(false);
        }else{
          print('insideelse ${getMessgaeRes.messages?[i].userId}  userID: ${UserId}');
          isUser.add(true);
        }
        ClearChatID = getMessgaeRes.messages?[i].crId.toString() ?? "";
        print('ClearChatID ${ClearChatID}');
        //print('received message ${_getmessages[i]}');
        //  print('received message ${isUser[i]}');
      }
      LoadChats(_getmessages,isUser,_getuserpics,_getuserType);

    }
  }

  onSendAdMsgSuccessRes(StatusandMessageModel? p1) {
    _chatRoomViewModel.getAdminmessageapi(onFailureRes: onFailureRes, onSuccessRes: onAdminSuccessRes);
  }

  SetUsername(String? username) {
    print('username in chat:: ${widget.username}');
    if(widget.username == null) {
     return "Chat with a Pro";
   }else {
     return widget.username;
   }
  }
}




class Message {
  final String text;
  final DateTime date;
  final bool isSendByMe;
  final String propic;
  final String usertype;

  Message({required this.text, required this.date, required this.isSendByMe,required this.propic,required this.usertype});
}