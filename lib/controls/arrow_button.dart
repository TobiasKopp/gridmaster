import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data.dart';
import 'input_sequence.dart';

class InputActionButton extends StatelessWidget {
  const InputActionButton({
    required this.action,
    Key? key
  }) : super(key: key);

  final InputAction action;

  @override
  Widget build(BuildContext context) {
    IconData iconData;

    return ElevatedButton(
      onPressed: () => Provider.of<Data>(context, listen: false).inputSequenceAdd(action.getInputAction()),
      style: ButtonStyle(
        // TODO

      ),
      child: Icon(
        action.getIcon(),
      )
    );
  }
}
