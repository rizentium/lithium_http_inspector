import 'package:flutter/material.dart';

import 'widgets/general.dart';
import 'widgets/headers.dart';

class DetailHeadersScreen extends StatelessWidget {
  const DetailHeadersScreen({
    super.key,
    this.requestUrl,
    this.requestMethod,
    this.responseStatusCode,
    this.responseReasonPhrase,
    this.message,
    this.requestRemoteAddress,
    this.requestReferrerPolicy,
    this.responseHeaders,
    this.requestHeaders,
  });

  final String? requestUrl;
  final String? requestMethod;
  final int? responseStatusCode;
  final String? responseReasonPhrase;
  final String? message;
  final String? requestRemoteAddress;
  final String? requestReferrerPolicy;
  final Map<String, dynamic>? responseHeaders;
  final Map<String, dynamic>? requestHeaders;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        GeneralWidget(
          requestUrl: requestUrl,
          requestMethod: requestMethod,
          responseStatusCode: responseStatusCode,
          responseReasonPhrase: responseReasonPhrase,
          message: message,
        ),
        const Divider(height: 0),
        HeadersWidget(
          title: 'Response Headers (${responseHeaders?.length})',
          items: responseHeaders,
        ),
        const Divider(height: 0),
        HeadersWidget(
          title: 'Request Headers (${requestHeaders?.length})',
          items: requestHeaders,
        ),
      ],
    );
  }
}
