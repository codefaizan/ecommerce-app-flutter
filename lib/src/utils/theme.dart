import 'package:flutter/material.dart';
import 'base/resizer/fetch_pixels.dart';
import 'base/resources/resources.dart';
import 'base/resources/text_style.dart';

class DefaultTheme{
  static ThemeData getDefaultTheme(){
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: R.color.theme),
      scaffoldBackgroundColor: R.color.white,
      appBarTheme: AppBarTheme(backgroundColor: R.color.white),
      fontFamily: "Metropolis",
      useMaterial3: true,
      inputDecorationTheme: InputDecorationTheme(
          fillColor: R.color.bgColor,
        contentPadding:
        EdgeInsets.symmetric(vertical: FetchPixels.getPixelHeight(15), horizontal: FetchPixels.getPixelWidth(10)),
        hintStyle: AppFontStyles.styleRegularPoppins15(),
        errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: R.color.theme,
              foregroundColor: R.color.white,

              // minimumSize: Size(FetchPixels.getWidthPercentSize(70) ,FetchPixels.getPixelHeight(55)),
              shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(FetchPixels.getPixelHeight(8))),
              textStyle: TextStyle(fontSize: FetchPixels.getPixelHeight(17) )
          )
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
            foregroundColor: R.color.theme,
            side:
            BorderSide(color: R.color.theme, width: 2),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(FetchPixels.getPixelHeight(8))),
            minimumSize: Size.fromHeight(FetchPixels.getPixelHeight(45)),
            textStyle: TextStyle(fontSize: FetchPixels.getPixelHeight(24) )
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          splashFactory: NoSplash.splashFactory,
        )
      ),
      actionIconTheme: ActionIconThemeData(
        backButtonIconBuilder: (context) => Icon(Icons.arrow_back_ios),
      )



    );
  }
}