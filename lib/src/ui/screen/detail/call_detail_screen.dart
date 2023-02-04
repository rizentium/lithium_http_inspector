import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:lithium_http_inspector/src/ui/screen/detail_payload/detail_payload.dart';

import '../../../data/http_interface.dart';
import '../../interface/tab_interface.dart';
import '../detail_headers/detail_headers_screen.dart';

class CallDetailScreen extends StatefulWidget {
  final HttpResponseInterface response;

  const CallDetailScreen({super.key, required this.response});

  @override
  State<CallDetailScreen> createState() => _CallDetailScreenState();
}

class _CallDetailScreenState extends State<CallDetailScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    inspect(widget.response.request.uri?.queryParameters);
    return DefaultTabController(
      length: _items.length,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            isScrollable: true,
            tabs: _items.map((e) => e.tab).toList(),
            onTap: (value) => setState(() => _currentIndex = value),
          ),
          title: const Text('Response Detail'),
        ),
        body: _items[_currentIndex].screen,
      ),
    );
  }

  List<TabInterface> get _items {
    return [
      TabInterface(
        const Tab(text: 'Headers'),
        DetailHeadersScreen(
          requestUrl: widget.response.request.uri.toString(),
          requestMethod: widget.response.request.method,
          responseStatusCode: widget.response.statusCode,
          responseReasonPhrase: widget.response.reasonPhrase,
          message: widget.response.message,
          responseHeaders: widget.response.headers,
          requestHeaders: widget.response.request.headers,
        ),
      ),
      TabInterface(
          const Tab(text: 'Payload'),
          DetailPayloadScreen(
            queryParameters: widget.response.request.uri?.queryParameters,
          )),
      TabInterface(
        const Tab(text: 'Preview'),
        DetailHeadersScreen(
          requestUrl: widget.response.request.uri.toString(),
          requestMethod: widget.response.request.method,
          responseStatusCode: widget.response.statusCode,
          responseReasonPhrase: widget.response.reasonPhrase,
          message: widget.response.message,
          responseHeaders: widget.response.headers,
          requestHeaders: widget.response.request.headers,
        ),
      ),
      TabInterface(
        const Tab(text: 'Response'),
        DetailHeadersScreen(
          requestUrl: widget.response.request.uri.toString(),
          requestMethod: widget.response.request.method,
          responseStatusCode: widget.response.statusCode,
          responseReasonPhrase: widget.response.reasonPhrase,
          message: widget.response.message,
          responseHeaders: widget.response.headers,
          requestHeaders: widget.response.request.headers,
        ),
      ),
      TabInterface(
        const Tab(text: 'Initiator'),
        DetailHeadersScreen(
          requestUrl: widget.response.request.uri.toString(),
          requestMethod: widget.response.request.method,
          responseStatusCode: widget.response.statusCode,
          responseReasonPhrase: widget.response.reasonPhrase,
          message: widget.response.message,
          responseHeaders: widget.response.headers,
          requestHeaders: widget.response.request.headers,
        ),
      ),
      TabInterface(
        const Tab(text: 'Timing'),
        DetailHeadersScreen(
          requestUrl: widget.response.request.uri.toString(),
          requestMethod: widget.response.request.method,
          responseStatusCode: widget.response.statusCode,
          responseReasonPhrase: widget.response.reasonPhrase,
          message: widget.response.message,
          responseHeaders: widget.response.headers,
          requestHeaders: widget.response.request.headers,
        ),
      ),
      TabInterface(
        const Tab(text: 'Cookies'),
        DetailHeadersScreen(
          requestUrl: widget.response.request.uri.toString(),
          requestMethod: widget.response.request.method,
          responseStatusCode: widget.response.statusCode,
          responseReasonPhrase: widget.response.reasonPhrase,
          message: widget.response.message,
          responseHeaders: widget.response.headers,
          requestHeaders: widget.response.request.headers,
        ),
      ),
    ];
  }
}
