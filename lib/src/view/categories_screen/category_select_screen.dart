import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turtle/src/common_providers/product_provider.dart';
import 'package:turtle/src/common_widgets/product_widget.dart';
import 'package:turtle/src/utils/base/resizer/fetch_pixels.dart';
import 'package:turtle/src/utils/routing/route_names.dart';
import 'package:turtle/src/view/purchases_screen/models/product_model.dart';

import '../../utils/base/resources/resources.dart';
import '../../utils/base/resources/text_style.dart';
import '../../utils/base/widget_utils.dart';

class CategorySelectScreen extends StatelessWidget {
  final dynamic data;
  const CategorySelectScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(builder: (context, provider, child) {


    return Scaffold(
      appBar: AppBar(
        title: Text(data["category"], style: AppFontStyles.styleRegularPoppins20.copyWith(fontWeight: FontWeight.bold)),
        actions: [InkWell(onTap: ()=>Navigator.pushNamed(context, RouteNames.notificationsScreen),child: getAssetImage(R.images.notificationIcon)), getHorSpace(FetchPixels.getPixelWidth(10))],
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(FetchPixels.getPixelHeight(20)),
          child: Column(
            children: List.generate(demoProductsList.length, (index) => getProductWidget(context, demoProductsList[index], index, navigationRoute: RouteNames.productDetailScreen, provider: provider)),
          ),
        ),
      ),
    );
    },);
  }
}
