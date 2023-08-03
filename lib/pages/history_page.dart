import 'package:flutter/material.dart';
import 'package:flutter_qr_reader/models/scan_model.dart';
import 'package:flutter_qr_reader/services/scan_provider.dart';
import 'package:provider/provider.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scanProvider = Provider.of<ScanProvider>(context);
    final scans = scanProvider.scans;

    return ListView.builder(
        itemCount: scans.length,
        itemBuilder: (_, int index) {
          ScanModel scan = scans[index];

          return Dismissible(
            key: UniqueKey(),
            background: Container(color: Colors.red),
            onDismissed: (DismissDirection direction) {
              Provider.of<ScanProvider>(context, listen: false)
                  .deleteScanById(scan.id);
            },
            child: ListTile(
              leading: const Icon(Icons.map),
              title: Text(scan.valor),
              subtitle: Text('ID: ${scan.id.toString()}'),
              trailing: const Icon(
                Icons.keyboard_arrow_right,
                color: Colors.grey,
              ),
              onTap: () => print('OPEN SOMETHING'),
            ),
          );
        });
  }
}
