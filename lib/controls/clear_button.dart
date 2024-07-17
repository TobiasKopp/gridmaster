import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data.dart';

class ClearButton extends StatelessWidget {
  const ClearButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => Provider.of<Data>(context, listen: false).inputSequenceClear(),
        style: ButtonStyle(
          // TODO

        ),
        child: Icon(
          Icons.clear
        )
    );
  }
}