import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:turtle/src/utils/base/resizer/fetch_pixels.dart';
import 'package:turtle/temporary-pos/add_customers.dart';
import 'package:turtle/temporary-pos/provider.dart';

class InvoiceScreen extends StatelessWidget {
  InvoiceScreen({super.key});
  final TextEditingController deliveredByTextController = TextEditingController();
  final TextEditingController ReceiverNameController = TextEditingController();
  final TextEditingController ReceiverSignController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<InvoiceProvider>(builder: (context, invoiceProvider, child) {


    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      appBar: AppBar(
        backgroundColor: Color(0xFFB3B3B3),
        title: Text(
          'INV 00012',
          style: TextStyle(
              fontSize: FetchPixels.getPixelHeight(25),
              fontFamily: 'Jost',
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: FetchPixels.getPixelHeight(2), vertical: FetchPixels.getPixelHeight(20)),
        child: Screenshot(
          controller: invoiceProvider.screenshotController,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: FetchPixels.getPixelWidth(10), vertical: FetchPixels.getPixelHeight(20)),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(FetchPixels.getPixelHeight(20))),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFCCCCCC),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: Offset(0, 2), // changes position of shadow
                  ),
                ],
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        getElevatedButton('Edit', () => showDialog(context: context, builder: (context) => Dialog(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(FetchPixels.getPixelHeight(7))),
                          surfaceTintColor: Color(0xFFF7F7F7),
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: FetchPixels.getPixelHeight(70), horizontal: FetchPixels.getPixelWidth(10)),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                
                                    SizedBox(width: FetchPixels.getPixelWidth(100), child: Text("Delivered By", style: TextStyle(fontWeight: FontWeight.w700),)),
                                    SizedBox(width: FetchPixels.getPixelWidth(150), child: customTextFromFieldWidget(controller: deliveredByTextController, enabledBorderColor: Colors.transparent)),
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Row(
                                  children: [
                
                                    SizedBox(width: FetchPixels.getPixelWidth(100), child: Text("Receiver Name", style: TextStyle(fontWeight: FontWeight.w700),),),
                                    SizedBox(width: FetchPixels.getPixelWidth(150), child: customTextFromFieldWidget(controller: ReceiverNameController, enabledBorderColor: Colors.transparent)),
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Row(
                                  children: [
                                    SizedBox(width: FetchPixels.getPixelWidth(100), child: Text("Receiver Sign", style: TextStyle(fontWeight: FontWeight.w700),),),
                                    SizedBox(width: 80, child: customTextFromFieldWidget(controller: ReceiverSignController, maxLines: 4, enabledBorderColor: Colors.transparent)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ))),
                        getElevatedButton('Process', () => null),
                        getElevatedButton('Delete', () => null),
                        getElevatedButton('Print', () => invoiceProvider.takeScreenshot(context)),
                        getElevatedButton('Preview Map', () => null),
                        getElevatedButton('Export PDf', () => invoiceProvider.generatePdf(context)),
                        getElevatedButton('Export Excel', () => null),
                      ],
                    ),
                    Center(
                      child: Text(
                        'Invoice',
                        style: TextStyle(
                            fontSize: FetchPixels.getPixelHeight(40),
                            fontFamily: 'Jost',
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF006666)),
                      ),
                    ),
                    Center(
                      child: Text(
                        'INV No: 00000718',
                        style: TextStyle(
                            fontSize: FetchPixels.getPixelHeight(12),
                            fontFamily: 'Jost'),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: FetchPixels.getPixelWidth(30)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            // 'assets/image/icon/Rectangle 5129.png',
                            'assets/images/Rectangle 5129.png',
                            width: FetchPixels.getPixelWidth(60),
                            height: FetchPixels.getPixelHeight(60),
                            fit: BoxFit.cover,
                          ),
                          SizedBox(height: FetchPixels.getPixelHeight(10)),
                          Text(
                            'Company Name Here',
                            style: TextStyle(
                                fontSize: FetchPixels.getPixelHeight(16),
                                fontFamily: 'Jost',
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: FetchPixels.getPixelHeight(10)),
                          SizedBox(
                              width: FetchPixels.getPixelHeight(210),
                              child: Text(
                                'T/A Insya Kassam 33x, Pangani/livingstone St P.O Vox 16271 Aruhsa Tanzania',
                                style: TextStyle(
                                    fontFamily: 'Jost',
                                    fontSize: FetchPixels.getPixelHeight(10)),
                              )),
                          SizedBox(height: FetchPixels.getPixelHeight(10)),
                          Text(
                            'Bill To',
                            style: TextStyle(
                                fontSize: FetchPixels.getPixelHeight(16),
                                fontFamily: 'Jost',
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            'Muhammad Ali Traders',
                            style: TextStyle(
                                fontSize: FetchPixels.getPixelHeight(10),
                                fontFamily: 'Jost'),
                          ),
                          SizedBox(
                              width: FetchPixels.getPixelHeight(200),
                              child: Text(
                                'To branch Address (T/A Insya Kassam 33x, Pangani/livingstone)',
                                style: TextStyle(
                                    fontSize: FetchPixels.getPixelHeight(10),
                                    fontFamily: 'Jost'),
                              )),
                          SizedBox(height: FetchPixels.getPixelHeight(10)),
                          Row(
                            children: [
                              Text(
                                'Invoice Date:',
                                style: TextStyle(
                                    fontSize: FetchPixels.getPixelHeight(10),
                                    fontFamily: 'Jost'),
                              ),
                              SizedBox(width: FetchPixels.getPixelWidth(5)),
                              Text(
                                '12/04/24',
                                style: TextStyle(
                                    fontSize: FetchPixels.getPixelHeight(10),
                                    fontFamily: 'Jost'),
                              ),
                
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'Processed On:',
                                style: TextStyle(
                                    fontSize: FetchPixels.getPixelHeight(10),
                                    fontFamily: 'Jost'),
                              ),
                              SizedBox(width: FetchPixels.getPixelWidth(5)),
                              Text(
                                '12/04/24',
                                style: TextStyle(
                                    fontSize: FetchPixels.getPixelHeight(10),
                                    fontFamily: 'Jost'),
                              )
                            ],
                          ),
                          SizedBox(
                            width: FetchPixels.getPixelHeight(200),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'From Branch:',
                                  style: TextStyle(
                                      fontSize:
                                      FetchPixels.getPixelHeight(10),
                                      fontFamily: 'Jost'),
                                ),
                                SizedBox(width: FetchPixels.getPixelWidth(5)),
                                Flexible(
                                    child: Text(
                                      'To branch Address (T/A Insya Kassam 33x, Pangani/livingstone)',
                                      style: TextStyle(
                                          fontSize:
                                          FetchPixels.getPixelHeight(10),
                                          fontFamily: 'Jost'),
                                    ))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                
                
                    SizedBox(height: FetchPixels.getPixelHeight(20)),
                    table(),
                    // SizedBox(height: FetchPixels.getPixelHeight(20)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Sub Total',
                          style: TextStyle(
                              fontSize: FetchPixels.getPixelHeight(13),
                              fontWeight: FontWeight.w800),
                        ),
                        SizedBox(width: FetchPixels.getPixelWidth(5)),
                        Text(
                          '100',
                          style: TextStyle(
                              fontSize: FetchPixels.getPixelHeight(13),
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        width: FetchPixels.getPixelWidth(180),
                        padding: EdgeInsets.symmetric(
                            vertical: FetchPixels.getPixelHeight(10),
                            horizontal: FetchPixels.getPixelWidth(10)),
                        color: Color(0xFFCCCCCC),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Total',
                              style: TextStyle(
                                  fontSize: FetchPixels.getPixelHeight(13),
                                  fontWeight: FontWeight.w800),
                            ),
                            SizedBox(width: FetchPixels.getPixelWidth(5)),
                            Text(
                              '100',
                              style: TextStyle(
                                  fontSize: FetchPixels.getPixelHeight(13),
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )),
        ),
      ),
    );
    },);
  }
}

 Widget getElevatedButton(String text, Function()? onPressed){
  return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF006666),
          padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(FetchPixels.getPixelHeight(3))),
          minimumSize: Size(FetchPixels.getPixelWidth(45), FetchPixels.getPixelHeight(22))
      ),
      child: Text(text, style: TextStyle(fontSize: FetchPixels.getPixelHeight(10), fontFamily: "Jost"))
  );
}

Widget table() {
  return Column(
    children: [
      Container(
        height: FetchPixels.getPixelHeight(160),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  height: FetchPixels.getPixelHeight(40),
                  decoration: BoxDecoration(color: Color(0xFF006666)),
                  child: Row(
                    children: [
                      SizedBox(
                        width: FetchPixels.getPixelWidth(5),
                      ),
                      SizedBox(
                        width: FetchPixels.getPixelWidth(30),
                        child: Text(
                          'S NO',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Jost',
                              fontSize: FetchPixels.getPixelHeight(12),
                              color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        width: FetchPixels.getPixelWidth(15),
                      ),
                      SizedBox(
                        width: FetchPixels.getPixelWidth(140),
                        child: Text(
                          'Item And Description',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Jost',
                              fontSize: FetchPixels.getPixelHeight(12),
                              color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        width: FetchPixels.getPixelWidth(10),
                      ),
                      SizedBox(
                        width: FetchPixels.getPixelWidth(30),
                        child: Text(
                          'Qty',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Jost',
                              fontSize: FetchPixels.getPixelHeight(12),
                              color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        width: FetchPixels.getPixelWidth(5),
                      ),
                      SizedBox(
                        width: FetchPixels.getPixelWidth(30),
                        child: Text(
                          'Rate',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Jost',
                              fontSize: FetchPixels.getPixelHeight(12),
                              color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        width: FetchPixels.getPixelWidth(10),
                      ),
                      SizedBox(
                        width: FetchPixels.getPixelWidth(42),
                        child: Text(
                          'Amount',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Jost',
                              fontSize: FetchPixels.getPixelHeight(12),
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 3,
                  // userAuctionProvider.searchController.text.isEmpty
                  //     ? userProviders.userList.length
                  //     : userprovider.itemsuseraution.length,
                  padding: EdgeInsets.only(top: 0),
                  itemBuilder: (context, index) {
                    Color backgroundColor =
                    index.isOdd ? Colors.grey.shade100 : Colors.white;

                    return GestureDetector(
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) =>
                        //             ReceivablePageView()));
                      },
                      child: Container(
                        // padding: EdgeInsets.only(
                        //     bottom: FetchPixels.getPixelHeight(5)),
                        height: FetchPixels.getPixelHeight(40),
                        width: FetchPixels.getPixelWidth(15),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                                color: Colors.grey.withOpacity(0.3)),
                          ),
                          color: backgroundColor,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 0.1,
                            bottom: 1,
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                  width: FetchPixels.getPixelWidth(40),
                                  child: Text(
                                    index.toString(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize:
                                        FetchPixels.getPixelHeight(13)),
                                  )),
                              SizedBox(width: FetchPixels.getPixelWidth(15)),
                              SizedBox(
                                  width: FetchPixels.getPixelWidth(140),
                                  child: Text(
                                    "Macbook Air",
                                    style: TextStyle(
                                        fontSize:
                                        FetchPixels.getPixelHeight(13)),
                                  )),
                              SizedBox(width: FetchPixels.getPixelWidth(10)),
                              SizedBox(
                                  width: FetchPixels.getPixelWidth(30),
                                  child: Text(
                                    "25",
                                    style: TextStyle(
                                        fontSize:
                                        FetchPixels.getPixelHeight(13)),
                                  )),
                              SizedBox(
                                width: FetchPixels.getPixelWidth(5),
                              ),
                              SizedBox(
                                  width: FetchPixels.getPixelWidth(30),
                                  child: Text(
                                    "\$50",
                                    style: TextStyle(
                                        fontSize:
                                        FetchPixels.getPixelHeight(13)),
                                  )),
                              SizedBox(
                                width: FetchPixels.getPixelWidth(10),
                              ),
                              SizedBox(
                                  width: FetchPixels.getPixelWidth(40),
                                  child: Text(
                                    "\$30",
                                    style: TextStyle(
                                        fontSize:
                                        FetchPixels.getPixelHeight(13)),
                                  )),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            )
            //;
            //})
          ],
        ),
      ),
    ],
  );
}