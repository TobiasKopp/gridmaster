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

  InputAction getInputAction() {
    switch (this) {
      case moveUp:    return InputAction.moveUp;
      case moveDown:  return InputAction.moveDown;
      case moveLeft:  return InputAction.moveLeft;
      case moveRight: return InputAction.moveRight;
    }
  }
}

class InputSequence {
  List<InputAction> inputs = [];

  List<InputAction> get actions {
    return inputs;
  }

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
