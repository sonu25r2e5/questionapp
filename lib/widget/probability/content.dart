import 'package:flutter/material.dart';
import 'class2.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

class Imagee extends StatelessWidget {
  final Question qse;
  const Imagee(this.qse, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(qse.yearName),
      ),
      body: PDF(
        enableSwipe: true,
        onError: (error) {
          print(
            error.toString(),
          );
        },
        onPageError: (page, error) {
          print('$page: ${error.toString()}');
        },
        onPageChanged: (int? page, total) {
          print('page: $page/$total');
        },
      ).fromAsset(qse.url),
    );
  }
}
