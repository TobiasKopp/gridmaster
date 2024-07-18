import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../data.dart';
import '../game/grid.dart';
import '../game/level.dart';
import '../game/tile.dart';

class GenerateButton extends StatelessWidget {
  const GenerateButton({required this.nTiles, Key? key}) : super(key: key);

  final int nTiles;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => Provider.of<Data>(context, listen: false).setLevel(Level(
          grid: generateRandomGrid(DEFAULT_LEVEL_WIDTH, DEFAULT_LEVEL_HEIGHT)
      )),
      icon: Icon(Icons.autorenew),
      iconSize: 40,
    );
  }

  Grid generateRandomGrid(int width, int height) {
    List<List<String>> grid = [];
    for (int i=0; i<height; i++) {
      List<String> row = [];
      for (int j=0; j<width; j++) {
        row.add(TileType.values[Random().nextInt(TileType.values.length)].textRepresentation);
      }
      grid.add(row);
    }
    return Grid.fromRaw(grid);
  }
}
