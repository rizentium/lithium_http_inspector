import 'package:flutter/material.dart';
import 'package:lithium_http_inspector/src/ui/shared/item_tile.dart';

import '../../../shared/group_body.dart';
import '../../../shared/group_title.dart';

class PayloadQueryParams extends StatefulWidget {
  final Map<String, String>? queryParameters;

  const PayloadQueryParams({super.key, this.queryParameters});

  @override
  State<PayloadQueryParams> createState() => _PayloadQueryParamsState();
}

class _PayloadQueryParamsState extends State<PayloadQueryParams> {
  bool _isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GroupTitle(
          title: 'Query String Parameters',
          isVisible: _isVisible,
          onTap: () => setState(() => _isVisible = !_isVisible),
        ),
        GroupBody(
          isVisible: _isVisible,
          child: items.isNotEmpty
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: items,
                )
              : null,
        ),
      ],
    );
  }

  List<Widget> get items {
    final keys = widget.queryParameters?.keys ?? [];
    return keys
        .map(
          (e) => ItemTile(title: e, value: widget.queryParameters?[e]),
        )
        .toList();
  }
}
