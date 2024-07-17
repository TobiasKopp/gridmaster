import 'package:flutter/material.dart';
import 'package:grid_master/tiles/tile_widget.dart';

class GridConverter {
  static List<Widget> convert(List<List<String>> grid) {
    List<Widget> res = [];
    for (int i=0; i<grid.length; i++) {
      for (int j=0; j<grid[i].length; j++) {
        res.add(TileWidget(type: TileType.getType(grid[i][j])));
      }
    }
    return res;
  }
}