import 'package:flutter/material.dart';
import 'package:turtle/src/utils/base/resizer/fetch_pixels.dart';
import 'package:turtle/src/utils/base/widget_utils.dart';

import '../../utils/base/resources/resources.dart';
import '../../utils/base/resources/text_style.dart';

class FaqsScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(R.texts.faqs), titleTextStyle: AppFontStyles.styleRegularPoppins25.copyWith(fontWeight: FontWeight.bold)),
      
      body: Padding(padding: EdgeInsets.all(FetchPixels.getPixelHeight(20)),
      child: ListView(
        children: [
          Text("Hi Faizan, \nhow can we help ?", style: AppFontStyles.styleRegularPoppins28.copyWith(fontWeight: FontWeight.bold)),
          getVerSpace(FetchPixels.getPixelHeight(20)),
          SearchBar(elevation: MaterialStatePropertyAll(0), side: MaterialStatePropertyAll(BorderSide(color: Colors.grey)), hintText: R.texts.searchHowTo, hintStyle: MaterialStatePropertyAll(AppFontStyles.styleRegularPoppins20.copyWith(color: R.color.hintText)), leading: Icon(Icons.search, color: R.color.hintText),padding: MaterialStatePropertyAll(EdgeInsets.only(left: FetchPixels.getPixelWidth(20), right: FetchPixels.getPixelWidth(10))),),
          getVerSpace(FetchPixels.getPixelHeight(20)),
          Text(R.texts.faqs, style: AppFontStyles.styleRegularPoppins28.copyWith(fontWeight: FontWeight.bold)),

          ExpansionTile(title: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("How do i list an item for sale?"),
              Divider()
            ],
          ), shape: const CircleBorder(), 
            childrenPadding: EdgeInsets.symmetric(horizontal: FetchPixels.getPixelHeight(20)),
            children: [Text(R.dummyData.mediumText)],),
          ExpansionTile(title: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("How do i list an item for sale?"),
              Divider()
            ],
          ), shape: const CircleBorder(),
              childrenPadding: EdgeInsets.symmetric(horizontal: FetchPixels.getPixelHeight(20)),
              children: [Text(R.dummyData.mediumText)]),
          ExpansionTile(title: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("How do i list an item for sale?"),
              Divider()
            ],
          ), shape: const CircleBorder(),
              childrenPadding: EdgeInsets.symmetric(horizontal: FetchPixels.getPixelHeight(20)),
              children: [Text(R.dummyData.mediumText)]),
          ExpansionTile(title: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("How do i list an item for sale?"),
              Divider()
            ],
          ), shape: const CircleBorder(),
              childrenPadding: EdgeInsets.symmetric(horizontal: FetchPixels.getPixelHeight(20)),
              children: [Text(R.dummyData.mediumText)]),

          Text(R.texts.searchByCategory, style: AppFontStyles.styleRegularPoppins28.copyWith(fontWeight: FontWeight.bold)),
          ExpansionTile(title: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Account"),
              Divider()
            ],
          ), shape: const CircleBorder(),
              childrenPadding: EdgeInsets.symmetric(horizontal: FetchPixels.getPixelHeight(20)),
              children: [Text(R.dummyData.mediumText)]),
          ExpansionTile(title: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Promotions"),
              Divider()
            ],
          ), shape: const CircleBorder(),
              childrenPadding: EdgeInsets.symmetric(horizontal: FetchPixels.getPixelHeight(20)),
              children: [Text(R.dummyData.mediumText)]),
        ],
      ),
      ),
    );
  }

}