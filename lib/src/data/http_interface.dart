class HttpInterface {
  final String method;
  final String uri;
  final String url;
  final Map<String, dynamic> headers;
  final dynamic body;

  HttpInterface({
    required this.method,
    required this.uri,
    required this.url,
    required this.headers,
    this.body,
  });
}
