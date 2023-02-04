import 'dart:typed_data';

class HttpRequestInterface {
  final Map<String, dynamic> headers;
  final String method;
  final Uri? uri;
  final String? body;
  final Uint8List? bodyBytes;
  final Map<String, String>? bodyFields;
  final int? contentLength;
  final bool finalized;
  final int maxRedirects;
  final bool persistentConnection;

  HttpRequestInterface({
    required this.headers,
    required this.method,
    this.uri,
    this.body,
    this.bodyBytes,
    this.bodyFields,
    this.contentLength,
    required this.finalized,
    required this.maxRedirects,
    required this.persistentConnection,
  });

  HttpRequestInterface.fromJson(Map<String, dynamic> json)
      : headers = json['headers'],
        method = json['method'],
        uri = json['uri'] != null ? Uri.tryParse(json['uri']) : null,
        body = json['body'],
        bodyBytes = Uint8List.fromList(
          List<int>.from(json['bodyBytes'] ?? []),
        ),
        bodyFields = json['bodyFields'],
        contentLength = json['contentLength'],
        finalized = json['finalized'],
        maxRedirects = json['maxRedirects'],
        persistentConnection = json['persistentConnection'];

  Map<String, dynamic> toJson() => {
        'method': method,
        'uri': uri?.toString(),
        'headers': headers,
        'body': body,
        'bodyBytes': bodyBytes,
        'bodyFields': bodyFields,
        'contentLength': contentLength,
        'finalized': finalized,
        'maxRedirects': maxRedirects,
        'persistentConnection': persistentConnection,
      };
}

class HttpResponseInterface {
  final int? contentLength;
  final Map<String, dynamic>? headers;
  final bool? isRedirect;
  final bool? persistentConnection;
  final String? reasonPhrase;
  final HttpRequestInterface request;
  final int? statusCode;
  final String? message;

  HttpResponseInterface({
    this.contentLength,
    this.headers,
    this.isRedirect,
    this.persistentConnection,
    this.reasonPhrase,
    required this.request,
    this.statusCode,
    this.message,
  });

  HttpResponseInterface.fromJson(Map<String, dynamic> json)
      : contentLength = json['contentLength'],
        headers = json['headers'],
        isRedirect = json['isRedirect'],
        persistentConnection = json['isPersistentConnection'],
        reasonPhrase = json['reasonPhrase'],
        request = HttpRequestInterface.fromJson(json['request']),
        statusCode = json['statusCode'],
        message = json['message'];

  Map<String, dynamic> toJson() => {
        'contentLength': contentLength,
        'headers': headers,
        'isRedirect': isRedirect,
        'isPersistentConnection': persistentConnection,
        'reasonPhrase': reasonPhrase,
        'request': request,
        'statusCode': statusCode,
        'message': message,
      };
}
