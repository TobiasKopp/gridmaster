import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data.dart';

class PopActionButton extends StatelessWidget {
  const PopActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    IconData iconData;

    return ElevatedButton(
        onPressed: () => Provider.of<Data>(context, listen: false).inputSequenceRemoveLast(),
        style: ButtonStyle(
          // TODO

        ),
        child: Icon(
            Icons.backspace
        )
    );
  }
}