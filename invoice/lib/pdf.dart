// import 'dart:typed_data';
// import 'dart:typed_data';
// import 'package:flutter/material.dart';
// import 'package:invoice/page/invoice.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:printing/printing.dart';
// import 'package:flutter/services.dart' show rootBundle;
//
// class InvoiceForm extends StatefulWidget {
//   @override
//   _InvoiceFormState createState() => _InvoiceFormState();
//   final images = [
//     'assets/images/1.png',
//     'assets/images/2.png',
//     'assets/images/3.png',
//     'assets/images/4.png',
//     'assets/images/5.png',
//   ];
//
//   onSelectIcon(int iconIndex){
//     final iconImages = <int, pw.MemoryImage>{};
//     var items;
//     for (var item in items) {
//       if (item.iconIndex != null) {
//         final image = pw.MemoryImage(images[item.iconIndex!] as Uint8List);
//     iconImages[item.iconIndex!] = image;
//   }
//   }
//   }
//
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
//   Future<void> generatePDF() async {
//     final pdf = pw.Document();
//
//     final images = [
//       'assets/images/1.png',
//       'assets/images/2.png',
//       'assets/images/3.png',
//       'assets/images/4.png',
//       'assets/images/5.png',
//     ];
//
//     final iconImages = <int, pw.MemoryImage>{};
//     for (var item in items) {
//       if (item.iconIndex != null) {
//         final image = pw.MemoryImage(await loadAsset(images[item.iconIndex!]));
//         iconImages[item.iconIndex!] = image;
//       }
//     }
//
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
//                    pw.Image(image),
//
//                   ]
//               ),
//               pw.SizedBox(height: 20),
//               pw.Table.fromTextArray(
//                 headers: ['Item Name', 'Icon', 'Price', 'Quantity', 'Amount'],
//                 data: items.map((item) {
//                   return [
//                     item.name,
//                     // item.iconIndex != null
//                     //     ? pw.Image(iconImages[item.iconIndex!]!,
//                     //     width: 20, height: 20)
//                     //     : '',
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
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             Text('select icon'),
//             IconButton(
//               icon: Icon(Icons.image),
//               onPressed: () async {
//                 final iconIndex = await showDialog<int>(
//                   context: context,
//                   builder: (BuildContext context) {
//                     return SimpleDialog(
//                       title: Text('Select Icon'),
//                       children: [
//                         SimpleDialogOption(
//                           onPressed: () => Navigator.pop(context, 0),
//                           child: Image.asset('assets/images/1.png', width: 40),
//                         ),
//                         SimpleDialogOption(
//                           onPressed: () => Navigator.pop(context, 1),
//                           child: Image.asset('assets/images/2.png', width: 40),
//                         ),
//                         SimpleDialogOption(
//                           onPressed: () => Navigator.pop(context, 2),
//                           child: Image.asset('assets/images/3.png', width: 40),
//                         ),
//                         SimpleDialogOption(
//                           onPressed: () => Navigator.pop(context, 3),
//                           child: Image.asset('assets/images/4.png', width: 40),
//                         ),
//                         SimpleDialogOption(
//                           onPressed: () => Navigator.pop(context, 4),
//                           child: Image.asset('assets/images/5.png', width: 40),
//                         ),
//                       ],
//                     );
//                   },
//                 );
//                 if (iconIndex != null) {
//                   var onSelectIcon = widget.onSelectIcon(iconIndex);
//                 }
//               },
//             ),
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