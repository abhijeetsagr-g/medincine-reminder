import 'package:assignment_medicine/data/model/medicine_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MedicineCard extends StatelessWidget {
  const MedicineCard({super.key, required this.medicine});
  final MedicineModel medicine;

  @override
  Widget build(BuildContext context) {
    final time = DateFormat('hh:mm a').format(medicine.time);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ListTile(
        title: Text(medicine.name),
        subtitle: Text("${medicine.dose} $time"),
        leading: const Icon(Icons.medication),
      ),
    );
  }
}
