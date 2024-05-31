import 'package:flutter/material.dart';
import 'package:turtle/src/utils/base/widget_utils.dart';
import 'package:turtle/src/utils/routing/route_names.dart';
import 'package:turtle/src/view/profile_screen/models/profile_data_model.dart';
import 'package:turtle/src/view/purchases_screen/models/product_model.dart';

import '../../utils/base/resizer/fetch_pixels.dart';
import '../../utils/base/resources/resources.dart';
import '../../utils/base/resources/text_style.dart';

class ProfileScreen extends StatefulWidget{
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(R.texts.profile, style: AppFontStyles.styleRegularPoppins25.copyWith(fontWeight: FontWeight.bold),),
        actions: [TextButton(onPressed: ()=>Navigator.pushNamed(context, RouteNames.editProfileScreen).then((value) => setState((){})),
            style: TextButton.styleFrom(padding: EdgeInsets.zero,backgroundColor: R.color.greyColor, foregroundColor: R.color.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
            child: Text(R.texts.edit)),],
      ),

      body: Padding(
        padding: EdgeInsets.all(FetchPixels.getPixelHeight(10)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(demoProfileData.name, style: AppFontStyles.styleRegularPoppins22.copyWith(fontWeight: FontWeight.bold),),
                      Text(R.texts.notVerifiedYet, style: AppFontStyles.styleRegularPoppins15().copyWith(color: R.color.greyColor),),
                      getVerSpace(FetchPixels.getPixelHeight(10)),
                      Row(
                        children: [
                          Icon(Icons.favorite, color: R.color.greyColor,),
                          getHorSpace(FetchPixels.getPixelWidth(5)),
                          Text("2 reviews"),
                        ],
                      ),
                    ],
                  ),
                  CircleAvatar(foregroundImage: AssetImage(R.images.plantIcon), radius: FetchPixels.getPixelHeight(45),),
                ],
              ),

              getVerSpace(FetchPixels.getPixelHeight(20)),

              Container(
                padding: EdgeInsets.all(FetchPixels.getPixelHeight(6)),
                decoration: BoxDecoration(
                  color: R.color.bgColor,
                  borderRadius: BorderRadius.circular(FetchPixels.getPixelHeight(8))
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.file_upload_outlined),
                    getHorSpace(FetchPixels.getPixelWidth(5)),
                    Text(R.texts.shareProfile),
              ],),
              ),

              getVerSpace(FetchPixels.getPixelHeight(20)),
              Divider(),
              Text("3 Items", style: AppFontStyles.styleRegularPoppins15().copyWith(fontWeight: FontWeight.w600),),
              getVerSpace(FetchPixels.getPixelHeight(20)),
              SizedBox(
                height: FetchPixels.getPixelHeight(150),
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => getAssetImage(demoProductsList[0].image), separatorBuilder: (context, index) => getHorSpace(20), itemCount: 3),
              ),

              getVerSpace(FetchPixels.getPixelHeight(20)),
              Divider(),
              getVerSpace(FetchPixels.getPixelHeight(20)),

              Text(R.texts.reviews, style: AppFontStyles.styleRegularPoppins15().copyWith(fontWeight: FontWeight.w600)),
              getVerSpace(FetchPixels.getPixelHeight(20)),
              ListView.separated(
                itemCount: 5,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(foregroundImage: AssetImage(R.images.plantIcon), radius: FetchPixels.getPixelHeight(35),),
                  Column(children: [
                    Text("User", style: AppFontStyles.styleRegularPoppins18.copyWith(fontWeight: FontWeight.bold),),
                    getHorSpace(FetchPixels.getPixelWidth(60)),
                    Icon(Icons.emoji_emotions_outlined, color: Colors.yellow, size: FetchPixels.getPixelHeight(50),),
                  ],),
                  const Spacer(),
                  Text("4 mo", style: AppFontStyles.styleRegularPoppins15().copyWith(color: R.color.greyColor),)
                ],),
                separatorBuilder: (BuildContext context, int index) { return Divider(color: R.color.greyColor,); },
              )
            ],
          ),
        ),
      ),
    );
  }
}