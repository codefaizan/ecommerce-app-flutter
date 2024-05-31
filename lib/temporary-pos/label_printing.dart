import 'package:flutter/material.dart';

import '../src/utils/base/resizer/fetch_pixels.dart';

class LabelPrinting extends StatelessWidget {
  const LabelPrinting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Label Printing",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily: "Jost")),
      ),
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: FetchPixels.getPixelHeight(20)),
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

            ListView.builder(
              itemCount: 5,
              shrinkWrap: true,
              itemBuilder: (context, index) => Column(
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Layout Name",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Jost",
                                  fontSize: FetchPixels.getPixelHeight(15))),
                          Text(
                            "Label Size",
                            style:
                                TextStyle(
                                    fontSize: FetchPixels.getPixelHeight(12), fontFamily: "Jost"
                                ),
                          ),
                          Text(
                            "Date Created",
                            style:
                                TextStyle(fontSize: FetchPixels.getPixelHeight(12),
                                  fontFamily: "Jost"
                                ),
                          ),
                          Text(
                            "Last Modified",
                            style:
                                TextStyle(fontSize: FetchPixels.getPixelHeight(12), fontFamily: "Jost"),
                          ),
                        ],
                      ),
                      SizedBox(width: FetchPixels.getPixelWidth(100)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("0991112244",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: FetchPixels.getPixelHeight(15), fontFamily: "Jost")),
                          Text(
                            "30 x 16 mm",
                            style:
                                TextStyle(fontSize: FetchPixels.getPixelHeight(12), fontFamily: "Jost"),
                          ),
                          Text(
                            "13/04/2024",
                            style:
                                TextStyle(fontSize: FetchPixels.getPixelHeight(12), fontFamily: "Jost"),
                          ),
                          Text(
                            "18/04/2024",
                            style:
                                TextStyle(fontSize: FetchPixels.getPixelHeight(12), fontFamily: "Jost"),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Divider()
                ],
              ),
            ),

            SizedBox(height: FetchPixels.getPixelHeight(20)),
            ElevatedButton(
              onPressed: (){},
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF006666),
                foregroundColor: Colors.white,
                minimumSize: Size(FetchPixels.getWidthPercentSize(65), FetchPixels.getPixelHeight(45)),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7))
              ),
              child: Text("Add Layout", style: TextStyle(fontFamily: "Jost"),),
            ),
            SizedBox(height: FetchPixels.getPixelHeight(10)),
            ElevatedButton(
              onPressed: (){},
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF006666),
                  foregroundColor: Colors.white,
                  minimumSize: Size(FetchPixels.getWidthPercentSize(65), FetchPixels.getPixelHeight(45)),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7))
              ),
              child: Text("Edit Layout", style: TextStyle(fontFamily: "Jost"),),
            ),
            SizedBox(height: FetchPixels.getPixelHeight(10)),
            ElevatedButton(
              onPressed: (){},
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF006666),
                  foregroundColor: Colors.white,
                  minimumSize: Size(FetchPixels.getWidthPercentSize(65), FetchPixels.getPixelHeight(45)),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7))
              ),
              child: Text("Delete Layout", style: TextStyle(fontFamily: "Jost"),),
            ),
          ],
        ),
      ),
    );
  }
}
