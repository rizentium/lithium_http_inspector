import 'package:flutter/material.dart';
import 'package:lithium_http_inspector/src/ui/screen/dashboard/widgets/screen_body.dart';

import '../../../../lithium_http_inspector.dart';

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
