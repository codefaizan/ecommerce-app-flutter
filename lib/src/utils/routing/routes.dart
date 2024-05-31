import 'package:flutter/material.dart';
import 'package:turtle/src/utils/routing/route_names.dart';
import 'package:turtle/src/view/aboutus_screen/aboutus_screen.dart';
import 'package:turtle/src/view/auth/change_password_screen/change_password_screen.dart';
import 'package:turtle/src/view/auth/forgot_password_screen/forgot_password_screen.dart';
import 'package:turtle/src/view/auth/login_screen/login_screen.dart';
import 'package:turtle/src/view/auth/signup_screen/signup_screen.dart';
import 'package:turtle/src/view/categories_screen/category_select_screen.dart';
import 'package:turtle/src/view/contactus_screen/contactus_screen.dart';
import 'package:turtle/src/view/customize_feed_screen/customize_feed_screen.dart';
import 'package:turtle/src/view/dashboard_screen/dashboard_screen.dart';
import 'package:turtle/src/view/faqs_screen/faqs_screen.dart';
import 'package:turtle/src/view/favourites_screen/favourites_screen.dart';
import 'package:turtle/src/view/listings_screen/listings_screen.dart';
import 'package:turtle/src/view/new_listing_screen/new_listing_screen.dart';
import 'package:turtle/src/view/notifications_screen/notifications_screen.dart';
import 'package:turtle/src/view/privacy_policy_screen/privacy_policy_screen.dart';
import 'package:turtle/src/view/product_detail_screen/product_detail_screen.dart';
import 'package:turtle/src/view/profile_screen/edit_profile_screen.dart';
import 'package:turtle/src/view/purchase_detail_screen/purchase_detail_screen.dart';
import 'package:turtle/src/view/purchases_screen/purchases_screen.dart';
import 'package:turtle/src/view/search_alerts_screen/edit_search_alerts_screen.dart';
import 'package:turtle/src/view/search_alerts_screen/search_alerts_screen.dart';
import 'package:turtle/src/view/splash_screen/splash_screen.dart';
import 'package:turtle/src/view/terms_screen/terms_screen.dart';

class Routes{
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){

      case RouteNames.splashScreen:
        return MaterialPageRoute(builder: (context) => SplashScreen());
      case RouteNames.loginScreen:
        return MaterialPageRoute(builder: (context) => LoginScreen());
      case RouteNames.signupScreen:
        return MaterialPageRoute(builder: (context) => SignupScreen());
      case RouteNames.forgotPasswordScreen:
        return MaterialPageRoute(builder: (context) => ForgotPasswordScreen());
      case RouteNames.dashboardScreen:
        return MaterialPageRoute(builder: (context) => DashboardScreen());
      case RouteNames.termsScreen:
        return MaterialPageRoute(builder: (context) => TermsScreen());
      case RouteNames.privacyPolicyScreen:
        return MaterialPageRoute(builder: (context) => PrivacyPolicyScreen());
      case RouteNames.aboutUsScreen:
        return MaterialPageRoute(builder: (context) => AboutusScreen());
      case RouteNames.contactUsScreen:
        return MaterialPageRoute(builder: (context) => ContactusScreen());
      case RouteNames.changePasswordScreen:
        return MaterialPageRoute(builder: (context) => ChangePasswordScreen());
      case RouteNames.faqsScreen:
        return MaterialPageRoute(builder: (context) => FaqsScreen());
      case RouteNames.searchAlertsScreen:
        return MaterialPageRoute(builder: (context) => SearchAlertsScreen());
      case RouteNames.editSearchAlertsScreen:
        return MaterialPageRoute(builder: (context) => EditSearchAlertsScreen());
      case RouteNames.customizeFeedScreen:
        return MaterialPageRoute(builder: (context) => CustomizeFeedScreen());
      case RouteNames.purchasesScreen:
        return MaterialPageRoute(builder: (context) => PurchasesScreen());
      case RouteNames.listingsScreen:
        return MaterialPageRoute(builder: (context) => ListingsScreen());
      case RouteNames.favouritesScreen:
        return MaterialPageRoute(builder: (context) => const FavouritesScreen());
      case RouteNames.editProfileScreen:
        return MaterialPageRoute(builder: (context) => EditProfileScreen());
      case RouteNames.productDetailScreen:
        return MaterialPageRoute(builder: (context) => ProductDetailScreen(data: settings.arguments as Map));
      case RouteNames.notificationsScreen:
        return MaterialPageRoute(builder: (context) => NotificationsScreen());
      case RouteNames.newListingScreen:
        return MaterialPageRoute(builder: (context) => NewListingScreen());
      case RouteNames.purchaseDetailScreen:
        return MaterialPageRoute(builder: (context) => PurchaseDetails(data: settings.arguments as Map));
      case RouteNames.categorySelectScreen:
        return MaterialPageRoute(builder: (context) => CategorySelectScreen(data: settings.arguments as Map));
      default:
        return MaterialPageRoute(builder: (context) => const Scaffold(
          body: Center(child: Text('Route Not Defined!'),),
        ));
    }
  }
}