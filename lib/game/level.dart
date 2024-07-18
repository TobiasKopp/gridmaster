import 'grid.dart';

/// An instance of this class represents exactly one level, defined by its grid
class Level {
  final Grid grid;

  Level({required this.grid});

  int get width => grid.width;
  int get height => grid.height;
}