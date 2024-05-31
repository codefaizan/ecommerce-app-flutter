import 'package:flutter/material.dart';
import 'package:turtle/src/utils/base/resizer/fetch_pixels.dart';
import 'package:turtle/src/utils/base/widget_utils.dart';
import 'package:turtle/src/utils/routing/route_names.dart';
import 'package:turtle/src/view/search_alerts_screen/Models/search_alert_model.dart';

import '../../utils/base/resources/resources.dart';
import '../../utils/base/resources/text_style.dart';

class SearchAlertsScreen extends StatefulWidget {
  @override
  State<SearchAlertsScreen> createState() => _SearchAlertsScreenState();
}

class _SearchAlertsScreenState extends State<SearchAlertsScreen> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
            title: Text(R.texts.searchAlerts),
            titleTextStyle: AppFontStyles.styleRegularPoppins25
                .copyWith(fontWeight: FontWeight.bold),
            actions: [
              InkWell(onTap: () => Navigator.pushNamed(context, RouteNames.editSearchAlertsScreen), child: Text('Edit')),
              getHorSpace(FetchPixels.getPixelWidth(15))
            ]),
        body: Padding(
          padding: EdgeInsets.all(
            FetchPixels.getPixelHeight(20),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SearchBar(
                  controller: controller,
                  leading: const Icon(Icons.search),
                  trailing: [
                    TextButton(
                        onPressed: () {
                          if (controller.text.isEmpty) return;
                          demoAlertsList
                              .add(SearchAlert(title: controller.text));
                          controller.clear();
                          setState(() {});
                        },
                        child: Text(
                          R.texts.create,
                          style: AppFontStyles.styleRegularPoppins18.copyWith(
                              color: R.color.hintText,
                              fontWeight: FontWeight.w600),
                        ))
                  ],
                  elevation: MaterialStatePropertyAll(0.3),
                  hintText: R.texts.enterASearchWord,
                  hintStyle: MaterialStatePropertyAll(
                      AppFontStyles.styleRegularPoppins18),
                ),
                SizedBox(
                  height: FetchPixels.getHeightPercentSize(40),
                  child: ListView.separated(
                    itemCount: demoAlertsList.length,
                    itemBuilder: (context, index) {
                      SearchAlert data = demoAlertsList[index];
                      return ListTile(
                          title: Text(data.title),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              getAssetImage(R.images.settingIcon),
                              getHorSpace(FetchPixels.getPixelWidth(10)),
                              InkWell(
                                  onTap: () {
                                    demoAlertsList.removeAt(index);
                                    setState(() {});
                                  },
                                  child: getAssetImage(R.images.deleteIcon))
                            ],
                          ));
                    },
                    separatorBuilder: (context, index) => const Divider(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
