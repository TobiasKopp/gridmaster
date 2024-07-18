import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:grid_master/controls/input_sequence.dart';
import 'package:provider/provider.dart';
import 'package:grid_master/data.dart';

import '../game/grid.dart';
import '../game/position.dart';
import '../grid_widget.dart';

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
          positions.add(pos);

          // Go through inputs
          for (var action in inputSequence.inputs) {
            pos = computeNextTile(context, grid, pos, action);
            positions.add(pos);
          }


          PLAYER_STREAM_CONTROLLER.sink.add(positions);





        },
        style: const ButtonStyle(
          // TODO
        ),
        child: const Icon(Icons.start)
    );
  }

  static Position computeNextTile(BuildContext context, Grid grid, Position pos, InputAction action) {
    switch (action) {
      case InputAction.moveUp:
        int i = pos.row - 1;
        int j = pos.column;
        while (i >= 0) {
          if (grid.atIndex(i,j).isGoal || grid.atIndex(i,j).isStart) { return Position(i,j); }   // Start / Stop on end tile
          if (grid.atIndex(i,j).isWall) { return Position(i+1, j); }                      // Move until wall
          if (grid.atIndex(i,j).isFloor) { i--; }                                        // Move up when on floor
        }
        return Position(i+1, j);

      case InputAction.moveDown:
        int i = pos.row + 1;
        int j = pos.column;
        while (i < grid.height) {
          if (grid.atIndex(i,j).isGoal || grid.atIndex(i,j).isStart) { return Position(i, j); }   // Start / Stop on end tile
          if (grid.atIndex(i,j).isWall) { return Position(i-1, j); }                      // Move until wall
          if (grid.atIndex(i,j).isFloor) { i++; }                                        // Move up when on floor
        }
        return Position(i-1, j);

      case InputAction.moveLeft:
        int i = pos.row;
        int j = pos.column - 1;
        while (j >= 0) {
          if (grid.atIndex(i,j).isGoal || grid.atIndex(i,j).isStart) { return Position(i, j); }   // Start / Stop on end tile
          if (grid.atIndex(i,j).isWall) { return Position(i, j+1); }                      // Move until wall
          if (grid.atIndex(i,j).isFloor) { j--; }                                        // Move up when on floor
        }
        return Position(i, j+1);

      case InputAction.moveRight:
        int i = pos.row;
        int j = pos.column + 1;
        while (j < grid.width) {
          if (grid.atIndex(i,j).isGoal || grid.atIndex(i,j).isStart) { return Position(i, j); }   // Start / Stop on end tile
          if (grid.atIndex(i,j).isWall) { return Position(i, j-1); }                      // Move until wall
          if (grid.atIndex(i,j).isFloor) { j++; }                                        // Move up when on floor
        }
        return Position(i, j-1);

      default:
        throw Exception("Unreachable");
    }
  }

}