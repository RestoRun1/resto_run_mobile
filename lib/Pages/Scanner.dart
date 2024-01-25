import 'package:flutter/material.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

class Scanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SimpleBarcodeScannerPage());
  }
}
