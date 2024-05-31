import 'package:flutter/material.dart';
import 'package:turtle/src/utils/base/resizer/fetch_pixels.dart';
import 'package:turtle/src/utils/base/widget_utils.dart';

import '../../common_widgets/custom_dialog.dart';
import '../../utils/base/resources/resources.dart';
import '../../utils/base/resources/text_style.dart';

class ContactusScreen extends StatelessWidget{
  final TextEditingController emailController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(R.texts.contactUs), titleTextStyle: AppFontStyles.styleRegularPoppins25.copyWith(fontWeight: FontWeight.bold)),

      body: Padding(
        padding: EdgeInsets.all(FetchPixels.getPixelHeight(20)),
        child: Column(
          children: [
            getDefaultTextFieldWithLabel(context, R.texts.email, emailController),
            getVerSpace(FetchPixels.getPixelHeight(20)),
            getDefaultTextFieldWithLabel(context, R.texts.message, messageController, maxLines: 4),
            getVerSpace(FetchPixels.getPixelHeight(20)),
            getElevatedButton(R.texts.send.toUpperCase(), () {
              Navigator.pop(context);
              showDialog(context: context, builder: (context) => customDialog(title: R.texts.submitted, subtitle: R.texts.weWillGetBackToYou),);
            })
          ],
        )
      ),
    );
  }

}