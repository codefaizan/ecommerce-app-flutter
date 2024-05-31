import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turtle/src/utils/base/widget_utils.dart';
import 'package:turtle/src/view/auth/providers/auth_provider.dart';
import 'package:turtle/src/view/profile_screen/models/profile_data_model.dart';

import '../../utils/base/resizer/fetch_pixels.dart';
import '../../utils/base/resources/resources.dart';
import '../../utils/base/resources/text_style.dart';

class EditProfileScreen extends StatefulWidget{
  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController nameController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  @override
  void initState() {
    nameController.text = demoProfileData.name;
    phoneController.text = demoProfileData.phone;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, provider, child) {


    return Scaffold(
      appBar: AppBar(
        title: Text(R.texts.profile),
        titleTextStyle: AppFontStyles.styleRegularPoppins25
            .copyWith(fontWeight: FontWeight.bold),),

      body: Padding(
        padding: EdgeInsets.all(FetchPixels.getPixelHeight(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CircleAvatar(foregroundImage: AssetImage(R.images.plantIcon), radius: FetchPixels.getPixelHeight(60),),
              getVerSpace(FetchPixels.getPixelHeight(30)),
              getDefaultTextFiledWithSuffixPrefix(context, "Name", nameController, suffix: const Icon(Icons.edit)),getVerSpace(FetchPixels.getPixelHeight(15)),
              getDefaultTextFiledWithSuffixPrefix(context, "Email", TextEditingController()..text = demoProfileData.email, isEnable: false),
              getVerSpace(FetchPixels.getPixelHeight(15)),
              getDefaultTextFiledWithSuffixPrefix(context, "Phone", phoneController, suffix: const Icon(Icons.edit)),
              getVerSpace(FetchPixels.getPixelHeight(30)),
              getElevatedButton(R.texts.update.toUpperCase(), () {
                provider.updateProfileDetails(nameController.text, phoneController.text);
                Navigator.pop(context);
              })
            ],
          ),
        ),
      ),
    );
    },);
  }
}