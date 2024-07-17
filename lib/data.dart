import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:grid_master/controls/input_sequence.dart';
import 'package:grid_master/levels/level_1.dart';
import 'package:grid_master/tiles/tile_widget.dart';
import 'package:tuple/tuple.dart';
import 'dart:math';

import 'levels/grid_converter.dart';
import 'levels/level.dart';

class Data extends ChangeNotifier {

  /// CURRENT LEVEL
  level LEVEL = LEVEL_1();
  void setLevel(level newValue) {
    LEVEL = newValue;
    tiles = GridConverter.convert(LEVEL.getGrid());
    notifyListeners();
  }

  /// CURRENT GRID TILES
  List<Widget> tiles = GridConverter.convert(LEVEL_1().getGrid());
  void generateRandomTiles(int n) {
    tiles = List.generate(n, (index) => TileWidget(
      type: TileType.values[Random().nextInt(TileType.values.length)],
    ));
    notifyListeners();
  }


  /// GLOBAL INPUT SEQUENCE
  InputActionSequence inputSequence = InputActionSequence();
  void inputSequenceAdd(InputAction action) {
    inputSequence.push(action);
    notifyListeners();
  }
  void inputSequenceAddAll(Iterable<InputAction> actions) {
    inputSequence.pushAll(actions);
    notifyListeners();
  }
  void inputSequenceRemoveLast() {
    inputSequence.pop();
    notifyListeners();
  }
  void inputSequenceClear() {
    inputSequence.clear();
    notifyListeners();
  }


  /// POSITIONS TO MOVE PLAYER TO
  Queue<Tuple2<int, int>> MOVES = Queue();


}