import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class NewListingProvider extends ChangeNotifier{
  List<XFile>? pickedImages = [];
  bool isFree = false;

  void toggleProductType(bool value){
    isFree = value;
    notifyListeners();
  }

  void notify(){
    notifyListeners();
  }

  Future pickImage() async{

    final List<XFile>? selectedImages = await ImagePicker().pickMultiImage();
    if (selectedImages!.isNotEmpty) {
      pickedImages!.addAll(selectedImages);
    }
    notifyListeners();
  }

  removeImage(int index){
    pickedImages!.removeAt(index);
    notifyListeners();
  }
}