import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data.dart';
import '../game/logic.dart';

class PopActionButton extends StatelessWidget {
  const PopActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: !Logic.isControlAvailable(context)
            ? null
            : () => Provider.of<Data>(context, listen: false).inputSequenceRemoveLast(),
        style: const ButtonStyle(
          // TODO

        ),
        child: const Icon(
            Icons.backspace
        )
    );
  }
}
