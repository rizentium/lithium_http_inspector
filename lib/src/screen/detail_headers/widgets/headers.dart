import 'package:flutter/material.dart';

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
            ?.map(
              (key) => RichText(
                text: TextSpan(
                  text: '$key: ',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: items?[key],
                      style: const TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                        height: 1.25,
                      ),
                    ),
                  ],
                ),
              ),
            )
            .toList() ??
        [];
  }

  @override
  Widget build(BuildContext context) {
    if (items == null || items?.isEmpty == true) {
      return const Padding(
        padding: EdgeInsets.only(left: 16.0, bottom: 16.0),
        child: Text(
          '(empty)',
          style: TextStyle(
            color: Colors.black54,
            fontStyle: FontStyle.italic,
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }
}
