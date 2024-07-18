import 'package:flutter/material.dart';

import '../constants.dart';
import '../game/tile.dart';


class TileWidget extends StatelessWidget {
  const TileWidget({
    this.type = TileType.wall,
    this.size = 50,
    Key? key
  }) : super(key: key);

  final TileType type;
  final double size;
  final double borderThickness = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      color: kColorGridLines,
      alignment: Alignment.center,
      child: SizedBox(
        width: size - 2 * kGridLineThickness,
        height: size - 2 * kGridLineThickness,
        child: Container(
          color: _getColor(),
        ),
      ),
    );
  }

  Color _getColor() {
    switch (type) {
      case TileType.wall: return kColorWallTile;
      case TileType.floor: return kColorFloorTile;
      case TileType.start: return kColorStartTile;
      case TileType.goal: return kColorGoalTile;
    }
  }
}
