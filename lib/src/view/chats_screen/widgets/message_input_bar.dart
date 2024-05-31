import 'package:flutter/material.dart';

import '../../../utils/base/resources/resources.dart';
import '../providers/chats_provider.dart';

Widget getMessageInputBar(ChatsProvider provider, List messagesList){
  // return SafeArea(
  //     child: TextFormField(
  //       controller: _inputFieldController,
  //       decoration: InputDecoration(
  //         focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(200)),
  //         enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(200)),
  //         // prefixIcon: const Icon(Icons.attach_file),
  //         suffixIcon: IconButton(
  //             onPressed: () {
  //               if (_inputFieldController.text.isNotEmpty) {
  //                 messagesList.add(MessagesData(
  //                     text: _inputFieldController.text,
  //                     isSender: true));
  //               }
  //               _inputFieldController.text = '';
  //               setState(() {});
  //               scrollToBottom();
  //             },
  //         icon: CircleAvatar(backgroundColor: R.colors.whiteColor,child: const Icon(Icons.send))),
  //         fillColor: R.colors.theme,
  //         filled: true,
  //         hintText: R.texts.message
  //       ),
  //     )
  // );
  return SafeArea(
      child: TextFormField(
        controller: provider.messageScreenInputController,
        decoration: InputDecoration(
            prefixIcon: const Icon(Icons.attach_file),
            suffixIcon: IconButton(
                onPressed: () {
                  if (provider.messageScreenInputController.text.isNotEmpty) {
                    provider.sendMessage(messagesList);
                  }
                  // scrollToBottom(provider);
                },
                icon: const Icon(Icons.send)),
            hintText: R.texts.message
        ),
      )
  );
}

// void scrollToBottom(ChatsProvider provider){
//   provider.messageScreenScrollController.animateTo(
//       provider.messageScreenScrollController.position.minScrollExtent,
//       curve: Curves.easeOut,
//       duration: const Duration(milliseconds: 300));
// }