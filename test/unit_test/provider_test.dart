import 'package:assignment_medicine/data/model/medicine_model.dart';
import 'package:assignment_medicine/logic/providers/medicine_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_test/hive_test.dart';
import 'package:hive/hive.dart';

void main() {
  late Box<MedicineModel> medicineBox;
  late MedicineProvider provider;

  // SET UP FOR ALL
  setUpAll(() async {
    await setUpTestHive();

    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(MedicineModelAdapter());
    }
  });

  setUp(() async {
    medicineBox = await Hive.openBox<MedicineModel>('testBox');
    provider = MedicineProvider(medicineBox);
  });

  tearDown(() async {
    await medicineBox.clear();
    await medicineBox.close();
  });

  tearDownAll(() async {
    await tearDownTestHive();
  });

  test('Provider should be empty initially', () {
    expect(provider.isEmpty, true);
  });

  test('Adding medicine should increase count', () {
    final medicine = MedicineModel(
      name: 'Paracetamol',
      dose: '500mg',
      time: DateTime.now(),
      notificationId: DateTime.now().millisecondsSinceEpoch.remainder(100000),
    );

    provider.addMedicine(medicine);

    expect(provider.medicines.length, 1);
    expect(provider.isEmpty, false);
  });

  test('Medicines should be sorted by time', () {
    provider.addMedicine(
      MedicineModel(
        notificationId: DateTime.now().millisecondsSinceEpoch.remainder(100000),
        name: 'Afternoon',
        dose: '1 tab',
        time: DateTime(2026, 1, 1, 14, 0),
      ),
    );

    provider.addMedicine(
      MedicineModel(
        name: 'Morning',
        dose: '1 tab',
        time: DateTime(2026, 1, 1, 9, 0),
        notificationId: DateTime.now().millisecondsSinceEpoch.remainder(100000),
      ),
    );

    final meds = provider.medicines;

    expect(meds.first.name, 'Morning');
    expect(meds.last.name, 'Afternoon');
  });
}
