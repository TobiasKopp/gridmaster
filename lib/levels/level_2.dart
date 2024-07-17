import 'level.dart';

class LEVEL_2 implements level {
  @override
  List<List<String>> getGrid() {
    return [
      ['W', 'W', 'W', 'W', 'W', 'E', 'W', 'W', 'W', 'W', 'W'],
      ['W', 'W', 'F', 'F', 'F', 'F', 'W', 'F', 'F', 'F', 'W'],
      ['W', 'W', 'F', 'W', 'W', 'W', 'W', 'F', 'W', 'F', 'W'],
      ['W', 'W', 'F', 'F', 'W', 'W', 'W', 'F', 'W', 'F', 'W'],
      ['W', 'W', 'W', 'F', 'F', 'F', 'F', 'F', 'W', 'F', 'W'],
      ['W', 'W', 'W', 'W', 'W', 'W', 'W', 'W', 'W', 'F', 'W'],
      ['W', 'W', 'F', 'F', 'F', 'W', 'W', 'W', 'W', 'F', 'W'],
      ['W', 'F', 'F', 'W', 'F', 'F', 'F', 'F', 'W', 'F', 'W'],
      ['W', 'F', 'W', 'W', 'W', 'W', 'W', 'F', 'W', 'F', 'W'],
      ['W', 'F', 'F', 'F', 'F', 'F', 'W', 'F', 'F', 'F', 'W'],
      ['W', 'W', 'W', 'W', 'W', 'S', 'W', 'W', 'W', 'W', 'W'],
    ];
  }

  @override
  List<String> getSolution() {
    // TODO: implement getSolution
    throw UnimplementedError();
  }

}