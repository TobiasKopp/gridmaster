import 'package:flutter/material.dart';

import '../game/grid.dart';
import '../game/tile.dart';
import '../tiles/tile_widget.dart';

class GridConverter {
  static List<Widget> convertList(List<List<String>> grid) {
    List<Widget> res = [];
    for (int i=0; i<grid.length; i++) {
      for (int j=0; j<grid[i].length; j++) {
        res.add(TileWidget(type: TileType.fromString(grid[i][j])));
      }
    }
    return res;
  }

  static List<Widget> convertGrid(Grid grid) {
    List<Widget> res = [];
    for (int i=0; i<grid.height; i++) {
      for (int j=0; j<grid.width; j++) {
        res.add(TileWidget(type: grid.atIndex(i,j).type));
      }
    }
    return res;
  }
}