import 'package:flutter/material.dart';
import 'package:turtle/src/utils/base/resizer/fetch_pixels.dart';

import '../../utils/base/resources/resources.dart';
import '../../utils/base/resources/text_style.dart';

class AboutusScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(R.texts.aboutUs), titleTextStyle: AppFontStyles.styleRegularPoppins25.copyWith(fontWeight: FontWeight.bold)),

      body: Padding(
        padding: EdgeInsets.all(FetchPixels.getPixelHeight(20)),
        child: Text(R.dummyData.longerText),
      ),
    );
  }

}