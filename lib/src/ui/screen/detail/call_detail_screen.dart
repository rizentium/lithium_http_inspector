import 'package:flutter/material.dart';

import '../../../data/http_interface.dart';
import '../../interface/tab_interface.dart';
import '../detail_headers/detail_headers_screen.dart';

class CallDetailScreen extends StatelessWidget {
  final HttpResponseInterface response;

  const CallDetailScreen({super.key, required this.response});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _items.length,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            isScrollable: true,
            tabs: _items.map((e) => e.tab).toList(),
            onTap: (value) {
              print(value);
            },
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

  List<TabInterface> get _items {
    return [
      TabInterface(
        const Tab(text: 'Headers'),
        DetailHeadersScreen(
          requestUrl: response.request.uri.toString(),
          requestMethod: response.request.method,
          responseStatusCode: response.statusCode,
          responseReasonPhrase: response.reasonPhrase,
          message: response.message,
          responseHeaders: response.headers,
          requestHeaders: response.request.headers,
        ),
      ),
      TabInterface(
        const Tab(text: 'Payload'),
        DetailHeadersScreen(
          requestUrl: response.request.uri.toString(),
          requestMethod: response.request.method,
          responseStatusCode: response.statusCode,
          responseReasonPhrase: response.reasonPhrase,
          message: response.message,
          responseHeaders: response.headers,
          requestHeaders: response.request.headers,
        ),
      ),
      TabInterface(
        const Tab(text: 'Preview'),
        DetailHeadersScreen(
          requestUrl: response.request.uri.toString(),
          requestMethod: response.request.method,
          responseStatusCode: response.statusCode,
          responseReasonPhrase: response.reasonPhrase,
          message: response.message,
          responseHeaders: response.headers,
          requestHeaders: response.request.headers,
        ),
      ),
      TabInterface(
        const Tab(text: 'Response'),
        DetailHeadersScreen(
          requestUrl: response.request.uri.toString(),
          requestMethod: response.request.method,
          responseStatusCode: response.statusCode,
          responseReasonPhrase: response.reasonPhrase,
          message: response.message,
          responseHeaders: response.headers,
          requestHeaders: response.request.headers,
        ),
      ),
      TabInterface(
        const Tab(text: 'Initiator'),
        DetailHeadersScreen(
          requestUrl: response.request.uri.toString(),
          requestMethod: response.request.method,
          responseStatusCode: response.statusCode,
          responseReasonPhrase: response.reasonPhrase,
          message: response.message,
          responseHeaders: response.headers,
          requestHeaders: response.request.headers,
        ),
      ),
      TabInterface(
        const Tab(text: 'Timing'),
        DetailHeadersScreen(
          requestUrl: response.request.uri.toString(),
          requestMethod: response.request.method,
          responseStatusCode: response.statusCode,
          responseReasonPhrase: response.reasonPhrase,
          message: response.message,
          responseHeaders: response.headers,
          requestHeaders: response.request.headers,
        ),
      ),
      TabInterface(
        const Tab(text: 'Cookies'),
        DetailHeadersScreen(
          requestUrl: response.request.uri.toString(),
          requestMethod: response.request.method,
          responseStatusCode: response.statusCode,
          responseReasonPhrase: response.reasonPhrase,
          message: response.message,
          responseHeaders: response.headers,
          requestHeaders: response.request.headers,
        ),
      ),
    ];
  }
}
