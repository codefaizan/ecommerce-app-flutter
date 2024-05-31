import 'package:flutter/material.dart';
import '../Models/customize_feed_model.dart';

class CustomizeFeedProvider extends ChangeNotifier{
  List<CustomizeFeedItem> items = categoriesList;

  void update(){
    notifyListeners();
  }
}