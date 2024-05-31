import 'package:flutter/material.dart';
import 'package:turtle/src/common_widgets/product_widget.dart';
import 'package:turtle/src/utils/base/widget_utils.dart';
import 'package:turtle/src/utils/routing/route_names.dart';
import 'package:turtle/src/view/purchases_screen/models/product_model.dart';

import '../../utils/base/resizer/fetch_pixels.dart';
import '../../utils/base/resources/resources.dart';
import '../../utils/base/resources/text_style.dart';

class NotificationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(R.texts.notifications),
            titleTextStyle: AppFontStyles.styleRegularPoppins25
                .copyWith(fontWeight: FontWeight.bold)),
        body: Padding(
          padding: EdgeInsets.all(FetchPixels.getPixelHeight(15)),
          child: DefaultTabController(
            length: 2,
            child: Column(
              children: [
                TabBar(
                    indicatorSize: TabBarIndicatorSize.tab,
                    labelColor: R.color.blackColor,
                    labelStyle: AppFontStyles.styleRegularPoppins18
                        .copyWith(fontWeight: FontWeight.bold),
                    unselectedLabelColor: R.color.greyColor,
                    indicatorColor: R.color.blackColor,
                    tabs: [
                      Tab(child: Text(R.texts.active)),
                      Tab(child: Text(R.texts.searchAlerts))
                    ]),
                Expanded(
                  child: TabBarView(children: [
                    ListView.separated(
                        shrinkWrap: true,
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              CircleAvatar(
                                  radius: FetchPixels.getPixelHeight(23),
                                  foregroundImage:
                                      AssetImage(R.images.plantIcon)),
                              getHorSpace(FetchPixels.getPixelWidth(20)),
                              const Flexible(
                                  child: Text(
                                      "Hi Arslan, check out your new badge “Early bird” now! ")),
                            ],
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) =>
                            getVerSpace(FetchPixels.getPixelHeight(10))),
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: demoProductsList.length,
                        itemBuilder: (context, index) => getProductWidget(
                            context, demoProductsList[index], index, navigationRoute: RouteNames.productDetailScreen)),
                  ]),
                )
              ],
            ),
          ),
        ));
  }
}
