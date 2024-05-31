import 'package:flutter/material.dart';
import 'package:turtle/src/common_providers/product_provider.dart';
import 'package:turtle/src/view/chats_screen/models/chat_model.dart';
import 'package:turtle/src/view/chats_screen/screens/messages_screen.dart';
import 'package:turtle/src/view/product_detail_screen/widgets/make_offer_popup.dart';
import 'package:turtle/src/view/purchases_screen/models/product_model.dart';

import '../../../utils/base/resizer/fetch_pixels.dart';
import '../../../utils/base/resources/resources.dart';
import '../../../utils/base/resources/text_style.dart';
import '../../../utils/base/widget_utils.dart';

SizedBox productDetailBottomBar(BuildContext context,ProductProvider provider, dynamic data){
  return SizedBox(
    height: FetchPixels.getPixelHeight(70),
    child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: FetchPixels.getPixelHeight(10),
            horizontal: FetchPixels.getPixelWidth(19)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
                onTap: () {
                  provider.toggleFavourite(data["productData"]);
                },
                child: Icon(
                  data["productData"].isFavourite
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: data["productData"].isFavourite
                      ? R.color.redColor
                      : R.color.blackColor,
                  size: FetchPixels.getPixelHeight(32),
                )),
            const VerticalDivider(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data["productData"].price,
                  style: AppFontStyles.styleRegularPoppins18
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                data['productData'].isPriceFixed?
                Text(
                  R.texts.fixPrice,
                  style: AppFontStyles.styleRegularPoppins15().copyWith(
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      decorationThickness: 2),
                )
                :
                InkWell(
                  onTap: () => showDialog(context: context, builder: (BuildContext context) => makeOffer()),
                  child: Text(
                    R.texts.makeOffer,
                    style: AppFontStyles.styleRegularPoppins15().copyWith(
                        fontWeight: FontWeight.bold,
                        color: R.color.theme,
                        decoration: TextDecoration.underline,
                        decorationThickness: 2),
                  ),
                ),
              ],
            ),
            getHorSpace(FetchPixels.getPixelWidth(75)),
            ElevatedButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => MessagesScreen(chatData: demoChatDataList[0]),)),
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)),
                  minimumSize: Size(FetchPixels.getPixelHeight(68),
                      FetchPixels.getPixelWidth(38))),
              child: Text(R.texts.chat,
                  style: AppFontStyles.styleRegularPoppins15().copyWith(
                      color: R.color.white,
                      fontWeight: FontWeight.bold)),
            )
          ],
        )),
  );
}