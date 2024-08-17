import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'hive_model.dart';
import 'home_screen.dart';
import 'hive_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter is initialized

  // Initialize Hive
  await Hive.initFlutter();

  // Register Hive adapter
  Hive.registerAdapter(FruitAdapter());

  // Open Hive box
  // var box = await Hive.openBox<Fruit>('fruitsBox');
  final fruitBox = await Hive.openBox<Fruit>('fruitBox');
  final fruitService = FruitService(fruitBox);
  await fruitService.initializeFruits();

  // Add sample data if the box is empty

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fruit and Vegetable App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}
