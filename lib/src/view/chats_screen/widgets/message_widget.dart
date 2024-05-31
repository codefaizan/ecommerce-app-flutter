import 'package:flutter/material.dart';
import 'package:turtle/src/view/chats_screen/models/chat_model.dart';

import '../../../utils/base/resizer/fetch_pixels.dart';
import '../../../utils/base/resources/resources.dart';

Widget getMessageWidget(MessagesData message) {
  return Align(
    alignment: message.isSender ? Alignment.centerRight : Alignment.centerLeft,
    child: SizedBox(
      // width: screenWidth/1.3,
      width: FetchPixels.getWidthPercentSize(65),
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: FetchPixels.getPixelHeight(10),
            horizontal: FetchPixels.getPixelWidth(15)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: message.isSender
                  ? const Radius.circular(16)
                  : const Radius.circular(0),
              topRight: message.isSender
                  ? const Radius.circular(0)
                  : const Radius.circular(16),
              bottomLeft: const Radius.circular(16),
              bottomRight: const Radius.circular(16)),
          color: message.isSender
              ? R.color.greyColor
              : const Color(0xFFF1F1F1),
        ),
        child: Column(
          children: [
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  message.text,
                )),
            const Align(
                alignment: Alignment.centerRight,
                child: Text('02:00pm'))
          ],
        ),
      ),
    ),
  );
}
