import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turtle/temporary-pos/products_provider.dart';
import '../src/utils/base/resizer/fetch_pixels.dart';

class ProductFiltersScreen extends StatelessWidget {
  ProductFiltersScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Consumer<ProductsProvider>(builder: (context, productProvider, child) {
      return Scaffold(
        backgroundColor: Color(0xFFF5F5F5),
        appBar: AppBar(
          title: Text("Products",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily: "Jost")),
        ),

        body: Padding(
          padding: EdgeInsets.all(FetchPixels.getPixelHeight(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                      fillColor: Colors.grey[300],
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.circular(FetchPixels.getPixelHeight(10)),
                          borderSide: BorderSide(color: Colors.transparent)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.circular(FetchPixels.getPixelHeight(10)),
                          borderSide: BorderSide(color: Colors.transparent)),
                      contentPadding: EdgeInsets.zero,
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      hintText: 'Search',
                      hintStyle: TextStyle(color: Colors.grey, fontFamily: "Jost")),
                ),
                SizedBox(height: FetchPixels.getPixelHeight(20),),
                Row(
                  children: [
                    Text("Customize Columns", style: TextStyle(fontSize: FetchPixels.getPixelHeight(18),fontFamily: "Jost", fontWeight: FontWeight.bold)),
                    Spacer(),
                    Text("${productProvider.getSelectedFiltersCount()} of ${productProvider.filters.length} Selected", style: TextStyle(fontSize: FetchPixels.getPixelHeight(18),fontFamily: "Jost", fontWeight: FontWeight.w600)),
                    SizedBox(width: FetchPixels.getPixelWidth(5)),
                    InkWell(
                      onTap: () => productProvider.clearAllFilters(),
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(color: Colors.black)
                          ),
                          child: Icon(Icons.close, size: FetchPixels.getPixelHeight(15))),
                    )
                  ],
                ),
                SizedBox(height: FetchPixels.getPixelHeight(10)),
                ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: productProvider.filters.length,
                  itemBuilder: (context, index) => customFilterTileWidget(context, index),
                  separatorBuilder: (BuildContext context, int index) => SizedBox(height: FetchPixels.getPixelHeight(10),),),
                SizedBox(height: FetchPixels.getPixelHeight(20)),
                ElevatedButton(onPressed: (){}, child: Text('Save', style: TextStyle(fontSize: FetchPixels.getPixelHeight(18),fontFamily: "Jost",fontWeight: FontWeight.w600),), style:ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF006666),
                  minimumSize: Size(FetchPixels.getPixelWidth(250), FetchPixels.getPixelHeight(45)),
                ),),
                OutlinedButton(onPressed: (){}, child: Text('Cancel', style: TextStyle(fontSize: FetchPixels.getPixelHeight(18), fontFamily: "Jost",fontWeight: FontWeight.w600),), style:OutlinedButton.styleFrom(
                  side: BorderSide(color: Color(0xFF006666)),
                  foregroundColor: Color(0xFF006666),
                  minimumSize: Size(FetchPixels.getPixelWidth(250), FetchPixels.getPixelHeight(45)),
                ),)
              ],
            ),
          ),
        ),
      );
    },);
  }
}

Container customFilterTileWidget(BuildContext context, index){
  final productProvider = Provider.of<ProductsProvider>(context);
  return Container(
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5)
    ),
    child: Row(children: [
      Checkbox(value: productProvider.filters[index].isSelected, onChanged: (val) => productProvider.toggleFilter(val, index), activeColor: Color(0xFF02A6ED),),
      Text(productProvider.filters[index].filterName, style: TextStyle(fontFamily: "Jost", fontSize: 15),)
    ],),
  );
}

class ProductFilerModel{
  String filterName;
  bool? isSelected;

  ProductFilerModel({
    required this.filterName,
    required this.isSelected
  });
}
