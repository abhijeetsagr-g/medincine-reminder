import 'package:assignment_medicine/data/model/medicine_model.dart';
import 'package:assignment_medicine/logic/services/notification_service.dart';
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

  Future<void> addMedicine(MedicineModel meds) async {
    _medicineBox.add(meds);
    await NotificationService().scheduleDailyNotification(
      id: meds.notificationId,
      title: meds.name,
      body: meds.dose,
      time: meds.time,
    );
    notifyListeners();
  }

  Future<void> deleteAll() async {
    _medicineBox.clear();
    await NotificationService().cancelAll();
    notifyListeners();
  }

  bool get isEmpty => _medicineBox.isEmpty;
}
