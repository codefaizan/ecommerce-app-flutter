import 'package:flutter/material.dart';
import 'package:turtle/src/common_providers/product_provider.dart';
import 'package:turtle/src/utils/base/widget_utils.dart';
import 'package:turtle/src/utils/routing/route_names.dart';
import 'package:turtle/src/view/purchases_screen/models/product_model.dart';
import '../utils/base/resizer/fetch_pixels.dart';
import '../utils/base/resources/resources.dart';
import '../utils/base/resources/text_style.dart';
import '../view/chats_screen/models/chat_model.dart';
import '../view/chats_screen/screens/messages_screen.dart';

Widget getProductWidget(BuildContext context, Product product, int index,
    {ProductProvider? provider, required String navigationRoute}) {
  return InkWell(
    onTap: () => Navigator.pushNamed(context, navigationRoute,
        arguments: {
          "productData": product,
        }),
    child: Container(
      height: FetchPixels.getPixelHeight(130),
      padding: EdgeInsets.all(FetchPixels.getPixelHeight(10)),
      decoration: BoxDecoration(
          color: R.color.bgColor,
          borderRadius: BorderRadius.circular(FetchPixels.getPixelHeight(10))),
      child: Row(
        children: [
          Container(
            height: double.infinity,
            width: FetchPixels.getWidthPercentSize(25),
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(product.image),
                  fit: BoxFit.cover,
                ),
                borderRadius:
                    BorderRadius.circular(FetchPixels.getPixelHeight(10))),
          ),
          getHorSpace(FetchPixels.getPixelWidth(10)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Flexible(
                        child: Text(
                      product.title,
                      maxLines: 2,
                      style: AppFontStyles.styleRegularPoppins18
                          .copyWith(fontWeight: FontWeight.bold),
                    )),
                    if (product.isOwner == false && provider != null)
                      InkWell(
                          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => MessagesScreen(chatData: demoChatDataList[0]),)),
                          child: getAssetImage(R.images.chatsActive, height: FetchPixels.getPixelHeight(30)))
                  ],
                ),
                Text(product.price,
                    style: AppFontStyles.styleRegularPoppins15()
                        .copyWith(fontWeight: FontWeight.bold)),
                Text(product.description,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppFontStyles.styleRegularPoppins15())
              ],
            ),
          )
        ],
      ),
    ),
  );
}
