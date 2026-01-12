import 'package:assignment_medicine/data/model/medicine_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MedicineProvider extends ChangeNotifier {
  final Box<MedicineModel> _medicineBox;
  MedicineProvider(this._medicineBox);

  List<MedicineModel> get medicines {
    final meds = _medicineBox.values.toList();
    meds.sort((a, b) => a.time.compareTo(b.time));
    return meds;
  }

  void addMedicine(MedicineModel meds) {
    _medicineBox.add(meds);
    notifyListeners();
  }

  bool get isEmpty => _medicineBox.isEmpty;
}
