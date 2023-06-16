import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter_pdfview/flutter_pdfview.dart';

import 'package:image_picker/image_picker.dart';

class ImageToPdfList extends StatefulWidget {
  const ImageToPdfList({super.key});

  @override
  _ImageToPdfListState createState() => _ImageToPdfListState();
}

class _ImageToPdfListState extends State<ImageToPdfList> {
  List<File> imageFiles = [];
  List<pw.Document> pdfDocuments = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image to PDF List'),
      ),
      body: ListView.builder(
        itemCount: pdfDocuments.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('PDF Document ${index + 1}'),
            onTap: () async {
              final file = File('${pdfDocuments[index].hashCode}.pdf');
              file.writeAsBytesSync(await pdfDocuments[index].save());
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PdfviwerPage(pdfPath: file.path),
                  ));
              // Open the file using a PDF viewer
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          captureImage();
        },
        child: const Icon(Icons.camera_alt),
      ),
    );
  }

  Future<void> captureImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        final imageFile = File(pickedFile.path);
        imageFiles.add(imageFile);
        convertImageToPdf(imageFile);
      });
    }
  }

  Future<void> convertImageToPdf(File imageFile) async {
    final pdf = pw.Document();

    final bytes = await imageFile.readAsBytes();
    final Uint8List uint8List = Uint8List.fromList(bytes);

    pdf.addPage(pw.Page(
      build: (pw.Context context) {
        return pw.Image(
          pw.MemoryImage(uint8List),
          fit: pw.BoxFit.contain,
        );
      },
    ));

    setState(() {
      pdfDocuments.add(pdf);
    });
  }
}

class PdfviwerPage extends StatelessWidget {
  final String pdfPath;
  const PdfviwerPage({super.key, required this.pdfPath});

  @override
  Widget build(BuildContext context) {
    return PDFView(
      filePath: pdfPath,
      swipeHorizontal: true,
    );
  }
}
