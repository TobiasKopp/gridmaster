import 'package:flutter/material.dart';

enum InputAction {
  moveUp, moveDown, moveLeft, moveRight;

  IconData getIcon() {
    switch (this) {
      case moveUp:    return Icons.arrow_upward;
      case moveDown:  return Icons.arrow_downward;
      case moveLeft:  return Icons.arrow_back;
      case moveRight: return Icons.arrow_forward;
    }
  }

}

class InputActionSequence {
  List<InputAction> inputs = [];

  void push(InputAction action) {
    inputs.add(action);
  }

  void pushAll(Iterable<InputAction> actions) {
    inputs.addAll(actions);
  }

  void pop() {
    if (inputs.isNotEmpty) {
      inputs.removeLast();
    }
  }

  void clear() {
    inputs = [];
  }

}
