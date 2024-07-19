import 'grid.dart';

/// An instance of this class represents exactly one level, defined by its grid
class Level {
  final Grid grid;
  final Duration showDuration;

  Level({
    required this.grid,
    this.showDuration = const Duration(seconds: 5),
  });

  int get width => grid.width;
  int get height => grid.height;
}