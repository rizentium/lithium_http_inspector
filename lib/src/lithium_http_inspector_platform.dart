import 'package:http/http.dart' as http;

import 'data/http_interface.dart';

abstract class LithiumHttpInspectorPlatform {
  http.BaseClient httpClient(http.Client client) {
    throw UnimplementedError('httpClient() is not implemented yet');
  }

  /// [find] will return all http request history that saved in local storage
  Future<List<HttpResponseInterface>?> find() {
    throw UnimplementedError('findl() is not implemented yet.');
  }

  /// [findById] will return a request histroy based on request id
  Future<HttpResponseInterface?> findById(String id) {
    throw UnimplementedError('findById() is not implemented yet.');
  }

  /// [insert] will create new http request histroy to local storage
  Future<bool> insert(HttpResponseInterface data) {
    throw UnimplementedError('insert() is not implemented yet.');
  }

  /// Intercept http request
  Future<bool> intercept(HttpResponseInterface data) {
    throw UnimplementedError('intercept() is not implemented yet.');
  }

  /// Mock http request
  Future<bool> mock(HttpResponseInterface data) {
    throw UnimplementedError('intercept() is not implemented yet.');
  }

  /// Delete http request from local storage based on request [id]
  Future<bool> deleteById(String id) {
    throw UnimplementedError('deleteById() is not implemented yet.');
  }

  /// Destroy all request saved in local storage
  Future<bool> destroy() {
    throw UnimplementedError('destroy() is not implemented yet.');
  }
}
