import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turtle/src/utils/base/resizer/fetch_pixels.dart';
import 'package:turtle/src/utils/base/widget_utils.dart';
import 'package:turtle/src/view/new_listing_screen/providers/new_listing_provider.dart';
import '../../utils/base/resources/resources.dart';
import 'dart:io';

import '../../utils/base/resources/text_style.dart';


class NewListingScreen extends StatelessWidget {
  TextEditingController prodNameController = TextEditingController();
  TextEditingController priceTextController = TextEditingController();
  TextEditingController descriptionTextController = TextEditingController();
  bool isOpenToOffers = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<NewListingProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(R.texts.newListing),
            titleTextStyle: AppFontStyles.styleRegularPoppins25
                .copyWith(fontWeight: FontWeight.bold),
          ),
          body: Padding(
              padding: EdgeInsets.all(FetchPixels.getPixelHeight(15)),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        provider.pickImage();
                      },
                      child: Container(
                        width: FetchPixels.getPixelHeight(180),
                        height: FetchPixels.getPixelHeight(180),
                        decoration: BoxDecoration(
                            color: R.color.bgColor,
                            borderRadius: BorderRadius.circular(
                                FetchPixels.getPixelHeight(12))),
                        child: Icon(
                          Icons.camera_alt_outlined,
                          size: 70,
                          color: R.color.greyColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: (provider.pickedImages!.isNotEmpty)
                          ? FetchPixels.getHeightPercentSize(13)
                          : 0,
                      child: ListView.builder(
                        itemCount: provider.pickedImages!.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Stack(
                            children: [
                              Container(
                                width: FetchPixels.getWidthPercentSize(22),
                                margin: EdgeInsets.only(
                                    right: FetchPixels.getPixelWidth(10),
                                    top: FetchPixels.getPixelHeight(7)),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                      image: FileImage(File(provider.pickedImages![index].path)),
                                      fit: BoxFit.cover),
                                ),
                              ),
                              Positioned(
                                  top: FetchPixels.getPixelHeight(-12),
                                  right: FetchPixels.getPixelWidth(-11),
                                  child: IconButton(
                                    constraints: BoxConstraints.tight(
                                        Size.fromRadius(
                                            FetchPixels.getPixelHeight(12))),
                                    onPressed: () => provider.removeImage(index),
                                    icon: getAssetImage("assets/icons/cross_icon.png", color: R.color.theme),
                                    padding: EdgeInsets.zero,
                                    alignment: Alignment.topRight,
                                  ))
                            ],
                          );
                        },
                      ),
                    ),
                    getVerSpace(FetchPixels.getPixelHeight(15)),
                    Text(R.texts.productName,
                        style: AppFontStyles.styleRegularPoppins18
                            .copyWith(fontWeight: FontWeight.w600)),
                    getDefaultTextFieldWithLabel(
                        context, R.texts.productNameHere, prodNameController),
                    getVerSpace(FetchPixels.getPixelHeight(15)),
                    Text(R.texts.listingType,
                        style: AppFontStyles.styleRegularPoppins18
                            .copyWith(fontWeight: FontWeight.w600)),
                    Row(
                      children: [
                        ElevatedButton(
                            onPressed: () => provider.toggleProductType(false),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: !provider.isFree
                                    ? R.color.blackColor
                                    : R.color.greyColor),
                            child: Text(R.texts.forSale)),
                        getHorSpace(FetchPixels.getPixelWidth(10)),
                        ElevatedButton(
                          onPressed: () => provider.toggleProductType(true),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: provider.isFree
                                  ? R.color.blackColor
                                  : R.color.greyColor),
                          child: Text(R.texts.free),
                        )
                      ],
                    ),
                    getVerSpace(FetchPixels.getPixelHeight(15)),
                    if (!provider.isFree)...[
                      Text(R.texts.price,
                          style: AppFontStyles.styleRegularPoppins18
                              .copyWith(fontWeight: FontWeight.w600)),
                      getVerSpace(FetchPixels.getPixelHeight(10)),
                      getDefaultTextFieldWithLabel(
                          context, R.texts.price, priceTextController),
                      CheckboxListTile(
                        onChanged: (value) {
                          isOpenToOffers = value!;
                          provider.notify();
                        },
                        activeColor: R.color.theme,
                        value: isOpenToOffers,
                        title: Text(
                          R.texts.openToOffers,
                          style: AppFontStyles.styleRegularPoppins15()
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        controlAffinity: ListTileControlAffinity.leading,
                        contentPadding: EdgeInsets.zero,
                      ),
                      getVerSpace(FetchPixels.getPixelHeight(15))
                    ],
                    Text(R.texts.description,
                        style: AppFontStyles.styleRegularPoppins18
                            .copyWith(fontWeight: FontWeight.w600)),
                    getVerSpace(FetchPixels.getPixelHeight(10)),
                    getDefaultTextFieldWithLabel(context,
                        R.texts.tellUsAboutYourItem, descriptionTextController,
                        maxLines: 4),
                    getVerSpace(FetchPixels.getPixelHeight(10)),
                    Center(
                        child: getElevatedButton(
                            R.texts.post.toUpperCase(), ()=> Navigator.pop(context)))
                  ],
                ),
              )),
        );
      },
    );
  }
}
