import 'package:flutter/material.dart';
import 'package:flutter_qr_reader/pages/addresses_page.dart';
import 'package:flutter_qr_reader/pages/history_page.dart';
import 'package:flutter_qr_reader/services/scan_provider.dart';
import 'package:flutter_qr_reader/services/ui_provider.dart';
import 'package:flutter_qr_reader/widgets/custom_navigationbar.dart';
import 'package:flutter_qr_reader/widgets/scan_button.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scanProvider = Provider.of<ScanProvider>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Historial'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                scanProvider.deleteAllScans();
              },
              icon: const Icon(Icons.delete_forever))
        ],
      ),
      body: const _HomePageBody(),
      bottomNavigationBar: const CustomNavigationBar(),
      floatingActionButton: const ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  const _HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);
    final currentIndex = uiProvider.selectedMenuOpt;

    final scanProvider = Provider.of<ScanProvider>(context, listen: false);

    switch (currentIndex) {
      case 0:
        scanProvider.getScansByType('geo');
        return const HistoryPage();
      case 1:
        scanProvider.getScansByType('http');
        return const AddressesPage();
      default:
        return const HistoryPage();
    }
  }
}
