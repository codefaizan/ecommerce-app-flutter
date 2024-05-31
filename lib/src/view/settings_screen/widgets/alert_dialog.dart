import 'package:flutter/material.dart';
import 'package:turtle/src/utils/base/resizer/fetch_pixels.dart';
import 'package:turtle/src/utils/base/widget_utils.dart';

import '../../../utils/base/resources/resources.dart';
import '../../../utils/base/resources/text_style.dart';

Future<dynamic> showAlertDialog(BuildContext context, String title, dynamic Function() onYesPressed, {String? subtitle}){
  return showDialog(context: context, builder: (buildContext) =>
      Dialog(
        backgroundColor: R.color.transparent,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 90, bottom: 30, left: 20, right: 20),
              margin: EdgeInsets.only(top: FetchPixels.getPixelHeight(30)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(title, style: AppFontStyles.styleRegularPoppins20.copyWith(fontWeight: FontWeight.w500), textAlign: TextAlign.center),
                  getVerSpace(FetchPixels.getPixelHeight(10)),
                  subtitle==null?const SizedBox():Text(subtitle,  style: AppFontStyles.styleRegularPoppins15(), textAlign: TextAlign.center),
                  subtitle==null?const SizedBox():getVerSpace(FetchPixels.getPixelHeight(10)),
                  getElevatedButton('NO', () => Navigator.pop(context
                  )),
                  getElevatedButton('YES', onYesPressed, foregroundColor: R.color.theme, backgroundColor: R.color.greyColor)
                ],
              ),
            ),
            getAssetImage(R.images.warning)
          ],
        ),
      )
  );
}