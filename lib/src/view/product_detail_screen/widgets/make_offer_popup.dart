import 'package:flutter/material.dart';

import '../../../utils/base/resizer/fetch_pixels.dart';
import '../../../utils/base/resources/resources.dart';
import '../../../utils/base/resources/text_style.dart';
import '../../../utils/base/widget_utils.dart';

class makeOffer extends StatelessWidget{
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(FetchPixels.getPixelHeight(10)),
          color: R.color.blackColor,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(R.texts.makeOffer, style: AppFontStyles.styleRegularPoppins20.copyWith(fontWeight: FontWeight.bold, color: R.color.white), textAlign: TextAlign.center),
            getVerSpace(FetchPixels.getPixelHeight(10)),
            getDefaultTextFieldWithLabel(context, R.texts.price, controller),
            getVerSpace(FetchPixels.getPixelHeight(10)),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () => Navigator.pop(context),
                    child: Text("cancel", style: AppFontStyles.styleRegularPoppins18.copyWith(color: R.color.white),)),
                getHorSpace(FetchPixels.getPixelHeight(15)),
                InkWell(
                onTap: () => Navigator.pop(context),
                    child: Text(R.texts.submit.toLowerCase(), style: AppFontStyles.styleRegularPoppins18.copyWith(color: R.color.white),)),
              ],
            )
          ],
        ),
      ),
    );
  }

}