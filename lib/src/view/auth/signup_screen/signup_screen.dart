import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turtle/src/utils/base/resizer/fetch_pixels.dart';
import 'package:turtle/src/utils/base/widget_utils.dart';
import 'package:turtle/src/utils/routing/route_names.dart';
import 'package:turtle/src/view/auth/providers/auth_provider.dart';

import '../../../utils/base/resources/resources.dart';
import '../../../utils/base/resources/text_style.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameInputController = TextEditingController();
  final TextEditingController phoneInputController = TextEditingController();
  final TextEditingController emailInputController = TextEditingController();
  final TextEditingController confirmPassInputController =
      TextEditingController();
  final TextEditingController passwordInputController = TextEditingController();
  bool isPasswordObscure = true;
  bool isConfirmPasswordObscure = true;

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.all(FetchPixels.getPixelHeight(20)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  getVerSpace(FetchPixels.getPixelHeight(20)),
                  getAssetImage(R.images.logo),
                  getVerSpace(FetchPixels.getPixelHeight(40)),
                  Text(R.texts.signup.toUpperCase(),
                      style: AppFontStyles.styleRegularPoppins40
                          .copyWith(fontWeight: FontWeight.bold)),
                  getVerSpace(FetchPixels.getPixelHeight(80)),
                  Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          getDefaultTextFieldWithLabel(
                            context,
                            R.texts.name,
                            nameInputController,
                            keyBoardType: TextInputType.text,
                            validator: (value) =>
                                provider.validateEmptyField(value),
                          ),
                          getVerSpace(FetchPixels.getPixelHeight(10)),
                          getDefaultTextFieldWithLabel(context,
                              R.texts.phoneNumber, phoneInputController,
                              keyBoardType: TextInputType.phone,
                              validator: (value) =>
                                  provider.validatePhoneNumber(value)),
                          getVerSpace(FetchPixels.getPixelHeight(10)),
                          getDefaultTextFieldWithLabel(
                              context, R.texts.email, emailInputController,
                              keyBoardType: TextInputType.emailAddress,
                              validator: (value) =>
                                  provider.validateEmail(value)),
                          getVerSpace(FetchPixels.getPixelHeight(10)),
                          getDefaultTextFiledWithSuffixPrefix(context,
                              R.texts.password, passwordInputController,
                              keyBoardType: TextInputType.visiblePassword,
                              validator: (value) =>
                                  provider.validatePasswordStrength(value),
                              isPass: isPasswordObscure,
                              suffix: IconButton(
                                  onPressed: () {
                                    isPasswordObscure = provider
                                        .togglePassword(isPasswordObscure);
                                  },
                                  icon: (!isPasswordObscure)?Icon(Icons.visibility):Icon(Icons.visibility_off))),
                          getVerSpace(FetchPixels.getPixelHeight(10)),
                          getDefaultTextFiledWithSuffixPrefix(
                              context,
                              R.texts.confirmPassword,
                              confirmPassInputController,
                              keyBoardType: TextInputType.visiblePassword,
                              validator: (value) =>
                                  provider.validateMatchPassword(
                                      value,
                                      passwordInputController,
                                      confirmPassInputController),
                              isPass: isConfirmPasswordObscure,
                              suffix: IconButton(
                                  onPressed: () {
                                    isConfirmPasswordObscure = provider
                                        .togglePassword(isConfirmPasswordObscure);
                                  },
                                  icon: (!isConfirmPasswordObscure)?Icon(Icons.visibility):Icon(Icons.visibility_off))),
                        ],
                      )),
                  getVerSpace(FetchPixels.getPixelHeight(80)),
                  getElevatedButton(R.texts.signup.toUpperCase(), () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pushReplacementNamed(
                          context, RouteNames.dashboardScreen);
                    }
                  }),
                  getVerSpace(FetchPixels.getPixelHeight(10)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(R.texts.alreadyHaveAccount),
                      TextButton(
                          child: Text(R.texts.login,
                              style: AppFontStyles.styleRegularPoppins18.copyWith(
                                  color: R.color.theme,
                                  decorationColor: R.color.theme,
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.w700)),
                          onPressed: () => Navigator.pushReplacementNamed(
                              context, RouteNames.loginScreen)),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
