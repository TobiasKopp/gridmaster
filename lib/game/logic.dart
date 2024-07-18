import 'package:flutter/cupertino.dart';
import 'package:grid_master/game/position.dart';
import 'package:provider/provider.dart';

import '../controls/input_sequence.dart';
import '../data.dart';
import 'grid.dart';
import 'level.dart';

enum GameState {
  initial, countdown, showing, covered, failed, won;
}

class Logic {
  static Position computeNextPosition(Grid grid, Position pos, InputAction action) {
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

  static void switchToLevel(BuildContext context, Level level) {
    if (Provider.of<Data>(context, listen: false).LEVEL != level) {
      Provider.of<Data>(context, listen: false).setLevel(level);
      Provider.of<Data>(context, listen: false).setGameState(GameState.initial);
      Provider.of<Data>(context, listen: false).inputSequenceClear();
    }
  }
}