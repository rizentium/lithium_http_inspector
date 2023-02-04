import 'package:flutter/material.dart';

import '../../data/http_interface.dart';

class CallDetailScreen extends StatelessWidget {
  final HttpResponseInterface response;

  const CallDetailScreen({super.key, required this.response});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
      ),
    );
  }
}
