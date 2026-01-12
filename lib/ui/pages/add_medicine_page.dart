import 'package:assignment_medicine/data/model/medicine_model.dart';
import 'package:assignment_medicine/logic/providers/medicine_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddMedicinePage extends StatefulWidget {
  const AddMedicinePage({super.key});

  @override
  State<AddMedicinePage> createState() => _AddMedicinePageState();
}

class _AddMedicinePageState extends State<AddMedicinePage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _doseController = TextEditingController();

  TimeOfDay? _selectedTime;

  void _pickTime() async {
    final time = await showTimePicker(
      context: context,
      initialTime: _selectedTime ?? TimeOfDay.now(),
    );
    if (time != null) {
      setState(() => _selectedTime = time);
    }
  }

  void _onSave() {
    if (!_formKey.currentState!.validate() || _selectedTime == null) return;
    final now = DateTime.now();
    final scheduledTime = DateTime(
      now.year,
      now.month,
      now.day,
      _selectedTime!.hour,
      _selectedTime!.minute,
    );

    final med = MedicineModel(
      name: _nameController.text,
      dose: _doseController.text,
      time: scheduledTime,
      // Give a  unique id
      notificationId: DateTime.now().millisecondsSinceEpoch.remainder(100000),
    );

    context.read<MedicineProvider>().addMedicine(med);
    Navigator.pop(context);
  }

  AppBar _appBar() => AppBar(title: Text("Add Medicine"), centerTitle: true);
  Widget _body() => Padding(
    padding: const EdgeInsets.all(20),
    child: Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(
              labelText: "Medicine Name",
              border: OutlineInputBorder(),
            ),
            validator: (value) => value!.isEmpty ? "Required" : null,
          ),

          TextFormField(
            controller: _doseController,
            decoration: const InputDecoration(
              labelText: "Dose",
              border: OutlineInputBorder(),
            ),
            validator: (value) => value!.isEmpty ? "Required" : null,
          ),

          ElevatedButton(
            onPressed: () => _pickTime(),
            child: Text(
              _selectedTime == null
                  ? "Pick Time"
                  : _selectedTime!.format(context),
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
      floatingActionButton: FloatingActionButton(
        onPressed: _onSave,
        child: Icon(Icons.save),
      ),
    );
  }
}
