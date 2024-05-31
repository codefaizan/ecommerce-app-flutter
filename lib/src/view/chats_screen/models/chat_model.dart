import '../../../utils/base/resources/resources.dart';

class ChatData{
  String title;
  String subTitle;
  bool hasNewMessage;
  String avatar;
  List<MessagesData> messages;

  ChatData({
    required this.title,
    required this. subTitle,
    required this.hasNewMessage,
    required this.avatar,
    required this.messages
  });
}

class MessagesData{
  final String text;
  final bool isSender;

  MessagesData({
    required this.text,
    required this.isSender
  });
}

List<MessagesData> demoMessages = [
  MessagesData(text: 'Lorem ipsum dolor sit amet. Sit architecto possimus et possimus corporis cum.', isSender: false),
  MessagesData(text: 'Lorem ipsum dolor sit amet. Sit architecto possimus et possimus corporis cum. Qui porro magni est internos molestias sit aperiam pariatur id dicta laboriosam qui adipisci totam nam amet quisquam ea ipsum dolorem. ', isSender: true),
  MessagesData(text: 'Lorem ipsum dolor sit amet. Sit architecto possimus et possimus corporis cum.', isSender: false),
  MessagesData(text: 'Lorem ipsum dolor sit amet. Sit architecto possimus et possimus corporis cum. Qui porro magni est internos molestias sit aperiam pariatur id dicta laboriosam qui adipisci totam nam amet quisquam ea ipsum dolorem. ', isSender: true),
];

List<ChatData> demoChatDataList = [
  ChatData(title: "Faizan Ahmad", subTitle: "subtitle subtitle subtitle subtitle", hasNewMessage: true, avatar: R.images.plantIcon, messages: [
    MessagesData(text: 'Lorem ipsum dolor sit amet. Sit architecto possimus et possimus corporis cum.', isSender: false),
    MessagesData(text: 'Lorem ipsum dolor sit amet. Sit architecto possimus et possimus corporis cum. Qui porro magni est internos molestias sit aperiam pariatur id dicta laboriosam qui adipisci totam nam amet quisquam ea ipsum dolorem. ', isSender: true),
    MessagesData(text: 'Lorem ipsum dolor sit amet. Sit architecto possimus et possimus corporis cum.', isSender: false),
    MessagesData(text: 'Lorem ipsum dolor sit amet. Sit architecto possimus et possimus corporis cum. Qui porro magni est internos molestias sit aperiam pariatur id dicta laboriosam qui adipisci totam nam amet quisquam ea ipsum dolorem. ', isSender: true),
  ]),
  ChatData(title: "title", subTitle: "subTitle", hasNewMessage: true, avatar: R.images.plantIcon, messages: [
    MessagesData(text: 'Lorem ipsum dolor sit amet. Sit architecto possimus et possimus corporis cum.', isSender: false),
    MessagesData(text: 'Lorem ipsum dolor sit amet. Sit architecto possimus et possimus corporis cum. Qui porro magni est internos molestias sit aperiam pariatur id dicta laboriosam qui adipisci totam nam amet quisquam ea ipsum dolorem. ', isSender: true),
    MessagesData(text: 'Lorem ipsum dolor sit amet. Sit architecto possimus et possimus corporis cum.', isSender: false),
    MessagesData(text: 'Lorem ipsum dolor sit amet. Sit architecto possimus et possimus corporis cum. Qui porro magni est internos molestias sit aperiam pariatur id dicta laboriosam qui adipisci totam nam amet quisquam ea ipsum dolorem. ', isSender: true),
  ]),
  ChatData(title: "Haider Ali", subTitle: "subTitle", hasNewMessage: true, avatar: R.images.plantIcon, messages: [
    MessagesData(text: 'Lorem ipsum dolor sit amet. Sit architecto possimus et possimus corporis cum.', isSender: false),
    MessagesData(text: 'Lorem ipsum dolor sit amet. Sit architecto possimus et possimus corporis cum. Qui porro magni est internos molestias sit aperiam pariatur id dicta laboriosam qui adipisci totam nam amet quisquam ea ipsum dolorem. ', isSender: true),
    MessagesData(text: 'Lorem ipsum dolor sit amet. Sit architecto possimus et possimus corporis cum.', isSender: false),
    MessagesData(text: 'Lorem ipsum dolor sit amet. Sit architecto possimus et possimus corporis cum. Qui porro magni est internos molestias sit aperiam pariatur id dicta laboriosam qui adipisci totam nam amet quisquam ea ipsum dolorem. ', isSender: true),
  ]),
  ChatData(title: "title", subTitle: "subTitle", hasNewMessage: true, avatar: R.images.plantIcon, messages: [
    MessagesData(text: 'Lorem ipsum dolor sit amet. Sit architecto possimus et possimus corporis cum.', isSender: false),
    MessagesData(text: 'Lorem ipsum dolor sit amet. Sit architecto possimus et possimus corporis cum. Qui porro magni est internos molestias sit aperiam pariatur id dicta laboriosam qui adipisci totam nam amet quisquam ea ipsum dolorem. ', isSender: true),
    MessagesData(text: 'Lorem ipsum dolor sit amet. Sit architecto possimus et possimus corporis cum.', isSender: false),
    MessagesData(text: 'Lorem ipsum dolor sit amet. Sit architecto possimus et possimus corporis cum. Qui porro magni est internos molestias sit aperiam pariatur id dicta laboriosam qui adipisci totam nam amet quisquam ea ipsum dolorem. ', isSender: true),
  ]),
];