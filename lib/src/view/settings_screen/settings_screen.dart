import 'package:flutter/material.dart';
import 'package:turtle/src/utils/base/resizer/fetch_pixels.dart';
import 'package:turtle/src/utils/base/widget_utils.dart';
import 'package:turtle/src/utils/routing/route_names.dart';
import 'package:turtle/src/view/auth/login_screen/login_screen.dart';
import 'package:turtle/src/view/auth/signup_screen/signup_screen.dart';
import 'package:turtle/src/view/contactus_screen/contactus_screen.dart';
import 'package:turtle/src/view/settings_screen/widgets/alert_dialog.dart';

import '../../utils/base/resources/resources.dart';
import '../../utils/base/resources/text_style.dart';

class SettingsScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(R.texts.settings, style: AppFontStyles.styleRegularPoppins25.copyWith(fontWeight: FontWeight.bold),),
        actions: [InkWell(onTap: ()=>Navigator.pushNamed(context, RouteNames.notificationsScreen),child: getAssetImage(R.images.notificationIcon)),],
      ),
      body: ListView(
        children: [
          SettingsScreenTile(R.texts.notifications, Icon: FittedBox(
            fit: BoxFit.cover,
            child: Switch(
              activeColor: R.color.theme,
              value: true, onChanged: (value) {},),
          )),
          getVerSpace(FetchPixels.getPixelHeight(20)),
          SettingsScreenTile(R.texts.favourites, Icon: getAssetImage(R.images.favIcon), onPressed: ()=> Navigator.pushNamed(context, RouteNames.favouritesScreen)),
          getVerSpace(FetchPixels.getPixelHeight(20)),
          SettingsScreenTile(R.texts.listings, Icon: getAssetImage(R.images.listingsIcon), onPressed: ()=> Navigator.pushNamed(context, RouteNames.listingsScreen)),
          getVerSpace(FetchPixels.getPixelHeight(20)),
          SettingsScreenTile(R.texts.purchases, Icon: getAssetImage(R.images.purchasesIcon), onPressed: ()=> Navigator.pushNamed(context, RouteNames.purchasesScreen)),
          getVerSpace(FetchPixels.getPixelHeight(20)),
          SettingsScreenTile(R.texts.customizeFeed, Icon: getAssetImage(R.images.customizeFeedIcon), onPressed: ()=> Navigator.pushNamed(context, RouteNames.customizeFeedScreen)),
          getVerSpace(FetchPixels.getPixelHeight(20)),
          SettingsScreenTile(R.texts.searchAlerts, Icon: getAssetImage(R.images.searchAlertsIcon), onPressed: ()=> Navigator.pushNamed(context, RouteNames.searchAlertsScreen)),
          getVerSpace(FetchPixels.getPixelHeight(25)),

          Text(R.texts.legal, style: AppFontStyles.styleRegularPoppins25.copyWith(fontWeight: FontWeight.bold)),
          getVerSpace(FetchPixels.getPixelHeight(20)),
          SettingsScreenTile(R.texts.termsConditions, onPressed: ()=> Navigator.pushNamed(context, RouteNames.termsScreen)),
          getVerSpace(FetchPixels.getPixelHeight(20)),
          SettingsScreenTile(R.texts.privacyPolicy, onPressed: ()=> Navigator.pushNamed(context, RouteNames.privacyPolicyScreen)),
          getVerSpace(FetchPixels.getPixelHeight(20)),
          SettingsScreenTile(R.texts.aboutUs, onPressed: ()=> Navigator.pushNamed(context, RouteNames.aboutUsScreen)),
          getVerSpace(FetchPixels.getPixelHeight(20)),
          SettingsScreenTile(R.texts.contactUs, onPressed: ()=> Navigator.pushNamed(context, RouteNames.contactUsScreen)),
          getVerSpace(FetchPixels.getPixelHeight(20)),
          SettingsScreenTile(R.texts.faqs, onPressed: ()=> Navigator.pushNamed(context, RouteNames.faqsScreen)),
          getVerSpace(FetchPixels.getPixelHeight(25)),

          Text(R.texts.account, style: AppFontStyles.styleRegularPoppins25.copyWith(fontWeight: FontWeight.bold)),
          getVerSpace(FetchPixels.getPixelHeight(20)),
          SettingsScreenTile(R.texts.changePassword, onPressed: ()=> Navigator.pushNamed(context, RouteNames.changePasswordScreen)),
          getVerSpace(FetchPixels.getPixelHeight(20)),
          SettingsScreenTile(R.texts.deleteAccount, onPressed: () => showAlertDialog(context, R.texts.deleteConfirmation, subtitle: R.texts.deleteWarning, ()=> Navigator.pushReplacementNamed(context, RouteNames.signupScreen))),
          getVerSpace(FetchPixels.getPixelHeight(20)),
          SettingsScreenTile(R.texts.logOut, onPressed: () => showAlertDialog(context, R.texts.logoutConfirmation, () => Navigator.pushReplacementNamed(context, RouteNames.loginScreen))),


        ],
      ),
    );
  }

}

Widget SettingsScreenTile(String title, {Widget? Icon, void Function()? onPressed}){
  return InkWell(
    onTap: onPressed,
    child: Container(
      height: FetchPixels.getPixelHeight(65),
      padding: EdgeInsets.symmetric(vertical: FetchPixels.getPixelHeight(18), horizontal: FetchPixels.getPixelWidth(15)),
      decoration: BoxDecoration(
          color: R.color.bgColor,
          borderRadius: BorderRadius.circular(FetchPixels.getPixelHeight(10))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: AppFontStyles.styleRegularPoppins18),
          Icon ?? const SizedBox()
        ],

      ),
    ),
  );
}

