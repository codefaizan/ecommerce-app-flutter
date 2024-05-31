import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turtle/src/utils/base/resizer/fetch_pixels.dart';
import 'package:turtle/src/utils/routing/route_names.dart';
import 'package:turtle/src/view/favourites_screen/providers/favourite_provider.dart';
import 'package:turtle/src/view/favourites_screen/widgets/favourite_widget.dart';
import 'package:turtle/src/view/purchases_screen/models/product_model.dart';

import '../../utils/base/resources/resources.dart';
import '../../utils/base/resources/text_style.dart';

class FavouritesScreen extends StatelessWidget{
  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<FavouriteProvider>(builder: (context, provider, child) {

    return Scaffold(
      appBar: AppBar(
        title: Text(R.texts.favourites),
        titleTextStyle: AppFontStyles.styleRegularPoppins25
            .copyWith(fontWeight: FontWeight.bold),),

      body: Padding(
        padding: EdgeInsets.all(FetchPixels.getPixelHeight(20)),
        child: GridView.builder(
          itemCount: demoProductsList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: FetchPixels.getPixelWidth(10), mainAxisExtent: FetchPixels.getPixelHeight(240), mainAxisSpacing: FetchPixels.getPixelWidth(10)),
          itemBuilder: (context, index) => getFavouriteWidget(context,demoProductsList[index], index, provider)
        ),
      ),
    );
    },);
  }
}