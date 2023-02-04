import 'package:flutter/widgets.dart';

class GroupBody extends StatelessWidget {
  final Widget? child;
  final bool isVisible;

  const GroupBody({super.key, this.child, this.isVisible = true});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
        ).copyWith(bottom: 8.0),
        child: child,
      ),
    );
  }
}
