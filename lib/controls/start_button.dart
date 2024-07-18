import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:grid_master/controls/input_sequence.dart';
import 'package:provider/provider.dart';
import 'package:grid_master/data.dart';

import '../game/grid.dart';
import '../game/logic.dart';
import '../game/position.dart';
import '../widgets/grid_widget.dart';

class StartButton extends StatelessWidget {
  const StartButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Grid grid = Provider.of<Data>(context, listen: false).LEVEL.grid;
          InputActionSequence inputSequence = Provider.of<Data>(context, listen: false).inputSequence;
          Queue<Position> positions = Queue();

          if (inputSequence.inputs.isEmpty) {
            showDialog(
              context: context,
              builder: (context) {
                return const SimpleDialog(
                  title: Center(child: Text("No inputs specified!")),
                  titlePadding: EdgeInsets.symmetric(horizontal: 0, vertical: 16),
                );
              }
            );
            return;
          }

          // Get start position
          Position pos = grid.start();

          // Go through inputs
          for (var action in inputSequence.inputs) {
            pos = Logic.computeNextPosition(grid, pos, action);
            positions.add(pos);
          }

          // Add positions (moves) to global player controller
          PLAYER_STREAM_CONTROLLER.sink.add(positions);
        },
        style: const ButtonStyle(
          // TODO
        ),
        child: const Icon(Icons.start)
    );
  }
}
