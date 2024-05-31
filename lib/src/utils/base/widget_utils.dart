import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:turtle/src/utils/base/resizer/fetch_pixels.dart';

import 'resources/resources.dart';
import 'constant.dart';

Widget getVerSpace(double verSpace) {
  return SizedBox(
    height: verSpace,
  );
}

Widget getAppbarContainer(
    {double? height,
    bool isBack = false,
    String? text,
    String? image,
    required BuildContext context}) {
  return Container(
      padding: EdgeInsets.all(FetchPixels.getPixelHeight(10)),
      height: height ?? FetchPixels.getPixelHeight(200),
      width: FetchPixels.width,
      decoration: BoxDecoration(
          image: getDecorationAssetImage(
        context,
        fit: BoxFit.cover,
        image!,
      )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          getVerSpace(FetchPixels.getPixelHeight(1)),
          isBack
              ? InkWell(
                  onTap: () {
                    // Get.back();
                  },
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Icon(
                        Icons.arrow_back_rounded,
                        color: R.color.white,
                        size: 27,
                      )))
              : const SizedBox(),
          getVerSpace(FetchPixels.getPixelHeight(1)),
          getCustomFont(text!, 25, R.color.white, 1,
              fontWeight: FontWeight.w600),
        ],
      ));
}

Widget getAssetImage(String image,
    {
      double? width,
    double? height,
    Color? color,
    BoxFit boxFit = BoxFit.contain
    }
    ) {
  return Image.asset(
    image,
    color: color,
    width: width,
    height: height,
    fit: boxFit,
    scale: FetchPixels.getScale(),
  );
}

// Widget getNetworkImage(String image,
//     {double? width,
//     double? height,
//     Color? color,
//     BoxFit boxFit = BoxFit.contain}) {
//   return CircleAvatar(
//     radius: 50,
//     backgroundColor: Colors.transparent,
//     backgroundImage: CachedNetworkImageProvider(
//       image,
//     ),
//   );
// }

Widget getFileImage(File image,
    {double? width,
    double? height,
    Color? color,
    BoxFit boxFit = BoxFit.fill}) {
  return CircleAvatar(
      radius: 45,
      backgroundColor: Colors.transparent,
      child: ClipOval(
        child: Image.file(
          File(image.path),
          color: color,
          width: width,
          height: height,
          fit: boxFit,
          scale: FetchPixels.getScale(),
        ),
      ));
}

Widget getFileImageContainer(File image,
    {double? width,
    double? height,
    Color? color,
    BoxFit boxFit = BoxFit.fill}) {
  return Image.file(
    image,
    color: color,
    width: width,
    height: height,
    fit: boxFit,
    scale: FetchPixels.getScale(),
  );
}

Widget getNetworkImageContainer(String image,
    {double? width,
    double? height,
    Color? color,
    BoxFit boxFit = BoxFit.fill}) {
  return Image.network(
    image,
    color: color,
    width: width,
    height: height,
    fit: boxFit,
    scale: FetchPixels.getScale(),
  );
}

Widget getSvgImage(String image,
    {double? width,
    double? height,
    Color? color,
    BoxFit boxFit = BoxFit.contain}) {
  return SvgPicture.asset(
    Constant.assetImagePath + image,
    color: color,
    width: width,
    height: height,
    fit: boxFit,
  );
}

Widget getPaddingWidget(EdgeInsets edgeInsets, Widget widget) {
  return Padding(
    padding: edgeInsets,
    child: widget,
  );
}

DecorationImage getDecorationAssetImage(BuildContext buildContext, String image,
    {BoxFit fit = BoxFit.contain}) {
  return DecorationImage(
      image: AssetImage((Constant.assetImagePath) + image),
      fit: fit,
      scale: FetchPixels.getScale());
}

Widget getCustomFont(String text, double fontSize, Color fontColor, int maxLine,
    {String fontFamily = Constant.fontsFamily,
    TextOverflow overflow = TextOverflow.ellipsis,
    TextDecoration decoration = TextDecoration.none,
    FontWeight fontWeight = FontWeight.normal,
    TextAlign textAlign = TextAlign.start,
    txtHeight}) {
  return Text(
    text,
    overflow: overflow,
    style: TextStyle(
        decoration: decoration,
        fontSize: fontSize,
        fontStyle: FontStyle.normal,
        color: fontColor,
        fontFamily: fontFamily,
        height: txtHeight,
        fontWeight: fontWeight),
    maxLines: maxLine,
    softWrap: true,
    textAlign: textAlign,
    textScaleFactor: FetchPixels.getTextScale(),
  );
}

Widget getMultilineCustomFont(String text, double fontSize, Color fontColor,
    {String fontFamily = Constant.fontsFamily,
    TextOverflow overflow = TextOverflow.ellipsis,
    TextDecoration decoration = TextDecoration.none,
    FontWeight fontWeight = FontWeight.normal,
    TextAlign textAlign = TextAlign.start,
    txtHeight = 1.0}) {
  return Text(
    text,
    style: TextStyle(
        decoration: decoration,
        fontSize: fontSize,
        fontStyle: FontStyle.normal,
        color: fontColor,
        fontFamily: fontFamily,
        height: txtHeight,
        fontWeight: fontWeight),
    textAlign: textAlign,
    textScaleFactor: FetchPixels.getTextScale(),
  );
}

BoxDecoration getButtonDecoration(
    {BorderRadius? borderRadius,
    LinearGradient? gradient,
    Border? border,
    List<BoxShadow> shadow = const [],
    DecorationImage? image}) {
  return BoxDecoration(
      gradient: gradient,
      borderRadius: borderRadius,
      border: border,
      boxShadow: shadow,
      image: image);
}

Widget getButton(BuildContext context, String text, Color textColor,
    Function function, double fontsize,
    {bool isBorder = false,
    EdgeInsetsGeometry? insetsGeometry,
    borderColor = Colors.transparent,
    FontWeight weight = FontWeight.bold,
    bool isIcon = false,
    String? image,
    Color? imageColor,
    double? imageWidth,
    double? imageHeight,
    bool smallFont = false,
    double? buttonHeight,
    double? buttonWidth,
    List<BoxShadow> boxShadow = const [],
    EdgeInsetsGeometry? insetsGeometrypadding,
    BorderRadius? borderRadius,
    double? borderWidth}) {
  return InkWell(
    onTap: () {
      function();
    },
    child: Container(
      margin: insetsGeometry,
      padding: insetsGeometrypadding,
      width: buttonWidth,
      height: FetchPixels.getPixelHeight(60),
      decoration: getButtonDecoration(
        borderRadius: BorderRadius.circular(11),
        shadow: boxShadow,
        border: (isBorder)
            ? Border.all(color: borderColor, width: borderWidth!)
            : null,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          (isIcon) ? getSvgImage(image!) : getHorSpace(0),
          (isIcon)
              ? getHorSpace(FetchPixels.getPixelHeight(15))
              : getHorSpace(0),
          getCustomFont(text, fontsize, textColor, 1,
              textAlign: TextAlign.center,
              fontWeight: weight,
              fontFamily: Constant.fontsFamily)
        ],
      ),
    ),
  );
}

Widget getButtonWithIcon(BuildContext context, Color bgColor, String text,
    Color textColor, Function function, double fontsize,
    {bool isBorder = false,
    EdgeInsetsGeometry? insetsGeometry,
    borderColor = Colors.transparent,
    FontWeight weight = FontWeight.bold,
    bool prefixIcon = false,
    bool sufixIcon = false,
    String? prefixImage,
    String? suffixImage,
    Color? imageColor,
    double? imageWidth,
    double? imageHeight,
    bool smallFont = false,
    double? buttonHeight,
    double? buttonWidth,
    List<BoxShadow> boxShadow = const [],
    EdgeInsetsGeometry? insetsGeometrypadding,
    BorderRadius? borderRadius,
    double? borderWidth,
    String fontFamily = Constant.fontsFamily}) {
  return InkWell(
    onTap: () {
      function();
    },
    child: Container(
      margin: insetsGeometry,
      padding: insetsGeometrypadding,
      width: buttonWidth,
      height: buttonHeight,
      decoration: BoxDecoration(color: R.color.white
          // gradient: LinearGradient(colors: [R.colors.gradiant1,R.colors.gradiant2],
          //   begin: Alignment.centerLeft,
          //   end: Alignment.centerRight,
          // ),
          ),

      // getButtonDecoration(
      //
      //   borderRadius: borderRadius,
      //   shadow: boxShadow,
      //   border: (isBorder)
      //       ? Border.all(color: borderColor, width: borderWidth!)
      //       : null,
      // ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              getHorSpace(FetchPixels.getPixelHeight(15)),
              (prefixIcon) ? getSvgImage(prefixImage!) : getHorSpace(0),
              (prefixIcon)
                  ? getHorSpace(FetchPixels.getPixelHeight(10))
                  : getHorSpace(0),
              getCustomFont(text, fontsize, textColor, 1,
                  textAlign: TextAlign.center,
                  fontWeight: weight,
                  fontFamily: fontFamily)
            ],
          ),
          Row(
            children: [
              (sufixIcon) ? getSvgImage(suffixImage!) : getHorSpace(0),
              (sufixIcon)
                  ? getHorSpace(FetchPixels.getPixelHeight(15))
                  : getHorSpace(0),
            ],
          )
        ],
      ),
    ),
  );
}

Widget getDefaultTextFieldWithLabel(
    BuildContext context, String s, TextEditingController textEditingController,
    {bool withprefix = false,
    bool withSufix = false,
    int? maxLines,
    int? maxLength,
    int? maxLineNumber,
    bool minLines = false,
    FormFieldValidator? validator,
    EdgeInsetsGeometry margin = EdgeInsets.zero,
    bool isPass = false,
    bool isEnable = true,
    bool isReadOnly = false,
    Color? fillColor,
    double? height,
    double? imageHeight,
    double? imageWidth,
    String? image,
    Widget? suffixIcon,
    void Function()? onTap,
    TextInputAction? textInputAction,
    TextInputType? keyBoardType,
    Function(String)? onChange,
    String? suffiximage,
    Function? imagefunction,
    AlignmentGeometry alignmentGeometry = Alignment.centerLeft,
    List<TextInputFormatter>? inputFormatters,
    bool defFocus = false,
    double? borderRadius,
    FocusNode? focus1}) {
  // FocusNode myFocusNode = (focus1 == null) ? FocusNode() : focus1;
  // Color color = borderColor;

  // return StatefulBuilder(
  //   builder: (context, setState) {
  //     final mqData = MediaQuery.of(context);
  //     final mqDataNew =
  //         mqData.copyWith(textScaler: TextScaler.linear(FetchPixels.getTextScale()));

      return TextFormField(
        maxLength: maxLength,
        onTap: onTap,
        cursorColor: R.color.theme,
        readOnly: isReadOnly,
        textInputAction: textInputAction,
        keyboardType: keyBoardType,
        onChanged: onChange,
        validator: validator,
        enabled: isEnable ? true : false,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        inputFormatters: inputFormatters,
        maxLines: maxLines ?? 1,
        controller: textEditingController,
        autofocus: false,
        obscureText: isPass,
        style: TextStyle(
            color: R.color.blackColor,
            fontWeight: FontWeight.w500,
            fontSize: FetchPixels.getPixelHeight(20),
            fontFamily: Constant.fontsFamily),
        decoration: InputDecoration(
            suffixIcon: suffixIcon,
            filled: true,
            fillColor: fillColor,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                  Radius.circular(FetchPixels.getPixelHeight(borderRadius ?? 10))),
              borderSide: BorderSide(
                width: 1,
                color: R.color.theme,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                  Radius.circular(FetchPixels.getPixelHeight(borderRadius ?? 10))),
              borderSide:
                  BorderSide(width: 1, color: R.color.greyColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                  Radius.circular(FetchPixels.getPixelHeight(borderRadius ?? 10))),
              borderSide:
                  BorderSide(width: 1, color: R.color.greyColor),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                  Radius.circular(FetchPixels.getPixelHeight(borderRadius ?? 10))),
              borderSide:
              BorderSide(width: 1, color: R.color.redColor),
            ),
            border: OutlineInputBorder(
              borderSide:
                  BorderSide(width: 1, color: R.color.greyColor),
              borderRadius: BorderRadius.all(
                  Radius.circular(FetchPixels.getPixelHeight(borderRadius ?? 10))),
            ),
            isDense: true,
            // border: InputBorder.none,
            hintText: s,
            hintStyle: TextStyle(
                color: R.color.hintText,
                fontWeight: FontWeight.w300,
                fontSize: FetchPixels.getPixelHeight(15),
                fontFamily: Constant.fontsFamily)
        ),
      );
    // },
  // );
}

Widget getDefaultTextFiledWithSuffixPrefix(
    BuildContext context, String s, TextEditingController textEditingController,
    {bool withprefix = false,
    bool withSufix = false,
    bool maxLines = false,
    int? maxLineNumber,
    bool minLines = false,
    FormFieldValidator? validator,
    EdgeInsetsGeometry margin = EdgeInsets.zero,
    bool isPass = false,
    bool isEnable = true,
    bool isReadOnly = false,
    Color? fillColor,
    TextInputType? keyBoardType,
    Function(String)? onChange,
    Widget? suffix,
      Widget? prefix,
    Function? imagefunction,
    AlignmentGeometry alignmentGeometry = Alignment.centerLeft,
    List<TextInputFormatter>? inputFormatters,
    bool defFocus = false,
    FocusNode? focus1}) {
  // FocusNode myFocusNode = (focus1 == null) ? FocusNode() : focus1;
  // Color color = borderColor;

  // return StatefulBuilder(
  //   builder: (context, setState) {
  //     final mqData = MediaQuery.of(context);
  //     final mqDataNew =
  //         mqData.copyWith(textScaler: TextScaler.linear(FetchPixels.getTextScale()));

      return TextFormField(
        cursorColor: R.color.theme,
        readOnly: isReadOnly,
        keyboardType: keyBoardType,
        onChanged: onChange,
        validator: validator,
        enabled: isEnable ? true : false,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        inputFormatters: inputFormatters,
        maxLines: (minLines)
            ? null
            : maxLines
                ? maxLineNumber!
                : 1,
        controller: textEditingController,
        obscuringCharacter: "*",
        autofocus: false,
        obscureText: isPass,
        style: TextStyle(
            color: R.color.blackColor,
            fontWeight: FontWeight.w500,
            fontSize: FetchPixels.getPixelHeight(20),
            fontFamily: Constant.fontsFamily),
        decoration: InputDecoration(
            suffixIcon: suffix,
            prefix: prefix,
            filled: true,
            fillColor: fillColor,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                  Radius.circular(FetchPixels.getPixelHeight(9))),
              borderSide: BorderSide(
                width: 1,
                color: R.color.theme,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                  Radius.circular(FetchPixels.getPixelHeight(9))),
              borderSide:
                  BorderSide(width: 1, color: R.color.greyColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                  Radius.circular(FetchPixels.getPixelHeight(9))),
              borderSide:
                  BorderSide(width: 1, color: R.color.greyColor),
            ),
            border: OutlineInputBorder(
              borderSide:
                  BorderSide(width: 1, color: R.color.greyColor),
              borderRadius: BorderRadius.all(
                  Radius.circular(FetchPixels.getPixelHeight(9))),
            ),
            isDense: true,
            // border: InputBorder.none,
            hintText: s,
            hintStyle: TextStyle(
                color: R.color.hintText,
                fontWeight: FontWeight.w300,
                fontSize: FetchPixels.getPixelHeight(15),
                fontFamily: Constant.fontsFamily)),
      );
  //   },
  // );
}

Widget getPaymentTextField(
    BuildContext context, String s, TextEditingController textEditingController,
    {bool withprefix = false,
    bool withSufix = false,
    bool minLines = false,
    EdgeInsetsGeometry margin = EdgeInsets.zero,
    bool isPass = false,
    bool isEnable = true,
    double? height,
    double? imageHeight,
    double? imageWidth,
    String? image,
    String? suffiximage,
    Function? imagefunction,
    // AlignmentGeometry alignmentGeometry = Alignment.centerLeft,
    List<TextInputFormatter>? inputFormatters,
    int? maxLength}) {
  FocusNode myFocusNode = FocusNode();
  return StatefulBuilder(
    builder: (context, setState) {
      final mqData = MediaQuery.of(context);
      final mqDataNew =
          mqData.copyWith(textScaleFactor: FetchPixels.getTextScale());

      return AbsorbPointer(
        absorbing: isEnable,
        child: Focus(
          onFocusChange: (hasFocus) {
            if (hasFocus) {
              setState(() {
                myFocusNode.canRequestFocus = true;
              });
            } else {
              setState(() {
                myFocusNode.canRequestFocus = false;
              });
            }
          },
          child: Container(
            height: height,
            margin: margin,
            // alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                      // color: textFieldShadow,
                      blurRadius: 17,
                      offset: Offset(0, 4)),
                ],
                borderRadius:
                    BorderRadius.circular(FetchPixels.getPixelHeight(12))),
            child: MediaQuery(
              data: mqDataNew,
              child: Row(
                children: [
                  (!withprefix)
                      ? getHorSpace(FetchPixels.getPixelHeight(16))
                      : Padding(
                          padding: EdgeInsets.only(
                              right: FetchPixels.getPixelHeight(8),
                              left: FetchPixels.getPixelHeight(18)),
                          child: getSvgImage(image!,
                              height: FetchPixels.getPixelHeight(24),
                              width: FetchPixels.getPixelHeight(24)),
                        ),
                  Expanded(
                    child: TextField(
                      maxLength: maxLength,
                      inputFormatters: inputFormatters,
                      maxLines: (minLines) ? null : 1,
                      controller: textEditingController,
                      obscuringCharacter: "*",
                      autofocus: false,
                      obscureText: isPass,
                      showCursor: false,
                      focusNode: myFocusNode,
                      onTap: () {
                        // function();
                      },
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          fontFamily: Constant.fontsFamily),
                      decoration: InputDecoration(
                          counterText: "",
                          border: InputBorder.none,
                          hintText: s,
                          hintStyle: const TextStyle(
                              // color: textColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              fontFamily: Constant.fontsFamily)),
                    ),
                  ),
                  (!withSufix)
                      ? getHorSpace(FetchPixels.getPixelHeight(16))
                      : Padding(
                          padding: EdgeInsets.only(
                              right: FetchPixels.getPixelHeight(14),
                              left: FetchPixels.getPixelHeight(12)),
                          child: InkWell(
                            onTap: () {
                              if (imagefunction != null) {
                                imagefunction();
                              }
                            },
                            child: getSvgImage(suffiximage!,
                                height: FetchPixels.getPixelHeight(24),
                                width: FetchPixels.getPixelHeight(24)),
                          ),
                        ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}

Widget getRichText(
    String firstText,
    Color firstColor,
    FontWeight firstWeight,
    double firstSize,
    String secondText,
    Color secondColor,
    FontWeight secondWeight,
    double secondSize,
    {TextAlign textAlign = TextAlign.center,
    double? txtHeight}) {
  return RichText(
    textAlign: textAlign,
    text: TextSpan(
        text: firstText,
        style: TextStyle(
          color: firstColor,
          fontWeight: firstWeight,
          fontFamily: Constant.fontsFamily,
          fontSize: firstSize,
          height: txtHeight,
        ),
        children: [
          TextSpan(
              text: secondText,
              style: TextStyle(
                  color: secondColor,
                  fontWeight: secondWeight,
                  fontFamily: Constant.fontsFamily,
                  fontSize: secondSize,
                  height: txtHeight))
        ]), textScaler: TextScaler.linear(FetchPixels.getTextScale()),
  );
}

Widget getCardDateTextField(
  BuildContext context,
  String s,
  TextEditingController textEditingController,
  Color fontColor, {
  bool minLines = false,
  EdgeInsetsGeometry margin = EdgeInsets.zero,
  bool isPass = false,
  bool isEnable = true,
  double? height,
  required Function function,
}) {
  FocusNode myFocusNode = FocusNode();
  return StatefulBuilder(
    builder: (context, setState) {
      final mqData = MediaQuery.of(context);
      final mqDataNew =
          mqData.copyWith(textScaleFactor: FetchPixels.getTextScale());

      return AbsorbPointer(
        absorbing: isEnable,
        child: Container(
          height: height,
          margin: margin,
          alignment: Alignment.centerLeft,
          padding:
              EdgeInsets.symmetric(horizontal: FetchPixels.getPixelHeight(18)),
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0.0, 4.0)),
              ],
              borderRadius:
                  BorderRadius.circular(FetchPixels.getPixelHeight(12))),
          child: Focus(
              onFocusChange: (hasFocus) {
                if (hasFocus) {
                  setState(() {
                    myFocusNode.canRequestFocus = true;
                  });
                } else {
                  setState(() {
                    myFocusNode.canRequestFocus = false;
                  });
                }
              },
              child: MediaQuery(
                data: mqDataNew,
                child: TextField(
                  maxLines: (minLines) ? null : 1,
                  controller: textEditingController,
                  obscuringCharacter: "*",
                  autofocus: false,
                  focusNode: myFocusNode,
                  obscureText: isPass,
                  showCursor: false,
                  onTap: () {
                    function();
                  },
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      fontFamily: Constant.fontsFamily),
                  // textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      border: InputBorder.none,
                      hintText: s,
                      hintStyle: const TextStyle(
                          // color: textColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          fontFamily: Constant.fontsFamily)),
                ),
              )),
        ),
      );
    },
  );
}

class CardNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    var inputText = newValue.text;

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    var bufferString = StringBuffer();
    for (int i = 0; i < inputText.length; i++) {
      bufferString.write(inputText[i]);
      var nonZeroIndexValue = i + 1;
      if (nonZeroIndexValue % 4 == 0 && nonZeroIndexValue != inputText.length) {
        bufferString.write(' ');
      }
    }

    var string = bufferString.toString();
    return newValue.copyWith(
      text: string,
      selection: TextSelection.collapsed(
        offset: string.length,
      ),
    );
  }
}

Widget getCardEditText(BuildContext context, String s,
    TextEditingController textEditingController, Color fontColor,
    {bool withprefix = false,
    bool withSufix = false,
    bool minLines = false,
    EdgeInsetsGeometry margin = EdgeInsets.zero,
    bool isPass = false,
    bool isEnable = true,
    double? height,
    double? imageHeight,
    double? imageWidth,
    String? image,
    String? suffiximage,
    required Function function,
    Function? imagefunction}) {
  FocusNode myFocusNode = FocusNode();
  return StatefulBuilder(
    builder: (context, setState) {
      final mqData = MediaQuery.of(context);
      final mqDataNew =
          mqData.copyWith(textScaleFactor: FetchPixels.getTextScale());

      return AbsorbPointer(
        absorbing: isEnable,
        child: Container(
          height: height,
          margin: margin,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0.0, 4.0)),
              ],
              borderRadius:
                  BorderRadius.circular(FetchPixels.getPixelHeight(12))),
          child: Focus(
              onFocusChange: (hasFocus) {
                if (hasFocus) {
                  setState(() {
                    myFocusNode.canRequestFocus = true;
                  });
                } else {
                  setState(() {
                    myFocusNode.canRequestFocus = false;
                  });
                }
              },
              child: MediaQuery(
                data: mqDataNew,
                child: TextField(
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    CardNumberFormatter(),
                  ],
                  maxLines: (minLines) ? null : 1,
                  controller: textEditingController,
                  maxLength: 19,
                  obscuringCharacter: "*",
                  autofocus: false,
                  focusNode: myFocusNode,
                  obscureText: isPass,
                  showCursor: false,
                  onTap: () {
                    function();
                  },
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      fontFamily: Constant.fontsFamily),
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                      counterText: "",
                      prefixIcon: (withprefix)
                          ? Padding(
                              padding: EdgeInsets.only(
                                  right: FetchPixels.getPixelHeight(12),
                                  left: FetchPixels.getPixelHeight(18)),
                              child: getSvgImage(image!,
                                  height: FetchPixels.getPixelHeight(24),
                                  width: FetchPixels.getPixelHeight(24)),
                            )
                          : null,
                      suffixIcon: (withSufix)
                          ? Padding(
                              padding: EdgeInsets.only(
                                  right: FetchPixels.getPixelHeight(18),
                                  left: FetchPixels.getPixelHeight(12)),
                              child: InkWell(
                                onTap: () {
                                  imagefunction!();
                                },
                                child: getSvgImage(suffiximage!,
                                    height: FetchPixels.getPixelHeight(24),
                                    width: FetchPixels.getPixelHeight(24)),
                              ),
                            )
                          : null,
                      border: InputBorder.none,
                      hintText: s,
                      hintStyle: const TextStyle(
                          // color: textColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          fontFamily: Constant.fontsFamily)),
                ),
              )),
        ),
      );
    },
  );
}

Widget getCountryTextField(BuildContext context, String s,
    TextEditingController textEditingController, String code,
    {bool withprefix = false,
    bool withSufix = false,
    bool minLines = false,
    EdgeInsetsGeometry margin = EdgeInsets.zero,
    bool isPass = false,
    bool isEnable = true,
    double? height,
    String? image,
    required Function function,
    Function? imagefunction}) {
  FocusNode myFocusNode = FocusNode();
  // Color color = borderColor;
  return StatefulBuilder(
    builder: (context, setState) {
      final mqData = MediaQuery.of(context);
      final mqDataNew =
          mqData.copyWith(textScaleFactor: FetchPixels.getTextScale());

      return AbsorbPointer(
        absorbing: isEnable,
        child: Focus(
          onFocusChange: (hasFocus) {
            if (hasFocus) {
              setState(() {
                // color = blueColor;
                myFocusNode.canRequestFocus = true;
              });
            } else {
              setState(() {
                // color = borderColor;
                myFocusNode.canRequestFocus = false;
              });
            }
          },
          child: Container(
            height: height,
            margin: margin,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                    // color: color,
                    width: FetchPixels.getPixelHeight(1)),
                borderRadius:
                    BorderRadius.circular(FetchPixels.getPixelHeight(12))),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                getHorSpace(FetchPixels.getPixelHeight(18)),
                getAssetImage(image!,
                    width: FetchPixels.getPixelHeight(24),
                    height: FetchPixels.getPixelHeight(24)),
                getHorSpace(FetchPixels.getPixelHeight(12)),
                getCustomFont(code, 16, Colors.black, 1,
                    fontWeight: FontWeight.w400,
                    fontFamily: Constant.fontsFamily),
                getSvgImage("down_arrow.svg"),
                getHorSpace(FetchPixels.getPixelHeight(20)),
                Expanded(
                  child: MediaQuery(
                    data: mqDataNew,
                    child: TextField(
                      readOnly: !isEnable,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      maxLines: (minLines) ? null : 1,
                      controller: textEditingController,
                      obscuringCharacter: "*",
                      autofocus: false,
                      focusNode: myFocusNode,
                      obscureText: isPass,
                      showCursor: false,
                      onTap: () {
                        function();
                      },
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          fontFamily: Constant.fontsFamily),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          border: InputBorder.none,
                          hintText: s,
                          hintStyle: const TextStyle(
                              // color: textColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              fontFamily: Constant.fontsFamily)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

Widget getSearchWidget(
    BuildContext context,
    TextEditingController searchController,
    Function filterClick,
    ValueChanged<String> onChanged,
    {bool withPrefix = true,
    List<BoxShadow>? boxShadow,
    bool isborder = true,
    String hint = "Search"}) {
  double height = FetchPixels.getPixelHeight(50);
  FocusNode myFocusNode = FocusNode();
  return StatefulBuilder(
    builder: (context, setState) {
      final mqData = MediaQuery.of(context);
      final mqDataNew =
          mqData.copyWith(textScaleFactor: FetchPixels.getTextScale());
      return Container(
        width: double.infinity,
        height: height,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            color: Colors.white,
            border: isborder == true
                ? Border.all(
                    // color: borderColor,
                    width: FetchPixels.getPixelHeight(1))
                : null,
            borderRadius: BorderRadius.circular(FetchPixels.getPixelHeight(15)),
            boxShadow: boxShadow),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  right: FetchPixels.getPixelHeight(9),
                  left: FetchPixels.getPixelHeight(16)),
              child: getSvgImage("serach.svg",
                  height: FetchPixels.getPixelHeight(18),
                  width: FetchPixels.getPixelHeight(18)),
            ),
            Expanded(
              flex: 1,
              child: MediaQuery(
                  data: mqDataNew,
                  child: TextField(
                    onTap: () {
                      filterClick();
                    },
                    autofocus: false,
                    onChanged: onChanged,
                    focusNode: myFocusNode,
                    textInputAction: TextInputAction.search,
                    controller: searchController,
                    decoration: InputDecoration(
                        isDense: true,
                        hintText: hint,
                        border: InputBorder.none,
                        hintStyle: const TextStyle(
                            // color: textColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            fontFamily: Constant.fontsFamily)),
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        fontFamily: Constant.fontsFamily),
                    textAlign: TextAlign.start,
                    maxLines: 1,
                  )),
            ),
            getHorSpace(FetchPixels.getPixelHeight(3)),
          ],
        ),
      );
    },
  );
}

Widget getsearchVehicle(
    BuildContext context,
    TextEditingController searchController,
    Function filterClick,
    ValueChanged<String> onChanged,
    {bool withPrefix = true}) {
  double height = FetchPixels.getPixelHeight(56);
  return StatefulBuilder(
    builder: (context, setState) {
      final mqData = MediaQuery.of(context);
      final mqDataNew =
          mqData.copyWith(textScaleFactor: FetchPixels.getTextScale());
      return AbsorbPointer(
        absorbing: false,
        child: Container(
          width: double.infinity,
          height: height,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                  // color: borderColor,
                  width: FetchPixels.getPixelHeight(1)),
              borderRadius:
                  BorderRadius.circular(FetchPixels.getPixelHeight(12))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              getHorSpace(FetchPixels.getPixelHeight(15)),
              Expanded(
                flex: 1,
                child: MediaQuery(
                    data: mqDataNew,
                    child: TextField(
                      onTap: () {
                        filterClick();
                      },
                      autofocus: false,
                      onChanged: onChanged,
                      textInputAction: TextInputAction.search,
                      controller: searchController,
                      decoration: const InputDecoration(
                          hintText: "OLA s1",
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                              // color: textColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              fontFamily: Constant.fontsFamily)),
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          fontFamily: Constant.fontsFamily),
                      textAlign: TextAlign.start,
                      maxLines: 1,
                    )),
              ),
              Padding(
                padding: EdgeInsets.only(
                    right: FetchPixels.getPixelHeight(15),
                    left: FetchPixels.getPixelHeight(15)),
                child: getSvgImage("serach.svg",
                    height: FetchPixels.getPixelHeight(24),
                    width: FetchPixels.getPixelHeight(24)),
              ),
            ],
          ),
        ),
      );
    },
  );
}

Widget gettoolbarMenu(BuildContext context, String image, Function function,
    {bool istext = false,
    double? fontsize,
    String? title,
    Color? textColor,
    FontWeight? weight,
    String fontFamily = Constant.fontsFamily,
    bool isrightimage = false,
    String? rightimage,
    Function? rightFunction,
    bool isleftimage = true}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      (isleftimage)
          ? InkWell(
              onTap: () {
                function();
              },
              child: getSvgImage(image,
                  height: FetchPixels.getPixelHeight(24),
                  width: FetchPixels.getPixelHeight(24)))
          : Container(),
      Expanded(
        child: Container(
          alignment: Alignment.center,
          child: (istext)
              ? getCustomFont(title!, fontsize!, textColor!, 1,
                  fontWeight: weight!, fontFamily: fontFamily)
              : null,
        ),
      ),
      (isrightimage)
          ? InkWell(
              onTap: () {
                rightFunction!();
              },
              child: getSvgImage(rightimage!,
                  height: FetchPixels.getPixelHeight(24),
                  width: FetchPixels.getPixelHeight(24)))
          : Container(),
    ],
  );
}

Widget withoutleftIconToolbar(BuildContext context,
    {bool istext = false,
    double? fontsize,
    String? title,
    Color? textColor,
    FontWeight? weight,
    String fontFamily = Constant.fontsFamily,
    bool isrightimage = false,
    String? rightimage,
    Function? rightFunction}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        child: Container(
          alignment: Alignment.center,
          child: (istext)
              ? getCustomFont(title!, fontsize!, textColor!, 1,
                  fontWeight: weight!, fontFamily: fontFamily)
              : null,
        ),
      ),
      (isrightimage)
          ? InkWell(
              onTap: () {
                rightFunction!();
              },
              child: getSvgImage(rightimage!,
                  height: FetchPixels.getPixelHeight(24),
                  width: FetchPixels.getPixelHeight(24)))
          : Container(),
    ],
  );
}

Widget getHorSpace(double verSpace) {
  return SizedBox(
    width: verSpace,
  );
}

Widget getDivider(Color color, double height, double thickness) {
  return Divider(
    color: color,
    height: height,
    thickness: thickness,
  );
}

ElevatedButton getElevatedButton(String text, void Function()? onPressed, {Color? foregroundColor, Color? backgroundColor, Size? minSize, OutlinedBorder? shape}){
  return ElevatedButton(onPressed: onPressed, child: Text(text),style: ElevatedButton.styleFrom(
    foregroundColor: foregroundColor,
    backgroundColor: backgroundColor,
    minimumSize: minSize ?? Size(FetchPixels.getWidthPercentSize(70) ,FetchPixels.getPixelHeight(45)),
    shape: shape
  ),);
}
