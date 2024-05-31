import 'dart:async';
import 'package:flutter/material.dart';
import 'package:turtle/src/utils/base/widget_utils.dart';
import '../utils/base/resizer/fetch_pixels.dart';
import '../utils/base/resources/resources.dart';
import '../utils/base/resources/text_style.dart';

class customDialog extends StatefulWidget {
  final String title;
  final String subtitle;
  const customDialog({super.key, required this.title, required this.subtitle});

  @override
  State<customDialog> createState() => _customDialogState();
}

class _customDialogState extends State<customDialog> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
      Navigator.pop(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Stack(alignment: Alignment.center, children: [
        Container(
          margin: EdgeInsets.only(top: FetchPixels.getPixelHeight(42)),
          padding: EdgeInsets.only(
              top: FetchPixels.getPixelHeight(90),
              bottom: FetchPixels.getPixelHeight(20)),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(12)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.title,
                style: AppFontStyles.styleRegularPoppins25
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              getVerSpace(FetchPixels.getPixelHeight(15)),
              Padding(
                  padding: EdgeInsets.only(
                      left: FetchPixels.getPixelHeight(35),
                      right: FetchPixels.getPixelWidth(30)),
                  child: Text(
                    widget.subtitle,
                    textAlign: TextAlign.center,
                    style: AppFontStyles.styleRegularPoppins18,
                  ))
            ],
          ),
        ),
        Positioned(
            top: FetchPixels.getPixelHeight(0),
            child: Image(
              image: AssetImage(R.images.successDialog),
              height: FetchPixels.getPixelHeight(100),
            )),
      ]),
    );
  }
}