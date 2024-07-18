import 'package:flutter/material.dart';
import 'package:grid_master/constants.dart';
import 'package:grid_master/controls/input_sequence.dart';
import 'package:grid_master/tiles/tile_widget.dart';
import 'dart:math';

import 'game/level.dart';
import 'game/tile.dart';
import 'levels/grid_converter.dart';

class Data extends ChangeNotifier {

  /// CURRENT LEVEL
  Level LEVEL = L_DEFAULT;
  void setLevel(Level newValue) {
    LEVEL = newValue;
    tiles = GridConverter.convertGrid(LEVEL.grid);
    notifyListeners();
  }

  /// CURRENT GRID TILES
  List<Widget> tiles = GridConverter.convertGrid(L_DEFAULT.grid);
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
}
