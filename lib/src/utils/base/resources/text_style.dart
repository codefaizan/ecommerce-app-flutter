import 'package:flutter/material.dart';
import '../resizer/fetch_pixels.dart';
class AppFontStyles {

  static TextStyle styleRegularPoppins15(){
     return TextStyle(
       fontFamily: "Metropolis",
       decoration: TextDecoration.none,
       fontSize: FetchPixels.getPixelHeight(15),
     );
   }

  static TextStyle styleRegularPoppins7 = TextStyle(
    fontFamily: "Metropolis",
    fontSize: FetchPixels.getPixelHeight(7),
  );
  static TextStyle styleRegularRPoppins12 = TextStyle(
    fontFamily: "Metropolis",
    fontSize: FetchPixels.getPixelHeight(12),
  );
  static TextStyle styleRegularPoppins20 = TextStyle(
    fontFamily: "Metropolis",
    fontSize: FetchPixels.getPixelHeight(20),
  );

  static TextStyle styleRegularPoppins22 = TextStyle(
    fontFamily: "Metropolis",
    fontSize: FetchPixels.getPixelHeight(22),
  );

  static TextStyle styleRegularPoppins40 = TextStyle(
    color: Colors.black,
    fontFamily: "Metropolis",
    fontSize: FetchPixels.getPixelHeight(40),
    fontWeight: FontWeight.w400,
  );

  static TextStyle styleRegularPoppins30 = TextStyle(
    color: Colors.black,
    fontFamily: "Metropolis",
    fontSize: FetchPixels.getPixelHeight(30),
    fontWeight: FontWeight.w400,
  );
  static TextStyle styleRegularPoppins28 = TextStyle(
    color: Colors.black,
    fontFamily: "Metropolis",
    fontSize: FetchPixels.getPixelHeight(28),
    fontWeight: FontWeight.w400,
  );
  static TextStyle styleRegularPoppins25 = TextStyle(
    color: Colors.black,
    fontFamily: "Metropolis",
    fontSize: FetchPixels.getPixelHeight(25),
    fontWeight: FontWeight.w400,
  );
  static TextStyle styleRegularPoppins18 = TextStyle(
    color: Colors.black,
    fontFamily: "Metropolis",
    fontSize: FetchPixels.getPixelHeight(18),
    fontWeight: FontWeight.w400,
  );






  TextStyle styleRegular_24 = TextStyle(
    color: Colors.black,
    fontFamily: "Jost",
    fontSize: FetchPixels.getPixelHeight(24),
  );

  TextStyle styleKronaOneRegular_30 = TextStyle(
    color: Colors.black,
    fontFamily: "Jost",
    fontSize: FetchPixels.getPixelHeight(30),
  );

}