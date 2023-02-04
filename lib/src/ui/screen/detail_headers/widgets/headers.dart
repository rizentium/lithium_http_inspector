import 'package:flutter/material.dart';

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
        InkWell(
          onTap: () => setState(() => _isVisible = !_isVisible),
          child: _HeadersTitle(title: widget.title, isVisible: _isVisible),
        ),
        Visibility(
          visible: _isVisible,
          child: _HeadersBody(items: widget.items),
        ),
      ],
    );
  }
}

class _HeadersTitle extends StatelessWidget {
  final String title;
  final bool isVisible;

  const _HeadersTitle({required this.title, required this.isVisible});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Icon(
            isVisible
                ? Icons.keyboard_arrow_down_sharp
                : Icons.keyboard_arrow_up_sharp,
          ),
        ],
      ),
    );
  }
}

class _HeadersBody extends StatelessWidget {
  final Map<String, dynamic>? items;

  const _HeadersBody({this.items});

  List<String>? get sortedKeys {
    return items?.keys.toList()?..sort((a, b) => a.compareTo(b));
  }

  List<Widget> get children {
    return sortedKeys
            ?.map((key) => ItemTile(title: key, value: items?[key]))
            .toList() ??
        [];
  }

  @override
  Widget build(BuildContext context) {
    final isEmpty = items == null || items?.isEmpty == true;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0).copyWith(bottom: 8),
      child: Column(
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
          if (!isEmpty) ...children,
        ],
      ),
    );
  }
}
