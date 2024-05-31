import 'package:flutter/material.dart';
import 'ProductsFiltersScreen.dart';

class ProductsProvider extends ChangeNotifier{
  bool showImage = true;
  List<ProductFilerModel> filters = [
    ProductFilerModel(filterName: "Name", isSelected: false),
    ProductFilerModel(filterName: "Sku", isSelected: false),
    ProductFilerModel(filterName: "Image", isSelected: false),
    ProductFilerModel(filterName: "Barcode", isSelected: false),
    ProductFilerModel(filterName: "Sale Price", isSelected: false),
    ProductFilerModel(filterName: "Purchase Price", isSelected: false),
    ProductFilerModel(filterName: "Branch Stock", isSelected: false),
    ProductFilerModel(filterName: "Sales UOM", isSelected: false),
    ProductFilerModel(filterName: "Description", isSelected: false),
  ];

  toggleShowImage(bool value){
    showImage = value;
    notifyListeners();
  }

  toggleFilter(bool? value, int filterIndex){
    filters[filterIndex].isSelected = value;
    notifyListeners();
  }

  int getSelectedFiltersCount(){
   return filters.where((element) => element.isSelected == true).length;
  }

  clearAllFilters(){
    filters.forEach((element) => element.isSelected = false);
    notifyListeners();
  }

  ///////////////////
// add products (update categories)
////////////////////

  List<String> categoriesList = [];

  addToList(List list, data){
    list.add(data);
    notifyListeners();
  }

  removeFromList(List list, int index){
    list.removeAt(index);
    notifyListeners();
  }

  clearList(List list){
    categoriesList.clear();
    notifyListeners();
  }


}