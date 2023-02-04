import 'package:flutter/material.dart';

import '../../../../lithium_http_inspector.dart';
import 'widgets/screen_body.dart';

class HttpInspectorScreen extends StatelessWidget {
  final LithiumHttpInspector lithium;

  const HttpInspectorScreen({super.key, required this.lithium});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lithium Inspector'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            // TODO: add rebuild ScreenBody on destroy
            onPressed: () => lithium.destroy(),
          ),
        ],
      ),
      body: ScreenBody(lithium: lithium),
    );
  }
}
