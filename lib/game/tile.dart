/// Defines the different types a tile can be
enum TileType {
  start("S"),
  goal("G"),
  floor("F"),
  wall("F");

  final String textRepresentation;

  const TileType(this.textRepresentation);

  factory TileType.fromString(String s) {
    return values.firstWhere((e) => e.textRepresentation == s);
}

}


/// Represents a tile in a grid
class Tile {
  final TileType type;

  const Tile({required this.type});

  bool get isStart => type == TileType.start;
  bool get isGoal => type == TileType.goal;
  bool get isFloor => type == TileType.floor;
  bool get isWall => type == TileType.wall;
}
