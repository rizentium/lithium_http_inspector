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
          TextButton(
            onPressed: () {},
            child: const Text('Clear'),
          ),
        ],
      ),
      body: ScreenBody(lithium: lithium),
    );
  }
}
