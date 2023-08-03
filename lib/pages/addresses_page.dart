import 'package:flutter/material.dart';
import 'package:flutter_qr_reader/models/scan_model.dart';
import 'package:flutter_qr_reader/services/scan_provider.dart';
import 'package:flutter_qr_reader/widgets/scan_list.dart';
import 'package:provider/provider.dart';

class AddressesPage extends StatelessWidget {
  const AddressesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ScanList(type: 'http');
  }
}
