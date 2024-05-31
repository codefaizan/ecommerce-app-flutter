import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:turtle/src/view/chats_screen/models/chat_model.dart';

class ChatsProvider extends ChangeNotifier{
  List<ChatData> allUsers = demoChatDataList;
  List<ChatData> filteredUsers = [];
  TextEditingController messageScreenInputController = TextEditingController();
  // ScrollController messageScreenScrollController = ScrollController();

  search(String searchText){
    filteredUsers.clear();
    if(searchText.isNotEmpty){
      filteredUsers.addAll(allUsers.where((element) => element.title.toLowerCase().contains(searchText)).toList());
    }
    notifyListeners();
  }

  deleteChat(int index){
    allUsers.removeAt(index);
    notifyListeners();
  }

  void sendMessage(List messagesList){
      if (messageScreenInputController.text.isNotEmpty) {
        messagesList.add(MessagesData(
            text: messageScreenInputController.text,
            isSender: true));
      }
      messageScreenInputController.text = '';
      notifyListeners();
  }
}