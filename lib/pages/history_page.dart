import 'package:flutter/material.dart';
import 'package:flutter_qr_reader/models/scan_model.dart';
import 'package:flutter_qr_reader/services/scan_provider.dart';
import 'package:provider/provider.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scanProvider = Provider.of<ScanProvider>(context);

    return ListView.builder(
        itemCount: scanProvider.scans.length,
        itemBuilder: (_, int index) {
          ScanModel scan = scanProvider.scans[index];

          return ListTile(
            leading: const Icon(Icons.map),
            title: Text(scan.valor),
            subtitle: Text('ID: ${scan.id.toString()}'),
            trailing: const Icon(
              Icons.keyboard_arrow_right,
              color: Colors.grey,
            ),
            onTap: () => print('OPEN SOMETHING'),
          );
        });
  }
}
