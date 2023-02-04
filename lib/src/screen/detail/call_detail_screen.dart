import 'package:flutter/material.dart';

import '../../data/http_interface.dart';
import '../detail_headers/detail_headers_screen.dart';

class CallDetailScreen extends StatelessWidget {
  final HttpResponseInterface response;

  const CallDetailScreen({super.key, required this.response});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: 'Headers'),
              Tab(text: 'Payload'),
              Tab(text: 'Preview'),
              Tab(text: 'Response'),
              Tab(text: 'Initiator'),
              Tab(text: 'Timing'),
              Tab(text: 'Cookies'),
            ],
          ),
          title: const Text('Response Detail'),
        ),
        body: DetailHeadersScreen(
          requestUrl: response.request.uri.toString(),
          requestMethod: response.request.method,
          responseStatusCode: response.statusCode,
          responseReasonPhrase: response.reasonPhrase,
          message: response.message,
          responseHeaders: response.headers,
          requestHeaders: response.request.headers,
        ),
      ),
    );
  }
}
