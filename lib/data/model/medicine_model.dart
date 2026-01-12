import 'package:hive/hive.dart';

part 'medicine_model.g.dart';

@HiveType(typeId: 0)
class MedicineModel {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String dose;

  @HiveField(2)
  final DateTime time;

  @HiveField(3)
  final int notificationId;

  const MedicineModel({
    required this.name,
    required this.dose,
    required this.time,
    required this.notificationId,
  });
}
