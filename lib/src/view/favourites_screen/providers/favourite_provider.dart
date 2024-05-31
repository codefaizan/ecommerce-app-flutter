import 'package:flutter/material.dart';
import 'package:turtle/src/view/purchases_screen/models/product_model.dart';

class FavouriteProvider extends ChangeNotifier{

  void toggleFavourite(int index){
    demoProductsList[index].isFavourite = !demoProductsList[index].isFavourite;
    notifyListeners();
  }
}