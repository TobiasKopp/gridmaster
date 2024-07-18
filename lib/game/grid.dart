import 'package:grid_master/game/position.dart';
import 'package:grid_master/game/tile.dart';

/// Represents a game grid
class Grid {
  final List<List<Tile>> tiles;

  const Grid({required this.tiles});

  factory Grid.fromRaw(List<List<String>> description) {
    List<List<Tile>> tiles = [];
    for (int row=0; row<description.length; row++) {
      List<Tile> r = [];
      for (int col=0; col<description[row].length; col++) {
        r.add(Tile(type: TileType.fromString(description[row][col])));
      }
      tiles.add(r);
    }
    return Grid(tiles: tiles);
  }

  int get width => tiles[0].length;
  int get height => tiles.length;

  Tile atIndex(int row, int column) {
    return tiles[row][column];
  }

  Tile atPosition(Position position) {
    return tiles[position.row][position.column];
  }

  Position start() {
    for (int row=0; row<height; row++) {
      for (int col=0; col<width; col++) {
        if (atIndex(row, col).isStart) {
          return Position(row, col);
        }
      }
    }
    throw IllegalGridException("No start tile found.");
  }

  Position goal() {
    for (int row=0; row<height; row++) {
      for (int col=0; col<width; col++) {
        if (atIndex(row, col).isGoal) {
          return Position(row, col);
        }
      }
    }
    throw IllegalGridException("No goal tile found.");
  }

  @override
  String toString() {
    String res = "${"-" * (width * 2 + 3)}\n";
    for (List<Tile> row in tiles) {
      res += "| ";
      for (Tile t in row) {
        res += "$t ";
      }
      res += "|\n";
    }
    res += "${"-" * (width * 2 + 3)}\n";
    return res;
  }

}

class IllegalGridException implements Exception {
  String cause;
  IllegalGridException(this.cause);
}
