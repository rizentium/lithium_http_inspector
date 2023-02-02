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

  HttpInterface.fromJson(Map<String, dynamic> json)
      : method = json['method'],
        uri = json['uri'],
        url = json['url'],
        headers = json['headers'],
        body = json['body'];

  Map<String, dynamic> toJson() => {
        'method': method,
        'uri': uri,
        'url': url,
        'headers': headers,
        'body': body,
      };
}
