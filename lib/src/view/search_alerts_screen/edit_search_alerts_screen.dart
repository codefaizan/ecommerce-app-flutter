import 'package:flutter/material.dart';
import '../../utils/base/resizer/fetch_pixels.dart';
import '../../utils/base/resources/resources.dart';
import '../../utils/base/resources/text_style.dart';
import '../../utils/base/widget_utils.dart';

class EditSearchAlertsScreen extends StatelessWidget{
  final TextEditingController minPriceController = TextEditingController();
  final TextEditingController maxPriceController = TextEditingController();
  final TextEditingController excludeWordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(R.texts.searchAlerts),
          titleTextStyle: AppFontStyles.styleRegularPoppins25
              .copyWith(fontWeight: FontWeight.bold),
          ),

      body: Padding(
        padding: EdgeInsets.all(FetchPixels.getPixelHeight(20)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(R.texts.price, style: AppFontStyles.styleRegularPoppins20.copyWith(fontWeight: FontWeight.bold),),
              getVerSpace(FetchPixels.getPixelHeight(10)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                SizedBox(width: FetchPixels.getWidthPercentSize(40), child: getDefaultTextFieldWithLabel(context, R.texts.min, minPriceController, keyBoardType: TextInputType.number)),
                Text("_"),
                SizedBox(width: FetchPixels.getWidthPercentSize(40), child: getDefaultTextFieldWithLabel(context, R.texts.max, maxPriceController, keyBoardType: TextInputType.number)),
              ],),
              
              getVerSpace(FetchPixels.getPixelHeight(25)),
              Text(R.texts.exclusions+" 0/10", style: AppFontStyles.styleRegularPoppins20.copyWith(fontWeight: FontWeight.bold),),
              getVerSpace(FetchPixels.getPixelHeight(10)),
              Text(R.texts.excludeKeywordsForSearchAlerts, style: AppFontStyles.styleRegularPoppins18,),
              getVerSpace(FetchPixels.getPixelHeight(25)),
              getDefaultTextFiledWithSuffixPrefix(context, R.texts.enterAWordToExclude, excludeWordController, suffix: IconButton(onPressed: (){}, icon: Text(R.texts.add))),
              getVerSpace(FetchPixels.getPixelHeight(50)),
              Center(child: getElevatedButton(R.texts.save.toUpperCase(), () => Navigator.pop(context)))
            ],
          ),
        ),
      ),
    );
  }

}