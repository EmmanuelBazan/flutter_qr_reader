import 'package:flutter/foundation.dart';
import 'package:flutter_qr_reader/models/scan_model.dart';
import 'package:flutter_qr_reader/services/db_provider.dart';

class ScanProvider extends ChangeNotifier {
  List<ScanModel> scans = [];
  String currentType = 'http';

  newScan(String value) async {
    final nuevoScan = ScanModel(valor: value);
    final id = await DBProvider.db.insertDB(nuevoScan);

    //^ Asigna el id de la base de datos al modelo
    nuevoScan.id = id;

    if (currentType == nuevoScan.tipo) {
      scans.add(nuevoScan);
      notifyListeners();
    }
  }

  getAllScans() async {
    final res = await DBProvider.db.getAllScans();
    scans = [...res];
    notifyListeners();
  }

  getScansByType(String type) async {
    final res = await DBProvider.db.getScansByType(type);
    scans = [...res];
    currentType = type;
    notifyListeners();
  }

  deleteAllScans() async {
    final res = await DBProvider.db.deleteAllScans();
    scans = [];
    notifyListeners();
  }

  deleteScanById(int? id) async {
    final res = await DBProvider.db.deleteScan(id!);
    // scans.removeWhere((element) => element.id == res);
    // notifyListeners();
  }
}
