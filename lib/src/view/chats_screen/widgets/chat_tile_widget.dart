import 'package:flutter/material.dart';
import 'package:turtle/src/view/chats_screen/models/chat_model.dart';
import '../../../utils/base/resizer/fetch_pixels.dart';
import '../../../utils/base/resources/resources.dart';
import '../../../utils/base/resources/text_style.dart';
import '../screens/messages_screen.dart';

class ChatTileWidget extends StatelessWidget {
  final ChatData chat;

  const ChatTileWidget(
      {super.key, required this.chat});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: R.color.greyColor),
          borderRadius: BorderRadius.circular(15)
      ),
      child: ListTile(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => MessagesScreen(chatData: chat)));
        },
        title: Text(chat.title, style: AppFontStyles.styleRegularPoppins15().copyWith(fontWeight: FontWeight.bold)),
        subtitle: Text(chat.subTitle, style: AppFontStyles.styleRegularRPoppins12, maxLines: 1, overflow: TextOverflow.clip,),
        leading: CircleAvatar(
            radius: FetchPixels.getPixelHeight(37),
            foregroundImage: AssetImage(chat.avatar)),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            (chat.hasNewMessage)?
            Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: R.color.theme),
                child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Text('1', style: AppFontStyles.styleRegularRPoppins12.copyWith(color: R.color.white))
                )
            ) : const Spacer(),
            Text(
              '02:00pm',
              style: AppFontStyles.styleRegularRPoppins12.copyWith(color: R.color.hintText),
            )
          ],
        ),
      ),
    );
  }
}