import 'resources.dart';
import 'package:flutter/material.dart';

class AppDecorations {
  InputDecoration textFormFieldDecoration(
    Widget? suffix,
    String hintText,
  ) {
    return InputDecoration(

      suffixIcon: suffix,
      isDense: true,
      // labelStyle: AppFontStyles.regularMontserrat(),
      floatingLabelBehavior: FloatingLabelBehavior.never,
      focusedBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(6)),
        borderSide: BorderSide(
          width: 1,
          color: R.color.theme,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(6)),
        borderSide: BorderSide(width: 1, color: R.color.borderColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(6)),
        borderSide: BorderSide(width: 1, color: R.color.borderColor),
      ),
      border: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: R.color.borderColor),
          borderRadius: const BorderRadius.all(Radius.circular(4))),
      filled: true,
      fillColor: R.color.white,
      focusColor: R.color.theme,
      hintText: hintText,

      // hintStyle: AppFontStyles
          // .mediumMontserrat()
          // .copyWith(fontSize: 13, color: R.colors.hintText),


      //  border: OutlineInputBorder()
    );
  }
}
