import 'package:base_flutter_provider_project/data/models/Chat_models/ChatHistoryModel.dart';
import 'package:base_flutter_provider_project/data/models/StatusandMessageModel.dart';
import 'package:base_flutter_provider_project/utils/common_textstyles.dart';
import 'package:base_flutter_provider_project/viewModel/ChatRoom_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common_widgets/appbar_widgets/common_appbar.dart';
import '../../../common_widgets/search_widgets/common_search.dart';
import '../../../constants/colors.dart';
import '../../../constants/local_images.dart';
import '../../ChatPage/ChatRoomPage.dart';
import '../../home/homepage.dart';

class DealerInbox extends StatefulWidget {
  const DealerInbox({super.key});

  @override
  State<DealerInbox> createState() => _DealerInboxState();
}

class _DealerInboxState extends State<DealerInbox> {

  late ChatRoomViewModel _chatroomviewmodel;
  
  @override
  void initState() {
    super.initState();
    
    _chatroomviewmodel = Provider.of<ChatRoomViewModel>(context,listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _chatroomviewmodel.getchathistoryapi(onFailureRes: onFailureRes, onSuccessRes: onSuccessRes);
    });
    
  }
  
  @override
  Widget build(BuildContext context) {
    var deviceheight = MediaQuery.of(context).size.height;
    var devicewidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Appcolors.white,
      appBar: CustomAppBar(
          height: 80.0, title: 'Chat Messages', appbarclr: Appcolors.white),
      body: Container(
        height: deviceheight,
        width: devicewidth,
      child: Column(
        children: [

          Expanded(child: DealerChatInboxUI(
              onclicked: (chat){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ChatRoomPage(chatuserID: chat?.sender?.id ?? 0,IsAdminChat: false,)));
              },
              onDelete: (chat){
            print('chat History call back ${chat?.id.toString()}');
            String? chatid = chat?.id.toString();
            _chatroomviewmodel.deletechathistoryapi(onFailureRes: onFailureRes, onSuccessRes: onChatHisDltSuccessRes, userid: chatid ?? "");
              }))
        ],
      ),
      )
    );
  }

  onFailureRes(String p1) {
  }

  onSuccessRes(ChatHistoryModel? p1) {
  }

  onChatHisDltSuccessRes(StatusandMessageModel? p1) {
    _chatroomviewmodel.getchathistoryapi(onFailureRes: onFailureRes, onSuccessRes: onSuccessRes);
  }
}

class DealerChatInboxUI extends StatelessWidget {
  final ValueChanged<Chat?> onDelete;
  final  ValueChanged<Chat?> onclicked;
  DealerChatInboxUI({
required this.onDelete,
required this.onclicked
});
  final  List<ListItem> items = [
    ListItem(
        lotsize: "1",
        stattxt: "Stat",
        statres: "E-Mobility",
        statres2: "100k",
        toprated: "Top Rated",
        text: 'Farid Amini',
        statyears: "5+ years",
        rate: '132',
        shname: 'YLW',
        colors: 2,
        imageUrl: "assets/png_icons/image0.jpg"),
    ListItem(
        lotsize: "1",
        stattxt: "Stat",
        statres: "E-Mobility",
        statres2: "100k",
        toprated: "Pharma Focused",
        statyears: "5+ years",
        text: 'Huo Shu',
        rate: '1681',
        shname: 'PFC',
        colors: 2,
        imageUrl:  "assets/png_icons/image1.jpg"),
    ListItem(
        lotsize: "1",
        stattxt: "Stat",
        statres: "E-Mobility",
        statres2: "100k",
        toprated: "Crypto",
        statyears: "5+ years",
        text: 'Lakshmana Dongerkerry',
        rate: '541',
        shname: 'DRL',
        colors: 2,
        imageUrl: "assets/png_icons/image2.jpg"),
    ListItem(
        lotsize: "1",
        stattxt: "Stat",
        statres: "E-Mobility",
        statres2: "100k",
        toprated: "Top Rated",
        statyears: "5+ years",
        text: 'Marysa Labrone',
        rate: '321',
        shname: 'API',
        colors: 2,
        imageUrl:  "assets/png_icons/image3.jpg"),
    ListItem(
        lotsize: "1",
        stattxt: "Stat",
        statres: "E-Mobility",
        statres2: "100k",
        toprated: "Top Rated",
        statyears: "5+ years",
        text: 'Nnenna Jioke',
        rate: '150',
        shname: 'ABS',
        colors: 5,
        imageUrl:  "assets/png_icons/image4.jpg"),

    ListItem(
        lotsize: "1",
        stattxt: "Stat",
        statres: "E-Mobility",
        statres2: "100k",
        toprated: "Top Rated",
        statyears: "5+ years",
        text: 'Nguyễn Quế Anh',
        rate: '132',
        shname: 'YLW',
        colors: 5,
        imageUrl:  "assets/png_icons/image5.jpg"),
    ListItem(
        lotsize: "1",
        stattxt: "Stat",
        statres: "E-Mobility",
        statres2: "100k",
        toprated: "Top Rated",
        statyears: "5+ years",
        text: 'Merrile Burgett',
        rate: '1681',
        shname: 'PFC',
        colors: 6,
        imageUrl:  "assets/png_icons/image6.jpg"),

  ];
  @override
  Widget build(BuildContext context) {

    return Consumer<ChatRoomViewModel>(
      builder: (context,chathistoyvm,child) {
        print('chat history::: ${chathistoyvm.ChatHistoryResponseModel?.chat?.length}');
        return Container(
          //  color: Colors.red.shade50,
          child: isChatisempty(chathistoyvm.ChatHistoryResponseModel?.chat)?Center(child: Text("No Chats Found"),):ListView.builder(
           //   itemCount: items.length,

              itemCount: chathistoyvm.ChatHistoryResponseModel?.chat?.length ?? 0,
              itemBuilder: (context, index) {

              var chathistorydata =chathistoyvm.ChatHistoryResponseModel?.chat;
              print('chat message ${chathistorydata?[index].messages?.message}');
                return GestureDetector(
                  onTap: (){
                    onclicked(chathistorydata?[index]);
                  },
                  child: Dismissible(
                  //  key: Key(items[index].text),
                  //  key: Key(chathistorydata?[index].sender?.name ?? ""),
                    key: UniqueKey(),
                    background: Container(
                      color: Colors.red,
                      child: Icon(Icons.delete, color: Colors.white),
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                    ),
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) {
                      // Remove the item from the list
                      //items.removeAt(index);
                      onDelete(chathistorydata?[index]);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundImage:
                          //AssetImage(items[index].imageUrl,),
                            NetworkImage(chathistorydata?[index].sender?.photoUrl ?? ""),
                        ),
                        title: Text(chathistorydata?[index].sender?.name ?? ""),
                        subtitle: Text(chathistorydata?[index].messages?.message ?? ""),
                        trailing: Container(
                          height: 60,
                          width: 60,
                          // color: Colors.red.shade50,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("May", style: CustomTextStyle.txt10Rrkyctxtgrey,),
                              Text("01,2023", style: CustomTextStyle.txt10Rrkyctxtgrey),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
        );
      }
    );
  }

  isChatisempty(List<Chat>? chat) {
    if(chat == null || chat.isEmpty){
      return true;
    }else{
      return false;
    }
  }
}
