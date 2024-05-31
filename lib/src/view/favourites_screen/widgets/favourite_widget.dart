import 'package:flutter/material.dart';
import 'package:turtle/src/utils/base/resizer/fetch_pixels.dart';
import 'package:turtle/src/view/favourites_screen/providers/favourite_provider.dart';
import '../../../utils/base/resources/resources.dart';
import '../../../utils/base/resources/text_style.dart';
import '../../../utils/routing/route_names.dart';
import '../../purchases_screen/models/product_model.dart';

Widget getFavouriteWidget(BuildContext context,Product product, int index, FavouriteProvider provider){
  return InkWell(
    onTap: ()=>Navigator.pushNamed(context, RouteNames.productDetailScreen, arguments: {"productData":product}),
    child: Container(
      // padding: EdgeInsets.all(FetchPixels.getPixelHeight(7)),
      decoration: BoxDecoration(
        color: R.color.bgColor,
        borderRadius: BorderRadius.circular(FetchPixels.getPixelHeight(15))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Stack(children: [
          Container(
            margin: EdgeInsets.only(top: FetchPixels.getPixelHeight(7), right: FetchPixels.getPixelWidth(7), left: FetchPixels.getPixelWidth(7)),
            height: FetchPixels.getPixelHeight(150),
            // width: FetchPixels.getPixelHeight(100),
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(product.image), fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(FetchPixels.getPixelHeight(10))
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: Container(
              padding: EdgeInsets.all(FetchPixels.getPixelHeight(5)),
              decoration: BoxDecoration(
                color: R.color.white,
                borderRadius: BorderRadius.circular(FetchPixels.getPixelHeight(10)),
                boxShadow: [BoxShadow(color: R.color.blackColor, blurRadius: 4, offset: Offset(-3.0, 3.0))]

              ),
              child: InkWell(onTap: () => provider.toggleFavourite(index),child: Icon(product.isFavourite? Icons.favorite:Icons.favorite_border_rounded, color: product.isFavourite?R.color.redColor:R.color.blackColor,)),
            ),
          )
        ],),
        Padding(
          padding: EdgeInsets.all(FetchPixels.getPixelHeight(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(product.title, style: AppFontStyles.styleRegularPoppins18.copyWith(fontWeight: FontWeight.w600), maxLines: 1,),
              Text(product.location, style: AppFontStyles.styleRegularPoppins15()),
              Align(alignment: Alignment.centerRight, child: Text(product.price, style: AppFontStyles.styleRegularPoppins18.copyWith(fontWeight: FontWeight.w900))),
            ],
          ),
        ),


      ],),
    ),
  );
}