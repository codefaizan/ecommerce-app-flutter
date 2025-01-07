import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turtle/src/common_providers/product_provider.dart';
import 'package:turtle/src/utils/base/resizer/fetch_pixels.dart';
import 'package:turtle/src/utils/routing/route_names.dart';
import 'package:turtle/src/utils/routing/routes.dart';
import 'package:turtle/src/utils/theme.dart';
import 'package:turtle/src/view/auth/providers/auth_provider.dart';
import 'package:turtle/src/view/chats_screen/providers/chats_provider.dart';
import 'package:turtle/src/view/customize_feed_screen/providers/customize_feed_provider.dart';
import 'package:turtle/src/view/favourites_screen/providers/favourite_provider.dart';
import 'package:turtle/src/view/new_listing_screen/providers/new_listing_provider.dart';
import 'package:turtle/temporary-pos/InvoiceScreen.dart';
import 'package:turtle/temporary-pos/ProductsFiltersScreen.dart';
import 'package:turtle/temporary-pos/add_product_categories.dart';
import 'package:turtle/temporary-pos/products_provider.dart';
import 'package:turtle/temporary-pos/bundling_screen.dart';
import 'package:turtle/temporary-pos/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    FetchPixels(context);
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => AuthProvider()),
      ChangeNotifierProvider(create: (context) => ProductProvider()),
      ChangeNotifierProvider(create: (context) => FavouriteProvider()),
      ChangeNotifierProvider(create: (context) => ChatsProvider()),
      ChangeNotifierProvider(create: (context) => NewListingProvider()),
      ChangeNotifierProvider(create: (context) => CustomizeFeedProvider()),
      //temp: to be removed
      ChangeNotifierProvider(create: (context) => InvoiceProvider()),
      ChangeNotifierProvider(create: (context) => ProductsProvider()),
    ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Turtle',
          theme: DefaultTheme.getDefaultTheme(),
          // home: AddProductCategories(),
          initialRoute: RouteNames.splashScreen,
          onGenerateRoute: Routes.generateRoute,
          
        )
    );

  }
}

























