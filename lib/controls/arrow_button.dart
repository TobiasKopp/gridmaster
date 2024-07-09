import 'package:flutter/material.dart';

enum ArrowButtonDirection {
  up, down, left, right;

  IconData getIcon() {
    switch (this) {
      case up:    return Icons.arrow_upward;
      case down:  return Icons.arrow_downward;
      case left:  return Icons.arrow_back;
      case right: return Icons.arrow_forward;
    }
  }
}

class ArrowButton extends StatelessWidget {
  const ArrowButton({
    required this.direction,
    Key? key
  }) : super(key: key);

  final ArrowButtonDirection direction;

  @override
  Widget build(BuildContext context) {
    IconData iconData;

    return ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(

      ),
      child: Icon(
        direction.getIcon(),
      )
    );
  }
}
