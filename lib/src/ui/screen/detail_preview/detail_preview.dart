import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter_html/flutter_html.dart';

class ContentType {
  static String json = 'application/json';
  static String html = 'text/html';

  static List<String> supported() {
    return [json, html];
  }
}

class DetailPreviewScreen extends StatelessWidget {
  final String contentType;
  final String? body;

  const DetailPreviewScreen({
    super.key,
    required this.contentType,
    this.body,
  });

  bool get _isContentTypeSupported {
    for (var e in ContentType.supported()) {
      if (contentType.contains(e)) {
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    if (!_isContentTypeSupported) {
      return const Center(
        child: Text('Preview is not supported for this request'),
      );
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                'Content Type: ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(contentType),
            ],
          ),
          const SizedBox(height: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Content',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              _viewer(),
            ],
          )
        ],
      ),
    );
  }

  Widget _viewer() {
    try {
      if (contentType.contains(ContentType.json)) {
        return Text(_jsonViewer(body ?? ''));
      }
      if (contentType.contains(ContentType.html)) {
        return Html(data: body);
      }
      return const Text('Preview Unsupported for this Content Type');
    } catch (e) {
      return const Text('Got error while try to render this Content Type');
    }
  }

  String _jsonViewer(String payload) {
    const encoder = JsonEncoder.withIndent('  ');
    return encoder.convert(json.decode(payload));
  }
}
