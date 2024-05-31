import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turtle/src/view/chats_screen/models/chat_model.dart';
import 'package:turtle/src/view/chats_screen/providers/chats_provider.dart';
import 'package:turtle/src/view/chats_screen/widgets/message_widget.dart';

import '../../../utils/base/resizer/fetch_pixels.dart';
import '../../../utils/base/resources/resources.dart';
import '../../../utils/base/resources/text_style.dart';
import '../../../utils/base/widget_utils.dart';
import '../widgets/message_input_bar.dart';

class MessagesScreen extends StatefulWidget {
  final ChatData chatData;
  const MessagesScreen({super.key, required this.chatData});

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  List<MessagesData> messagesList = [];

  @override
  void initState() {
    messagesList = widget.chatData.messages;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ChatsProvider>(builder: (context, chatProvider, child) {
     return GestureDetector(
    onTap: ()=> FocusScope.of(context).unfocus(),
    child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: BackButton(onPressed: () {
          chatProvider.messageScreenInputController.clear();
          Navigator.pop(context);
        }),
        title: Row(
          children: [
            CircleAvatar(
                radius: FetchPixels.getPixelHeight(25),
                foregroundImage: AssetImage(widget.chatData.avatar)),
            SizedBox(
              width: FetchPixels.getPixelHeight(10),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    widget.chatData.title,
                    style: AppFontStyles.styleRegularPoppins20),
                Text(
                  'Online',
                  style: AppFontStyles.styleRegularRPoppins12,
                ),
              ],
            ),
          ],
        ),
        actions: [const Icon(Icons.call), getHorSpace(FetchPixels.getPixelWidth(20))],
      ),
      body: Padding(
        padding: EdgeInsets.all(FetchPixels.getPixelHeight(20)),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                reverse: true,
                shrinkWrap: true,
                itemCount: messagesList.length,
                itemBuilder: (context, index) {
                  MessagesData message = messagesList[messagesList.length-index-1];
                  return getMessageWidget(message);
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: FetchPixels.getPixelHeight(15));
                },
              ),
            ),

            getVerSpace(FetchPixels.getPixelHeight(10)),
            getMessageInputBar(chatProvider, messagesList),

          ],
        ),
      ),
    ),
  );
  },);
  }

}