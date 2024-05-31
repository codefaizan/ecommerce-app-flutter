import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:turtle/src/utils/base/widget_utils.dart';

import '../src/utils/base/resizer/fetch_pixels.dart';
import '../src/utils/base/resources/resources.dart';

class AddCustomers extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _customerDisplayController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  AddCustomers({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Customers', style: TextStyle(fontSize: FetchPixels.getPixelHeight(25), fontWeight: FontWeight.bold,),),
      ),
      
      body: Padding(
        padding: EdgeInsets.all(FetchPixels.getPixelHeight(10)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Customer Type', style: TextStyle(fontSize: FetchPixels.getPixelHeight(15), fontWeight: FontWeight.w600,fontFamily: "Jost"),),
              Row(
                children: [
                  customerTypeInputWidget('Business'),
                  customerTypeInputWidget('Individual'),
                  Spacer()
                ],
              ),
              Text('Name', style: TextStyle(fontSize: FetchPixels.getPixelHeight(15), fontWeight: FontWeight.w600,fontFamily: "Jost"),),
              customTextFromFieldWidget(controller: _nameController),
              getVerSpace(FetchPixels.getPixelHeight(15)),
              Text('Last Name', style: TextStyle(fontSize: FetchPixels.getPixelHeight(15), fontWeight: FontWeight.w600,fontFamily: "Jost"),),
              customTextFromFieldWidget(controller: _lastNameController),
              getVerSpace(FetchPixels.getPixelHeight(15)),
              Text('Company Name', style: TextStyle(fontSize: FetchPixels.getPixelHeight(15), fontWeight: FontWeight.w600,fontFamily: "Jost"),),
              customTextFromFieldWidget(controller: _companyNameController),
              getVerSpace(FetchPixels.getPixelHeight(15)),
              Text('Customer Display Name', style: TextStyle(fontSize: FetchPixels.getPixelHeight(15), fontWeight: FontWeight.w600,fontFamily: "Jost"),),
              customTextFromFieldWidget(controller: _customerDisplayController),
              getVerSpace(FetchPixels.getPixelHeight(15)),
              Text('Email', style: TextStyle(fontSize: FetchPixels.getPixelHeight(15), fontWeight: FontWeight.w600,fontFamily: "Jost")),
              customTextFromFieldWidget(controller: _emailController, textInputType: TextInputType.emailAddress),
              getVerSpace(FetchPixels.getPixelHeight(15)),
              Text('Contact Number', style: TextStyle(fontSize: FetchPixels.getPixelHeight(15), fontWeight: FontWeight.w600,fontFamily: "Jost"),),
              Row(
                children: [
                  Flexible(child: customTextFromFieldWidget(controller: _phoneController, hintText: "Phone",hintTextcolor: R.color.greyColor, textInputType: TextInputType.phone)),
                  getHorSpace(FetchPixels.getPixelHeight(15)),
                  Flexible(child: customTextFromFieldWidget(controller: _mobileController, hintText: "Mobile",hintTextcolor: R.color.greyColor, textInputType: TextInputType.phone)),
                ],
              ),
              getVerSpace(FetchPixels.getPixelHeight(30)),

              //Other Details
              Text('Other Details', style: TextStyle(fontSize: FetchPixels.getPixelHeight(20), fontWeight: FontWeight.w600,fontFamily: "Jost"),),
              getVerSpace(FetchPixels.getPixelHeight(15)),
              Text('Currency', style: TextStyle(fontSize: FetchPixels.getPixelHeight(15), fontWeight: FontWeight.w600,fontFamily: "Jost")),
              customTextFromFieldWidget(controller: _emailController, textInputType: TextInputType.emailAddress),
              getVerSpace(FetchPixels.getPixelHeight(15)),
              Text('Tax', style: TextStyle(fontSize: FetchPixels.getPixelHeight(15), fontWeight: FontWeight.w600,fontFamily: "Jost")),
              customTextFromFieldWidget(controller: _emailController, textInputType: TextInputType.emailAddress),
              getVerSpace(FetchPixels.getPixelHeight(15)),
              Text('Payment Terms', style: TextStyle(fontSize: FetchPixels.getPixelHeight(15), fontWeight: FontWeight.w600,fontFamily: "Jost")),
              customTextFromFieldWidget(controller: _emailController, textInputType: TextInputType.emailAddress),
              getVerSpace(FetchPixels.getPixelHeight(15)),
              Text('Price List', style: TextStyle(fontSize: FetchPixels.getPixelHeight(15), fontWeight: FontWeight.w600,fontFamily: "Jost")),
              customTextFromFieldWidget(controller: _emailController, textInputType: TextInputType.emailAddress),
              getVerSpace(FetchPixels.getPixelHeight(15)),
              Text('Portal Language', style: TextStyle(fontSize: FetchPixels.getPixelHeight(15), fontWeight: FontWeight.w600,fontFamily: "Jost")),
              customTextFromFieldWidget(controller: _emailController, textInputType: TextInputType.emailAddress),
              getVerSpace(FetchPixels.getPixelHeight(15)),

              Row(
                children: [
                  Icon(Icons.circle),
                  getHorSpace(FetchPixels.getPixelWidth(10)),
                  Text('Add Billing & Shipping address', style: TextStyle(fontSize: FetchPixels.getPixelHeight(15), fontWeight: FontWeight.w700,fontFamily: "Jost"),),
                ],
              ),
              getVerSpace(FetchPixels.getPixelHeight(15)),
              Row(
                children: [
                  Icon(Icons.circle),
                  getHorSpace(FetchPixels.getPixelWidth(10)),
                  Text('Add Contact Person', style: TextStyle(fontSize: FetchPixels.getPixelHeight(15), fontWeight: FontWeight.w700, fontFamily: "Jost"),),
                ],
              ),

              getVerSpace(FetchPixels.getPixelHeight(15)),
              Center(child: ElevatedButton(onPressed: (){}, child: Text('Save', style: TextStyle(fontFamily: "Jost",fontWeight: FontWeight.w600),), style:ElevatedButton.styleFrom(
                minimumSize: Size(FetchPixels.getPixelWidth(250), FetchPixels.getPixelHeight(45)),
              ),))
          
            ],
          ),
        )
      ),
    );
  }
}


Widget customerTypeInputWidget(String title){
  return Flexible(
    child: RadioListTile(
      title: Text(title, style: TextStyle(fontSize: FetchPixels.getPixelHeight(15), fontWeight: FontWeight.w400,fontFamily: "Jost"),),
      value: 0,
      groupValue: 1,
      contentPadding: EdgeInsets.zero,
      onChanged: (value) {},
    ),
  );
}

Widget customTextFromFieldWidget(
    {required TextEditingController controller,
      List<TextInputFormatter>? listinputFormatters = const [],
      TextInputType? textInputType,
      String? hintText,
      IconData? icons,
      String? Function(String?)? validator,
      Function(String)? onFieldSubmitted,
      Function(String)? onFieldChange,
      Color? enabledBorderColor,
      double? enabledBorderRadius,
      Color? focusedBorderColor,
      double? focusedBorderRadius,
      Color? errorBorderColor,
      Color? fillColor,
      FocusNode? focusNode,
      bool? readOnly,
      IconButton? eyeIcon,
      IconButton? personIcon,
      bool? obscureText,
      String? initialValue,
      bool? enable,
      int? maxLines,
      Color? hintTextcolor,
      double? hintTextsize}) {
  return TextFormField(
    enabled: enable,
    initialValue: initialValue,
    focusNode: focusNode,
    controller: controller,
    inputFormatters: listinputFormatters,
    keyboardType: textInputType,
    // style: TextStyle(color: Colors.black),

    decoration: InputDecoration(
      prefixIcon: personIcon,
      suffixIcon: eyeIcon,
      contentPadding: const EdgeInsets.symmetric(vertical: 1, horizontal: 10),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(focusedBorderRadius ?? 10),
        borderSide: BorderSide(color: focusedBorderColor ?? Colors.blue),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: enabledBorderColor ?? Colors.grey),
        borderRadius: BorderRadius.circular(enabledBorderRadius ?? 10),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(focusedBorderRadius ?? 10),
        borderSide: BorderSide(color: errorBorderColor ?? Colors.red),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(focusedBorderRadius ?? 10),
        borderSide: BorderSide(color: focusedBorderColor ?? Colors.blue),
      ),
      hintText: hintText,

      hintStyle: TextStyle(
          fontSize: hintTextsize ?? FetchPixels.getPixelHeight(15),
          fontFamily: 'Montserrat',
          color: hintTextcolor ?? R.color.blackColor,
          fontWeight: FontWeight.w400),
      // prefixIcon: Padding(zxz
      //   padding: const EdgeInsets.only(right: 8.0),
      //   child: Icon(icons),
      // ),
      filled: true,
      fillColor: fillColor ?? R.color.white,
    ),
    maxLines: maxLines ?? 1,
    obscureText: obscureText ?? false,
    validator: validator,
    onFieldSubmitted: onFieldSubmitted,
    onChanged: onFieldChange,
    readOnly: readOnly ?? false,
  );
}
