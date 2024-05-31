import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turtle/src/common_providers/product_provider.dart';
import 'package:turtle/src/common_widgets/product_widget.dart';
import 'package:turtle/src/common_widgets/product_widget_secondary.dart';
import 'package:turtle/src/utils/base/resizer/fetch_pixels.dart';
import 'package:turtle/src/utils/base/widget_utils.dart';
import 'package:turtle/src/utils/routing/route_names.dart';
import 'package:turtle/src/view/purchases_screen/models/product_model.dart';

import '../../utils/base/resources/resources.dart';
import '../../utils/base/resources/text_style.dart';
import '../categories_screen/categories_screen.dart';

class HomeScreen extends StatelessWidget {
  bool isSearchbarVisible = false;
  bool isSearching = false;
  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(
            title: Row(
              children: [
                Text("Pakistan", style: AppFontStyles.styleRegularPoppins22.copyWith(fontWeight: FontWeight.bold, color: R.color.theme)),
                Icon(Icons.location_on, color: R.color.theme, size: FetchPixels.getPixelHeight(25))
              ],
            ),
            leadingWidth: FetchPixels.getPixelWidth(70),
            actions: [
              if(!provider.isHomeSearchEnabled)
              InkWell(
                  onTap: ()=>provider.enableHomeSearch(),
                  child: getAssetImage(R.images.searchIcon)),
              getHorSpace(FetchPixels.getPixelWidth(10)),
              InkWell(onTap: ()=>Navigator.pushNamed(context, RouteNames.notificationsScreen),child: getAssetImage(R.images.notificationIcon)),
              getHorSpace(FetchPixels.getPixelWidth(20))
            ],
          ),

          drawer: Drawer(
              child: CategoriesScreen()
          ),

          body: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
              if(provider.isHomeSearchEnabled)
              SearchBar(
                onChanged: (value) {
                  isSearching = value.isEmpty?false:true;
                  provider.search(value, provider.allProducts);
                },
                leading: Icon(
                  Icons.search,
                  color: R.color.hintText,
                ),
                hintText: R.texts.search,
                hintStyle: MaterialStatePropertyAll(
                    TextStyle(color: R.color.hintText, )),
                elevation: const MaterialStatePropertyAll(0.2),
                side: MaterialStatePropertyAll(BorderSide(color: R.color.blackColor)),
              ),

              getVerSpace(FetchPixels.getPixelHeight(20)),
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: FetchPixels.getPixelHeight(18),
                            horizontal: FetchPixels.getPixelWidth(18)),
                        height: FetchPixels.getPixelHeight(130),
                        width: FetchPixels.width,
                        decoration: BoxDecoration(color: R.color.greyColor,
                            borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(image: AssetImage("assets/images/ad.jpg"),fit: BoxFit.cover)
                        ),
                        // child: Text(R.texts.adsHere,style: AppFontStyles.styleRegularPoppins22
                        //     .copyWith(fontWeight: FontWeight.bold,color: R.colors.whiteColor)),
                      ),
              getVerSpace(FetchPixels.getPixelHeight(10)),
              SizedBox(
                  height: 50,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => FilterChip(
                            label: Text(searchFilters[index],),
                            labelStyle: AppFontStyles.styleRegularPoppins15().copyWith(
                              color: provider.selectedFilter == index?
                                  R.color.white:R.color.blackColor
                            ),
                            showCheckmark: false,
                            color: MaterialStatePropertyAll(provider.selectedFilter==index?R.color.blackColor:R.color.bgColor),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    FetchPixels.getPixelHeight(10)),
                                ),
                            selected: provider.selectedFilter==index?true:false,
                            onSelected: (value) => provider.changeFilterIndex(index),
                          ),
                      separatorBuilder: (context, index) => getHorSpace(10),
                      itemCount: searchFilters.length)),

              getVerSpace(FetchPixels.getPixelHeight(10)),
              Column(
                  children: List.generate(
                      !isSearching? provider.allProducts.length: provider.filteredList.length,
                      (index) => Column(
                            children: [
                              getProductWidget (context,
                                  !isSearching? provider.allProducts[index]:provider.filteredList[index], index, provider: provider, navigationRoute: RouteNames.productDetailScreen),
                              getVerSpace(FetchPixels.getPixelHeight(15))
                            ],
                          ))),
                      getVerSpace(FetchPixels.getPixelHeight(10)),
              Text(
                R.texts.nearbyPlaces,
                style: AppFontStyles.styleRegularPoppins22
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              getVerSpace(FetchPixels.getPixelHeight(10)),
              SizedBox(
                height: FetchPixels.getPixelHeight(250),
                child: ListView.separated(
                  itemCount: demoProductsList.length,
                  scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => getSecondaryProductWidget(context,demoProductsList[index], index), separatorBuilder: (BuildContext context, int index) => getHorSpace(FetchPixels.getPixelWidth(20))),
              )
            ]),
          ),
        );
      },
    );
  }
}

List<String> searchFilters = [
  "All",
  "Nearby Places",
  "Free",
  "Offers Delivery",
  "Free Delivery"
];
