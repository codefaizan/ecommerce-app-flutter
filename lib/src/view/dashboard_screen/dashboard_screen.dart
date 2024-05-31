import 'package:flutter/material.dart';
import 'package:turtle/src/utils/base/resizer/fetch_pixels.dart';
import 'package:turtle/src/utils/base/widget_utils.dart';
import 'package:turtle/src/utils/routing/route_names.dart';
import 'package:turtle/src/view/categories_screen/categories_screen.dart';
import 'package:turtle/src/view/chats_screen/screens/chats_screen.dart';
import 'package:turtle/src/view/home_screen/home_screen.dart';
import 'package:turtle/src/view/new_listing_screen/new_listing_screen.dart';
import 'package:turtle/src/view/profile_screen/profile_screen.dart';
import 'package:turtle/src/view/settings_screen/settings_screen.dart';

import '../../utils/base/resources/resources.dart';

class DashboardScreen extends StatefulWidget {
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;
  List<Widget> screens =
     [
      HomeScreen(),
       ChatsScreen(),
      ProfileScreen(),
      SettingsScreen()
    ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: R.color.white,
      bottomNavigationBar: Container(
        color: R.color.transparent,
          margin: EdgeInsets.only(
              bottom: FetchPixels.getPixelHeight(10),
              left: FetchPixels.getPixelWidth(8),
              right: FetchPixels.getPixelWidth(8)),
          child: ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
            child: BottomNavigationBar(
              backgroundColor: R.color.white.withOpacity(0.7),
                currentIndex: _currentIndex,
                onTap: (value) => changeIndex(value),
                selectedItemColor: R.color.blackColor,
                unselectedItemColor: R.color.blackColor,
                showUnselectedLabels: true,
                // selectedFontSize: FetchPixels.getPixelHeight(14),
                // unselectedFontSize: FetchPixels.getPixelHeight(14),
                type: BottomNavigationBarType.fixed,
                elevation: 0.3,

                items: [
                  BottomNavigationBarItem(
                    icon: getAssetImage(R.images.homeInactive),
                    label: "Home",
                    activeIcon: getAssetImage(R.images.homeActive)
                  ),
                  BottomNavigationBarItem(
                      icon: getAssetImage(R.images.chatsInactive),
                      label: "Chats",
                      activeIcon: getAssetImage(R.images.chatsActive)),
                  BottomNavigationBarItem(
                      icon: getAssetImage(R.images.profileInactive),
                      label: "Profile",
                      activeIcon: getAssetImage(R.images.profileActive),),
                  BottomNavigationBarItem(
                      icon: getAssetImage(R.images.settingsInactive),
                      label: "Settings",
                      activeIcon: getAssetImage(R.images.settingsActive)),
                ]),

          )),
      body: Padding(
        padding: EdgeInsets.only(left: FetchPixels.getPixelHeight(10), right: FetchPixels.getPixelHeight(10), top: FetchPixels.getPixelHeight(10)),
        child: screens[_currentIndex],
      ),
      // appBar: AppBar(
      //   title: Text(R.texts.settings),
      //   automaticallyImplyLeading: false,
      //   actions: [
      //     getAssetImage(R.images.notificationIcon),
      //     getHorSpace(FetchPixels.getPixelWidth(20))
      //   ],
      // ),




      floatingActionButton:
      _currentIndex==0?
      FloatingActionButton(onPressed: () => Navigator.pushNamed(context, RouteNames.newListingScreen), shape: const CircleBorder(), backgroundColor: R.color.theme,foregroundColor: R.color.white,
      child: const Icon(Icons.add),)
      :null,
    );
  }

  void changeIndex(int value){
    setState(() {});
    _currentIndex = value;
  }


}
