import 'package:flutter/material.dart';

class ItemTile extends StatelessWidget {
  final String title;
  final String? value;

  const ItemTile({super.key, required this.title, this.value});
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: '$title: ',
        style: DefaultTextStyle.of(context).style.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.black54,
            ),
        children: <TextSpan>[
          TextSpan(
            text: value.toString(),
            style: TextStyle(
              fontWeight: FontWeight.normal,
              color: value == null ? Colors.black54 : Colors.black,
              height: 1.25,
              fontStyle: value == null ? FontStyle.italic : null,
            ),
          ),
        ],
      ),
    );
  }
}
