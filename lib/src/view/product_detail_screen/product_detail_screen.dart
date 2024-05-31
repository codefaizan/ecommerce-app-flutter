import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turtle/src/common_providers/product_provider.dart';
import 'package:turtle/src/common_widgets/product_widget.dart';
import 'package:turtle/src/common_widgets/product_widget_secondary.dart';
import 'package:turtle/src/utils/base/resizer/fetch_pixels.dart';
import 'package:turtle/src/utils/base/widget_utils.dart';
import 'package:turtle/src/utils/routing/route_names.dart';
import 'package:turtle/src/view/product_detail_screen/widgets/detail_screen_bottom.dart';
import 'package:turtle/src/view/purchases_screen/models/product_model.dart';

import '../../utils/base/resources/resources.dart';
import '../../utils/base/resources/text_style.dart';

class ProductDetailScreen extends StatelessWidget{
  dynamic data;
  ProductDetailScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(builder: (context, provider, child) {
      print("build");

    return Scaffold(
      appBar: AppBar(backgroundColor: R.color.transparent, leading: BackButton(color: R.color.white),),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                SizedBox(
                  height: FetchPixels.getHeightPercentSize(40),
                  child: PageView.builder(
                    controller: provider.pageController,
                    onPageChanged: (value) => provider.onProductDetailPageViewChange(value),
                    itemCount: 3,
                    itemBuilder: (context, index) => getAssetImage(data["productData"].image, boxFit: BoxFit.cover),
                  )
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(3, (index) {
                    return Container(
                      margin: EdgeInsets.only(
                          right: FetchPixels.getPixelWidth(5),
                          bottom: FetchPixels.getPixelHeight(15)),
                      width: FetchPixels.getPixelHeight(10),
                      height: FetchPixels.getPixelHeight(10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: provider.currentPage == index
                            ? R.color.theme
                            : R.color.greyColor,
                      ),
                    );
                  }),
                )
              ],
            ),
        
            Padding(
              padding: EdgeInsets.all(FetchPixels.getPixelHeight(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(leading: CircleAvatar(
                      radius: FetchPixels.getPixelHeight(37),
                      foregroundImage: AssetImage(data["productData"].image)),
                    title: Text("Seller Name", style: AppFontStyles.styleRegularPoppins18.copyWith(fontWeight: FontWeight.w700),),
                    subtitle: Text("Seller location here..."),
                    tileColor: R.color.bgColor,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(FetchPixels.getPixelHeight(10))),
                  ),

                  getVerSpace(FetchPixels.getPixelHeight(10)),


                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(data["productData"].title, style: AppFontStyles.styleRegularPoppins20.copyWith(fontWeight: FontWeight.w600)),
                            Text(data["productData"].category),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Column(
                            children: [
                              getAssetImage(R.images.eyeIcon),
                              Text("10")
                            ],
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(Icons.favorite,color: R.color.redColor),
                              ),
                              Text("10")
                            ],
                          ),
                          Column(
                            children: [
                              getAssetImage(R.images.commentsIcon),
                              Text("10")
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
        

        
                  getVerSpace(FetchPixels.getPixelHeight(15)),
                  
                  Text(R.texts.whereToMeet, style: AppFontStyles.styleRegularPoppins18.copyWith(fontWeight: FontWeight.bold),),
                  getVerSpace(FetchPixels.getPixelHeight(10)),
                  getAssetImage("assets/images/demo_map.png"),
                  
                  Text(R.texts.description, style: AppFontStyles.styleRegularPoppins18.copyWith(fontWeight: FontWeight.bold)),
                  Text(data["productData"].description),
                  getVerSpace(FetchPixels.getPixelHeight(10)),
                  SizedBox(
                    height: FetchPixels.getPixelHeight(249),
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => getSecondaryProductWidget(context,demoProductsList[index], index), separatorBuilder: (BuildContext context, int index) => getHorSpace(FetchPixels.getPixelWidth(10)), itemCount: demoProductsList.length,
                    ),
                  ),
                  getVerSpace(FetchPixels.getPixelHeight(15)),
                  Text(R.texts.relatedItems, style: AppFontStyles.styleRegularPoppins18.copyWith(fontWeight: FontWeight.bold),),
                  getVerSpace(FetchPixels.getPixelHeight(10)),
                  Column(
                      children: List.generate(
                          demoProductsList.length,
                              (index) => Column(
                            children: [
                              getProductWidget (context,
                                  demoProductsList[index], index, navigationRoute: RouteNames.productDetailScreen),
                              getVerSpace(FetchPixels.getPixelHeight(15))
                            ],
                          ))),
                ],
              ),
            )
          ],
        ),
      ),

        bottomNavigationBar: productDetailBottomBar(context,provider, data)
    );
    },);
  }

}