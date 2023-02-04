import 'package:flutter/widgets.dart';

import 'widgets/payload_query_params.dart';

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
