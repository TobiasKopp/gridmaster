import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:grid_master/widgets/grid_converter.dart';

import '../constants.dart';
import '../game/level.dart';
import '../game/position.dart';
import 'grid_cover/grid_cover.dart';

final StreamController<Queue<Position>> PLAYER_STREAM_CONTROLLER = StreamController<Queue<Position>>();

class GridWidget extends StatefulWidget {
  GridWidget({
    required this.level,
    Key? key
  }) {
    tileWidgets = GridConverter.convertGrid(level.grid);
  }

  // Defining properties
  final Level level;
  late List<Widget> tileWidgets;

  // Logic
  final Stream<Queue<Position>> moveStream = PLAYER_STREAM_CONTROLLER.stream;

  // Visuals
  final double tileSize = 50;
  final Color backgroundColor = Colors.blueGrey;
  final double borderThickness = 1;
  final Duration animationDuration = const Duration(milliseconds: 700);


  @override
  State<GridWidget> createState() => _GridWidgetState();
}

class _GridWidgetState extends State<GridWidget>
    with SingleTickerProviderStateMixin {
  late Position playerPosition;
  bool isAnimating = false;
  late Queue<Position> moves;

  @override
  void initState() {
    playerPosition = widget.level.grid.start();
    widget.moveStream.listen((queue) {
      setState(() {
        if (!isAnimating) isAnimating = true;
        moves = queue;
      });
    });
    super.initState();
  }




  @override
  Widget build(BuildContext context) {
    var playerSize = widget.tileSize - 20;
    Widget player = AnimatedPositioned(
      top: playerPosition.row * widget.tileSize,
      left: playerPosition.column * widget.tileSize,
      duration: widget.animationDuration,
      curve: Curves.easeInOut,
      onEnd: () => onAnimationEnd(),
      child: AnimatedOpacity(
        opacity: isAnimating ? 1 : 0,
        duration: widget.animationDuration,
        onEnd: onAnimationEnd,
        child: SizedBox(
          width: widget.tileSize,
          height: widget.tileSize,
          child: Center(
            child: Container(
              width: playerSize,
              height: playerSize,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(playerSize/2),
                color: kColorPlayer,
              ),
            ),
          ),
        ),
      ),
    );


    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        width: widget.level.grid.width * widget.tileSize + 2*kGridLineThickness,
        height: widget.level.grid.height * widget.tileSize + 2*kGridLineThickness,
        color: kColorGridLines,
        alignment: Alignment.center,
        child: Stack(
          children: [
            SizedBox(
              width: widget.level.grid.width * widget.tileSize,
              height: widget.level.grid.height * widget.tileSize,
              child: GridView.count(
                crossAxisCount: widget.level.grid.width,
                children: widget.tileWidgets,
              ),
            ),

            player,

            GridCover(),

          ],
        )
      ),
    );
  }

  void onAnimationEnd() {
    if (!isAnimating) playerPosition = widget.level.grid.start();

    if (moves.isEmpty) {
      // Handle win check
      if (widget.level.grid.atPosition(playerPosition).isGoal) {
        // TODO play winning animation
      } else {
        // TODO unsuccessful
      }
      setState(() {
        isAnimating = false;
      });
      return;
    }

    Position nextPosition;
    do {
      nextPosition = moves.removeFirst();
    } while (nextPosition.equals(playerPosition));

    // Position nextPosition = moves.removeFirst();
    // if (nextPosition.equals(playerPosition)) {
    //
    // }

    // Move player to next position
    setState(() {
      playerPosition = nextPosition;
    });
  }

}



