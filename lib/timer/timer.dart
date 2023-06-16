import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;

class MyPDFFile {
  final String fileName;
  final String filePath;

  const MyPDFFile(this.fileName, this.filePath);

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'fileName': fileName});
    result.addAll({'filePath': filePath});

    return result;
  }

  factory MyPDFFile.fromMap(Map<String, dynamic> map) {
    return MyPDFFile(
      map['fileName'] ?? '',
      map['filePath'] ?? '',
    );
  }
}

class ImageToPdfList extends StatefulWidget {
  const ImageToPdfList({super.key});

  @override
  _ImageToPdfListState createState() => _ImageToPdfListState();
}

class _ImageToPdfListState extends State<ImageToPdfList> {
  static const cacheKey = 'pdffilekey';

  final List<MyPDFFile> _pdfFiles = <MyPDFFile>[];

  final box = GetStorage();

  @override
  void initState() {
    super.initState();
    _initializeState();
  }

  void _updateCache() {
    box.write(cacheKey, _pdfFiles.map((e) => e.toMap()).toList());
    setState(() {});
  }

  void _initializeState() {
    setState(() {
      _pdfFiles.clear();
      _pdfFiles.addAll(cachePDfFile);
    });
  }

  List<MyPDFFile> get cachePDfFile => (box.read<List>(cacheKey) ?? [])
      .map((e) => MyPDFFile.fromMap(e))
      .toList();

  Future<void> _saveFile(MyPDFFile pdfFile, pw.Document document) async {
    final file = File(pdfFile.filePath);
    final pdfData = await document.save();

    await file.writeAsBytes(pdfData);
    _pdfFiles.add(pdfFile);
    _updateCache();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image to PDF List'),
      ),
      body: ListView.builder(
        itemCount: _pdfFiles.length,
        itemBuilder: (context, index) {
          final pdfDoc = _pdfFiles[index];
          return ListTile(
            title: Text(pdfDoc.fileName),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PdfviwerPage(filePath: pdfDoc.filePath),
                ),
              );
              //

              // Open the file using a PDF viewer
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final capturedDocument = await captureImage();
          if (capturedDocument == null) {
            return;
          }
          if (!mounted) {
            return;
          }
          final fileName = await _getFileNameDialog(context);

          if (fileName == null) {
            return;
          }

          final filePath = join((await getApplicationDocumentsDirectory()).path,
              '${capturedDocument.hashCode}.pdf');

          final myPDF = MyPDFFile(fileName, filePath);
          await _saveFile(myPDF, capturedDocument);
        },
        child: const Icon(Icons.camera_alt),
      ),
    );
  }

  Future<String?> _getFileNameDialog(BuildContext context) {
    return showDialog<String>(
        barrierDismissible: false,
        context: context,
        builder: (ctx) {
          String? fileName;
          return AlertDialog(
            title: const Text('Enter File Name'),
            content: TextField(
              onChanged: (s) {
                fileName = s;
              },
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(fileName);
                },
                child: const Text('OK'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('cancel'),
              ),
            ],
          );
        });
  }

  Future<pw.Document?> captureImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      final imageFile = File(pickedFile.path);
      // imageFiles.add(imageFile);
      final document = await convertImageToPdf(imageFile);
      return document;
    }
    return null;
  }

  Future<pw.Document> convertImageToPdf(File imageFile) async {
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
    return pdf;

    // setState(() {
    //   pdfDocuments.add(pdf);
    // });
  }
}

class PdfviwerPage extends StatelessWidget {
  final String filePath;
  const PdfviwerPage({super.key, required this.filePath});

  @override
  Widget build(BuildContext context) {
    return PDFView(
      filePath: filePath,
      swipeHorizontal: true,
    );
  }
}
