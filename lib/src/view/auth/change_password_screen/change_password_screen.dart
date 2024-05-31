import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turtle/src/utils/base/resizer/fetch_pixels.dart';
import 'package:turtle/src/utils/base/widget_utils.dart';
import 'package:turtle/src/view/auth/providers/auth_provider.dart';
import '../../../utils/base/resources/resources.dart';
import '../../../utils/base/resources/text_style.dart';


class ChangePasswordScreen extends StatefulWidget{
  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController newPassController = TextEditingController();

  TextEditingController currentPassController = TextEditingController();

  TextEditingController confirmPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, provider, child) {


    return Scaffold(
      appBar: AppBar(title: Text(R.texts.changePassword), titleTextStyle: AppFontStyles.styleRegularPoppins25.copyWith(fontWeight: FontWeight.bold)),

      body: Padding(
          padding: EdgeInsets.all(FetchPixels.getPixelHeight(20)),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  getVerSpace(FetchPixels.getPixelHeight(70)),
                  getDefaultTextFieldWithLabel(context, R.texts.currentPassword, currentPassController, validator: (value) => provider.validateEmptyField(value)),
                  getVerSpace(FetchPixels.getPixelHeight(20)),
                  getDefaultTextFieldWithLabel(context, R.texts.newPassword, newPassController, validator: (value) => provider.validatePasswordStrength(value),),
                  getVerSpace(FetchPixels.getPixelHeight(20)),
                  getDefaultTextFieldWithLabel(context, R.texts.confirmPassword, confirmPassController, validator: (value) => provider.validateMatchPassword(value, newPassController, confirmPassController)),
                  getVerSpace(FetchPixels.getPixelHeight(70)),
                  getElevatedButton(R.texts.update.toUpperCase(), () {
                    if(_formKey.currentState!.validate()){
                      Navigator.pop(context);
                    }
                  })
                ],
              ),
            ),
          )
      ),
    );
    },);
  }
}