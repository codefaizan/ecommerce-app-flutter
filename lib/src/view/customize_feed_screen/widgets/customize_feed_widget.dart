import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turtle/src/view/customize_feed_screen/Models/customize_feed_model.dart';
import 'package:turtle/src/view/customize_feed_screen/providers/customize_feed_provider.dart';

import '../../../utils/base/resizer/fetch_pixels.dart';
import '../../../utils/base/resources/resources.dart';
import '../../../utils/base/resources/text_style.dart';
import '../../../utils/base/widget_utils.dart';

Widget customizeFeedWidget(CustomizeFeedItem data, CustomizeFeedProvider provider){
  return ListTile(
    title: Text(
      data.title,
      style: AppFontStyles.styleRegularPoppins22,
    ),
    leading: getAssetImage(data.prefixImage),
    trailing: Checkbox(
        onChanged: (value) {
          data.isSelected = value!;
          provider.update();
          // setState(() {});
        },
        value: data.isSelected,
        activeColor: R.color.blackColor),
    tileColor: R.color.bgColor,
    contentPadding: EdgeInsets.symmetric(
        horizontal: FetchPixels.getPixelWidth(7)),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
            FetchPixels.getPixelHeight(10))),
  );
}