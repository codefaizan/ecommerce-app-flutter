import 'package:flutter/material.dart';
import 'package:turtle/src/view/customize_feed_screen/Models/customize_feed_model.dart';
import 'package:turtle/src/view/purchases_screen/models/product_model.dart';

class ProductProvider extends ChangeNotifier{
  List<Product> allProducts = demoProductsList;
  bool isDrawerSearchEnabled = false;
  bool isHomeSearchEnabled = false;
  int currentPage = 0;
  int dropDownValue = 0;
  int selectedFilter = 0;
  final pageController = PageController();
  List<CustomizeFeedItem> allCategories = categoriesList;
  List<dynamic> filteredList = [];

  void toggleFavourite(Product product){
    product.isFavourite = !product.isFavourite;
    notifyListeners();
  }

  enableDrawerSearch(){
    isDrawerSearchEnabled = true;
    notifyListeners();
  }

  enableHomeSearch(){
    isHomeSearchEnabled = true;
    notifyListeners();
  }

  search(String searchText,List list){
    filteredList.clear();
      filteredList.addAll(list.where((element) => element.title.toLowerCase().contains(searchText)).toList());
      notifyListeners();
  }


  void onProductDetailPageViewChange(onchange) {
    currentPage = onchange;
    notifyListeners();
  }

  void productDetailsCategories(newVal){
    dropDownValue = newVal!;
    notifyListeners();
  }

  void update(){
    notifyListeners();
  }

  void changeFilterIndex(int index){
    selectedFilter = index;
    notifyListeners();
  }

}