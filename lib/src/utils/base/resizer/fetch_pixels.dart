import 'dart:async';

import 'package:flutter/material.dart';

import '../device_util.dart';

class FetchPixels {
  static double mockupWidth = 390;
  static double mockupHeight = 888;
  static double width = 0;
  static double height = 0;
  int count=0;

  FetchPixels(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    print("${width}:${height}");
  }

  static double getHeightPercentSize(double percent) {
    return (percent * height) / 100;
  }

  static double getWidthPercentSize(double percent) {
    return (percent * width) / 100;
  }

  static double getPixelWidth(double val) {
    return val / mockupWidth * width;
  }

  static double getPixelHeight(double val) {
    return val / mockupHeight * height;
  }

  static double getDefaultHorSpace(BuildContext context) {
    return FetchPixels.getPixelWidth(20);
  }

  static double getTextScale() {
    double textScaleFactor =
        (width > height) ? width / mockupWidth : height / mockupHeight;
    if (DeviceUtil.isTablet) {
      textScaleFactor = height / mockupHeight;
    }

    return textScaleFactor;
  }

  static double getScale() {
    double scale =
        (width > height) ? mockupWidth / width : mockupHeight / height;

    if (DeviceUtil.isTablet) {
      scale = height / mockupHeight;
    }

    return scale;
  }
}
