import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data.dart';
import '../generate_button.dart';
import '../levels/grid_converter.dart';
import '../levels/level_1.dart';
import '../levels/level_2.dart';

class LevelChooser extends StatelessWidget {
  const LevelChooser({
    required this.genSize,
    Key? key
  }) : super(key: key);

  final int genSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GenerateButton(nTiles: genSize),
        IconButton(
          onPressed: () => Provider.of<Data>(context, listen: false).setTiles(GridConverter.convert(LEVEL_1().getGrid())),
          icon: Text("1", style: TextStyle(fontSize: 30),),
          iconSize: 40,
        ),
        IconButton(
          onPressed: () => Provider.of<Data>(context, listen: false).setTiles(GridConverter.convert(LEVEL_2().getGrid())),
          icon: Text("2", style: TextStyle(fontSize: 30),),
          iconSize: 40,
        ),
      ],
    );
  }
}
