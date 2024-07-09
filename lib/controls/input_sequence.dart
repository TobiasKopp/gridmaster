enum InputAction {
  moveUp, moveDown, moveLeft, moveRight;
}

class InputSequence {
  List<InputAction> inputs = [];

  void push(InputAction action) {
    inputs.add(action);
  }

  void pushAll(Iterable<InputAction> actions) {
    inputs.addAll(actions);
  }

  void pop() {
    inputs.removeLast();
  }

  void clear() {
    inputs = [];
  }

}
