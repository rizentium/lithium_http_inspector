class HttpInterface {
  final HttpRequestInterface request;
  final HttpResponseInterface response;

  HttpInterface({required this.request, required this.response});

  HttpInterface.fromJson(Map<String, dynamic> json)
      : request = HttpRequestInterface.fromJson(json['request']),
        response = HttpResponseInterface.fromJson(json['response']);

  Map<String, dynamic> toJson() => {
        'request': request.toJson(),
        'response': response.toJson(),
      };
}

class HttpRequestInterface {
  final String method;
  final Uri? uri;
  final Map<String, dynamic> headers;

  HttpRequestInterface({
    required this.method,
    this.uri,
    required this.headers,
  });

  HttpRequestInterface.fromJson(Map<String, dynamic> json)
      : method = json['method'],
        uri = json['uri'] != null ? Uri.tryParse(json['uri']) : null,
        headers = json['headers'];

  Map<String, dynamic> toJson() => {
        'method': method,
        'uri': uri?.toString(),
        'headers': headers,
      };
}

class HttpResponseInterface {
  final String? message;
  final Uri? uri;
  final String? status;

  HttpResponseInterface({
    this.message,
    this.uri,
    this.status,
  });

  HttpResponseInterface.fromJson(Map<String, dynamic> json)
      : message = json['message'],
        uri = Uri.tryParse(json['uri']),
        status = json['status'];

  Map<String, dynamic> toJson() => {
        'message': message,
        'uri': uri?.toString(),
        'status': status,
      };
}
