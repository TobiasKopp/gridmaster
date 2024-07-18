import 'dart:math';

import 'package:flutter/material.dart';

import '../constants.dart';
import '../game/grid.dart';
import '../game/level.dart';
import '../game/logic.dart';
import '../game/tile.dart';

class GenerateButton extends StatelessWidget {
  const GenerateButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => Logic.switchToLevel(context, Level(
          grid: generateRandomGrid(DEFAULT_LEVEL_WIDTH, DEFAULT_LEVEL_HEIGHT)
      )),
      icon: const Icon(Icons.autorenew),
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
