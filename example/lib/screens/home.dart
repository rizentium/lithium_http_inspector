import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:lithium_http_inspector/lithium_http_inspector.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatelessWidget {
  final LithiumHttpInspector lithium;

  const HomeScreen({super.key, required this.lithium});

  void _onFloatingButtonClick(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HttpInspectorScreen(lithium: lithium),
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
              onPressed: _onCallHTTPGetPressed,
              child: const Text('Call HTTP GET'),
            ),
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

  Future<void> _onCallHTTPGetPressed() async {
    try {
      final uri = Uri.parse(
        'https://google.com',
      );
      await lithium.httpClient(http.Client()).get(uri);
    } catch (e) {
      inspect(e);
    }
  }
}
