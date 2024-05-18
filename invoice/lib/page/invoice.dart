import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:printing/printing.dart';
import 'package:share_plus/share_plus.dart';
import '../model/images.dart';

class Invoice extends StatefulWidget {
  const Invoice({super.key});

  @override
  State<Invoice> createState() => _InvoiceState();
}

class _InvoiceState extends State<Invoice> {
  List<Images> images = [
    Images(image: 'assets/images/1.png'),
    Images(image: 'assets/images/2.png'),
    Images(image: 'assets/images/3.png'),
    Images(image: 'assets/images/4.png'),
    Images(image: 'assets/images/5.png'),
  ];

  final List<TextEditingController> _itemNameControllers = [];
  final List<TextEditingController> _itemPriceControllers = [];
  final List<TextEditingController> _itemQuantityControllers = [];
  int selectedIconIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        leading: CircleAvatar(
          backgroundColor: Colors.blue,
          child: IconButton(onPressed: (){
            setState(() {
              selectedIconIndex = -1;
              _itemNameControllers.clear();
              _itemPriceControllers.clear();
              _itemQuantityControllers.clear();
            });
          },icon:const  Icon(Icons.restore_rounded)),
        ),
        title: const Text('Invoice Generator'),
        titleTextStyle: GoogleFonts.abel(
            textStyle: const TextStyle(fontSize: 25, color: Colors.black)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 8.3),
            child: Text(
              'Logo Select',
              style: GoogleFonts.abel(
                  textStyle:
                  const TextStyle(fontSize: 25, color: Colors.black)),
            ),
          ),
          SizedBox(
            height: 140,
            child: Card(
              color: Colors.grey.shade400,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: images.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          selectedIconIndex = index;
                        });
                      },
                      child: Stack(
                        children: [
                          Card(
                            margin: const EdgeInsets.all(20),
                            child: Image.asset(images[index].image),
                          ),
                          if (selectedIconIndex == index)
                            const Padding(
                              padding: EdgeInsets.only(top: 100.0, left: 100),
                              child: Icon(
                                Icons.verified,
                              ),
                            ),
                        ],
                      ),
                    );
                  }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 8.3),
            child: Text(
              'Add Item',
              style: GoogleFonts.abel(
                  textStyle:
                  const TextStyle(fontSize: 25, color: Colors.black)),
            ),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: _itemNameControllers.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 300,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          children: [
                            // Item name text field
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                controller: _itemNameControllers[index],
                                decoration: const InputDecoration(
                                    label: Text('Item Name'),
                                    border: OutlineInputBorder()),
                              ),
                            ),

                            // Item price text field
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                controller: _itemPriceControllers[index],
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                    label: Text('Item Price'),
                                    border: OutlineInputBorder()),
                              ),
                            ),

                            // Item quantity text field
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                controller: _itemQuantityControllers[index],
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                    label: Text('Quantity'),
                                    border: OutlineInputBorder()),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Column(
            children: [
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _itemNameControllers.add(TextEditingController());
                      _itemPriceControllers.add(TextEditingController());
                      _itemQuantityControllers.add(TextEditingController());
                    });
                  },
                  child: const Text('Add Item'),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white),
                    onPressed: selectedIconIndex < 0 ? null : () => sharePDF(),
                    child: const Text('Share PDF'),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  Future<void> sharePDF() async {
    final pdf = pw.Document();
    final subtotal = _calculateSubtotal();
    final gst = _calculateGST(subtotal);
    final deliveryCharges = _calculateDeliveryCharges(subtotal);
    final total = _calculateTotal(subtotal, gst, deliveryCharges);
    final image = await imageFromAssetBundle(images[selectedIconIndex].image);

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Column(
              children: [
                pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Text('INVOICE GENERATOR',
                          style: pw.TextStyle(
                              fontSize: 30, fontWeight: pw.FontWeight.bold)),
                      pw.Divider(),
                      pw.Image(image, height: 52),
                    ]),
                pw.Row(children: [
                  pw.Text('BILLED TO:',
                      style: pw.TextStyle(
                          fontSize: 15, fontWeight: pw.FontWeight.bold)),
                  pw.Spacer(),
                  pw.Text('Jenil Khatrani',
                      style: const pw.TextStyle(fontSize: 15)),
                ]),
                pw.SizedBox(height: 5),
                pw.Row(children: [
                  pw.Text('Pay TO:',
                      style: pw.TextStyle(
                          fontSize: 15, fontWeight: pw.FontWeight.bold)),
                  pw.Spacer(),
                  pw.Text('Items',
                      style: const pw.TextStyle(
                        fontSize: 15,
                      )),
                ]),
                pw.SizedBox(height: 5),
                pw.Row(children: [
                  pw.Text('Bank :', style: const pw.TextStyle(fontSize: 15)),
                  pw.Spacer(),
                  pw.Text('SBI bank',
                      style: const pw.TextStyle(
                        fontSize: 15,
                      )),
                ]),
                pw.SizedBox(height: 5),
                pw.Row(children: [
                  pw.Text('Account Name:',
                      style: const pw.TextStyle(fontSize: 15)),
                  pw.Spacer(),
                  pw.Text('khatrani jenil',
                      style: const pw.TextStyle(
                        fontSize: 15,
                      )),
                ]),
                pw.SizedBox(height: 5),
                pw.Row(children: [
                  pw.Text('IFSC:', style: const pw.TextStyle(fontSize: 15)),
                  pw.Spacer(),
                  pw.Text('SBI165418946',
                      style: const pw.TextStyle(
                        fontSize: 15,
                      )),
                ]),
                pw.SizedBox(height: 5),
                pw.Row(children: [
                  pw.Text('Account Number:',
                      style: const pw.TextStyle(fontSize: 15)),
                  pw.Spacer(),
                  pw.Text('458263 458972',
                      style: const pw.TextStyle(
                        fontSize: 15,
                      )),
                ]),
                pw.SizedBox(height: 15),
                pw.Padding(
                  padding: const pw.EdgeInsets.all(0),
                  child: pw.Row(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    mainAxisAlignment: pw.MainAxisAlignment.start,
                    children: [
                      pw.Column(
                        mainAxisAlignment: pw.MainAxisAlignment.start,
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Row(
                              crossAxisAlignment: pw.CrossAxisAlignment.center,
                              mainAxisAlignment: pw.MainAxisAlignment.center,
                              children: [
                                pw.Text('Product Name'),
                                pw.SizedBox(width: 180),
                                pw.Text('Price'),
                                pw.SizedBox(width: 155),
                                pw.Text('Quantity'),
                              ]),
                        ],
                      ),
                      pw.SizedBox(width: 10),
                    ],
                  ),
                ),
                pw.Divider(),
                pw.ListView.builder(
                    itemBuilder: (context, index) {
                      return pw.Padding(
                          padding: const pw.EdgeInsets.only(top: 0),
                          child: pw.Column(children: [
                            pw.Row(children: [
                              pw.Text(_itemNameControllers[index].text),
                              pw.Spacer(),
                              // pw.SizedBox(width: 150),
                              pw.Text(_itemPriceControllers[index].text),
                              pw.Spacer(),
                              pw.Text(_itemQuantityControllers[index].text),
                            ]),
                            pw.Divider(),
                          ]));
                    },
                    itemCount: _itemNameControllers.length),
                pw.Row(children: [
                  pw.Text('SubTotal', style: const pw.TextStyle(fontSize: 15)),
                  pw.Spacer(),
                  pw.Text('\$$subtotal',
                      style: const pw.TextStyle(
                        fontSize: 15,
                      )),
                ]),
                pw.Row(children: [
                  pw.Text('Delivery(Get free Delivery on bill above \$500)',
                      style: const pw.TextStyle(fontSize: 15)),
                  pw.Spacer(),
                  pw.Text('\$$deliveryCharges',
                      style: const pw.TextStyle(
                        fontSize: 15,
                      )),
                ]),
                pw.Row(children: [
                  pw.Text('GST Total(15%)',
                      style: const pw.TextStyle(fontSize: 15)),
                  pw.Spacer(),
                  pw.Text('\$${gst}',
                      style: const pw.TextStyle(
                        fontSize: 15,
                      )),
                ]),
                pw.Divider(),
                pw.Row(children: [
                  pw.Text('Total', style: const pw.TextStyle(fontSize: 15)),
                  pw.Spacer(),
                  pw.Text('\$$total',
                      style: const pw.TextStyle(
                        fontSize: 15,
                      )),
                ]),
                pw.SizedBox(height: 50),
                pw.Text(
                    'Payment is required within 14 business days of invoice date. Please send remittance to hello@rellygreatsite.com.'),
                pw.SizedBox(height: 50),
                pw.Text('Thank you for your business'),
              ],
            ),
          ); // Center
        },
      ),
    ); //

    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    final output = await getApplicationDocumentsDirectory();
    final file = File('${output.path}/$fileName.pdf');
    await file.writeAsBytes(await pdf.save());

    await Share.shareXFiles([XFile('${output.path}/$fileName.pdf')], text: 'Invoice Generator');
  }

  double _calculateSubtotal() {
    double subtotal = 0.0;
    for (int i = 0; i < _itemNameControllers.length; i++) {
      final priceText = _itemPriceControllers[i].text;
      final quantityText = _itemQuantityControllers[i].text;
      if (priceText.isNotEmpty && quantityText.isNotEmpty) {
        final price = double.tryParse(priceText);
        final quantity = double.tryParse(quantityText);
        if (price != null && quantity != null) {
          subtotal += price * quantity;
        }
      }
    }
    return subtotal;
  }

  double _calculateGST(double subtotal) {
    return subtotal * 0.15;
  }

  double _calculateDeliveryCharges(double subtotal) {
    if (subtotal >= 1 && subtotal < 100) {
      return 2.0;
    } else if (subtotal >= 100 && subtotal <= 200) {
      return 5.0;
    } else if (subtotal > 200 && subtotal <= 250) {
      return 8.0;
    } else if (subtotal > 250 && subtotal <= 500) {
      return 10.0;
    } else {
      return 0.0;
    }
  }

  double _calculateTotal(double subtotal, double gst, double deliveryCharges) {
    return subtotal + gst + deliveryCharges;
  }
}

// import 'dart:typed_data';
// import 'package:flutter/material.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:printing/printing.dart';
// import 'package:flutter/services.dart' show rootBundle;
//
// import '../model/images.dart';
//
//
// class InvoiceForm extends StatefulWidget {
//   @override
//   _InvoiceFormState createState() => _InvoiceFormState();
// }
//
// class _InvoiceFormState extends State<InvoiceForm> {
//   List<InvoiceItem> items = [InvoiceItem()];
//
//   void addItem() {
//     setState(() {
//       items.add(InvoiceItem());
//     });
//   }
//
//   void removeItem(int index) {
//     setState(() {
//       items.removeAt(index);
//     });
//   }
//
//   double getTotalAmount() {
//     return items.fold(0, (sum, item) => sum + item.amount);
//   }
//
//   Future<Uint8List> loadAsset(String path) async {
//     final ByteData data = await rootBundle.load(path);
//     return data.buffer.asUint8List();
//   }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             Expanded(
//               child: ListView.builder(
//                 itemCount: items.length,
//                 itemBuilder: (context, index) {
//                   return InvoiceItemRow(
//                     item: items[index],
//                     onRemove: () => removeItem(index),
//                     onSelectIcon: (iconIndex) {
//                       setState(() {
//                         items[index].iconIndex = iconIndex;
//                       });
//                     },
//                   );
//                 },
//               ),
//             ),
//             ElevatedButton(
//               onPressed: addItem,
//               child: Text('Add Item'),
//             ),
//             ElevatedButton(
//               onPressed: generatePDF,
//               child: Text('Create PDF'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class InvoiceItem {
//   String name = '';
//   double price = 0;
//   int quantity = 0;
//   int? iconIndex;
//
//   double get amount => price * quantity;
// }
//
// class InvoiceItemRow extends StatefulWidget {
//   final InvoiceItem item;
//   final VoidCallback onRemove;
//   final ValueChanged<int> onSelectIcon;
//
//   InvoiceItemRow(
//       {required this.item, required this.onRemove, required this.onSelectIcon});
//
//   @override
//   _InvoiceItemRowState createState() => _InvoiceItemRowState();
// }
//
// class _InvoiceItemRowState extends State<InvoiceItemRow> {
//   List<Images> images = [
//     Images(image: 'assets/images/1.png'),
//     Images(image: 'assets/images/2.png'),
//     Images(image: 'assets/images/3.png'),
//     Images(image: 'assets/images/4.png'),
//     Images(image: 'assets/images/5.png'),
//   ];
//   int selectedIconIndex = -1;
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Column(
//         children: [
//           // IconButton(
//           //   icon: Icon(Icons.image),
//           //   onPressed: () async {
//           //     final iconIndex = await showDialog<int>(
//           //       context: context,
//           //       builder: (BuildContext context) {
//           //         return SimpleDialog(
//           //           title: Text('Select Icon'),
//           //           children: [
//           //             SimpleDialogOption(
//           //               onPressed: () => Navigator.pop(context, 0),
//           //               child: Image.asset('assets/images/1.png', width: 40),
//           //             ),
//           //             SimpleDialogOption(
//           //               onPressed: () => Navigator.pop(context, 1),
//           //               child: Image.asset('assets/images/2.png', width: 40),
//           //             ),
//           //             SimpleDialogOption(
//           //               onPressed: () => Navigator.pop(context, 2),
//           //               child: Image.asset('assets/images/3.png', width: 40),
//           //             ),
//           //             SimpleDialogOption(
//           //               onPressed: () => Navigator.pop(context, 3),
//           //               child: Image.asset('assets/images/4.png', width: 40),
//           //             ),
//           //             SimpleDialogOption(
//           //               onPressed: () => Navigator.pop(context, 4),
//           //               child: Image.asset('assets/images/5.png', width: 40),
//           //             ),
//           //           ],
//           //         );
//           //       },
//           //     );
//           //     if (iconIndex != null) {
//           //       widget.onSelectIcon(iconIndex);
//           //     }
//           //   },
//           // ),
//           SizedBox(
//             height: 140,
//             child: Card(
//               color: Colors.grey.shade400,
//               child: ListView.builder(
//                   scrollDirection: Axis.horizontal,
//                   itemCount: images.length,
//                   itemBuilder: (context, index) {
//                     return InkWell(
//                       onTap: () {
//                         setState(() {
//                           selectedIconIndex = index;
//                         });
//                       },
//                       child: Stack(
//                         children: [
//                           Card(
//                             margin: const EdgeInsets.all(20),
//                             child: Image.asset(images[index].image),
//                           ),
//                           if (selectedIconIndex == index)
//                             const Padding(
//                               padding: EdgeInsets.only(top: 100.0, left: 100),
//                               child: Icon(
//                                 Icons.verified,
//                               ),
//                             ),
//                         ],
//                       ),
//                     );
//                   }),
//             ),
//           ),
//           Row(
//             children: [
//               Expanded(
//                 child: TextFormField(
//                   decoration: InputDecoration(labelText: 'Item Name'),
//                   onChanged: (value) {
//                     setState(() {
//                       widget.item.name = value;
//                     });
//                   },
//                 ),
//               ),
//               SizedBox(width: 8),
//
//               SizedBox(width: 8),
//               Expanded(
//                 child: TextFormField(
//                   decoration: InputDecoration(labelText: 'Price'),
//                   keyboardType: TextInputType.numberWithOptions(decimal: true),
//                   onChanged: (value) {
//                     setState(() {
//                       widget.item.price = double.tryParse(value) ?? 0;
//                     });
//                   },
//                 ),
//               ),
//               SizedBox(width: 8),
//               Expanded(
//                 child: TextFormField(
//                   decoration: InputDecoration(labelText: 'Quantity'),
//                   keyboardType: TextInputType.number,
//                   onChanged: (value) {
//                     setState(() {
//                       widget.item.quantity = int.tryParse(value) ?? 0;
//                     });
//                   },
//                 ),
//               ),
//               SizedBox(width: 8),
//               Expanded(
//                 child: Text(
//                   '\$${widget.item.amount.toStringAsFixed(2)}',
//                   style: TextStyle(fontSize: 16),
//                 ),
//               ),
//               SizedBox(width: 8),
//               IconButton(
//                 icon: Icon(Icons.remove_circle, color: Colors.red),
//                 onPressed: widget.onRemove,
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//   Future<void> generatePDF() async {
//     final pdf = pw.Document();
//     final image = await imageFromAssetBundle(images[selectedIconIndex].image);
//     pdf.addPage(
//       pw.Page(
//         build: (context) {
//           return pw.Column(
//             crossAxisAlignment: pw.CrossAxisAlignment.start,
//             children: [
//               pw.Row(
//                   children: [
//                     pw.Text('Invoice', style: pw.TextStyle(fontSize: 40)),
//                     pw.Spacer(),
//
//                   ]
//               ),
//
//
//               pw.SizedBox(height: 20),
//               pw.Table.fromTextArray(
//                 headers: ['Item Name', 'Icon', 'Price', 'Quantity', 'Amount'],
//                 data: items.map((item) {
//                   return [
//                     item.name,
//                     item.price.toStringAsFixed(2),
//                     item.quantity.toString(),
//                     item.amount.toStringAsFixed(2),
//                   ];
//                 }).toList(),
//               ),
//               pw.SizedBox(height: 20),
//               pw.Text(
//                 'Total Amount: \$${getTotalAmount().toStringAsFixed(2)}',
//                 style: pw.TextStyle(
//                     fontSize: 20, fontWeight: pw.FontWeight.bold),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//
//     await Printing.layoutPdf(
//         onLayout: (PdfPageFormat format) async => pdf.save());
//   }
// }
