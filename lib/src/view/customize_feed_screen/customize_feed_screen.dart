import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turtle/src/view/customize_feed_screen/Models/customize_feed_model.dart';
import 'package:turtle/src/view/customize_feed_screen/providers/customize_feed_provider.dart';
import 'package:turtle/src/view/customize_feed_screen/widgets/customize_feed_widget.dart';

import '../../utils/base/resizer/fetch_pixels.dart';
import '../../utils/base/resources/resources.dart';
import '../../utils/base/resources/text_style.dart';
import '../../utils/base/widget_utils.dart';
import '../../utils/routing/route_names.dart';

class CustomizeFeedScreen extends StatefulWidget {
  @override
  State<CustomizeFeedScreen> createState() => _CustomizeFeedScreenState();
}

class _CustomizeFeedScreenState extends State<CustomizeFeedScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CustomizeFeedProvider>(builder: (context, provider, child) {
    return Scaffold(
        appBar: AppBar(
            title: Text(R.texts.customizeFeed),
            titleTextStyle: AppFontStyles.styleRegularPoppins25
                .copyWith(fontWeight: FontWeight.bold),
            actions: [
              InkWell(
                  onTap: () => Navigator.pushNamed(
                      context, RouteNames.editSearchAlertsScreen),
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.notifications_none_sharp))),
              getHorSpace(FetchPixels.getPixelWidth(15))
            ]),
        body: Padding(
          padding: EdgeInsets.all(FetchPixels.getPixelHeight(20)),
          child: Column(
            children: [
              Text(
                R.texts.selectCategoriesForHomeFeed,
                style: AppFontStyles.styleRegularPoppins22,
              ),
              getVerSpace(FetchPixels.getPixelHeight(20)),
              Expanded(
                child: ListView.separated(
                  itemCount: categoriesList.length,
                  itemBuilder: (context, index) {
                    CustomizeFeedItem data = provider.items[index];
                    return customizeFeedWidget(data, provider);
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return getVerSpace(
                      FetchPixels.getPixelHeight(15),
                    );
                  },
                ),
              )
            ],
          ),
        ));
    },);
  }
}
