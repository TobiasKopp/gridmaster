import 'package:flutter/material.dart';
import 'package:grid_master/constants.dart';
import 'package:grid_master/controls/input_sequence.dart';

import 'input_action_button.dart';

class ArrowButtons extends StatelessWidget {
  const ArrowButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ArrowUp(),
        kVSpace_4,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ArrowLeft(),
            kHSpace_4,
            ArrowRight(),
          ],
        ),
        kVSpace_4,
        ArrowDown(),
      ],
    );
  }
}

class ArrowUp extends StatelessWidget {
  const ArrowUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const InputActionButton(action: InputAction.moveUp);
  }
}

class ArrowDown extends StatelessWidget {
  const ArrowDown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const InputActionButton(action: InputAction.moveDown);
  }
}

class ArrowLeft extends StatelessWidget {
  const ArrowLeft({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const InputActionButton(action: InputAction.moveLeft);
  }
}

class ArrowRight extends StatelessWidget {
  const ArrowRight({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const InputActionButton(action: InputAction.moveRight);
  }
}
