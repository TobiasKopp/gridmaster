import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:grid_master/constants.dart';
import 'package:grid_master/game/logic.dart';
import 'package:provider/provider.dart';

import '../../controls/input_sequence.dart';
import '../../data.dart';
import '../../game/grid.dart';
import '../../game/position.dart';
import '../grid_widget.dart';

class GridCoverCovering extends StatelessWidget {
  const GridCoverCovering({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kColorWallTile,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 340,
            ),
            child: const Text(
              "Define your moves below and press the button to check whether you reach the goal or not!",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22.0,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          kVSpace_16,
          ElevatedButton(
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(const EdgeInsets.all(24)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0)
                  ))
              ),
              onPressed: () => startRun(context),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8)
                ),
                child: const Text(
                  'RUN',
                  style: TextStyle(
                    fontSize: 24.0,
                  ),
                ),
              )
          ),
        ],
      ),
    );
  }

  void startRun(BuildContext context) {
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
    Provider.of<Data>(context, listen: false).setGameState(GameState.running);
  }

}
