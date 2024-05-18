
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Splash.dart';
import 'app_Screen.dart';

void main(){
  runApp(MaterialApp(
    initialRoute: '1',
    routes: {
      '1': (context) =>const Splashscreen(),
      '2':(context)=>const  MainScreen(),
    },
  ));
}
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'dart:async';
// import 'dart:io';
// import 'package:image_picker/image_picker.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:printing/printing.dart';
// import 'dart:typed_data';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => InvoiceModel(),
//       child: MaterialApp(
//         title: 'Invoice Generator App',
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//         ),
//         home: SplashScreen(),
//       ),
//     );
//   }
// }
//
// class SplashScreen extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     Timer(Duration(seconds: 3), () {
//       Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => HomePage()));
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Text(
//           'Invoice Generator',
//           style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//         ),
//       ),
//     );
//   }
// }
//
// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final invoiceModel = Provider.of<InvoiceModel>(context);
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Invoices'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.add),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => InvoicePage()),
//               );
//             },
//           ),
//         ],
//       ),
//       body: ListView.builder(
//         itemCount: invoiceModel.invoices.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             title: Text('Invoice ${index + 1}'),
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => InvoicePreview(invoice: invoiceModel.invoices[index])),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
//
// class InvoicePage extends StatefulWidget {
//   @override
//   _InvoicePageState createState() => _InvoicePageState();
// }
//
// class _InvoicePageState extends State<InvoicePage> {
//   final _formKey = GlobalKey<FormState>();
//   final _customerNameController = TextEditingController();
//   final _itemController = TextEditingController();
//   final _priceController = TextEditingController();
//   File? _companyLogo;
//
//   Future<void> _pickImage() async {
//     final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
//     setState(() {
//       if (pickedFile != null) {
//         _companyLogo = File(pickedFile.path);
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final invoiceModel = Provider.of<InvoiceModel>(context, listen: false);
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Create Invoice'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               TextFormField(
//                 controller: _customerNameController,
//                 decoration: InputDecoration(labelText: 'Customer Name'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter customer name';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 controller: _itemController,
//                 decoration: InputDecoration(labelText: 'Item'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter item';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 controller: _priceController,
//                 decoration: InputDecoration(labelText: 'Price'),
//                 keyboardType: TextInputType.number,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter price';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: _pickImage,
//                 child: Text('Pick Company Logo'),
//               ),
//               _companyLogo != null ? Image.file(_companyLogo!, height: 100) : Container(),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   if (_formKey.currentState!.validate()) {
//                     invoiceModel.addInvoice(
//                       Invoice(
//                         customerName: _customerNameController.text,
//                         item: _itemController.text,
//                         price: double.parse(_priceController.text),
//                         companyLogo: _companyLogo,
//                       ),
//                     );
//                     Navigator.pop(context);
//                   }
//                 },
//                 child: Text('Create Invoice'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class InvoicePreview extends StatelessWidget {
//   final Invoice invoice;
//
//   InvoicePreview({required this.invoice});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Invoice Preview'),
//       ),
//       body: PdfPreview(
//         build: (format) => _generatePdf(format, invoice),
//       ),
//     );
//   }
//
//   Future<Uint8List> _generatePdf(PdfPageFormat format, Invoice invoice) async {
//     final pdf = pw.Document();
//
//     final image = invoice.companyLogo != null ? pw.MemoryImage(invoice.companyLogo!.readAsBytesSync()) : null;
//
//     pdf.addPage(
//       pw.Page(
//         build: (context) {
//           return pw.Column(
//             children: [
//               if (image != null) pw.Image(image, height: 100),
//               pw.Text('Invoice', style: pw.TextStyle(fontSize: 24)),
//               pw.Text('Customer: ${invoice.customerName}'),
//               pw.Text('Item: ${invoice.item}'),
//               pw.Text('Price: \$${invoice.price.toStringAsFixed(2)}'),
//             ],
//           );
//         },
//       ),
//     );
//
//     return pdf.save();
//   }
// }
//
// class Invoice {
//   final String customerName;
//   final String item;
//   final double price;
//   final File? companyLogo;
//
//   Invoice({required this.customerName, required this.item, required this.price, this.companyLogo});
// }
//
// class InvoiceModel extends ChangeNotifier {
//   List<Invoice> invoices = [];
//
//   void addInvoice(Invoice invoice) {
//     invoices.add(invoice);
//     notifyListeners();
//   }
// }
