import 'package:flutter/material.dart';
import 'package:lithium_http_inspector/lithium_http_inspector.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _onFloatingButtonClick(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const HttpInspectorScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lithium HTTP Inspector Demo'),
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            OutlinedButton(
                onPressed: () {}, child: const Text('Call HTTP GET')),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _onFloatingButtonClick(context),
        tooltip: 'Inspector HTTP Screen',
        child: const Icon(Icons.settings),
      ),
    );
  }
}
