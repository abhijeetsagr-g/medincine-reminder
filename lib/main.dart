import 'package:assignment_medicine/data/model/medicine_model.dart';
import 'package:assignment_medicine/logic/providers/medicine_provider.dart';
import 'package:assignment_medicine/theme/app_theme.dart';
import 'package:assignment_medicine/ui/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(MedicineModelAdapter());
  final medicineBox = await Hive.openBox<MedicineModel>('medicines');

  runApp(
    ChangeNotifierProvider(
      create: (BuildContext context) => MedicineProvider(medicineBox),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      title: 'Medicine Reminder',
      home: HomePage(),
    );
  }
}
