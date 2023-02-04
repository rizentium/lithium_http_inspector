import 'package:flutter/material.dart';
import 'package:lithium_http_inspector/src/ui/shared/group_body.dart';
import 'package:lithium_http_inspector/src/ui/shared/group_title.dart';

import '../../../shared/item_tile.dart';

class GeneralWidget extends StatefulWidget {
  const GeneralWidget({
    super.key,
    this.requestUrl,
    this.requestMethod,
    this.responseStatusCode,
    this.responseReasonPhrase,
    this.message,
    this.requestRemoteAddress,
    this.requestReferrerPolicy,
  });

  final String? requestUrl;
  final String? requestMethod;
  final int? responseStatusCode;
  final String? responseReasonPhrase;
  final String? message;
  final String? requestRemoteAddress;
  final String? requestReferrerPolicy;

  @override
  State<GeneralWidget> createState() => _GeneralWidgetState();
}

class _GeneralWidgetState extends State<GeneralWidget> {
  bool _isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GroupTitle(
          title: 'General',
          isVisible: _isVisible,
          onTap: () => setState(() => _isVisible = !_isVisible),
        ),
        GroupBody(
          isVisible: _isVisible,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: items,
          ),
        ),
      ],
    );
  }

  List<ItemTile> get items {
    return [
      ItemTile(title: 'Request URL', value: widget.requestUrl),
      ItemTile(title: 'Request Method', value: widget.requestMethod),
      ItemTile(
        title: 'Status Code',
        value: widget.responseStatusCode?.toString(),
      ),
      ItemTile(title: 'Reason Phrase', value: widget.responseReasonPhrase),
      // TODO: add remote address and referrer policy
      ItemTile(title: 'Message', value: widget.message),
    ];
  }
}
