import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

import 'constants.dart';
import 'data.dart';

final StreamController<Queue<Tuple2<int, int>>> PLAYER_STREAM_CONTROLLER = StreamController<Queue<Tuple2<int, int>>>();

class GridWidget extends StatefulWidget {
  GridWidget({
    this.width = 11,
    this.height = 11,
    Key? key
  }) : super(key: key);

  final int width;
  final int height;

  final double tileSize = 50;
  final Color backgroundColor = Colors.blueGrey;
  final double borderThickness = 1;

  final Duration animationDuration = const Duration(milliseconds: 700);

  @override
  State<GridWidget> createState() => _GridWidgetState();
}

class _GridWidgetState extends State<GridWidget> {
  Tuple2 playerPosition = Tuple2(0, 0);

  bool isAnimating = false;

  late Stream<Queue<Tuple2<int, int>>> moveStream;

  @override
  void initState() {
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
      top: playerPosition.item1 * widget.tileSize,
      left: playerPosition.item2 * widget.tileSize,
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
        width: widget.width * widget.tileSize + 2*kGridLineThickness,
        height: widget.height * widget.tileSize + 2*kGridLineThickness,
        color: kColorGridLines,
        alignment: Alignment.center,
        child: Stack(
          children: [
            SizedBox(
              width: widget.width * widget.tileSize,
              height: widget.height * widget.tileSize,
              child: GridView.count(
                crossAxisCount: widget.width,
                children: Provider.of<Data>(context).tiles,
              ),
            ),

            if (isAnimating) player,
          ],
        )
      ),
    );
  }

}



