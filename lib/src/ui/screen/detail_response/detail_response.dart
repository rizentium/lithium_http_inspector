import 'package:flutter/material.dart';

class DetailResponseScreen extends StatelessWidget {
  final String? body;
  const DetailResponseScreen({super.key, this.body});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Text(
        body ?? '(empty)',
        style: body == null
            ? const TextStyle(
                color: Colors.black54,
                fontStyle: FontStyle.italic,
              )
            : null,
      ),
    );
  }
}
