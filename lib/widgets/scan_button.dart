import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_qr_reader/models/scan_model.dart';
import 'package:flutter_qr_reader/services/db_provider.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        // String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        //     '#3D8BEF', 'Cancelar', false, ScanMode.QR);
        // print(barcodeScanRes);

        final tempScan = ScanModel(valor: 'geo:12.33,43.22');
        DBProvider.db.insertDB(tempScan);

        final tempScan2 = ScanModel(valor: 'https://github.com/EmmanuelBazan');
        DBProvider.db.insertDB(tempScan2);
        // DBProvider.db.deleteAllScans().then((value) => print(value));
      },
      elevation: 0,
      child: const Icon(Icons.qr_code),
    );
  }
}
