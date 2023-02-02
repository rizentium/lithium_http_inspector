import 'package:http/http.dart' as http;
import 'package:lithium_http_inspector/src/data/http_interface.dart';
import 'package:lithium_http_inspector/src/storage/lithium_storage.dart';

class LithiumHttpClient extends http.BaseClient {
  final http.Client _inner;
  final LithiumStorage _storage;

  LithiumHttpClient(this._inner, this._storage);

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    final requestPayload = HttpRequestInterface(
      method: request.method,
      headers: request.headers,
      uri: Uri.tryParse(request.url.toString()),
    );
    try {
      final response = await _inner.send(request);
      return response;
    } on http.ClientException catch (e) {
      final response = HttpInterface(
        request: requestPayload,
        response: HttpResponseInterface(
          message: e.message,
          uri: e.uri,
          status: 'failed',
        ),
      );
      await _storage.writeLog(response);
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
