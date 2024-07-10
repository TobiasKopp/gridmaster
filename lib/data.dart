import 'package:flutter/material.dart';
import 'package:grid_master/controls/input_sequence.dart';
import 'package:grid_master/tiles/tile_widget.dart';
import 'dart:math';

class Data extends ChangeNotifier {

  List<Widget> tiles = [];
  void generateRandomTiles(int n) {
    tiles = List.generate(n, (index) => TileWidget(
      type: TileType.values[Random().nextInt(TileType.values.length)],
    ));
    notifyListeners();
  }

  void setTiles(List<Widget> newValue) {
    tiles = newValue;
    notifyListeners();
  }

  /// GLOBAL INPUT SEQUENCE
  InputSequence inputSequence = InputSequence();
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