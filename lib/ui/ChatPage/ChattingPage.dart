import 'package:base_flutter_provider_project/utils/common_textstyles.dart';
import 'package:flutter/material.dart';

import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';

import '../../common_widgets/appbar_widgets/green_appbar.dart';
import '../../constants/colors.dart';
import '../../constants/local_images.dart';

class ChattingPage extends StatefulWidget {
  const ChattingPage({Key? key}) : super(key: key);

  @override
  State<ChattingPage> createState() => _ChattingPageState();
}

class _ChattingPageState extends State<ChattingPage> {

  final List<ChatMessage> _messages = [];

  final ScrollController _scrollController = ScrollController();

  TextEditingController _messageController = TextEditingController();

  void _sendMessage(String message) {
    setState(() {
      _messages.add(ChatMessage (message: message, isSender: false,profilePic: "https://images.pexels.com/photos/2589653/pexels-photo-2589653.jpeg?auto=compress&cs=tinysrgb&w=600",));
      _messageController.clear();

      // Scroll to the last message when a new message is added
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }




  @override
  Widget build(BuildContext context) {
    var deviceheight = MediaQuery.of(context).size.height;
    var devicewidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,

      appBar: GreenAppBar(
          icn1: LocalSVGImages.search,
          icn1tag: "searchA&B",
          icn2: LocalSVGImages.filter,
          icn2tag: "send",
          isDealerChat: false,
          onPressBack: () {
            Navigator.pop(context);
          },
          onPressStar: () {},
          onPressSend: () {},
          height: 80.0,
          title: 'Chat with a Pro',
          hidemore: true,
          appbarclr: Appcolors.splashbgcolor2),
      backgroundColor: Appcolors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: deviceheight*0.8,
              width: devicewidth,
         //     color: Colors.red.shade50,
              child: Column(
                children: [
               /*   Container(
                    height: 30,
                  //  color: Colors.red,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("You are chatting with",style: CustomTextStyle.txt14gpquickstatsgrey,),
                        Text(" Lizzie Saavedra",style: CustomTextStyle.txt16Rmtxtblk)
                      ],
                    ),
                  ),*/
                  Expanded(
                    child: ListView.builder(
                     // shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      controller: _scrollController,
                      itemCount: _messages.length,
                      itemBuilder: (context, index) {
                        return _messages[index];

                      },
                    ),
                  ),

                ],
              ),
            ),
            _buildMessageComposer()
          ],
        ),
      ),
    );
  }

  Widget _buildMessageItem(ChatMessage message) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Text(
        message.message,
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _buildMessageComposer() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: _messageController,
              decoration: InputDecoration(
                hintText: 'Type your message...',
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              if (_messageController.text.isNotEmpty) {
                _sendMessage(_messageController.text);
              }
            },
          ),
        ],
      ),
    );
  }


}




class ChatMessage extends StatelessWidget {
  final String message;
  final bool isSender;
  final String? profilePic; // Add a new profilePic parameter

  ChatMessage({
    required this.message,
    required this.isSender,
    this.profilePic,
  });

  @override
  Widget build(BuildContext context) {
    final messageWidget = Container(
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: isSender ? Appcolors.txtpurple.withOpacity(0.4) : Appcolors.splashbgcolor2.withOpacity(0.4),
        borderRadius: BorderRadius.circular(18.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          message,
          style: CustomTextStyle.txt14Rrtxtblk,
        ),
      ),
    );

    if (isSender) {
      return Align(
        alignment: Alignment.centerRight,
        child: messageWidget,
      );
    } else {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: 8),
          if (profilePic != null)
            CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(profilePic!),
            ),
          SizedBox(width: 8),
          messageWidget,
        ],
      );
    }
  }
}


// chat ui using grouped package

