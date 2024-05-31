import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as p;

class InvoiceProvider extends ChangeNotifier {
  ScreenshotController screenshotController = ScreenshotController();

  void takeScreenshot(BuildContext context) {
    screenshotController
        .capture()
        .then((Uint8List? image) => _saveToGallery(image!));
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Saved to Gallery')));
  }

  void _saveToGallery(Uint8List bytes) async {
    String time = DateTime.now()
        .toIso8601String()
        .replaceAll('.', '-')
        .replaceAll(':', '-');
    String name = "POS-INV-$time";
    await ImageGallerySaver.saveImage(bytes, name: name);
  }

  Future<void> generatePdf(BuildContext context) async{
    final pdf = p.Document();
    final image = p.MemoryImage(
      (await rootBundle.load('assets/image/icon/Rectangle 5129.png')).buffer.asUint8List(),
    );

    pdf.addPage(
        p.MultiPage(
          mainAxisAlignment: p.MainAxisAlignment.start,
          margin: p.EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          pageFormat: PdfPageFormat.a4,
          build: (context) => [
            p.SizedBox(
              height: 70,
              width: 70,
              child: p.Image(
                  image,
                fit: p.BoxFit.cover
              ),
            ),
      _buildTitle(),
      p.SizedBox(height: 20),
      _buildTable(),
      p.SizedBox(height: 10),
      _buildTotal(),
    ],
    ));

    Directory? root = await getExternalStorageDirectory();
    String time = DateTime.now()
        .toIso8601String()
        .replaceAll('.', '-')
        .replaceAll(':', '-');
    String name = "POS-INV-$time";
    String path = "${root?.path}/${name}.pdf";
    final file = File(path);
    await file.writeAsBytes(await pdf.save());
    await OpenFile.open(file.path);

    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("PDF saved on path: "+ path)));
  }

  p.Widget _buildTitle() => p.Column(
      children: [
        p.Row(
            crossAxisAlignment: p.CrossAxisAlignment.start,
            mainAxisAlignment: p.MainAxisAlignment.spaceBetween,
            children: [
              p.Column(
                  crossAxisAlignment: p.CrossAxisAlignment.start,
                  children: [
                    p.Text(
                      'Company Name Here',
                      style: p.TextStyle(
                          fontSize: 16,
                          fontWeight: p.FontWeight.bold
                      ),
                    ),
                    p.SizedBox(height:10),
                    p.SizedBox(
                        width: 135,
                        child: p.Text(
                          'T/A Insya Kassam 33x, Pangani/livingstone St P.O Vox 16271 Aruhsa Tanzania',
                          style: p.TextStyle(
                              fontSize: 10),
                        )),
                    p.SizedBox(height: (30)),
                    p.Text(
                      'Bill To',
                      style: p.TextStyle(
                          fontSize: (16),
                          fontWeight: p.FontWeight.bold),
                    ),
                    p.Text(
                      'Muhammad Ali Traders',
                      style: p.TextStyle(
                        fontSize: (10),
                      ),
                    ),
                    p.SizedBox(
                        width: (135),
                        child: p.Text(
                          'To branch Address (T/A Insya Kassam 33x, Pangani/livingstone)',
                          style: p.TextStyle(
                            fontSize: (10),
                          ),
                        )),
                  ]
              ),
              p.Column(
                crossAxisAlignment: p.CrossAxisAlignment.start,
                children: [
                  p.Text(
                    'Invoice',
                    style: p.TextStyle(
                      fontSize: 30,
                      color: PdfColor.fromHex("#1B4332"),
                      fontWeight: p.FontWeight.bold
                    ),
                  ),
                  p.Text(
                    'INV No: 00000718',
                    style: p.TextStyle(
                      fontSize: 10,),
                  ),
                  p.SizedBox(height: 50),
                  p.Row(
                    children: [
                      p.Text(
                        'Invoice Date:',
                        style: p.TextStyle(
                          fontSize: 10,),
                      ),
                      p.SizedBox(width: 5),
                      p.Text(
                        '12/04/24',
                        style: p.TextStyle(
                          fontSize: 10,),
                      )
                    ],
                  ),
                  p.SizedBox(height: 5),
                  p.Row(
                    children: [
                      p.Text(
                        'Processed On:',
                        style: p.TextStyle(
                          fontSize: (10),),
                      ),
                      p.SizedBox(width: (5)),
                      p.Text(
                        '12/04/24',
                        style: p.TextStyle(
                          fontSize: (10),),
                      )
                    ],
                  ),
                  p.SizedBox(height: (5)),
                  p.SizedBox(
                    width: (150),
                    child: p.Row(
                      crossAxisAlignment: p.CrossAxisAlignment.start,
                      children: [
                        p.Text(
                          'From Branch:',
                          style: p.TextStyle(
                              fontSize: 10),
                        ),
                        p.SizedBox(width: (5)),
                        p.Flexible(
                            child: p.Text(
                              'To branch Address (T/A Insya Kassam 33x, Pangani/livingstone)',
                              style: p.TextStyle(
                                fontSize:
                                (10),),
                            ))
                      ],
                    ),
                  )
                ],
              ),
            ]
        ),

      ]
  );

  p.Widget _buildTable() {
    final headers = [
      'S No',
      'Items & Description',
      'Qty',
      'Rate',
      'Amount'
    ];
    List<List<dynamic>> data = [
      ['0',
      'Macbook Air',
      '5',
      '\$250',
      '\$600'],
      ['0',
        'Macbook Air',
        '5',
        '\$250',
        '\$600'],
      ['0',
        'Macbook Air',
        '5',
        '\$250',
        '\$600'],

    ];
    return p.TableHelper.fromTextArray(
        headers: headers,
        data: data,
      headerStyle: p.TextStyle(fontWeight: p.FontWeight.bold, color: PdfColors.white),
      border: null,
      cellHeight: 30,
      cellAlignments: {
        0: p.Alignment.centerRight,
        1: p.Alignment.centerLeft,
        2: p.Alignment.centerRight,
        3: p.Alignment.centerRight,
        4: p.Alignment.centerRight,
      },
      headerDecoration: p.BoxDecoration(color: PdfColor.fromHex("#1B4332")),

    );
  }

  p.Widget _buildTotal(){
    return p.Column(
      children: [
    p.Row(
    mainAxisAlignment: p.MainAxisAlignment.end,
      children: [
        p.Text(
          'Sub Total',
          style: p.TextStyle(
            fontSize: (13),),
        ),
        p.SizedBox(width: (5)),
        p.Text(
          '100',
          style: p.TextStyle(
            fontSize: 13,
          ),
        ),
      ],
    ),
    p.Align(
    alignment: p.Alignment.centerRight,
    child: p.Container(
    width:180,
    padding: p.EdgeInsets.symmetric(
    vertical: 10,
    horizontal: 10),
    color: PdfColor.fromHex("#CCCCCC"),
    child: p.Row(
    mainAxisAlignment: p.MainAxisAlignment.end,
    children: [
    p.Text(
    'Total',
    style: p.TextStyle(
    fontSize: 13,
    fontWeight: p.FontWeight.bold
    ),
    ),
    p.SizedBox(width: 5),
    p.Text(
    '100',
    style: p.TextStyle(
    fontSize: 13,
    fontWeight: p.FontWeight.bold),
    ),
    ],
    ),
    ),
    )
      ]
    );
  }

}
