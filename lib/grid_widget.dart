import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'constants.dart';
import 'data.dart';

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

  @override
  State<GridWidget> createState() => _GridWidgetState();
}

class _GridWidgetState extends State<GridWidget> {
  bool isAnimating = false;


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var playerSize = widget.tileSize - 10;
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

            AnimatedPositioned(
              duration: const Duration(milliseconds: 700),
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
            )
          ],
        )
      ),
    );
  }

}



