/// Describes the position of a tile in a grid
class Position {
  final int row;
  final int column;

  const Position(this.row, this.column);

  bool equals(Position other) {
    return row==other.row && column==other.column;
  }

  @override
  String toString() {
    return "($row,$column)";
  }

}
