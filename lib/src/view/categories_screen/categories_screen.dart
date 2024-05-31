import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turtle/src/common_providers/product_provider.dart';
import 'package:turtle/src/utils/base/resizer/fetch_pixels.dart';
import 'package:turtle/src/utils/routing/route_names.dart';
import 'package:turtle/src/view/purchases_screen/models/product_model.dart';

import '../../utils/base/resources/resources.dart';
import '../../utils/base/resources/text_style.dart';
import '../../utils/base/widget_utils.dart';
import '../customize_feed_screen/Models/customize_feed_model.dart';

class CategoriesScreen extends StatefulWidget {
  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  bool isSearchbarVisible = false;

  bool isSearching = false;

  SearchController searchController = SearchController();

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(
      builder: (context, provider, child) {
        return Padding(
          padding: EdgeInsets.all(FetchPixels.getPixelHeight(10)),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Categories',
                      style: AppFontStyles.styleRegularPoppins22
                          .copyWith(fontWeight: FontWeight.bold)),
                  if (!provider.isDrawerSearchEnabled)
                    IconButton(
                        onPressed: () => provider.enableDrawerSearch(),
                        icon: const Icon(Icons.search))
                ],
              ),
              if (provider.isDrawerSearchEnabled)
                SearchBar(
                  controller: searchController,
                  elevation: MaterialStatePropertyAll(0),
                  side: MaterialStatePropertyAll(BorderSide(color: R.color.blackColor)),
                  hintText: R.texts.search,
                  trailing: const [Icon(Icons.search)],
                  onChanged: (value) {
                     provider.search(value, provider.allCategories);
                  },
                ),
              getVerSpace(FetchPixels.getPixelHeight(5)),
              ListView.separated(
                padding: EdgeInsets.only(bottom: FetchPixels.getPixelHeight(20)),
                  shrinkWrap: true,
                  physics: PageScrollPhysics(),
                  itemCount:   searchController.text.isEmpty ?   provider.allCategories.length:provider.filteredList.length,
                  itemBuilder: (context, index) {
                    CustomizeFeedItem data = searchController.text.isEmpty ? provider.allCategories[index]:provider.filteredList[index];
                    return InkWell(
                      onTap: () => Navigator.pushNamed(context, RouteNames.categorySelectScreen, arguments: {"category":data.title}),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                FetchPixels.getPixelHeight(10)),
                            color: R.color.bgColor),
                        child: Row(
                          children: [
                            getAssetImage(data.prefixImage,
                                height: FetchPixels.getPixelHeight(48)),
                            getHorSpace(FetchPixels.getPixelWidth(20)),
                            Text(
                              data.title,
                              style: AppFontStyles.styleRegularPoppins18,
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) =>
                      getVerSpace(FetchPixels.getPixelHeight(10)))

            ],
          ),
        );
      },
    );
  }
}
