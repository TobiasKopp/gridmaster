import 'package:flutter/material.dart';
import 'package:grid_master/game/logic.dart';
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
    return ElevatedButton(
      onPressed: !Logic.isControlAvailable(context)
          ? null
          : () => Provider.of<Data>(context, listen: false).inputSequenceAdd(action),
      style: ButtonStyle(
        // TODO

      ),
      child: Icon(
        action.getIcon(),
      )
    );
  }
}
