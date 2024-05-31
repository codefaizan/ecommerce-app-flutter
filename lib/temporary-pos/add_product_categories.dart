import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turtle/src/utils/base/widget_utils.dart';
import 'package:turtle/temporary-pos/products_provider.dart';
import '../src/utils/base/resizer/fetch_pixels.dart';
import '../src/utils/base/resources/resources.dart';

class AddProductCategories extends StatelessWidget {
  AddProductCategories({super.key});


  TextEditingController inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductsProvider>(
      builder: (context, productProvider, child) {
        return Scaffold(
          backgroundColor: Color(0xFFF5F5F5),
          appBar: AppBar(
            title: Text("Add Products",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Jost")),
          ),
          body: Padding(
            padding: EdgeInsets.all(FetchPixels.getPixelHeight(20)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextFormField(
                    controller: inputController,
                    decoration: InputDecoration(
                        fillColor: Colors.grey[300],
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                FetchPixels.getPixelHeight(10)),
                            borderSide: BorderSide(color: Colors.transparent)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                FetchPixels.getPixelHeight(10)),
                            borderSide: BorderSide(color: Colors.transparent)),
                        contentPadding: EdgeInsets.symmetric(horizontal: FetchPixels.getPixelWidth(10)),
                        suffixIcon: ElevatedButton(onPressed: ()=> productProvider.addToList(productProvider.categoriesList, inputController.text), child: Text("Add"), style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF006666),
                        ),),
                        hintText: 'Type',
                        hintStyle:
                            TextStyle(color: Colors.grey, fontFamily: "Jost")),
                  ),
                  SizedBox(
                    height: FetchPixels.getPixelHeight(20),
                  ),
                  Row(
                    children: [
                      Text("Update Categories",
                          style: TextStyle(
                              fontSize: FetchPixels.getPixelHeight(18),
                              fontFamily: "Jost",
                              fontWeight: FontWeight.bold)),
                      Spacer(),
                      InkWell(
                        onTap: () => productProvider.clearList(productProvider.categoriesList),
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(color: Colors.black)),
                            child: Icon(Icons.close,
                                size: FetchPixels.getPixelHeight(15))),
                      )
                    ],
                  ),
                  SizedBox(height: FetchPixels.getPixelHeight(10)),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: productProvider.categoriesList.length,
                    itemBuilder: (context, index) =>
                        AddCategoriesTileWidget(context, index),
                    separatorBuilder: (BuildContext context, int index) =>
                        SizedBox(
                      height: FetchPixels.getPixelHeight(10),
                    ),
                  ),
                  SizedBox(height: FetchPixels.getPixelHeight(20)),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Save',
                      style: TextStyle(
                          fontSize: FetchPixels.getPixelHeight(18),
                          fontFamily: "Jost",
                          fontWeight: FontWeight.w600),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF006666),
                      minimumSize: Size(FetchPixels.getPixelWidth(250),
                          FetchPixels.getPixelHeight(45)),
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                          fontSize: FetchPixels.getPixelHeight(18),
                          fontFamily: "Jost",
                          fontWeight: FontWeight.w600),
                    ),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Color(0xFF006666)),
                      foregroundColor: Color(0xFF006666),
                      minimumSize: Size(FetchPixels.getPixelWidth(250),
                          FetchPixels.getPixelHeight(45)),
                    ),
                  ),


                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

Container AddCategoriesTileWidget(BuildContext context, index) {
  final productProvider = Provider.of<ProductsProvider>(context);
  return Container(
    padding: EdgeInsets.symmetric(horizontal: FetchPixels.getPixelWidth(5)),
    decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(5)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          productProvider.categoriesList[index],
          style: TextStyle(fontFamily: "Jost", fontSize: 15),
        ),
        IconButton(onPressed: ()=> productProvider.removeFromList(productProvider.categoriesList, index), icon: Icon(Icons.close))
      ],
    ),
  );
}

class ProductFilerModel {
  String filterName;
  bool? isSelected;

  ProductFilerModel({required this.filterName, required this.isSelected});
}
