// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
//
// class ImagePickerWidget extends StatefulWidget {
//   const ImagePickerWidget({Key? key}) : super(key: key);
//
//   // final int h;
//   // final int w;
//
//   @override
//   _ImagePickerWidgetState createState() => _ImagePickerWidgetState();
// }
//
// class _ImagePickerWidgetState extends State<ImagePickerWidget> {
//   XFile? _image;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: _image != null
//             ? const Text('No image selected.')
//             : Image.file(File(_image!.path)),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => pickImage(source: ImageSource.gallery),
//         tooltip: 'Pick Image',
//         child: const Icon(Icons.add_a_photo),
//       ),
//     );
//   }
//
//   Future<void> pickImage({required ImageSource source}) async {
//     final XFile? image = await ImagePicker().pickImage(source: source);
//
//     setState(() {
//       _image = image;
//     });
//   }
// }
