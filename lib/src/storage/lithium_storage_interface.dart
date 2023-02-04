import 'package:lithium_http_inspector/src/data/http_interface.dart';

class LithiumStorageInterface {
  final List<HttpResponseInterface>? data;
  final List<String>? config;

  LithiumStorageInterface({this.data, this.config});

  LithiumStorageInterface.fromJson(Map<String, dynamic> json)
      : data = ((json['data'] ?? []) as List)
            .map((e) => HttpResponseInterface.fromJson(e))
            .toList(),
        config = json['config'];

  Map<String, dynamic> toJson() {
    return {
      'data': data?.map((e) => e.toJson()).toList(),
      'config': config,
    };
  }
}
