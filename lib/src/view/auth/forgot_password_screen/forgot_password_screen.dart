import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turtle/src/utils/base/resizer/fetch_pixels.dart';
import 'package:turtle/src/utils/base/widget_utils.dart';
import 'package:turtle/src/view/auth/providers/auth_provider.dart';

import '../../../utils/base/resources/resources.dart';
import '../../../utils/base/resources/text_style.dart';

class ForgotPasswordScreen extends StatefulWidget{
  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, provider, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text(R.texts.forgotPassword, style: AppFontStyles.styleRegularPoppins28.copyWith(fontWeight: FontWeight.bold),),
        ),
        body: Padding(
          padding: EdgeInsets.all(FetchPixels.getPixelHeight(25)),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(R.texts.enterEmailForResetLink, style: AppFontStyles.styleRegularPoppins18),
                getVerSpace(FetchPixels.getPixelHeight(30)),
                getDefaultTextFieldWithLabel(context, R.texts.email, emailInputController, validator: (value) => provider.validateEmail(value)),
                getVerSpace(FetchPixels.getPixelHeight(30)),
                getElevatedButton(R.texts.sendLink, () {
                  if(_formKey.currentState!.validate()){
                    Navigator.pop(context);
                  }
                })

              ],
            ),
          ),
        ),
      );
    },);
  }
}