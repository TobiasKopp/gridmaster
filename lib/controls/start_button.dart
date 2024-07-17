import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:grid_master/controls/input_sequence.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';
import 'package:grid_master/data.dart';

class StartButton extends StatelessWidget {
  const StartButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          List<List<String>> grid = Provider.of<Data>(context, listen: false).LEVEL.getGrid();
          InputActionSequence inputSequence = Provider.of<Data>(context, listen: false).inputSequence;
          Queue<Tuple2<int,int>> positions = Queue();

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
          Tuple2<int, int> pos = Tuple2(0, 0);
          for (int i=0; i<grid.length; i++) {
            for (int j=0; j<grid[i].length; j++) {
              if (grid[i][j] == 'S') {
                pos = Tuple2(i, j);
                positions.add(Tuple2(i, j));
              }
            }
          }

          // Go through inputs
          for (var action in inputSequence.inputs) {
            pos = computeNextTile(context, grid, pos, action);
            positions.add(pos);
          }








        },
        style: const ButtonStyle(
          // TODO
        ),
        child: const Icon(Icons.start)
    );
  }

  static Tuple2<int, int> computeNextTile(BuildContext context, List<List<String>> grid, Tuple2<int, int> pos, InputAction action) {
    switch (action) {
      case InputAction.moveUp:
        int i = pos.item1 - 1;
        int j = pos.item2;
        while (i >= 0) {
          if (grid[i][j] == 'E' || grid[i][j] == 'S') { return Tuple2(i, j); }   // Start / Stop on end tile
          if (grid[i][j] == 'W') { return Tuple2(i+1, j); }                      // Move until wall
          if (grid[i][j] == 'F') { i--; }                                        // Move up when on floor
        }
        return Tuple2(i+1, j);

      case InputAction.moveDown:
        int i = pos.item1 + 1;
        int j = pos.item2;
        while (i < grid.length) {
          if (grid[i][j] == 'E' || grid[i][j] == 'S') { return Tuple2(i, j); }   // Start / Stop on end tile
          if (grid[i][j] == 'W') { return Tuple2(i-1, j); }                      // Move until wall
          if (grid[i][j] == 'F') { i++; }                                        // Move up when on floor
        }
        return Tuple2(i-1, j);

      case InputAction.moveLeft:
        int i = pos.item1;
        int j = pos.item2 - 1;
        while (j >= 0) {
          if (grid[i][j] == 'E' || grid[i][j] == 'S') { return Tuple2(i, j); }   // Start / Stop on end tile
          if (grid[i][j] == 'W') { return Tuple2(i, j+1); }                      // Move until wall
          if (grid[i][j] == 'F') { j--; }                                        // Move up when on floor
        }
        return Tuple2(i, j+1);

      case InputAction.moveRight:
        int i = pos.item1;
        int j = pos.item2 + 1;
        while (j < grid[i].length) {
          if (grid[i][j] == 'E' || grid[i][j] == 'S') { return Tuple2(i, j); }   // Start / Stop on end tile
          if (grid[i][j] == 'W') { return Tuple2(i, j-1); }                      // Move until wall
          if (grid[i][j] == 'F') { j++; }                                        // Move up when on floor
        }
        return Tuple2(i, j-1);

      default:
        throw Exception("Unreachable");
    }
  }

}