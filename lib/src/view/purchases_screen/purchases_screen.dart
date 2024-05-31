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

class PurchasesScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(builder: (context, provider, child) {


    return Scaffold(
      appBar: AppBar(
          title: Text(R.texts.purchases),
          titleTextStyle: AppFontStyles.styleRegularPoppins25
              .copyWith(fontWeight: FontWeight.bold),),

      body: Padding(
        padding: EdgeInsets.all(FetchPixels.getPixelHeight(20)),
        child: ListView.separated(
          itemCount: demoProductsList.length,
          itemBuilder: (context, index) {
          return getProductWidget(context,demoProductsList[index], index, provider: provider, navigationRoute: RouteNames.purchaseDetailScreen);
        },
          separatorBuilder: (BuildContext context, int index) {return getVerSpace(FetchPixels.getPixelHeight(15));},
        ),
      ),
    );
    },);
  }

}