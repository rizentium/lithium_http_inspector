import 'package:example/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:lithium_http_inspector/lithium_http_inspector.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final lithium = await LithiumHttpInspector.initialize();

  runApp(MyApp(lithium: lithium));
}

class MyApp extends StatelessWidget {
  final LithiumHttpInspector lithium;

  const MyApp({super.key, required this.lithium});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lithium Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(lithium: lithium),
    );
  }
}
