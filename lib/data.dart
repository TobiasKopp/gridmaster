import 'package:flutter/material.dart';
import 'package:grid_master/constants.dart';
import 'package:grid_master/controls/input_sequence.dart';
import 'package:grid_master/game/logic.dart';

import 'game/level.dart';


class Data extends ChangeNotifier {

  /// CURRENT LEVEL
  Level LEVEL = DEFAULT_LEVEL;
  void setLevel(Level newValue) {
    LEVEL = newValue;
    notifyListeners();
  }


  /// CURRENT GAME STATE
  GameState gameState = GameState.initial;
  void setGameState(GameState newValue) {
    gameState = newValue;
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
