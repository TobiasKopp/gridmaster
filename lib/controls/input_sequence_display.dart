import 'package:flutter/material.dart';
import 'package:grid_master/constants.dart';
import 'package:provider/provider.dart';

import '../data.dart';
import 'input_sequence.dart';

class InputSequenceDisplay extends StatelessWidget {
  const InputSequenceDisplay({
    this.maxWidth = 300,
    this.maxHeight = 120,
    Key? key
  }) : super(key: key);

  final double maxWidth;
  final double maxHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: maxWidth,
      height: maxHeight,
      color: kColorInputSequenceDisplay,
      padding: EdgeInsets.all(8.0),
      child: Wrap(
        children: Provider.of<Data>(context).inputSequence.inputs.map((InputAction action) => Icon(action.getIcon())).toList(),
      ),
    );
  }
}
