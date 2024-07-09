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
   @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        width: widget.width * widget.tileSize + 2*kGridLineThickness,
        height: widget.height * widget.tileSize + 2*kGridLineThickness,
        color: kColorGridLines,
        child: SizedBox(
          width: widget.width * widget.tileSize,
          height: widget.height * widget.tileSize,
          child: GridView.count(
            crossAxisCount: widget.width,
            children: Provider.of<Data>(context).tiles,
          ),
        )
      ),
    );
  }
}

