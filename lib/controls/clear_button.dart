import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data.dart';
import '../game/logic.dart';

class ClearButton extends StatelessWidget {
  const ClearButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: !Logic.isControlAvailable(context)
            ? null
            : () => Provider.of<Data>(context, listen: false).inputSequenceClear(),
        style: ButtonStyle(
          // TODO

        ),
        child: Icon(
          Icons.clear
        )
    );
  }
}