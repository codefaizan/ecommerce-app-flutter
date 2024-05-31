import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turtle/src/common_providers/product_provider.dart';
import 'package:turtle/src/common_widgets/product_widget.dart';
import 'package:turtle/src/utils/base/resizer/fetch_pixels.dart';
import 'package:turtle/src/utils/base/widget_utils.dart';
import 'package:turtle/src/utils/routing/route_names.dart';
import 'package:turtle/src/view/purchases_screen/models/product_model.dart';

import '../../utils/base/resources/resources.dart';
import '../../utils/base/resources/text_style.dart';

class ListingsScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(builder: (context, provider, child) {

    return Scaffold(
      appBar: AppBar(
        title: Text(R.texts.listings),
        titleTextStyle: AppFontStyles.styleRegularPoppins25
            .copyWith(fontWeight: FontWeight.bold),),

      body: Padding(
        padding: EdgeInsets.all(FetchPixels.getPixelHeight(20)),
        child: Column(

          children: [
            Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
  TextButton(onPressed: ()=>Navigator.pushNamed(context, RouteNames.newListingScreen), child: Text(R.texts.post), style: TextButton.styleFrom(backgroundColor: R.color.theme, foregroundColor: R.color.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(FetchPixels.getPixelHeight(10)))),),

  CircleAvatar(foregroundImage: AssetImage(R.images.plantIcon), radius: FetchPixels.getPixelHeight(35),),
],),
            DefaultTabController(
              length: 3,
              child: Column(
                children: [
                  TabBar(
                    indicatorSize: TabBarIndicatorSize.tab,
                    padding: EdgeInsets.symmetric(vertical: FetchPixels.getPixelHeight(15)),
                    labelColor: R.color.blackColor,
                    labelStyle: AppFontStyles.styleRegularPoppins20.copyWith(fontWeight: FontWeight.bold),
                    unselectedLabelStyle: AppFontStyles.styleRegularPoppins20.copyWith(fontWeight: FontWeight.bold),
                    unselectedLabelColor: R.color.greyColor,
                    indicatorColor: R.color.blackColor,
                    dividerHeight: 0,
                    tabs: [
                    Tab(child: Text(R.texts.active)),
                    Tab(child: Text(R.texts.sold)),
                    Tab(child: Text(R.texts.reserved)),
                  ],
                  ),
                  SizedBox(
                    height: FetchPixels.height/1.65,
                    child: TabBarView(
                      physics: const NeverScrollableScrollPhysics(),
                        children: [
                      ListView.separated(itemCount: demoProductsList.length,itemBuilder: (context, index) => getProductWidget(context, demoProductsList[index], index,provider: provider, navigationRoute: RouteNames.productDetailScreen), separatorBuilder: (BuildContext context, int index) => getVerSpace(FetchPixels.getPixelHeight(15))),

                      ListView.separated(itemCount: demoProductsList.length,itemBuilder: (context, index) => getProductWidget(context, demoProductsList[index], index, provider: provider, navigationRoute: RouteNames.productDetailScreen), separatorBuilder: (BuildContext context, int index) => getVerSpace(FetchPixels.getPixelHeight(15))),

                      ListView.separated(itemCount: demoProductsList.length,itemBuilder: (context, index) => getProductWidget(context, demoProductsList[index], index, provider: provider, navigationRoute: RouteNames.productDetailScreen), separatorBuilder: (BuildContext context, int index) => getVerSpace(FetchPixels.getPixelHeight(15))),
                    ]),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
    },);
  }
}




