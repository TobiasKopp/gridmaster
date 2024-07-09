import 'package:flutter/material.dart';
import 'package:grid_master/tiles/tile_widget.dart';

class GridConverter {
  static List<Widget> convert(List<String> grid) {
    return grid.map((t) => TileWidget(type: TileType.getType(t),)).toList();
  }
}