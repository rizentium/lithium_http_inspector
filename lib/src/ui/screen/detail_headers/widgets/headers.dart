import 'package:flutter/material.dart';
import 'package:lithium_http_inspector/src/ui/shared/group_body.dart';
import 'package:lithium_http_inspector/src/ui/shared/group_title.dart';

import '../../../shared/item_tile.dart';

class HeadersWidget extends StatefulWidget {
  const HeadersWidget({super.key, required this.title, this.items});

  final String title;
  final Map<String, dynamic>? items;

  @override
  State<HeadersWidget> createState() => _HeadersWidgetState();
}

class _HeadersWidgetState extends State<HeadersWidget> {
  bool _isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GroupTitle(
          title: widget.title,
          isVisible: _isVisible,
          onTap: () => setState(() => _isVisible = !_isVisible),
        ),
        GroupBody(
          isVisible: _isVisible,
          child: groupBody,
        ),
      ],
    );
  }

  Widget get groupBody {
    final keys = widget.items?.keys.toList()?..sort((a, b) => a.compareTo(b));
    final isEmpty = widget.items == null || widget.items?.isEmpty == true;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (isEmpty)
          const Text(
            '(empty)',
            style: TextStyle(
              color: Colors.black54,
              fontStyle: FontStyle.italic,
            ),
          ),
        ...(keys ?? [])
            .map((e) => ItemTile(title: e, value: widget.items?[e]))
            .toList(),
      ],
    );
  }
}
