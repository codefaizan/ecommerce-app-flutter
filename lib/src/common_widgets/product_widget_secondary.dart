import 'package:flutter/material.dart';
import 'package:turtle/src/common_providers/product_provider.dart';
import 'package:turtle/src/utils/routing/route_names.dart';

import '../utils/base/resizer/fetch_pixels.dart';
import '../utils/base/resources/resources.dart';
import '../utils/base/resources/text_style.dart';
import '../view/favourites_screen/providers/favourite_provider.dart';
import '../view/purchases_screen/models/product_model.dart';

Widget getSecondaryProductWidget(BuildContext context,Product product, int index){
  return InkWell(
    onTap: ()=> Navigator.pushNamed(context, RouteNames.productDetailScreen, arguments: {"productData":product}),
    child: Container(
      width: FetchPixels.getPixelWidth(170),
      padding: EdgeInsets.all(FetchPixels.getPixelHeight(12)),
      decoration: BoxDecoration(
          color: R.color.bgColor,
          borderRadius: BorderRadius.circular(FetchPixels.getPixelHeight(15))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: FetchPixels.getHeightPercentSize(17),
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(product.image), fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(FetchPixels.getPixelHeight(10))
            ),
          ),
          Text(product.title, style: AppFontStyles.styleRegularPoppins18.copyWith(fontWeight: FontWeight.bold), maxLines: 1,),
          Text(product.location, style: AppFontStyles.styleRegularPoppins15()),
          Align(alignment: Alignment.centerRight, child: Text(product.price, style: AppFontStyles.styleRegularPoppins18.copyWith(fontWeight: FontWeight.w900))),


        ],),
    ),
  );
}