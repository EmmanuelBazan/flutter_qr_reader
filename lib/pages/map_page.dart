import 'package:flutter/material.dart';
import 'package:flutter_qr_reader/models/scan_model.dart';
import 'package:flutter_qr_reader/services/scan_provider.dart';
import 'package:provider/provider.dart';

class MapPage extends StatelessWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScanModel scan =
        ModalRoute.of(context)!.settings.arguments as ScanModel;
    return Scaffold(
      appBar: AppBar(title: const Text('Mapa')),
      body: Center(child: Text(scan.valor)),
    );
  }
}
