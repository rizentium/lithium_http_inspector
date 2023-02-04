import 'package:flutter/widgets.dart';
import 'package:lithium_http_inspector/src/ui/screen/detail_payload/widgets/payload_query_params.dart';

class DetailPayloadScreen extends StatelessWidget {
  final Map<String, String>? queryParameters;

  const DetailPayloadScreen({super.key, this.queryParameters});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        PayloadQueryParams(queryParameters: queryParameters),
      ],
    );
  }
}
