import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turtle/temporary-pos/products_provider.dart';
import '../src/utils/base/resizer/fetch_pixels.dart';
import '../src/utils/base/resources/resources.dart';

class BundlingScreen extends StatelessWidget {
  BundlingScreen({super.key});

  final PageController pageViewController = PageController();

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductsProvider>(builder: (context, productProvider, child) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Bundling",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily: "Jost")),
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: FetchPixels.getPixelHeight(20)),
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
            SizedBox(height: FetchPixels.getPixelHeight(10)),
            Row(
              children: [
                Text("Show Image", style: TextStyle(fontSize: 12),),
                SizedBox(
                  width: FetchPixels.getPixelWidth(30),
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: Switch(
                      value: productProvider.showImage, onChanged: (value) => productProvider.toggleShowImage(value),
                      activeColor: Color(0xFF006666),
                      activeTrackColor: Color(0xFF006666).withAlpha(100),
                    ),
                  ),
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: (){},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFD9D9D9),
                      foregroundColor: Colors.black,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      minimumSize: Size(FetchPixels.getPixelWidth(70), FetchPixels.getPixelHeight(27)),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4), side: BorderSide(color: Colors.black))
                  ),
                  child: Text("Discount", style: TextStyle(fontFamily: "Jost", fontSize: FetchPixels.getPixelHeight(12)),),
                ),
              ],
            ),
            ListView.builder(
              itemCount: 3,
              shrinkWrap: true,
              itemBuilder: (context, index) => Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if(productProvider.showImage)
                        Image.asset(R.images.plantIcon,width:50, height: 50, fit: BoxFit.cover,),
                      SizedBox(width: FetchPixels.getPixelWidth(10)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Name Bundle",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Jost",
                                  fontSize: FetchPixels.getPixelHeight(15))),
                          Text(
                            "Unit Price",
                            style:
                            TextStyle(
                                fontSize: FetchPixels.getPixelHeight(12), fontFamily: "Jost"
                            ),
                          ),
                          Text(
                            "Total Price",
                            style:
                            TextStyle(fontSize: FetchPixels.getPixelHeight(12),
                                fontFamily: "Jost"
                            ),
                          ),
                          Text(
                            "Quantity",
                            style:
                            TextStyle(fontSize: FetchPixels.getPixelHeight(12), fontFamily: "Jost"),
                          ),
                        ],
                      ),
                      Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Name Product",
                              style: TextStyle(
                                  fontFamily: "Jost",
                                  fontSize: FetchPixels.getPixelHeight(14))),
                          Text(
                            "Unknown",
                            style:
                            TextStyle(fontSize: FetchPixels.getPixelHeight(12), fontFamily: "Jost"),
                          ),
                          Text(
                            "00000123",
                            style:
                            TextStyle(fontSize: FetchPixels.getPixelHeight(12), fontFamily: "Jost"),
                          ),

                        ],
                      )
                    ],
                  ),
                  Divider()
                ],
              ),
            ),
          ],
        ),
      ),
    );
    },);
  }
}
