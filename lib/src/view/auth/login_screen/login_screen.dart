import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turtle/src/utils/base/resizer/fetch_pixels.dart';
import 'package:turtle/src/utils/base/resources/text_style.dart';
import 'package:turtle/src/utils/base/widget_utils.dart';
import 'package:turtle/src/utils/routing/route_names.dart';
import 'package:turtle/src/view/auth/providers/auth_provider.dart';
import '../../../utils/base/resources/resources.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailInputController = TextEditingController();
  bool isPasswordObscure = true;

  final TextEditingController passwordInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, provider, child) {

    return Scaffold(
      body: Padding(
          padding: EdgeInsets.all(FetchPixels.getPixelHeight(20)),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                getVerSpace(FetchPixels.getPixelHeight(20)),
                getAssetImage(R.images.logo),
                getVerSpace(FetchPixels.getPixelHeight(40)),

                Text(R.texts.login.toUpperCase(),
                    style: AppFontStyles.styleRegularPoppins40.copyWith(fontWeight: FontWeight.bold)
                ),
                getVerSpace(FetchPixels.getPixelHeight(60)),

                getDefaultTextFieldWithLabel(context, R.texts.email, emailInputController, keyBoardType: TextInputType.emailAddress, validator: (value) => provider.validateEmail(value)),
                getVerSpace(FetchPixels.getPixelHeight(10)),
                getDefaultTextFiledWithSuffixPrefix(context, R.texts.password, passwordInputController, keyBoardType: TextInputType.visiblePassword, validator: (value) => provider.validateEmptyField(value),
                    isPass: isPasswordObscure,
                    suffix: IconButton(onPressed: ()=>isPasswordObscure=provider.togglePassword(isPasswordObscure), icon: isPasswordObscure? Icon(Icons.visibility): Icon(Icons.visibility_off))),
                Align(
                  alignment: Alignment.centerRight,
                    child: TextButton(onPressed: ()=>Navigator.pushNamed(context, RouteNames.forgotPasswordScreen), child: Text(R.texts.forgotPasswordQMark, style: AppFontStyles.styleRegularPoppins15().copyWith(color: R.color.theme)))),
                getElevatedButton(R.texts.login.toUpperCase(), () {
                  if(_formKey.currentState!.validate()){
                    Navigator.pushReplacementNamed(context, RouteNames.dashboardScreen);
                  }
                }),
                getVerSpace(FetchPixels.getPixelHeight(20)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Text(R.texts.dontHaveAccount, style: AppFontStyles.styleRegularPoppins18),
                  TextButton(child: Text(R.texts.signup, style: AppFontStyles.styleRegularPoppins18.copyWith(decoration: TextDecoration.underline, decorationColor: R.color.theme, fontWeight: FontWeight.w700, color: R.color.theme)), onPressed: ()=>Navigator.pushReplacementNamed(context, RouteNames.signupScreen)),
                ],)


              ],
            ),
          ),
        ),
      ),
    );
    },);
  }
}
