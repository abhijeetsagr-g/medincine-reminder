import 'package:assignment_medicine/logic/providers/medicine_provider.dart';
import 'package:assignment_medicine/ui/pages/add_medicine_page.dart';
import 'package:assignment_medicine/ui/widgets/medicine_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AppBar _appBar(MedicineProvider provider) => AppBar(
    title: const Text("Medicine Reminder"),
    actions: [
      IconButton(
        onPressed: () => provider.deleteAll(),
        icon: Icon(Icons.cancel),
      ),
    ],
  );

  Widget _body(MedicineProvider provider) => provider.isEmpty
      ? const Center(child: Text("Add Your Meds here"))
      : ListView.builder(
          itemCount: provider.medicines.length,
          itemBuilder: (context, index) =>
              MedicineCard(medicine: provider.medicines[index]),
        );

  void changePage() => Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => AddMedicinePage()),
  );

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<MedicineProvider>();
    return Scaffold(
      appBar: _appBar(provider),
      body: _body(provider),
      floatingActionButton: FloatingActionButton(
        onPressed: () => changePage(),
        child: Icon(Icons.add),
      ),
    );
  }
}
