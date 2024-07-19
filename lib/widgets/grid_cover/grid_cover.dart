import 'package:flutter/material.dart';
import 'package:grid_master/widgets/grid_cover/grid_cover_init.dart';
import 'package:grid_master/widgets/grid_cover/grid_cover_showing.dart';
import 'package:provider/provider.dart';

import '../../data.dart';
import '../../game/level.dart';
import '../../game/logic.dart';
import 'grid_cover_countdown.dart';
import 'grid_cover_covering.dart';

class GridCover extends StatelessWidget {
  const GridCover({
    required this.level,
    required this.width,
    Key? key
  }) : super(key: key);

  final Level level;
  final double width;

  @override
  Widget build(BuildContext context) {
    switch (Provider.of<Data>(context).gameState) {
      case GameState.initial: return GridCoverInitial();
      case GameState.countdown: return GridCoverCountdown();
      case GameState.showing: return GridCoverShowing(duration: level.showDuration, width: width);
      case GameState.covered: return GridCoverCovering();
      case GameState.running: return Container();
      case GameState.failed: return GridCoverInitial();
      case GameState.won: return GridCoverInitial();
    }
  }
}
