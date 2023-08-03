import 'package:flutter/material.dart';
import 'package:flutter_qr_reader/models/scan_model.dart';
import 'package:url_launcher/url_launcher.dart';

launchUrlScan(BuildContext context, ScanModel scan) async {
  final url = Uri.parse(scan.valor);

  if (scan.tipo == 'http') {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  } else {
    Navigator.pushNamed(context, 'mapPage', arguments: scan);
  }
}
