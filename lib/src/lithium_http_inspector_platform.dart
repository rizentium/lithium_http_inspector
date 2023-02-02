import 'package:lithium_http_inspector/src/data/http_interface.dart';

abstract class LithiumHttpInspectorPlatform {
  /// [find] will return all http request history that saved in local storage
  Future<List<HttpInterface>?> find() {
    throw UnimplementedError('findl() is not implemented yet.');
  }

  /// [findById] will return a request histroy based on request id
  Future<HttpInterface?> findById(String id) {
    throw UnimplementedError('findById() is not implemented yet.');
  }

  /// [insert] will create new http request histroy to local storage
  Future<bool> insert(HttpInterface data) {
    throw UnimplementedError('insert() is not implemented yet.');
  }

  /// Intercept http request
  Future<bool> intercept(HttpInterface data) {
    throw UnimplementedError('intercept() is not implemented yet.');
  }

  /// Mock http request
  Future<bool> mock(HttpInterface data) {
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
