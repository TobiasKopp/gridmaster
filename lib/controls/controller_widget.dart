import 'package:flutter/material.dart';
import 'package:grid_master/constants.dart';
import 'package:grid_master/controls/clear_button.dart';
import 'package:grid_master/controls/input_sequence_display.dart';
import 'package:grid_master/controls/pop_action_button.dart';

import 'arrow_buttons.dart';

class ControllerWidget extends StatelessWidget {
  const ControllerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ArrowButtons(),
        kHSpace_16,
        Column(
          children: [
            PopActionButton(),
            kVSpace_16,
            ClearButton(),
            kVSpace_16,
          ],
        ),
        InputSequenceDisplay(),
      ],
    );
  }
}
