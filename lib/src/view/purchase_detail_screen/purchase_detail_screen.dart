import 'package:flutter/material.dart';
import 'package:flutter_emoji_feedback/flutter_emoji_feedback.dart';
import 'package:provider/provider.dart';
import 'package:turtle/src/common_providers/product_provider.dart';
import '../../common_widgets/custom_dialog.dart';
import '../../utils/base/resizer/fetch_pixels.dart';
import '../../utils/base/resources/resources.dart';
import '../../utils/base/resources/text_style.dart';
import '../../utils/base/widget_utils.dart';

class PurchaseDetails extends StatelessWidget {
  dynamic data;
  PurchaseDetails({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(builder: (context, provider, child) {
      return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              color: R.color.white,
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_sharp,
              ),
            ),
            backgroundColor: R.color.transparent,
          ),
          extendBodyBehindAppBar: true,
          body: SingleChildScrollView(
              child: Column(children: [
                SizedBox(
                  height: FetchPixels.getPixelHeight(300),
                  child: Stack(alignment: Alignment.bottomCenter, children: [
                    PageView.builder(
                      onPageChanged: (value) {
                        provider.onProductDetailPageViewChange(value);
                      },
                      controller: provider.pageController,
                      itemCount: 5,
                      itemBuilder: (context, index) => getAssetImage(
                          data["productData"].image,
                          boxFit: BoxFit.cover),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(5, (index) {
                        return Container(
                          margin: EdgeInsets.only(
                              right: FetchPixels.getPixelWidth(5),
                              bottom: FetchPixels.getPixelHeight(15)),
                          width: FetchPixels.getPixelHeight(10),
                          height: FetchPixels.getPixelHeight(10),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: provider.currentPage == index
                                ? R.color.theme
                                : R.color.greyColor,
                          ),
                        );
                      }),
                    )
                  ]),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: FetchPixels.getPixelHeight(12),
                      horizontal: FetchPixels.getPixelWidth(18)),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            decoration: BoxDecoration(
                                color: R.color.bgColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                                child: ListTile(
                                    contentPadding: EdgeInsets.symmetric(
                                      horizontal: FetchPixels.getPixelHeight(10),
                                    ),
                                    onTap: () {},
                                    title: Text("Seller Name",
                                        style: AppFontStyles.styleRegularPoppins20
                                            .copyWith(fontWeight: FontWeight.bold)),
                                    subtitle: Text(
                                      "Seller location here",
                                      maxLines: 1,
                                    ),
                                    leading: CircleAvatar(
                                        radius: FetchPixels.getPixelHeight(30),
                                        foregroundImage:
                                        AssetImage(R.images.plantIcon))))),
                        getVerSpace(FetchPixels.getPixelHeight(15)),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(data["productData"].title,
                                      style: AppFontStyles.styleRegularPoppins20
                                          .copyWith(fontWeight: FontWeight.w600)),
                                  Text(data["productData"].category),
                                ],
                              ),
                            ),
                          ],
                        ),
                        getVerSpace(FetchPixels.getPixelHeight(25)),
                        EmojiFeedback(
                          animDuration: const Duration(milliseconds: 300),
                          curve: Curves.easeOut,
                          inactiveElementScale: 0.6,
                          elementSize: FetchPixels.getPixelHeight(45),
                          onChanged: (value) {

                          },
                        ),
                        getVerSpace(FetchPixels.getPixelHeight(35)),
                        Align(
                            alignment: Alignment.center,
                            child: getElevatedButton(
                                R.texts.submit, () {
                              Navigator.pop(context);
                              showDialog(context: context, builder: (context) => customDialog(title: R.texts.reviewSubmitted, subtitle: R.texts.thanksForFeedback),);
                            }))
                      ]),
                )
              ])));
    });
  }
}