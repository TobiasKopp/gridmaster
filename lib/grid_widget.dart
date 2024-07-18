import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:grid_master/levels/grid_converter.dart';

import 'constants.dart';
import 'game/level.dart';
import 'game/position.dart';

final StreamController<Queue<Position>> PLAYER_STREAM_CONTROLLER = StreamController<Queue<Position>>();

class GridWidget extends StatefulWidget {
  GridWidget({
    required this.level,
    Key? key
  }) {
    tileWidgets = GridConverter.convertGrid(level.grid);
  }

  final Level level;
  late List<Widget> tileWidgets;

  final double tileSize = 50;
  final Color backgroundColor = Colors.blueGrey;
  final double borderThickness = 1;

  final Duration animationDuration = const Duration(milliseconds: 700);

  @override
  State<GridWidget> createState() => _GridWidgetState();
}

class _GridWidgetState extends State<GridWidget> {
  late Position playerPosition;
  bool isAnimating = false;
  late Stream<Queue<Position>> moveStream;

  @override
  void initState() {
    playerPosition = widget.level.grid.start();
    moveStream = PLAYER_STREAM_CONTROLLER.stream;
    moveStream.listen((queue) {
      setState(() {
        playerPosition = queue.first;
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
      child: AnimatedOpacity(
        opacity: isAnimating ? 1 : 0,
        duration: widget.animationDuration,
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

            if (isAnimating) player,
          ],
        )
      ),
    );
  }

}



