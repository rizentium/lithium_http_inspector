import 'package:flutter/material.dart';

class GroupTitle extends StatelessWidget {
  final String title;
  final bool isVisible;
  final void Function()? onTap;

  const GroupTitle({
    super.key,
    required this.title,
    required this.isVisible,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
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
      ),
    );
  }
}
