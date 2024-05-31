import 'package:flutter/material.dart';

import '../src/utils/base/resizer/fetch_pixels.dart';
import '../src/utils/base/resources/resources.dart';
import '../src/utils/base/widget_utils.dart';
import 'add_customers.dart';

class AddressScreen extends StatelessWidget {
  final TextEditingController _attentionControllerBilling = TextEditingController();
  final TextEditingController _streetOneControllerBilling = TextEditingController();
  final TextEditingController _streetTwoControllerBilling = TextEditingController();
  final TextEditingController _cityControllerBilling = TextEditingController();
  final TextEditingController _stateControllerBilling = TextEditingController();
  final TextEditingController _zipCodeControllerBilling = TextEditingController();
  final TextEditingController _countryControllerBilling = TextEditingController();
  final TextEditingController _faxControllerBilling = TextEditingController();
  final TextEditingController _phoneControllerBilling = TextEditingController();

  final TextEditingController _attentionControllerShipping = TextEditingController();
  final TextEditingController _streetOneControllerShipping = TextEditingController();
  final TextEditingController _streetTwoControllerShipping = TextEditingController();
  final TextEditingController _cityControllerShipping = TextEditingController();
  final TextEditingController _stateControllerShipping = TextEditingController();
  final TextEditingController _zipCodeControllerShipping = TextEditingController();
  final TextEditingController _countryControllerShipping = TextEditingController();
  final TextEditingController _faxControllerShipping = TextEditingController();
  final TextEditingController _phoneControllerShipping = TextEditingController();
  AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Address', style: TextStyle(fontSize: FetchPixels.getPixelHeight(25), fontWeight: FontWeight.bold,),),
      ),

      body: Padding(
        padding: EdgeInsets.all(FetchPixels.getPixelHeight(10)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Billing Address
              AddressSection(title: 'Billing Address', controllers: [
                _attentionControllerBilling,
                _streetOneControllerBilling,
                _streetTwoControllerBilling,
                _cityControllerBilling,
                _stateControllerBilling,
                _zipCodeControllerBilling,
                _countryControllerBilling,
                _faxControllerBilling,
                _phoneControllerBilling,
              ]),
              getVerSpace(FetchPixels.getPixelHeight(30)),

              // Shipping Address
              AddressSection(title: 'Shipping', controllers: [
                _attentionControllerShipping,
                _streetOneControllerShipping,
                _streetTwoControllerShipping,
                _cityControllerShipping,
                _stateControllerShipping,
                _zipCodeControllerShipping,
                _countryControllerShipping,
                _faxControllerShipping,
                _phoneControllerShipping,
              ]),
              getVerSpace(FetchPixels.getPixelHeight(15)),
              Center(child: ElevatedButton(onPressed: (){}, child: Text('Save', style: TextStyle(fontFamily: "Jost",fontWeight: FontWeight.w600),), style:ElevatedButton.styleFrom(
                minimumSize: Size(FetchPixels.getPixelWidth(250), FetchPixels.getPixelHeight(45)),
              ),))

            ],
          ),
        ),
      ),
    );
  }
}











class AddressSection extends StatelessWidget {
  final String title;
  final List<TextEditingController> controllers;

  const AddressSection({
    required this.title,
    required this.controllers,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: FetchPixels.getPixelHeight(18),
            fontWeight: FontWeight.w500,
            fontFamily: "Jost",
          ),
        ),
        SizedBox(height: FetchPixels.getPixelHeight(15)),
          Column(
            children: [
              customTextFromFieldWidget(
                controller: controllers[0],
                hintText: 'Attention',
                hintTextcolor: R.color.greyColor,
              ),
              SizedBox(height: FetchPixels.getPixelHeight(10)),
              customTextFromFieldWidget(
                controller:  controllers[1],
                hintText: 'Street 1',
                hintTextcolor: R.color.greyColor,
              ),
              SizedBox(height: FetchPixels.getPixelHeight(10)),
              customTextFromFieldWidget(
                controller:  controllers[2],
                hintText: 'Street 2',
                hintTextcolor: R.color.greyColor,
              ),
              SizedBox(height: FetchPixels.getPixelHeight(10)),
              customTextFromFieldWidget(
                controller:  controllers[3],
                hintText: 'City',
                hintTextcolor: R.color.greyColor,
              ),
              SizedBox(height: FetchPixels.getPixelHeight(10)),
              customTextFromFieldWidget(
                controller:  controllers[4],
                hintText: 'State',
                hintTextcolor: R.color.greyColor,
              ),
              SizedBox(height: FetchPixels.getPixelHeight(10)),
              customTextFromFieldWidget(
                controller:  controllers[5],
                hintText: 'Zip Code',
                hintTextcolor: R.color.greyColor,
              ),
              SizedBox(height: FetchPixels.getPixelHeight(10)),
              customTextFromFieldWidget(
                controller:  controllers[6],
                hintText: 'Country/State',
                hintTextcolor: R.color.greyColor,
              ),
              SizedBox(height: FetchPixels.getPixelHeight(10)),
              customTextFromFieldWidget(
                controller:  controllers[7],
                hintText: 'Fax',
                hintTextcolor: R.color.greyColor,
              ),
              SizedBox(height: FetchPixels.getPixelHeight(10)),
              customTextFromFieldWidget(
                controller:  controllers[8],
                hintText: 'Phone',
                hintTextcolor: R.color.greyColor,
              ),
            ],
          ),
      ],
    );
  }
}
